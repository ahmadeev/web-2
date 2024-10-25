package filters;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class URLFilter implements Filter {
    Logger logger = Logger.getLogger(URLFilter.class.getName());

    @Override
    public void init(FilterConfig filterConfig) {
        logger.setLevel(Level.ALL);
        logger.info("URLFilter init");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String path = httpRequest.getRequestURI();

        if (path.endsWith(".js") || path.endsWith(".css") || path.endsWith(".png") || path.endsWith("index.jsp") || path.endsWith("controller")) {
            chain.doFilter(request, response);
        } else {
            request.setAttribute("path", path);
            httpRequest.getRequestDispatcher("/error_page.jsp").forward(request, response);
        }
    }
}
