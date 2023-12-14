<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.spendwise.model.dao.*,br.spendwise.model.domain.*"%>
<%@page import="java.util.*"%>

<%
    Usuario u = null;
    String botao;

    if(request.getParameter("id")!=null){
        UsuarioDAO dao = new UsuarioDAO();
        Integer id = Integer.parseInt(request.getParameter("id"));
        u = dao.pesquisarPorId(id);
        botao = "Alterar";
    }else{
        u = new Usuario();
        botao = "Salvar";
    }
%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>SpendWise</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/formUser.css">
    <link rel="shortcut icon" href="assets/img/icons8-dinheiro-na-mão-48.png" type="image/x-icon" />
</head>
<body>
    <div class="container-fluid">
        <div class="row mh-100vh">
            <div class="col-10 col-sm-8 col-md-6 col-lg-6 offset-1 offset-sm-2 offset-md-3 offset-lg-0 align-self-center d-lg-flex align-items-lg-center align-self-lg-stretch bg-white p-5 rounded rounded-lg-0 my-5 my-lg-0"
                id="login-block">
                <div class="m-auto w-lg-75 w-xl-50">
                    <h1 class="mb-5 text-center spend_logo"> Faça seu cadastro! </h1>
                    <form action="usuarios" method="POST">
                        <div class="form-group mb-3"><label class="form-label spend_text"></label><input
                            class="form-control" type="hidden" required id="id" name="id" value="<%=u.getId()%>"></div>
                        <div class="form-group mb-3"><label class="form-label spend_text">Nome</label><input
                            class="form-control" type="text" required id="nome" name="nome" value="<%=u.getNome()%>"></div>
                        <div class="form-group mb-3"><label class="form-label spend_text">Email</label><input
                            class="form-control" type="email" required id="email" name="email" value="<%=u.getEmail()%>"></div>
                        <div class="form-group mb-3"><label class="form-label spend_text">Senha</label><input
                            class="form-control" type="password" required id="senha" name="senha" value="<%=u.getSenha()%>"></div>
                        <button class="btn btn-primary mt-2 spend_text" type="submit" name="enviar" value="<%=botao%>"><%=botao%></button>
                    </form>
                    <p class="mt-3 spend_logo fw-bold">Já tem uma conta? <a href="login.jsp">Faça Login!</a></p>
                </div>
            </div>
            <div class="col-lg-6 d-flex align-items-end" id="bg-block"
                style="background-image:url('https://img.freepik.com/vetores-gratis/ilustracao-de-conceito-de-pesquisa-de-cliente_114360-459.jpg?w=826&t=st=1692275746~exp=1692276346~hmac=06a797bc3645a7a6bb78fd710e686de65e12b17dbdf74c690d7cda1f5f067725');">
            </div>
        </div>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
