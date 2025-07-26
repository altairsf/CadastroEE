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
    </head>
    <body>
        <h2>Listagem de Produtos</h2>
        <!-- Link para o formulário de inclusão -->
        <p>
            <a href="?acao=formIncluir">Novo Produto</a>
        </p>
         <!-- Dados -->
        <table>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Quantidade</th>
            <th>Preço de Venda</th>
            <th>Opções</th>
        </tr>
        
        <c:forEach var="p" items="${produtos}">
            <tr>
                <td>${p.idProduto}</td>
                <td>${p.nome}</td>
                <td>${p.quantidade}</td>
                <td>R$ ${p.precoVenda}</td>
                <td>
                    <a href="?acao=formAlterar&idProduto=${p.idProduto}">Alterar</a> |
                    <a href="?acao=excluir&idProduto=${p.idProduto}" onclick="return confirm('Deseja excluir este produto?')">Excluir</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    </body>
</html>
