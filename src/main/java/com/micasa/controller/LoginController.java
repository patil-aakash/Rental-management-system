/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.micasa.controller;

import com.micasa.dao.LoginDAO;
import com.micasa.pojo.Login;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author Pranali
 */
public class LoginController extends AbstractController {
    static Logger log = Logger.getLogger(LoginController.class.getName());
    
        protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
            
        HttpSession session = request.getSession();
        ModelAndView mv = null;
        
        String option = request.getParameter("option") == null ? "" : request.getParameter("option");
//        if (session.getAttribute("USER") == null && option.equals("")) {
//            return new ModelAndView("index");
//        }
//        
//        String userName = request.getParameter("userName");
//        String password = request.getParameter("password");
        LoginDAO user = new LoginDAO();
        
        switch(option){
            case "logout":
                System.out.println("in logout");
                session.invalidate();
                mv = new ModelAndView("welcome");
                break;
            
            case "login":
                System.out.println("In login!");
                String IptEmail = request.getParameter("InputEmail1");
                String IptPassword = request.getParameter("InputPassword1");
                int checkUser1 = user.getUserByEmail(IptEmail);
                Login loggedUser = user.authenticateLogin(IptEmail, IptPassword);
                List<Login> list = user.getAllUsers();
   
//                if(checkUser1 == 0 && loggedUser == null){
//                      String msg ="No such user";
//                      mv =  new ModelAndView("welcome");
//                      session.setAttribute("message1",msg);
//                }
                
                for(Login l : list){
                    if(l.getEmail().equals(IptEmail)){
                        String msg = "Invalid credentials";
                        mv = new ModelAndView("welcome");
                        session.setAttribute("message1",msg);
                    }
                }
                
                if(loggedUser == null){
                      String msg ="Invalid User";
                      mv =  new ModelAndView("welcome");
//                      System.out.println("No such user");
                      session.setAttribute("message1",msg);
                } else{
                      session.setAttribute("user", loggedUser);
//                    mv = new ModelAndView(new RedirectView("/springmvc/messageHome.htm", false));
                      if(loggedUser.getRole().equalsIgnoreCase("Customer")){
                          mv = new ModelAndView("customerlogin","user",loggedUser);
                      }
                      if(loggedUser.getRole().equalsIgnoreCase("Manager")){
                          mv = new ModelAndView("managerlogin","user",loggedUser);
                      }
                      if(loggedUser.getRole().equalsIgnoreCase("Worker")){
                          mv = new ModelAndView("workerlogin","user",loggedUser);
                      }
                      System.out.println("Logged in: " + loggedUser.getFirstName());
                      System.out.println(loggedUser.getRole());
                }
                break;
                
            case "register":
                System.out.println("In register!");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String InputEmail = request.getParameter("InputEmail");
                String InputPassword = request.getParameter("InputPassword");
                String telNumber = request.getParameter("telNumber");
                String address = request.getParameter("address");
                String role = request.getParameter("role");
                
//                int checkUser = user.getUserByEmail(InputEmail);
                
//                    String msg ="Email address already registered";
//                    mv =  new ModelAndView("welcome");
//                    session.setAttribute("message1",msg);
                try{
                    user.addUser(firstName, lastName, InputEmail, InputPassword, telNumber, address, role);
                    String msg ="User has been added successfully";
                    mv = new ModelAndView("success","message", msg);
                }catch(Exception e){
                    mv =  new ModelAndView("welcome");
                    System.out.println("something went wrong");                   
//                    String msg ="Email address already registered";                   
                    session.setAttribute("message1","Email address already registered");
                }
                
//                if (registerUser == 1) {
//                    String msg ="User has been added successfully";
//                    mv = new ModelAndView("success","message", msg);
//                } else {
//                    mv = new ModelAndView("loginPage");
//                }
                
               
                break;
        }
        
        if(request.getRequestURI().equals("/MiCasa/logout.htm")){
                session.invalidate();
                mv = new ModelAndView("welcome");
        }
        
        return mv;
        
    }
}
