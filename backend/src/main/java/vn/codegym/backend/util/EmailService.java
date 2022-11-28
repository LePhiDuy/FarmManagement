package vn.codegym.backend.util;

public interface EmailService {
    boolean sendEmail(String receiptEmail, String link);
}
