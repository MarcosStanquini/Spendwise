<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SpendWise</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/relatorio.css">
    <link rel="shortcut icon" href="assets/img/icons8-dinheiro-na-mão-48.png" type="image/x-icon" />
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

    <h1 class="poppinsbtw text-center margin-top">Gráfico de Despesas</h1>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <form id="expenseForm" class="text-center">
                    <div class="form-group mb-3">
                        <label for="expense">Despesa:</label>
                        <input type="text" class="form-control" id="expense" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="amount">Valor:</label>
                        <input type="number" class="form-control" id="amount" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="date">Data:</label>
                        <input type="date" class="form-control" id="date" required>
                    </div>
                    <button type="button" class="btn btn-primary mt-3" id="addExpense">Adicionar Despesa</button>
                </form>
            </div>
            <div class="col-md-6">
                <table id="expenseTable" class="table">
                    <thead>
                        <tr>
                            <th>Despesa:</th>
                            <th>Data:</th>
                            <th>Total Gasto(R$)</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>

    <button id="downloadButton" class="btn btn-primary mt-3">Baixar Gráfico</button>


    
 
    <div>
        <canvas id="expenseChart"> </canvas>
    </div>

    
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/chart.js"></script>
</body>
</html>