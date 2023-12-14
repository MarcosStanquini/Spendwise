<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.spendwise.model.dao.*,br.spendwise.model.domain.*"%>
<%@page import="java.util.*"%>

<%
  ReceitaDAO rdao = new ReceitaDAO();
  rdao.criarTabela();
  ArrayList<Receita> receitas = rdao.listar();

  DespesaDAO ddao = new DespesaDAO();
  ddao.criarTabela();
  ArrayList<Despesa> despesas = ddao.listar();
  System.out.println(despesas);
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>SpendWise</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/table.css">
    <link rel="shortcut icon" href="assets/img/icons8-dinheiro-na-mão-48.png" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand text-black text_nav spend_text d-none d-md-block" href="apresentacao.jsp">SpendWise</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-chevron-down fa-sm text-black text_nav" style="color: #ffffff;"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link text-black text_nav" href="inserir.jsp">
                                <i class="fas fa-plus fa-lg"></i> Inserir
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-black text_nav" href="visualizar.jsp">
                                <i class="fas fa-eye fa-lg"></i> Visualizar
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-black text_nav" href="relatorio.jsp">
                                <i class="fas fa-chart-bar fa-lg"></i> Relatório
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <form action="logout" method="post" class="nav-link">
                                <button type="submit" class="btn btn-outline-primary">
                                    <i class="fas fa-sign-out-alt fa-lg"></i> Logout
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="container" id="listagem">
        <div class="table-container">
            <table class="table table-responsive">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Valor</th>
                        <th>Data</th>
                        <th>Usuario</th>
                        <th>Descrição</th>
                        <th>Tipo</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Receita r : receitas) { 
                        if (r.getUsuario().getId() == (int) request.getAttribute("usuarioId")) { %>
                    <tr>
                        <td><%=r.getId()%></td>
                        <td><%=r.getValor()%></td>
                        <td><%=r.getData()%></td>
                        <td><%=r.getUsuario().getNome()%></td>
                        <td><%=r.getDescricao()%></td>
                        <td><%=r.getTipo()%></td>
                        <td>
                            <a class="btn btn-info btn-sm" href="inserir.jsp?idReceita=<%=r.getId()%>" role="button">
                                <i class="fas fa-pencil-alt fa-sm" title="Editar" aria-hidden="true"></i>
                            </a>
                            <a class="btn btn-danger btn-sm" href="receitas?id=<%=r.getId()%>" role="button">
                                <i class="fas fa-trash-alt fa-sm" title="Excluir" aria-hidden="true"></i>
                            </a>
                        </td>
                    </tr>
                    <% } } %>
                </tbody>
            </table>

            <table class="table table-responsive">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Valor</th>
                        <th>Data</th>
                        <th>Usuario</th>
                        <th>Descrição</th>
                        <th>Tipo</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Despesa d : despesas) { 
                        if (d.getUsuario().getId() == (int) request.getAttribute("usuarioId")) { %>
                    <tr>
                        <td><%=d.getId()%></td>
                        <td><%=d.getValor()%></td>
                        <td><%=d.getData()%></td>
                        <td><%=d.getUsuario().getNome()%></td>
                        <td><%=d.getDescricao()%></td>
                        <td><%=d.getTipo()%></td>
                        <td>
                            <a class="btn btn-info btn-sm" href="inserir.jsp?idDespesa=<%=d.getId()%>" role="button">
                                <i class="fas fa-pencil-alt fa-sm" title="Editar" aria-hidden="true"></i>
                            </a>
                            <a class="btn btn-danger btn-sm" href="despesas?id=<%=d.getId()%>" role="button">
                                <i class="fas fa-trash-alt fa-sm" title="Excluir" aria-hidden="true"></i>
                            </a>
                        </td>
                    </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
    </div>
    

    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>
