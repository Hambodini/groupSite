/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import business.User;
import data.UserDA;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.LinkedHashMap;
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

        HttpSession session = request.getSession();

        switch (action) {
            case "first":
                break;
            case "goToRegistration":
                url="/Registration.jsp";
                break;
            case "login":
                String username = request.getParameter("username");
                request.setAttribute("userName", username);
                String password = request.getParameter("password");
                request.setAttribute("password", password);
                String loginError = "";
                boolean isValid = true;

                if ("".equals(username)) {
                    loginError += "Username is a required field. <br>";
                    isValid = false;
                }

                if ("".equals(password)) {
                    loginError += "Password is a required field. ";
                    isValid = false;
                }

                try {
                    if (isValid) {
                        isValid = UserDA.userNameExists(username);

                        if (isValid) {
                            String correctPassword = UserDA.getUserPassword(username);
                            if (!password.equals(correctPassword)) {
                                loginError = "Password is not correct.";
                            } else {
                                //login user

                                url = "/private?action=profile";
                                User user = UserDA.getUserByUsername(username);
                                session.setAttribute("loggedInUser", user.getUsername());
                            }
                        } else {
                            loginError = "User does not exist.";
                        }
                    }
                } catch (SQLException e) {
                    loginError = "SQL Exception, please try again.";
                    isValid = false;
                }

                request.setAttribute("loginError", loginError);

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
                    errors.add("Your username must be between 4 and 20 characters.");
                }

                if (userNameExists(userNameRaw)) {
                    errors.add("Your username already exists");
                }

                if (!emailRaw.contains("@") && !emailRaw.contains(".")) {
                    errors.add("Your email isn't in the right format.");
                }

                if (emailExists(emailRaw)) {
                    errors.add("Your email already exists.");
                }

                if (passwordRaw.length() < 10) {
                    errors.add("Your password isn't long enough");
                }

                LocalDate today = LocalDate.now();
                LocalDate birthDate = null;

                try {
                    birthDate = LocalDate.parse(birthDayRaw);

                    Period period = birthDate.until(today);
                    int yearsBetween = period.getYears();

                    if (yearsBetween < 18) {
                        errors.add("Sorry, you are not old enough to make an account.");
                    }
                } catch (Exception e) {
                    errors.add("Your birthdate isn't in the right format.");
                }

                if (errors.isEmpty()) {
                    User user = new User(userNameRaw, emailRaw, passwordRaw, birthDate);
                    try {
                        UserDA.insert(user);
                    } catch (SQLException ex) {
                    }
                    message = "User added!";
                } else {
                    message = "User was not added.";
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

    private boolean userNameExists(String userNameRaw) {
        try {
            return UserDA.userNameExists(userNameRaw);
        } catch (SQLException e) {
        } catch (Exception e) {
        }
        return false;

    }

    private boolean emailExists(String emailRaw) {
        try {
            return UserDA.emailExists(emailRaw);
        } catch (SQLException e) {
        }
        return false;
    }

}
