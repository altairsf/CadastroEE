package cadastroee.servlets;

import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletProdutoFC", urlPatterns = {"/ServletProdutoFC"})
public class ServletProdutoFC extends HttpServlet {

    @EJB
    private ProdutoFacadeLocal facade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String acao = request.getParameter("acao");
        String destino;

        if ("formIncluir".equals(acao) || "formAlterar".equals(acao)) {
            destino = "ProdutoDados.jsp";

            if ("formAlterar".equals(acao)) {
                try {
                    int id = Integer.parseInt(request.getParameter("idProduto"));
                    Produto produto = facade.find(id);
                    request.setAttribute("produto", produto);
                } catch (NumberFormatException e) {
                    request.setAttribute("erro", "ID inválido para alteração");
                }
            }

        } else {
            destino = "ProdutoLista.jsp";

            if (acao == null) {
                acao = "listar"; // ação padrão
            }

            try {
                switch (acao) {
                    case "listar":
                        request.setAttribute("produtos", facade.findAll());
                        break;

                    case "excluir":
                        int idExclusao = Integer.parseInt(request.getParameter("idProduto"));
                        Produto prodExclusao = facade.find(idExclusao);
                        if (prodExclusao != null) {
                            facade.remove(prodExclusao);
                        }
                        request.setAttribute("produtos", facade.findAll());
                        request.setAttribute("mensagem", "Produto excluído com sucesso!");

                        break;

                    case "alterar":
                        int idAlt = Integer.parseInt(request.getParameter("idProduto"));
                        Produto prodAlt = facade.find(idAlt);
                        if (prodAlt != null) {
                            prodAlt.setNome(request.getParameter("nome"));
                            prodAlt.setQuantidade(Integer.valueOf(request.getParameter("quantidade")));
                            prodAlt.setPrecoVenda(Integer.valueOf(request.getParameter("preco")));
                            facade.edit(prodAlt);
                        }
                        request.setAttribute("produtos", facade.findAll());
                        request.setAttribute("mensagem", "Produto alterado com sucesso!");

                        break;

                    case "incluir":
                        Produto novoProd = new Produto();
                        novoProd.setIdProduto(facade.getProximoIdProduto());
                        novoProd.setNome(request.getParameter("nome"));
                        novoProd.setQuantidade(Integer.valueOf(request.getParameter("quantidade")));
                        novoProd.setPrecoVenda(Integer.valueOf(request.getParameter("preco")));
                        facade.create(novoProd);
                        request.setAttribute("produtos", facade.findAll());
                        request.setAttribute("mensagem", "Produto incluído com sucesso!");
                        break;

                    default:
                        request.setAttribute("produtos", facade.findAll());
                        break;
                }
            } catch (Exception e) {
                request.setAttribute("erro", "Erro ao processar a ação: " + e.getMessage());
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher(destino);
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
