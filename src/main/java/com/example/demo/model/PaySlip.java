package com.example.demo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name="payslip")
public class PaySlip {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String email;
	private String month;
	private String year;
	private int deduction;
	private String deductionReason;
	
	public PaySlip() {
		 
	}
	@Override
	public String toString() {
		return "PaySlip [id=" + id + ", email=" + email + ", month=" + month + ", year=" + year + ", deduction="
				+ deduction + ", deductionReason=" + deductionReason + "]";
	}
	public PaySlip(int id, String email, String month, String year, int deduction) {
		super();
		this.id = id;
		this.email = email;
		this.month = month;
		this.year = year;
		this.deduction = deduction;
	}
	public PaySlip(int id, String email, String month, String year, int deduction, String deductionReason) {
		super();
		this.id = id;
		this.email = email;
		this.month = month;
		this.year = year;
		this.deduction = deduction;
		this.deductionReason = deductionReason;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public int getDeduction() {
		return deduction;
	}
	public void setDeduction(int deduction) {
		this.deduction = deduction;
	}

	public String getDeductionReason() {
		return deductionReason;
	}

	public void setDeductionReason(String deductionReason) {
		this.deductionReason = deductionReason;
	}
	

}
