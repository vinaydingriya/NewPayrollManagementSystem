package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Admin;
import com.example.demo.model.PaySlip;
import com.example.demo.model.User;
import com.example.demo.services.AdminService;
import com.example.demo.services.MailService;
import com.example.demo.services.PaySlipServices;
import com.example.demo.services.PdfService;
import com.example.demo.services.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ApplicationController {

	@Autowired
	private UserService userService;

	@Autowired
	private AdminService adminService;

	@Autowired
	private PaySlipServices payService;

	@Autowired
	private PdfService pdfService;

	@Autowired
	private MailService mailService;

	@ResponseBody
	@RequestMapping("/home")
	public String hello() {
		return "welcome";
	}

	@RequestMapping("/welcome")
	public String welcome(HttpServletRequest req) {
		req.setAttribute("mode", "MODE_HOME");
		return "welcomeemployee";
	}

	@RequestMapping("/register")
	public String registration(HttpServletRequest req) {
		return "register";
	}

	   @RequestMapping(value = "/save-user", method = org.springframework.web.bind.annotation.RequestMethod.POST)
	   public String saveUser(@ModelAttribute("user") User user, HttpServletRequest request) {
			   System.out.println(user);
			   // If id present -> update existing user
			   if (user.getId() != null) {
				   User existing = userService.findById(user.getId());
				   if (existing == null) {
					   request.setAttribute("error", "User not found for update.");
					   return "allusers";
				   }
				   // Check duplicate username (allow if same user)
				   User other = userService.editUser(user.getUsername());
				   if (other != null && !other.getId().equals(existing.getId())) {
					   request.setAttribute("error", "Username already exists. Please choose another.");
					   request.setAttribute("user", user);
					   return "updateuser";
				   }
				   // Check duplicate email (allow if same user)
				   User emailOwner = userService.findByEmail(user.getEmail());
				   if (emailOwner != null && !emailOwner.getId().equals(existing.getId())) {
					   request.setAttribute("error", "Email already in use. Please choose another.");
					   request.setAttribute("user", user);
					   return "updateuser";
				   }
				   // copy fields
				   existing.setUsername(user.getUsername());
				   existing.setFirstname(user.getFirstname());
				   existing.setLastname(user.getLastname());
				   existing.setEmail(user.getEmail());
				   existing.setPhone(user.getPhone());
				   existing.setAge(user.getAge());
				   existing.setDoj(user.getDoj());
				   existing.setPos(user.getPos());
				   existing.setSalary(user.getSalary());
				   // If password provided, update (it will be encoded in service)
				   if (user.getPassword() != null && !user.getPassword().isEmpty()) {
					   existing.setPassword(user.getPassword());
				   }
				   userService.saveMyUser(existing);
			   } else {
				   // New user: check duplicate username and email
				   if (userService.editUser(user.getUsername()) != null) {
					   request.setAttribute("error", "Username already exists. Please choose another.");
					   request.setAttribute("user", user);
					   return "register";
				   }
				   if (userService.findByEmail(user.getEmail()) != null) {
					   request.setAttribute("error", "Email already in use. Please choose another.");
					   request.setAttribute("user", user);
					   return "register";
				   }
				   userService.saveMyUser(user);
			   }
			   request.setAttribute("users", userService.showAllUsers());
			   request.setAttribute("mode", "MODE_HOME");
			   return "allusers";
	   }

	@RequestMapping("/delete-user")
	public String deleteUser(@RequestParam int id, HttpServletRequest req) {
		userService.deleteMyUser(id);
		req.setAttribute("users", userService.showAllUsers());
		return "allusers";
	}

	@RequestMapping("/edit-user")
	public String editUser(@RequestParam String username, HttpServletRequest req) {
		req.setAttribute("user", userService.editUser(username));
		return "updateuser";
	}

	@RequestMapping("/login")
	public String login(HttpServletRequest req) {
		req.setAttribute("mode", "MODE_LOGIN");
		return "welcomeemployee";
	}



       // Show user login page
       @RequestMapping(value = "/login-user", method = org.springframework.web.bind.annotation.RequestMethod.GET)
       public String showUserLogin(HttpServletRequest req) {
	       return "userlogin";
       }

       // Handle user login POST
       @RequestMapping(value = "/login-user", method = org.springframework.web.bind.annotation.RequestMethod.POST)
       public String loginUser(@ModelAttribute User user, HttpServletRequest req) {
	       User loggedInUser = userService.findByUsernameAndPassword(user.getUsername(), user.getPassword());
	       if (loggedInUser != null) {
		       req.getSession().setAttribute("user", loggedInUser);
		       req.setAttribute("user", loggedInUser);
		       return "useroptions";
	       } else {
		       req.setAttribute("error", "Invalid Username or Password");
		       return "userlogin";
	       }
       }

       // User home page (in case you want to allow direct access after login)
       @RequestMapping("/userhome")
       public String userHome(HttpServletRequest req) {
	       User user = (User) req.getSession().getAttribute("user");
	       if (user == null) {
		       return "redirect:/login";
	       }
	       java.util.List<com.example.demo.model.PaySlip> payslips = payService.findAllByEmail(user.getEmail());
	       req.setAttribute("user", user);
	       req.setAttribute("payslips", payslips);
	       return "userhome";
       }

	// View an existing payslip saved in DB for the logged-in user
	@RequestMapping(value = "/view-payslip", method = org.springframework.web.bind.annotation.RequestMethod.POST)
	public String viewPayslip(HttpServletRequest req, @RequestParam String month, @RequestParam String year) {
		User user = (User) req.getSession().getAttribute("user");
		if (user == null) {
			return "redirect:/login-user";
		}
		// find stored payslip
		com.example.demo.model.PaySlip stored = payService.findByEmailAndMonthAndYear(user.getEmail(), month, year);
		if (stored != null) {
			// prepare attributes for compact payslip view (payslip.jsp)
			req.setAttribute("user", userService.findByEmail(user.getEmail()));
			req.setAttribute("month", stored.getMonth());
			req.setAttribute("year", stored.getYear());
			req.setAttribute("deduction", stored.getDeduction());
			req.setAttribute("deductionReason", stored.getDeductionReason());
			// return a slim view for users that shows only the payslip and print/mail options
			return "payslip";
		} else {
			// not found -> show message in userhome
			req.setAttribute("user", user);
			req.setAttribute("payslips", payService.findAllByEmail(user.getEmail()));
			req.setAttribute("message", "No payslip found for " + month + " " + year);
			return "userhome";
		}
	}

	@RequestMapping("/")
	public String homepage() {
		return "login";
	}

	@RequestMapping("/admin")
	public String loginadmin(@ModelAttribute Admin admin, HttpServletRequest req) {
		if (adminService.findByEmailAndPassword(admin.getEmail(), admin.getPassword()) != null) {
			return "welcomeemployee";
		} else {
			return "login";
		}
	}

	@RequestMapping("/all-users")
	public String allusers(HttpServletRequest req) {
		req.setAttribute("users", userService.showAllUsers());
		return "allusers";
	}

	@RequestMapping("/manage")
	public String manage(HttpServletRequest req) {
		req.setAttribute("users", userService.showAllUsers());
		return "manage";
	}


	@RequestMapping("/save-payslip")
	public String savepayslip(@ModelAttribute PaySlip payslip, BindingResult bindingresult, HttpServletRequest req,
			@RequestParam String email, @RequestParam String year, @RequestParam String month,
			@RequestParam String deduction, @RequestParam(required = false) String deductionReason) {

		// Ensure payslip model carries the received values
		payslip.setEmail(email);
		payslip.setMonth(month);
		payslip.setYear(year);
		try {
			payslip.setDeduction(Integer.parseInt(deduction));
		} catch (NumberFormatException ex) {
			// if parsing fails, default to 0
			payslip.setDeduction(0);
		}
		payslip.setDeductionReason(deductionReason);

		// Add data to request for display
		req.setAttribute("user", userService.findByEmail(email));
		req.setAttribute("month", month);
		req.setAttribute("year", year);
		req.setAttribute("deduction", payslip.getDeduction());
		req.setAttribute("deductionReason", deductionReason);

		// Upsert behavior: if a payslip for this email+month+year already exists, update it
		com.example.demo.model.PaySlip existing = payService.findByEmailAndMonthAndYear(email, month, year);
		if (existing != null) {
			existing.setDeduction(payslip.getDeduction());
			existing.setDeductionReason(payslip.getDeductionReason());
			// keep existing email/month/year (should be same)
			payService.savePayslip(existing);
		} else {
			payService.savePayslip(payslip);
		}
		return "generate";
	}

	// Admin endpoint: generate PDF for current displayed payslip and send via server SMTP
	@RequestMapping(value = "/email-payslip", method = org.springframework.web.bind.annotation.RequestMethod.POST)
	public String emailPayslip(HttpServletRequest req, @RequestParam String email, @RequestParam String month,
							@RequestParam String year) {
		User user = userService.findByEmail(email);
		if (user == null) {
			req.setAttribute("message", "User not found");
			return "generate";
		}
		// Build simple values used by PdfService
		String name = user.getFirstname() + " " + user.getLastname();
		String designation = user.getPos();
		String phone = user.getPhone();
		String monthYear = month + " " + year;
		// derive values similar to client-side calculations
		int totalSalary = 0;
		try {
			totalSalary = Integer.parseInt(user.getSalary().replaceAll(",", ""));
		} catch (Exception e) {
			try { totalSalary = Integer.parseInt(user.getSalary()); } catch(Exception ex) { totalSalary = 0; }
		}
		int basic = Math.round(totalSalary * 50 / 100.0f);
		int hra = Math.round(basic * 40 / 100.0f);
		int specialAllowance = Math.round(totalSalary * 20 / 100.0f);
		int otherAllowance = Math.round(totalSalary * 10 / 100.0f);
		int grossSalary = basic + hra + specialAllowance + otherAllowance;

		int pf = Math.round(basic * 12 / 100.0f);
		int pt = 200;
		int tds = 10000;
		// try to fetch stored deduction if exists
		com.example.demo.model.PaySlip stored = payService.findByEmailAndMonthAndYear(email, month, year);
		int extraDeduction = stored != null ? stored.getDeduction() : 0;
		int totalDeductions = pf + pt + tds + extraDeduction;
		int netSalary = grossSalary - totalDeductions;

		try {
			byte[] pdfBytes = pdfService.createPayslipPdf(name, email, designation, phone, monthYear,
				String.valueOf(basic), String.valueOf(hra), String.valueOf(specialAllowance), String.valueOf(otherAllowance),
				String.valueOf(grossSalary), String.valueOf(pf), String.valueOf(pt), String.valueOf(tds),
				String.valueOf(totalDeductions), stored != null ? stored.getDeductionReason() : "", String.valueOf(extraDeduction),
				String.valueOf(netSalary));

			mailService.sendMailWithAttachment(email, "PaySlip - " + monthYear, "Please find attached your payslip.", pdfBytes,
				"payslip-" + month + "-" + year + ".pdf");
			req.setAttribute("message", "Payslip emailed successfully to " + email);
		} catch (Exception ex) {
			ex.printStackTrace();
			req.setAttribute("message", "Failed to email payslip: " + ex.getMessage());
		}
		// return to generate page with message
		req.setAttribute("user", user);
		req.setAttribute("month", month);
		req.setAttribute("year", year);
		return "generate";
	}


       @RequestMapping("/logout")
       public String logout(HttpServletRequest req) {
	       req.getSession().invalidate();
	       return "redirect:/login-user";
       }
}
