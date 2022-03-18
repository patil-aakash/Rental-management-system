/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.micasa.controller;

import com.micasa.dao.LoginDAO;
import com.micasa.dao.RequestDAO;
import com.micasa.pojo.Login;
import com.micasa.pojo.Request;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author Pranali
 */
public class WorkerController extends AbstractController {
    
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
            HttpSession session = request.getSession();
            ModelAndView mv = null;
            LoginDAO ld = new LoginDAO();
            RequestDAO rd = new RequestDAO();
            
            if(request.getRequestURI().equals("/MiCasa/workercheckservicerequest.htm")){
                List<Login> customerlist = ld.getUserByRole("Customer");
                List<Request> rl = new ArrayList<>();
//                session.setAttribute("customerlist", customerlist);
                Login login = (Login) session.getAttribute("user");
                for(Login l : customerlist){
                    for(Request r : l.getCustomerRequest()){
                        if(r.getAssignWorker().equals(login.getFirstName()+" "+login.getLastName())){
                            rl.add(r);
                        }
                    }
                }
                
                for(Request r: rl){
                    System.out.println(r.getRequestID() + " "+ r.getRequestType());
                    System.out.println(r.getLogin().getFirstName());
                }
                session.setAttribute("requestlist", rl);
                mv = new ModelAndView("workercheckrequests");
            }
            
            if(request.getRequestURI().equals("/MiCasa/workersubmitrequest.htm")){
                long requestID= Long.parseLong(request.getParameter("reqID"));
                String requestType = request.getParameter("reqType");
                String requestDesc = request.getParameter("reqDesc");
                String status = request.getParameter("getStatus");
                Login w = (Login) session.getAttribute("user");
                String assignWorker = w.getFirstName() + " "+w.getLastName();
                Login c = ld.getUserByID(Long.parseLong(request.getParameter("currlogin")));

                
                rd.updateCustomerRequest(requestID, c, requestType, requestDesc, assignWorker, status);
                
                mv = new ModelAndView("workeralert","message","Work request complete!");
            }
            
            if(request.getRequestURI().equals("/MiCasa/workerprofile.htm")){
                mv = new ModelAndView("workerprofile");
            }
            
            if(request.getRequestURI().equals("/MiCasa/workerlogin.htm")){
                mv = new ModelAndView("workerlogin");
            }
            
            return mv;
    }
    
}
