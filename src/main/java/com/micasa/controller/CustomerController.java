/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.micasa.controller;

import com.micasa.dao.LoginDAO;
import com.micasa.dao.RentDAO;
import com.micasa.dao.RequestDAO;
import com.micasa.pojo.Login;
import com.micasa.pojo.Rent;
import com.micasa.pojo.Request;
import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author Pranali
 */
public class CustomerController extends AbstractController { 
    
            protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
            
        HttpSession session = request.getSession();
        ModelAndView mv = null;
        RentDAO rd = new RentDAO();
        LoginDAO ld = new LoginDAO();
        RequestDAO reqd = new RequestDAO();
        
        
//        String option = request.getParameter("option") == null ? "" : request.getParameter("option");
//        if (session.getAttribute("USER") == null && option.equals("")) {
//            return new ModelAndView("index");
//        }
//        
//        String userName = request.getParameter("userName");
//        String password = request.getParameter("password");
        if(request.getRequestURI().equals("/MiCasa/customerprofile.htm")){
                mv = new ModelAndView("customerprofile");
            }
        if(request.getRequestURI().equals("/MiCasa/customerlogin.htm")){
                mv = new ModelAndView("customerlogin");
            }
        if(request.getRequestURI().equals("/MiCasa/customerpayment.htm")){
                if(session.getAttribute("user")==null){
                    mv = new ModelAndView("welcome");
                }else{
                    mv = new ModelAndView("customerpayment");
                }
                
            }
        if(request.getRequestURI().equals("/MiCasa/customerconfirmpayment.htm")){
                SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd");
                Date date1=formatter1.parse(request.getParameter("datetime")); 
                java.sql.Date sqlDate = new java.sql.Date(date1.getTime());
                float amount = Float.parseFloat(request.getParameter("amount"));
                Login login = (Login) session.getAttribute("user");
//                long id = login.getId();
                Rent rent = rd.addCustomerRent(login, sqlDate, amount);
                login.addRentRecord(rent);
//                int result = ld.updateCustomerRent(login,rent);
//                System.out.println(login.getRentRecord().size());
//                    if (result == 1) {
                    mv = new ModelAndView("alertpage","message", "Payment Successfull!");
//                } else {
//                    mv = new ModelAndView("alertpage", "message", "Payment Unsuccessfull!");
//                }
            }
        if(request.getRequestURI().equals("/MiCasa/customerprofilephoto.htm")){
            Login login = (Login) session.getAttribute("user");
            String email = login.getEmail();
            String filepath = request.getParameter("img");
            System.out.println(filepath);
//            File file = new File("/Users/Pranali/NetBeansProjects/MiCasa/src/main/webapp/img/" + filepath);                      
//            System.out.println(email);
//            System.out.println(file);
//            System.out.println(file.getPath());
//            System.out.println(file.getAbsolutePath()); 
            
//            String relativeWebPath = "/img";
//            String absolutePath = getServletContext().getRealPath(relativeWebPath);
//            System.out.println(absolutePath);

//            int result = ld.saveImage(email,file);
//            if (result == 1) {
//                    mv = new ModelAndView("alertpage","message", "Payment Successfull!");
//                } else {
//                    mv = new ModelAndView("alertpage", "message", "Payment Unsuccessfull!");
//                }
//            mv = new ModelAndView("customerprofile");
        }
        
        if(request.getRequestURI().equals("/MiCasa/customerpaymenthistory.htm")){
            Login login = (Login) session.getAttribute("user");
            Set<Rent> custrent= login.getRentRecord();
            mv = new ModelAndView("customerhistory","custrent",custrent);
            
        }
        
        if(request.getRequestURI().equals("/MiCasa/customerprofileedit.htm")){
            Login login = (Login) session.getAttribute("user");
            long id = login.getId();
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String userEmail = request.getParameter("userEmail");
            String userPhone = request.getParameter("userPhone");
            String userAddress = request.getParameter("userAddress");
            String password = request.getParameter("password");
            int result = ld.updateUser(id,firstName,lastName,userEmail,userPhone,userAddress,password);
            if (result == 1) {
                    mv = new ModelAndView("alertpage","message", "Update Successful!");
                } else {
                    mv = new ModelAndView("alertpage", "message", "Update Unsuccessfull!");
                }
        }
        if(request.getRequestURI().equals("/MiCasa/customerservicerequest.htm")){
            Login login = (Login) session.getAttribute("user");
            mv= new ModelAndView("customerrequest","login",login);            
        }
        if(request.getRequestURI().equals("/MiCasa/customersubmitrequest.htm")){
            
            Login login = (Login) session.getAttribute("user");
            String problemCategory = request.getParameter("problemCategory");
            String problemdesc = request.getParameter("problemdesc");
            String worker = "Not Assigned";
            String status = "Not Assigned";
            Request req = reqd.addCustomerRequest(login, problemCategory, problemdesc,worker,status);
            login.addCustomerRequest(req);
            System.out.println(login.getCustomerRequest().size());
//            List<Login> loginlist = ld.getWorkers("Worker");
//            for(Login l : loginlist){
//                System.out.println(l.getFirstName()+ " "+l.getLastName());
//            }

//            ar.addPendingRequest(req);
            
            
//            System.out.println(ar.getPendingRequest().size());
//            if (result == 1) {
                    mv = new ModelAndView("alertpage","message", "Request Submitted Sucessfully!");
//                } 
//            else {
//                    mv = new ModelAndView("alertpage", "message", "Request Not Submitted, please check again later!");
//                }
        }
        if(request.getRequestURI().equals("/MiCasa/customerAccount.htm")){
            mv = new ModelAndView("customeraccount");
        }
        if(request.getRequestURI().equals("/MiCasa/customeraccountdelete.htm")){
            Login login = (Login) session.getAttribute("user");
            
            int result = ld.deleteUser(login.getId());
            
            if(result ==1){
                session.invalidate();
                mv = new ModelAndView("welcome");
            }     
        }
        if(request.getRequestURI().equals("/MiCasa/customerrequesthistory.htm")){
            Login login = (Login) session.getAttribute("user");
            Set<Request> rl = login.getCustomerRequest();
            mv = new ModelAndView("customerrequesthistory","requestlist",rl);
        }
        if(request.getRequestURI().equals("/MiCasa/customersendmail.htm")){
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            String msgBody = request.getParameter("msgBody");
            String title = request.getParameter("title");
           boolean sent = EmailController.sendEmail(from,to,msgBody,title);
           
           if(sent){
               mv = new ModelAndView("alertpage","message","Email sent");
           }else{
               mv = new ModelAndView("alertpage","message","Email not sent, try again later!");
           }
        }
        return mv;
    }
}
