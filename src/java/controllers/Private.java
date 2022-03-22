/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import business.User;
import data.UserDA;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author fs148523
 */
public class Private extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        doPost(request, response);
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

        String url = "/target.jsp";
        String message = "";
        String action = request.getParameter("action");
        //set an action value if there is none, to avoid null
        if (action == null) {
            action = "none";
        }

        HttpSession session = request.getSession();

        //check session to see if a user is logged in
        String loggedInUser = (String) session.getAttribute("loggedInUser");

        if (loggedInUser == null || loggedInUser.equals("")) {
            //user is NOT logged in, set up a message and take them back to the index
            message = "Please login";
            url = "/index.jsp";

            //If they aren't logged in, check to see if they are trying to login
            //we know that if the action matches the login form hidden action
            if (action.equals("attemptLogin")) {
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");

                //hard coded credential list / replace with call to DB to retrieve
                //password stored for user.
                HashMap<String, String> credentials = new HashMap();
                credentials.put("bill", "apple is dumb");
                credentials.put("timApple", "microsoft is dumb");
                credentials.put("billy", "notpassword");

                String passFromMap = credentials.get(userName);

                if (passFromMap == null || !passFromMap.equals(password)) {
                    //INVALID LOGIN - set generic error message and take them to index
                    message = "Incorect Password for user";
                    url = "/index.jsp";
                } else {
                    //VALID LOGIN - set success message and take them to page for
                    //logged in users
                    session.setAttribute("loggedInUser", userName);
                    message = "Login Sucesss";
                    url = "/profile.jsp";
                }

            }
        } else {
            //You're already logged in!

            message = "You are still logged in";
            url = "/profile.jsp";

            //code for logged in only actions should happen here
            switch (action) {
                case "updateUser": {

                    break;
                }
            }

        }

        //regardless of what happens put the message in the request and forward
        // to url
        request.setAttribute("message", message);

        getServletContext().getRequestDispatcher(url).forward(request, response);
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
