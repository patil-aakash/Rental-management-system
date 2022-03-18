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
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author Pranali
 */
public class ManagerController extends AbstractController {
    
    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
            
        HttpSession session = request.getSession();
        ModelAndView mv = null;
        LoginDAO ld = new LoginDAO();
        RequestDAO rd = new RequestDAO();
        
        if(request.getRequestURI().equals("/MiCasa/managercheckservicerequest.htm")){
            List<Login> customerlist = ld.getUserByRole("Customer");
            List<Login> workerlist = ld.getUserByRole("Worker");
            session.setAttribute("customerlist", customerlist);
            session.setAttribute("workerlist", workerlist);
            for(Login l : customerlist){
                
                for(Request r : l.getCustomerRequest()){

                    if(!r.getStatus().equals("Complete")){
                        System.out.println(r.getStatus());
                    }

                }
            }
            
            System.out.println(workerlist.size());
            
        
            mv = new ModelAndView("managercheckrequests");
        }
        
        if(request.getRequestURI().equals("/MiCasa/managersubmitrequest.htm")){

            long requestID= Long.parseLong(request.getParameter("reqID"));
            String requestType = request.getParameter("reqType");
            String requestDesc = request.getParameter("reqDesc");
            String assignWorker = request.getParameter("getworker");
            String status = request.getParameter("getStatus");
//            Login w = ld.getUserByID(Long.parseLong(request.getParameter("getWorkerID")));
            Login c = ld.getUserByID(Long.parseLong(request.getParameter("currlogin")));
//            System.out.println(request.getParameter("currlogin"));
            Request r = rd.updateCustomerRequest(requestID, c, requestType, requestDesc, assignWorker, status);
////            Request r = rd.addCustomerRequest(w, requestType, requestDesc, assignWorker, status);
//           session.setAttribute("worker",assignWorker);
//            w.addCustomerRequest(r);
            
//            w.addCustomerRequest(r);
////            w.getCustomerRequest().clear();
//                System.out.println(w.getCustomerRequest().size());
//                Set<Request> r1 = w.getCustomerRequest();
// 
//            for(Request r2 : r1){
//                System.out.println(r2.getLogin().getFirstName());
//                System.out.println(r2.getRequestType());
//            }
//            
            if(r !=null){
            mv = new ModelAndView("manageralert","message", "Request sent to worker!");
            }else{
            mv = new ModelAndView("manageralert","message", "Request not submitted");
            }
            
        }
        if(request.getRequestURI().equals("/MiCasa/managerprofile.htm")){
            mv = new ModelAndView("managerprofile");
        }
        if(request.getRequestURI().equals("/MiCasa/managerlogin.htm")){
            mv = new ModelAndView("managerlogin");
        }
        return mv;
    }
}
