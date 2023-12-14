package br.spendwise.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.spendwise.model.dao.UsuarioDAO;
import br.spendwise.model.domain.Usuario;

@WebServlet(name = "autenticacaoServlet", value = "/autenticacoes")
public class AutenticacaoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sessao = req.getSession(false);
        if (sessao != null) {
            sessao.invalidate();
        }
        resp.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String semail = req.getParameter("email");
        String ssenha = req.getParameter("senha");

        Usuario usu = new Usuario();
        usu.setEmail(semail);
        usu.setSenha(ssenha);

        UsuarioDAO usudao = new UsuarioDAO();
        Usuario usuautenticado = usudao.autenticacao(usu);
        System.out.println(usu);
        System.out.println(usuautenticado);

        if (usuautenticado != null) {
            HttpSession sessao = req.getSession();
            sessao.setAttribute("usuautenticado", usuautenticado);

            req.getRequestDispatcher("apresentacao.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("login.jsp");
        }
    }
}
