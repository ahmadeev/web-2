package servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static servlets.AreaCheckServlet.getDouble;
import beans.Results;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    Results results;

    public ControllerServlet() {
        results = new Results();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ((request.getParameter("action") != null) && (request.getParameter("action") == "clean" || request.getParameter("action").equals("clean"))) {
            reqForwarding(request, response, "/cleaner");
            return;
        }

        ServletContext context = getServletContext();
        if (context.getAttribute("results") == null) {
            getServletContext().setAttribute("results", results);
        }

        try {
            if (request.getParameter("xType") != null && request.getParameter("yType") != null && request.getParameter("RType") != null) {
                if (getDouble(request, "yType") >= -5 && getDouble(request, "yType") <= 3) {
                    reqForwarding(request, response,"/areaCheck");
                } else {
                    reqForwarding(request, response,"/index.jsp");
                }
            } else {
                reqForwarding(request, response,"/index.jsp");
            }
        } catch (Exception e) {
            sendError(response, e.toString());
        }
    }

    private void sendError(HttpServletResponse response, String errorMessage) throws IOException {
        /*var json = new Gson();
        Map<String, Object> jsonResponse = new HashMap<>() {{
            put("error", errorMessage);
            put("status", "UNPROCESSABLE_ENTITY");
        }};

        response.setContentType("application/json");
        response.getWriter().write(json.toJson(jsonResponse));*/

        response.setContentType("application/text");
        response.getWriter().write(errorMessage);
    }

    private void reqForwarding(HttpServletRequest request, HttpServletResponse response, String address) throws ServletException, IOException {
        ServletContext servletContext = getServletContext();
        RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher(address);
        requestDispatcher.forward(request, response);
    }
}
