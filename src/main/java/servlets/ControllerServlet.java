package servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.logging.Level;
import java.util.logging.Logger;

import beans.Results;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    public static final Logger logger = Logger.getLogger(ControllerServlet.class.getName());

    Results results;

    private static final BigDecimal LOWER_VALID_X = BigDecimal.valueOf(-2);
    private static final BigDecimal HIGHER_VALID_X = BigDecimal.valueOf(2);

    private static final BigDecimal LOWER_VALID_Y = BigDecimal.valueOf(-5);
    private static final BigDecimal HIGHER_VALID_Y = BigDecimal.valueOf(3);

    private static final BigDecimal LOWER_VALID_R = BigDecimal.valueOf(1);
    private static final BigDecimal HIGHER_VALID_R = BigDecimal.valueOf(5);

    public ControllerServlet() {
        results = new Results();
        logger.setLevel(Level.ALL);
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
        logger.info("\n----------------------------PROCESSING REQUEST START (/controller)----------------------------");

        ServletContext context = getServletContext();

        if ((request.getParameter("action") != null) && (request.getParameter("action") == "clean" || request.getParameter("action").equals("clean"))) {
            if (context.getAttribute("results") != null) context.removeAttribute("results");
            context.getRequestDispatcher("/index.jsp").forward(request, response);
            logger.info("\nclean task\n----------------------------PROCESSING REQUEST END (/controller)----------------------------");
            return;
        }

        if (context.getAttribute("results") == null) {
            getServletContext().setAttribute("results", results);
        }

        try {
            if (isInputValid(request)) {
                context.getRequestDispatcher("/areaCheck").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Bad Request");
                // context.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            logger.info(e.toString());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.toString());
        }

        logger.info("\n----------------------------PROCESSING REQUEST END (/controller)----------------------------");
    }

    public static boolean isInputValid(HttpServletRequest request) {
        BigDecimal x = new BigDecimal(request.getParameter("xType").replace(",", "."));
        BigDecimal y = new BigDecimal(request.getParameter("yType").replace(",", "."));
        BigDecimal r = new BigDecimal(request.getParameter("RType").replace(",", "."));

        boolean xb = x.compareTo(LOWER_VALID_X) >= 0 && x.compareTo(HIGHER_VALID_X) <= 0;
        boolean yb = y.compareTo(LOWER_VALID_Y) >= 0 && y.compareTo(HIGHER_VALID_Y) <= 0;
        boolean rb = r.compareTo(LOWER_VALID_R) >= 0 && r.compareTo(HIGHER_VALID_R) <= 0;

        logger.info("\nis x valid? " + xb + "\nis y valid? " + yb + "\nis r valid? " + rb);
        return xb && yb && rb;
    }
}
