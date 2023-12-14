<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>SpendWise</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/home.css">
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

    
      <div style="height: 650px;background: url(assets/img/img-index.jpg) center / cover;">
    </div>
    
    <div class="container h-100 position-relative" style="top: -50px;">
        <div class="row gy-5 gy-lg-0 row-cols-1 row-cols-md-2 row-cols-lg-3">
            <div class="col">
                <div class="card">
                    <div class="card-body pt-5 p-4">
                        <div class="bs-icon-lg bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center position-absolute mb-3 bs-icon lg"
                            style="top: -30px;"><i class="far fa-lightbulb"></i></div>
                        <h4 class="spend_text ">Rápido!</h4>
                        <p class="card-text spend_text">As atualizações dos dados são&nbsp;<br>instantâneas!<br></p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body pt-5 p-4">
                        <div class="bs-icon-lg bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center position-absolute mb-3 bs-icon lg"
                            style="top: -30px;"><i class="fas fa-wrench"></i></div>
                        <h4 class="card-title spend_text">Fácil!</h4>

                        <p class="card-text spend_text">Com apenas três cliques você consegue fazer uma inserção em
                            nosso sistema!</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body pt-5 p-4">
                        <div class="bs-icon-lg bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center position-absolute mb-3 bs-icon lg"
                            style="top: -30px;"><i class="far fa-user"></i></div>
                        <h4 class="card-title spend_text">Feito para você!</h4>
                        <p class="card-text spend_text">SpendWise foi desenvolvido para otimizar seus gastos e controlar
                            seus ganhos!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container py-4 py-xl-5">
        <div class=" border-1" style="height: 600px;">
                <div class="carousel-item active h-100"><img class="w-100 d-block position-absolute h-100 fit-cover"
                        src="assets/img/pigmoney.jpg" style="z-index: -1;">
                    <div class="container d-flex flex-column justify-content-center h-100">
                        <div class="row">
                            <div class="col-md-6 col-xl-4 offset-md-2">
                                <div style="max-width: 500px;">
                                    <h1 class=" spend_logo">Estruture sua vida financeira!</h1>
                                    <p class="my-3 spend_text_secondary" style="font-size: x-large;font-weight: 900; ">
                                        <span style="color: rgb(0, 0, 0);">70% dos brasileiros admitem gastos
                                            desnecessários.</span><br>
                                    </p><a class="btn btn-lg me-2 spend_text" role="button" href="inserir.jsp" style="background-color: #BFD1E8;">Começar!</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          

     
    <div class="container py-4 py-xl-5">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h2 class="spend_text mt-5">O que nossos clientes dizem?</h2>
            </div>
        </div>
        <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-xl-3">
            <div class="col">
                <div class="card"><img class="card-img-top w-100 d-block fit-cover" style="height: 200px;"
                        src="https://img.freepik.com/fotos-gratis/homem-de-negocios-confiante-segurando-um-tablet-digital-e-sorrindo-em-pe_1258-26615.jpg?w=1380&amp;t=st=1683248408~exp=1683249008~hmac=298143e7d33c2f2d03c7fff5f5a917b7b46fc01f24acf4d24bbab494b4bcf972">
                    <div class="card-body p-4">
                        <p class="card-text spend_text">"O controle de caixa da nossa empresa nunca foi tão fácil desde
                            que começamos a utilizar o software oferecido por esse site. Com a ferramenta, podemos
                            facilmente monitorar todas as transações e manter nossas finanças organizadas. "<br></p>
                        <div class="d-flex"><img class="rounded-circle flex-shrink-0 me-3 fit-cover" width="50"
                                height="50"
                                src="https://img.freepik.com/fotos-gratis/homem-de-negocios-confiante-trabalhando-em-tablet-digital-sorrindo-feliz-em-pe_1258-26614.jpg?w=1380&amp;t=st=1683248441~exp=1683249041~hmac=eba7c5061d9b239938b13fed0f6762cb87807d745ab7f82a862ce2ad27398cc4">
                            <div>
                                <p class="fw-bold mb-0 spend_logo">Marcos Stanquini</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card"><img class="card-img-top w-100 d-block fit-cover" style="height: 200px;"
                        src="https://img.freepik.com/fotos-gratis/empresario-de-baixo-angulo_23-2148825893.jpg?w=1380&amp;t=st=1683248418~exp=1683249018~hmac=6b568942ad101a5860d0e792ca5da5cc6ab376e60a2b91dcc48233bc1379a502">
                    <div class="card-body p-4">
                        <p class="card-text spend_text">"Eu sou o responsável pelas finanças da minha pequena empresa e
                            posso dizer com certeza que este site foi uma ótima escolha para nós. Com a funcionalidade
                            de controle de caixa, podemos facilmente rastrear todas as nossas transações.</p>
                        <div class="d-flex"><img class="rounded-circle flex-shrink-0 me-3 fit-cover" width="50"
                                height="50"
                                src="https://img.freepik.com/fotos-gratis/empresario-de-baixo-angulo_23-2148825893.jpg?w=1380&amp;t=st=1683248418~exp=1683249018~hmac=6b568942ad101a5860d0e792ca5da5cc6ab376e60a2b91dcc48233bc1379a502">
                            <div>
                                <p class="fw-bold mb-0 spend_logo">Lucas Apóstolo</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card"><img class="card-img-top w-100 d-block fit-cover" style="height: 200px;"
                        src="https://img.freepik.com/fotos-gratis/empresario-sorridente-em-oculos-sentado-junto-a-mesa-no-cafe-com-o-computador-portatil-enquanto-estiver-usando-o-smartphone-e-escrevendo-algo_171337-5589.jpg?w=1380&amp;t=st=1683248427~exp=1683249027~hmac=6d4dad2a33773de329b0b2a8d8cb803c35b19cd509901926010e275eec7500f6">
                    <div class="card-body p-4">
                        <p class="card-text spend_text">"Como um profissional autônomo, nunca achei fácil gerenciar
                            minhas finanças até encontrar este site. O controle de caixa me permite manter um registro
                            completo de todas as minhas despesas e receitas e o relatório me ajudou muito!</p>
                        <div class="d-flex"><img class="rounded-circle flex-shrink-0 me-3 fit-cover" width="50"
                                height="50"
                                src="https://img.freepik.com/fotos-gratis/empresario-sorridente-em-oculos-sentado-junto-a-mesa-no-cafe-com-o-computador-portatil-enquanto-estiver-usando-o-smartphone-e-escrevendo-algo_171337-5589.jpg?w=1380&amp;t=st=1683248471~exp=1683249071~hmac=c0f0f7740b0b5154eee0393fa0983201de1d7ce07b0900943568a0ecf1d338b5">
                            <div>
                                <p class="fw-bold mb-0 spend_logo">Leonardo Fatorri</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="p-3 mt-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="mb-0 text-black text_nav spend_logo ">Spendwise - Todos os Direitos Reservados</p>
                </div>
                <div class="col text-end text-black text_nav">
                    <p class="mb-0 spend_logo">2023</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>