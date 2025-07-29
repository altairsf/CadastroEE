<%-- 
    Document   : ProdutoLista
    Created on : 7 de jul. de 2025, 23:20:43
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
        <h2>Listagem de Produtos</h2>
        <!-- Link para o formulário de inclusão -->
        <p>
            <a href="?acao=formIncluir" class="btn btn-primary m-2">Novo Produto</a>
        </p>
         <!-- Dados -->
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                <th>#</th>
                <th>Nome</th>
                <th>Quantidade</th>
                <th>Preço de Venda</th>
                <th>Opções</th>
            </tr>
            </thead>
        
        <c:forEach var="p" items="${produtos}">
            <tr>
                <td>${p.idProduto}</td>
                <td>${p.nome}</td>
                <td>${p.quantidade}</td>
                <td>R$ ${p.precoVenda}</td>
                <td>
                    <a href="?acao=formAlterar&idProduto=${p.idProduto}"
                       class="btn btn-primary btn-sm">Alterar</a> |
                    <a href="?acao=excluir&idProduto=${p.idProduto}" 
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Deseja excluir este produto?')">Excluir</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    </body>
</html>
