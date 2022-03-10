/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fs148523
 */
public class Public extends HttpServlet {

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
        String url = "/index.jsp";
        
        ArrayList<String> errors = new ArrayList<String>();
        String message = null;

        String action = request.getParameter("action");
        if (action == null) {
            action = "first";
        }

        switch(action) {
            case "first":
                break;
            case "login":
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String loginError = "";
                boolean isValid = true;
                
                if ("".equals(username)) {
                    loginError += "Username is a required field. ";
                    isValid = false;
                }
                
                if ("".equals(password)) {
                    loginError += "Password is a required field. ";
                    isValid = false;
                }
                
                if (isValid == true) {
                    //Search DB
                    //IF user doesn't exist return error
                    //IF user exists but invalid password return error
                    //IF usename and passworrd correctr then login and goto profile
                }
                
                if(isValid == false) {
                    loginError = "*" + loginError;
                    request.setAttribute("loginError", loginError);
                }
             
                break;
            case "registerPerson":
                errors = new ArrayList<String>();

                String userNameRaw = request.getParameter("username");
                request.setAttribute("userName", userNameRaw);
                String emailRaw = request.getParameter("email");
                request.setAttribute("email", emailRaw);
                String passwordRaw = request.getParameter("password");
                request.setAttribute("password", passwordRaw);
                String birthDayRaw = request.getParameter("birthday");
                request.setAttribute("birthDay", birthDayRaw);

                if ("".equals(userNameRaw) || userNameRaw.length() < 4 || userNameRaw.length() > 20) {
                    errors.add("Your username is long or too short");
                }
            
                if (userNameExists()) {
                    errors.add("Your username already exists");
                }

                if (!emailRaw.contains("@") && !emailRaw.contains(".")) {
                    errors.add("Your email isnt in the right format");
                }
            
                if (emailExists()) {
                    errors.add("Your email already exists");
                }

                if (passwordRaw.length() < 10) {
                    errors.add("Your password isnt long enough");
                }

                LocalDate today = LocalDate.now();
                LocalDate birthDate = null;

                try {
                    birthDate = LocalDate.parse(birthDayRaw);
                
                    Period period = birthDate. until(today);
                    int yearsBetween = period. getYears();
                
                    if (yearsBetween < 18) {
                       errors.add("Your no old enough to make an account");
                    }
                } catch (Exception e) {
                    errors.add("Your birthdate isnt in the right format");
                }

                if (errors.isEmpty()) {
                    //add to db
                 message = "User added";
                } else {
                    message = "User was not added";
                }
            
                request.setAttribute("message", message);
                request.setAttribute("errors", errors);
                url = "/Registration.jsp";
                break;
            }
        
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

    private boolean userNameExists() {
            return false;
        
    }

    private boolean emailExists() {
        return false;
    }

}
