package br.spendwise.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.spendwise.model.dao.DespesaDAO;
import br.spendwise.model.dao.UsuarioDAO;
import br.spendwise.model.domain.Despesa;
import br.spendwise.model.domain.Usuario;

@WebServlet(name = "despesaServlet", value = "/despesas")
public class DespesaServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        DespesaDAO dao = new DespesaDAO();
        dao.criarTabela();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        DespesaDAO dao = new DespesaDAO();
        dao.excluir(id);
        resp.sendRedirect("visualizar.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        UsuarioDAO udao = new UsuarioDAO();
        Integer id = Integer.parseInt(req.getParameter("idDespesa"));
        String data = req.getParameter("dataDespesa");
        Double valor = Double.parseDouble(req.getParameter("valorDespesa"));
        Integer idusuario = Integer.parseInt(req.getParameter("usuarioIDespesa"));
        String descricao = (req.getParameter("descricaoDespesa"));
        Usuario u = udao.pesquisarPorId(idusuario);
        String enviar = req.getParameter("enviarDespesa");
        Despesa d = new Despesa(id, valor, data, u, "Despesa", descricao);
        DespesaDAO dao = new DespesaDAO();
        if (enviar.contains("Salvar")) {
            dao.inserir(d);
            System.out.println(d);
        } else {
            dao.alterar(d);
        }
        resp.sendRedirect("visualizar.jsp");
    }
}
