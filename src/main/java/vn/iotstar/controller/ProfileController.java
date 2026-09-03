package vn.iotstar.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import vn.iotstar.entity.User;
import vn.iotstar.service.IUserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.constants;

/**
cap nhat fullname, phone, avatar (upload anh - multipart).
 */
@MultipartConfig
@WebServlet(urlPatterns = { "/profile", "/profile/update" })
public class ProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User account = (User) session.getAttribute("account");
        // Lay du lieu moi nhat tu DB (tranh du lieu cu trong session)
        User user = userService.findById(account.getId());
        req.setAttribute("user", user);
        req.getRequestDispatcher("/views/profile/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User account = (User) session.getAttribute("account");
        User user = userService.findById(account.getId());

        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        String message;

        if (fullname == null || fullname.trim().isEmpty()) {
            req.setAttribute("error", "Ho ten khong duoc de trong");
            req.setAttribute("user", user);
            req.getRequestDispatcher("/views/profile/profile.jsp").forward(req, resp);
            return;
        }

        user.setFullname(fullname.trim());
        user.setPhone(phone == null ? null : phone.trim());

        // Xu ly upload anh dai dien (multipart)
        String uploadPath = constants.DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        try {
            Part part = req.getPart("avatar");
            if (part != null && part.getSize() > 0) {
                String submitted = part.getSubmittedFileName();
                if (submitted != null && !submitted.trim().isEmpty()) {
                    String filename = Paths.get(submitted).getFileName().toString();
                    int index = filename.lastIndexOf(".");
                    String ext = index >= 0 ? filename.substring(index + 1) : "jpg";
                    String fname = "avatar_" + user.getId() + "_" + System.currentTimeMillis() + "." + ext;
                    part.write(uploadPath + File.separator + fname);
                    user.setAvatar(fname);
                }
            }
        } catch (FileNotFoundException fne) {
            fne.printStackTrace();
        }

        try {
            userService.updateProfile(user);
            // Cap nhat lai thong tin trong session cho dong bo voi giao dien
            session.setAttribute("account", user);
            message = "Cap nhat ho so thanh cong";
            req.setAttribute("message", message);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Cap nhat ho so that bai, vui long thu lai");
        }

        req.setAttribute("user", user);
        req.getRequestDispatcher("/views/profile/profile.jsp").forward(req, resp);
    }
}