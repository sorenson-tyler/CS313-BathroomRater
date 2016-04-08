/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tyler Sorenson
 */
@WebServlet(urlPatterns = {"/Map"})
public class Map extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList <ArrayList> markers = new ArrayList<>();
        String dbHost = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
        String dbPort = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
        String dbUser = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
        String dbPassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
        String dbName = "java";
        String mysql = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;

        try {
           Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection(mysql, dbUser, dbPassword);

           PreparedStatement stmt = conn.prepareStatement("SELECT * FROM rated_locations");
           ResultSet rs = stmt.executeQuery();
           while (rs.next()) {
                ArrayList markerDetails = new ArrayList <>();
                markerDetails.add(rs.getString("name"));
                markerDetails.add(Double.valueOf(rs.getString("lat")));
                markerDetails.add(Double.valueOf(rs.getString("lng")));
                markerDetails.add(rs.getInt("stars"));
                markers.add(markerDetails);
            }               
       } catch (ClassNotFoundException | SQLException ex) {
           Logger.getLogger(SaveRating.class.getName()).log(Level.SEVERE, null, ex);
       }
        request.setAttribute("markers", markers);
        request.getRequestDispatcher("mapView.jsp").forward(request,response);
}

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
