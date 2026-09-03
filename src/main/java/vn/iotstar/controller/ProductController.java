package vn.iotstar.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.impl.CategoryServiceImpl;
import vn.iotstar.service.impl.ProductServiceImpl;
import vn.iotstar.util.constants;

@MultipartConfig
@WebServlet(urlPatterns = {
    "/home", "/product",
    "/admin/products", "/admin/product/add",
    "/admin/product/insert", "/admin/product/edit",
    "/admin/product/update", "/admin/product/delete",
    "/product/detail"
})
public class ProductController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    IProductService productService = new ProductServiceImpl();
    ICategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String url = req.getRequestURI();

        // Trang chủ — hiển thị 10 sản phẩm mới nhất
        if (url.contains("/home")) {
            List<Product> top10 = productService.findTop10();
            req.setAttribute("top10", top10);
            req.getRequestDispatcher("/views/home.jsp").forward(req, resp);

        // Tất cả sản phẩm — phân trang 6sp/trang
        } else if (url.endsWith("/product")) {
            int page = 0;
            int pagesize = 6;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            List<Product> products = productService.findAll(page, pagesize);
            int totalProducts = productService.count();
            int totalPages = (int) Math.ceil((double) totalProducts / pagesize);
            req.setAttribute("products", products);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPages", totalPages);
            req.getRequestDispatcher("/views/product-list.jsp").forward(req, resp);

        // Chi tiết sản phẩm
        } else if (url.contains("/product/detail")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productService.findById(id);
            req.setAttribute("product", product);
            req.getRequestDispatcher("/views/product-detail.jsp").forward(req, resp);

        // Admin — danh sách products
        } else if (url.contains("/admin/products")) {
            List<Product> list = productService.findAll();
            req.setAttribute("listproduct", list);
            req.getRequestDispatcher("/views/admin/product-list.jsp").forward(req, resp);

        // Admin — thêm product
        } else if (url.contains("/admin/product/add")) {
            List<Category> categories = categoryService.findAll();
            req.setAttribute("categories", categories);
            req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);

        // Admin — sửa product
        } else if (url.contains("/admin/product/edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productService.findById(id);
            List<Category> categories = categoryService.findAll();
            req.setAttribute("product", product);
            req.setAttribute("categories", categories);
            req.getRequestDispatcher("/views/admin/product-edit.jsp").forward(req, resp);

        // Admin — xóa product
        } else if (url.contains("/admin/product/delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            try {
                productService.delete(id);
            } catch (Exception e) {
                e.printStackTrace();
            }
            resp.sendRedirect(req.getContextPath() + "/admin/products");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String url = req.getRequestURI();

        if (url.contains("/admin/product/insert")) {
            String productname = req.getParameter("productname");
            double price       = Double.parseDouble(req.getParameter("price"));
            String description = req.getParameter("description");
            int quantity       = Integer.parseInt(req.getParameter("quantity"));
            int status         = Integer.parseInt(req.getParameter("status"));
            int categoryId     = Integer.parseInt(req.getParameter("categoryId"));

            Product product = new Product();
            product.setProductname(productname);
            product.setPrice(price);
            product.setDescription(description);
            product.setQuantity(quantity);
            product.setStatus(status);
            product.setCreatedDate(new Date(System.currentTimeMillis()));

            Category category = categoryService.findById(categoryId);
            product.setCategory(category);

            String uploadPath = constants.DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            try {
                Part part = req.getPart("images");
                if (part != null && part.getSize() > 0) {
                    String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    int index = filename.lastIndexOf(".");
                    String ext = filename.substring(index + 1);
                    String fname = System.currentTimeMillis() + "." + ext;
                    part.write(uploadPath + "/" + fname);
                    product.setImages(fname);
                }
            } catch (FileNotFoundException fne) {
                fne.printStackTrace();
            }

            productService.insert(product);
            resp.sendRedirect(req.getContextPath() + "/admin/products");

        } else if (url.contains("/admin/product/update")) {
            int productId      = Integer.parseInt(req.getParameter("productId"));
            String productname = req.getParameter("productname");
            double price       = Double.parseDouble(req.getParameter("price"));
            String description = req.getParameter("description");
            int quantity       = Integer.parseInt(req.getParameter("quantity"));
            int status         = Integer.parseInt(req.getParameter("status"));
            int categoryId     = Integer.parseInt(req.getParameter("categoryId"));

            Product product = productService.findById(productId);
            product.setProductname(productname);
            product.setPrice(price);
            product.setDescription(description);
            product.setQuantity(quantity);
            product.setStatus(status);

            Category category = categoryService.findById(categoryId);
            product.setCategory(category);

            String uploadPath = constants.DIR;
            try {
                Part part = req.getPart("images");
                if (part != null && part.getSize() > 0) {
                    String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    int index = filename.lastIndexOf(".");
                    String ext = filename.substring(index + 1);
                    String fname = System.currentTimeMillis() + "." + ext;
                    part.write(uploadPath + "/" + fname);
                    product.setImages(fname);
                }
            } catch (FileNotFoundException fne) {
                fne.printStackTrace();
            }

            productService.update(product);
            resp.sendRedirect(req.getContextPath() + "/admin/products");
        }
    }
}