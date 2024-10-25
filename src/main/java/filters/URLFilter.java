package filters;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import servlets.ControllerServlet;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class URLFilter implements Filter {
    Logger logger = Logger.getLogger(URLFilter.class.getName());

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        logger.setLevel(Level.ALL);
        logger.info("URLFilter init");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String path = httpRequest.getRequestURI();

        // Разрешенные URL (например, страницы .jsp и сервлеты)
        if (path.endsWith(".css") || path.endsWith(".js") || path.endsWith("index.jsp") || path.endsWith("result.jsp") || path.endsWith("/controller")) {
            chain.doFilter(request, response); // Пропустить запрос
        } else {
            // Обработка запроса с неразрешенного URL
            //request.setAttribute("path", path);
            httpRequest.getRequestDispatcher("/error_page.jsp").forward(request, response);
        }
    }
}
