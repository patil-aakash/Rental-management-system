/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.micasa.pojo;


/**
 *
 * @author Pranali
 */
public class Request {
    private long requestID;
    private Login login;
    private String requestType;
    private String requestDesc;
    private String assignWorker;
    private String status;
  
    public long getRequestID() {
        return requestID;
    }

    public void setRequestID(long requestID) {
        this.requestID = requestID;
    }

    public Login getLogin() {
        return login;
    }

    public void setLogin(Login login) {
        this.login = login;
    }

    public String getRequestType() {
        return requestType;
    }

    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }

    public String getRequestDesc() {
        return requestDesc;
    }

    public void setRequestDesc(String requestDesc) {
        this.requestDesc = requestDesc;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAssignWorker() {
        return assignWorker;
    }

    public void setAssignWorker(String assignWorker) {
        this.assignWorker = assignWorker;
    }
}
