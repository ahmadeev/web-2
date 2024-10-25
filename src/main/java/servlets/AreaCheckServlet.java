package servlets;

import beans.*;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {
    public static final Logger logger = Logger.getLogger(AreaCheckServlet.class.getName());
    public static SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

    public AreaCheckServlet() {
        logger.setLevel(Level.ALL);
        logger.info("AreaCheckServlet init");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("GET REQUEST (/areaCheck)");
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("POST REQUEST (/areaCheck)");
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("PROCESSING REQUEST START (/areaCheck)");

        Long startTime = System.nanoTime();

        ServletContext context = getServletContext();
        HttpSession session = request.getSession();
        ArrayList<Hit> results = (ArrayList<Hit>) session.getAttribute("results");

        double x;
        double y;
        double R;

        try {
            x = Double.parseDouble(request.getParameter("xType").replace(",", "."));
            y = Double.parseDouble(request.getParameter("yType").replace(",", "."));
            R = Double.parseDouble(request.getParameter("RType").replace(",", "."));
        } catch (NumberFormatException e) {
            throw new RuntimeException("Wrong type arguments!");
        }

        Hit hit = new Hit();
        hit.setResult(isHit(x, y, R));

        double scale = Math.pow(10, 2);

        x = Math.ceil(x * scale) / scale;
        y = Math.ceil(y * scale) / scale;

        hit.setX(x);
        hit.setY(y);
        hit.setR(R);
        hit.setCurrentTime(sdf.format(System.currentTimeMillis()));

        Long endTime = System.nanoTime();
        hit.setScriptTime((endTime - startTime) / 1000);


        results.add(hit);
        session.setAttribute("results", results);
        request.setAttribute("result", hit);
        request.setAttribute("results", session.getAttribute("results"));
        context.getRequestDispatcher("/result.jsp").forward(request, response);

        logger.info("PROCESSING REQUEST END (/areaCheck)");
    }

    private boolean isHit(double x, double y, double r) {
        //Top-right
        if (x >= 0 && y >= 0) {
            return (x * x + y * y) <= (r / 2) * (r / 2);
        }
        //Top-left
        if (x <= 0 && y >= 0) {
            return x / 2 + r / 2 >= y;
        }
        //Bottom-left
        if (x <= 0 && y <= 0) {
            return (y >= (-r)) && (x >= (-r) / 2);
        }
        //Bottom-right
        return false;
    }
}
