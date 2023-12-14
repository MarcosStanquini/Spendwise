package br.spendwise.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.spendwise.model.domain.Usuario;

@WebFilter("/*")
public class FiltroPaginas implements Filter {
    public FiltroPaginas() {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;

        String url = httpServletRequest.getRequestURI();

        HttpSession sessao = httpServletRequest.getSession();

        if (sessao.getAttribute("usuautenticado") != null || url.lastIndexOf("login.jsp") > -1
                || url.contains("index.jsp") || url.contains("usuarios")
                || url.contains("autenticacoes")) {
                    if (url.contains("visualizar.jsp")) {
                        Usuario usuautenticado = (Usuario) sessao.getAttribute("usuautenticado");
                        if (usuautenticado != null) {
                            request.setAttribute("usuarioId", usuautenticado.getId());
                            request.setAttribute("usuarioIdespesa", usuautenticado.getId());
                        }
                    }
            chain.doFilter(request, response);
        } else {
            ((HttpServletResponse) response).sendRedirect("login.jsp");
        }
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }

}
