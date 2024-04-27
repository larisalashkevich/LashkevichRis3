package com.lashkevich.servlet;

import com.lashkevich.bean.CommentBean;
import com.lashkevich.entity.Comment;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/comments")
public class CommentServlet extends HttpServlet {
    @EJB
    private CommentBean commentBean;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        String text = req.getParameter("text");
        if (username.length() > 30 || text.length() > 250) {
            resp.sendRedirect(req.getContextPath() + "/comments");
        } else {
            switch (req.getParameter("action")) {
                case "add" -> {
                    commentBean.save(new Comment(username, text));
                    resp.sendRedirect(req.getContextPath() + "/comments");
                }
                case "edit" -> {
                    Long id = Long.parseLong(req.getParameter("id"));
                    commentBean.edit(id, new Comment(username, text));
                    resp.sendRedirect(req.getContextPath() + "/comments");
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            getAll(req, resp);
        }
        try {
            switch (action) {
                case "add" -> {
                    getServletContext().getRequestDispatcher("/template.jsp").forward(req, resp);
                }
                case "edit" -> {
                    req.setAttribute("comment", commentBean.findById(Long.parseLong(req.getParameter("id"))));
                    getServletContext().getRequestDispatcher("/template.jsp").forward(req, resp);
                }
                case "delete" -> {
                    commentBean.deleteById(Long.parseLong(req.getParameter("id")));
                    resp.sendRedirect(req.getContextPath() + "/comments");
                }
            }
        } catch (NumberFormatException ex) {
            getAll(req, resp);
        }
    }

    private void getAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("comments", commentBean.findAll());
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
