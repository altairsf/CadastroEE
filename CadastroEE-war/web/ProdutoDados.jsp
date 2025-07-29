<%-- 
    Document   : ProdutoDados
    Created on : 10 de jul. de 2025, 19:25:30
    Author     : Altair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    </head>
    <body class="container">
        <h2>Dados do Produto</h2>

        <form action="ServletProdutoFC" method="post">
            <c:set var="acao" value="${produto != null ? 'alterar' : 'incluir'}" />
            <input type="hidden" name="acao" value="${acao}" />

            <c:if test ="${produto != null }">
                <input type="hidden" name="idProduto" value="${produto.idProduto}" />
                </c:if>
                
                <div class="mb-3">
                <label for ="nome" class="form-label">Nome:</label>
                <input type="text" name="nome" id="nome" value="${produto.nome}" class="form-control" required />
                </div>
                
                <div class="mb-3">
                <label for="quantidade" class="form-label">Quantidade:</label>
                <input type="number" name="quantidade" id="quantidade" value="${produto.quantidade}" class="form-control" required />
                </div>
                
                <div class="mb-3">
                <label for="preco" class="form-label">Preço de Venda:</label><br/>
                <input type="number" name="preco" id="preco" value="${produto.precoVenda}" class="form-control" required />
                </div>
                
                <!-- Botão -->
                
                <input type="submit" class="btn btn-primary" value="${produto != null ? 'Alterar Produto' : 'Cadastrar Produto'}" />
        </form>
    </body>
</html>

