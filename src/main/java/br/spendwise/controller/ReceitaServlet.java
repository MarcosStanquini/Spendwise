package br.spendwise.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.spendwise.model.dao.ReceitaDAO;
import br.spendwise.model.dao.UsuarioDAO;
import br.spendwise.model.domain.Receita;
import br.spendwise.model.domain.Usuario;

@WebServlet(name = "receitaServlet", value = "/receitas")
public class ReceitaServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        ReceitaDAO dao = new ReceitaDAO();
        dao.criarTabela();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ReceitaDAO dao = new ReceitaDAO();
        dao.excluir(id);
        resp.sendRedirect("visualizar.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        UsuarioDAO udao = new UsuarioDAO();
        Integer id = Integer.parseInt(req.getParameter("idReceita"));
        String data = req.getParameter("dataReceita");
        Double valor = Double.parseDouble(req.getParameter("valorReceita"));
        Integer idusuario = Integer.parseInt(req.getParameter("usuarioID"));
        String descricao = req.getParameter("descricaoReceita");
        Usuario u = udao.pesquisarPorId(idusuario);
        String enviar = req.getParameter("enviarReceita");
        Receita r = new Receita(id, valor, data, u, "Receita", descricao);
        ReceitaDAO dao = new ReceitaDAO();
        if (enviar.contains("Salvar")) {
            dao.inserir(r);
            System.out.println(r);
        } else {
            dao.alterar(r);
        }
        resp.sendRedirect("visualizar.jsp");
    }
}
