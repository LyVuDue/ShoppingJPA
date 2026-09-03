package vn.iotstar.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.User;
import vn.iotstar.service.IUserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.EmailUtil;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = {"/forgot-password", "/reset-password"})
public class ForgotPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.contains("/forgot-password")) {
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String url = req.getRequestURI();
        IUserService service = new UserServiceImpl();

        if (url.contains("/forgot-password")) {
            String email = req.getParameter("email");
            User user = service.findByEmail(email);
            if (user == null) {
                req.setAttribute("alert", "Email không tồn tại!");
                req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
                return;
            }
            String otp = EmailUtil.generateOTP();
            service.updateOTP(user.getUsername(), otp);
            try {
                EmailUtil.sendOTPResetPassword(email, otp);
            } catch (Exception e) {
                e.printStackTrace();
            }
            req.getSession().setAttribute("resetUsername", user.getUsername());
            resp.sendRedirect(req.getContextPath() + "/reset-password");

        } else if (url.contains("/reset-password")) {
            String otp        = req.getParameter("otp");
            String newPassword = req.getParameter("newPassword");
            String username   = (String) req.getSession().getAttribute("resetUsername");

            User user = service.findByUsername(username);
            if (user != null && user.getOtp() != null && user.getOtp().equals(otp)) {
                service.updatePassword(username, newPassword);
                service.updateOTP(username, null);
                req.getSession().removeAttribute("resetUsername");
                req.setAttribute("alert", "Đặt lại mật khẩu thành công!");
                req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
            } else {
                req.setAttribute("alert", "Mã OTP không đúng!");
                req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            }
        }
    }
}