package com.example.demo.services;

import java.awt.Color;
import java.io.ByteArrayOutputStream;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.springframework.stereotype.Service;

@Service
public class PdfService {

    public byte[] createPayslipPdf(String name, String email, String designation, String phone, String monthYear,
            String basic, String hra, String specialAllowance, String otherAllowance, String grossSalary,
            String pf, String pt, String tds, String totalDeductions, String deductionReason, String extraDeduction,
            String netSalary) throws Exception {

        try (PDDocument doc = new PDDocument()) {
            PDPage page = new PDPage(PDRectangle.A4);
            doc.addPage(page);

            PDPageContentStream cs = new PDPageContentStream(doc, page);
            cs.setNonStrokingColor(Color.BLACK);
            cs.beginText();
            cs.setFont(PDType1Font.HELVETICA_BOLD, 16);
            cs.newLineAtOffset(50, 800);
            cs.showText("PaySlip for " + name);
            cs.endText();

            cs.beginText();
            cs.setFont(PDType1Font.HELVETICA, 12);
            cs.newLineAtOffset(50, 780);
            cs.showText("Email: " + email + "    Phone: " + phone);
            cs.endText();

            cs.beginText();
            cs.setFont(PDType1Font.HELVETICA, 12);
            cs.newLineAtOffset(50, 760);
            cs.showText("Designation: " + designation + "    Month: " + monthYear);
            cs.endText();

            // Add earnings/deductions as simple lines
            int y = 720;
            String[][] rows = new String[][] {
                    { "Basic", basic },
                    { "HRA", hra },
                    { "Special Allowance", specialAllowance },
                    { "Other Allowance", otherAllowance },
                    { "Gross Salary", grossSalary },
                    { "PF", pf },
                    { "PT", pt },
                    { "TDS", tds },
                    { "Total Deductions", totalDeductions },
                    { "Extra Deduction", extraDeduction },
                    { "Deduction Reason", deductionReason },
                    { "Net Salary", netSalary }
            };

            for (String[] r : rows) {
                cs.beginText();
                cs.setFont(PDType1Font.HELVETICA, 11);
                cs.newLineAtOffset(50, y);
                cs.showText(r[0] + ": " + (r[1] == null ? "" : r[1]));
                cs.endText();
                y -= 18;
            }

            cs.close();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            doc.save(baos);
            return baos.toByteArray();
        }
    }
}
