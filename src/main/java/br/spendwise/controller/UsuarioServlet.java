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

@WebServlet(name = "usuarioServlet", value = "/usuarios")
public class UsuarioServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        UsuarioDAO dao = new UsuarioDAO();
        dao.criarTabela();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UsuarioDAO dao = new UsuarioDAO();
        dao.excluir(id);
        resp.sendRedirect("apresentacao.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        Integer id = Integer.parseInt(req.getParameter("id"));
        String nome = (req.getParameter("nome"));
        String email = (req.getParameter("email"));
        String senha = (req.getParameter("senha"));
        String enviar = req.getParameter("enviar");
        Usuario u = new Usuario(id, nome, email, senha);
        System.out.println(u);
        UsuarioDAO dao = new UsuarioDAO();
        if (enviar.contains("Salvar")) {
            dao.inserir(u);
            System.out.println(u);
        } else {
            dao.alterar(u);
        }
        session.setAttribute("usuautenticado", u);
        resp.sendRedirect("apresentacao.jsp");
    }
}
