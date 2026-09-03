package vn.iotstar.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;
import vn.iotstar.util.constants;

@WebServlet(urlPatterns = "/image")
public class DownloadImageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String fileName = req.getParameter("fname");
        resp.setContentType("image/jpeg");

        if (fileName == null || fileName.trim().isEmpty()) {
            return;
        }

        File file = new File(constants.DIR + "/" + fileName);
        if (file.exists() && file.isFile()) {
            IOUtils.copy(new FileInputStream(file), resp.getOutputStream());
        }
    }
}