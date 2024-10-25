package servlets;

import beans.Hit;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.http.HttpSession;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    public static final Logger logger = Logger.getLogger(ControllerServlet.class.getName());

    private static final BigDecimal LOWER_VALID_X = BigDecimal.valueOf(-3);
    private static final BigDecimal HIGHER_VALID_X = BigDecimal.valueOf(5);

    private static final BigDecimal LOWER_VALID_Y = BigDecimal.valueOf(-5);
    private static final BigDecimal HIGHER_VALID_Y = BigDecimal.valueOf(5);

    private static final BigDecimal LOWER_VALID_R = BigDecimal.valueOf(1);
    private static final BigDecimal HIGHER_VALID_R = BigDecimal.valueOf(3);

    public ControllerServlet() {
        logger.setLevel(Level.ALL);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("GET REQUEST (/controller)");
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("POST REQUEST (/controller)");
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("PROCESSING REQUEST START (/controller)");

        ServletContext context = getServletContext();
        HttpSession session = request.getSession();
        ArrayList<Hit> results = new ArrayList<Hit>();

        if ((request.getParameter("action") != null) && (request.getParameter("action") == "clean" || request.getParameter("action").equals("clean"))) {
            if (session.getAttribute("results") != null) session.removeAttribute("results");
            context.getRequestDispatcher("/index.jsp").forward(request, response);
            logger.info("clean task");
            logger.info("PROCESSING REQUEST END (/controller)");
            return;
        }

        if (session.getAttribute("results") == null) {
            session.setAttribute("results", results);
        }

        try {
            if (isInputValid(request)) {
                context.getRequestDispatcher("/areaCheck").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Bad Request");
            }
        } catch (Exception e) {
            logger.info(e.toString());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.toString());
        }

        logger.info("PROCESSING REQUEST END (/controller)");
    }

    public static boolean isInputValid(HttpServletRequest request) {
        BigDecimal x = new BigDecimal(request.getParameter("xType").replace(",", "."));
        BigDecimal y = new BigDecimal(request.getParameter("yType").replace(",", "."));
        BigDecimal r = new BigDecimal(request.getParameter("RType").replace(",", "."));

        boolean xb = x.compareTo(LOWER_VALID_X) >= 0 && x.compareTo(HIGHER_VALID_X) <= 0;
        boolean yb = y.compareTo(LOWER_VALID_Y) >= 0 && y.compareTo(HIGHER_VALID_Y) <= 0;
        boolean rb = r.compareTo(LOWER_VALID_R) >= 0 && r.compareTo(HIGHER_VALID_R) <= 0;

        logger.info(String.format("isValid(x, y, r) : (%b, %b, %b)", xb, yb, rb));
        return xb && yb && rb;
    }
}
