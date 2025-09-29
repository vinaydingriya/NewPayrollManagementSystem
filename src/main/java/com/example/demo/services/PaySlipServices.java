package com.example.demo.services;

import org.springframework.stereotype.Service;

import com.example.demo.model.PaySlip;
import com.example.demo.repository.PaySlipRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class PaySlipServices {

	private final PaySlipRepository payRepository;
	
	public PaySlipServices(PaySlipRepository payRepository) {
		this.payRepository = payRepository;
	}
	
	public void savePayslip(PaySlip payslip) {
			
		payRepository.save(payslip);
		}
	
       public PaySlip findByEmail(String email) {
	       return payRepository.findByEmail(email);
       }

       // New: Get all payslips for a user
       public java.util.List<PaySlip> findAllByEmail(String email) {
	       return payRepository.findAllByEmail(email);
       }

       // New: find a payslip by email+month+year
       public PaySlip findByEmailAndMonthAndYear(String email, String month, String year) {
	       // Prefer the top (most recently inserted) if duplicates exist
	       PaySlip single = payRepository.findTopByEmailAndMonthAndYearOrderByIdDesc(email, month, year);
	       if (single != null) return single;
	       return payRepository.findByEmailAndMonthAndYear(email, month, year);
       }
}
