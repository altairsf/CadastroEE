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
    </head>
    <body>
        <h2>Dados do Produto</h2>

        <form action="ServletProdutoFC" method="post">
            <c:set var="acao" value="${produto != null ? 'alterar' : 'incluir'}" />
            <input type="hidden" name="acao" value="${acao}" />

            <c:if test ="${produto != null }">
                <input type="hidden" name="idProduto" value="${produto.idProduto}" />
                </c:if>

                <label for ="nome">Nome:</label><br/>
                <input type="text" name="nome" id="nome" value="${produto.nome}" required /><br/><br/>

                <label for="quantidade">Quantidade:</label><br/>
                <input type="number" name="quantidade" id="quantidade" value="${produto.quantidade}" required /><br/><br/>

                <label for="preco">Preço de Venda:</label><br/>
                <input type="number" name="preco" id="preco" value="${produto.precoVenda}" required /><br/><br/>
                
                <!-- Botão -->
                <input type="submit" value="${produto != null ? 'Salvar Produto' : 'Cadastrar Produto'}" />
        </form>
    </body>
</html>

