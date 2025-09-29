package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.PaySlip;

public interface PaySlipRepository extends JpaRepository<PaySlip, Integer> {

	// For admin or single payslip fetch
	public PaySlip findByEmail(String email);

	// For user to see all their payslips
	public java.util.List<PaySlip> findAllByEmail(String email);

	// Find a specific payslip for a user by month and year
	public PaySlip findByEmailAndMonthAndYear(String email, String month, String year);

	// Return the most recent payslip for a user for given month/year (useful if duplicates exist)
	public PaySlip findTopByEmailAndMonthAndYearOrderByIdDesc(String email, String month, String year);
}
