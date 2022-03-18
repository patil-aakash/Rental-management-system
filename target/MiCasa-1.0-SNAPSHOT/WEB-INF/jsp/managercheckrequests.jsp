<%-- 
    Document   : customerlogin
    Created on : 27 Mar, 2020, 7:09:01 PM
    Author     : Pranali
--%>

<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="css/styles.css" />
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script 
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
    </script>
        <title>Manager Requests</title>
    </head>
    <body>
        <header>
            <div class="navbar navbar-dark bg-dark box-shadow">
              <div class="container">
                <a href="#" class="navbar-brand d-flex">
                  <img src="img/house.png" width="30" height="25"/>
                  <!--<strong>Mi Casa</strong>-->
                  <h5 class="my-0 mr-md-auto font-weight-normal">Mi Casa</h5>
                </a>
                  
                  
<!--                <nav class="my-2 my-md-0 mr-md-3 pl-5">
                    <a class="p-3 text-white" href="#">Marketplace</a>
                    <a class="p-3 text-white" href="#">Community</a>
                    <a class="p-3 text-white" href="#">Groups</a>
                    <a class="p-3 text-white" href="#">Dashboard</a>
                </nav>-->
                  
            <div class="btn-group open bg-dark">
                <a class="btn" data-toggle="dropdown"><i class="fa fa-user fa-lg" style="color:white"></i></a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item disabled">${user.getFirstName()} ${user.getLastName()}</a></li>
                    <li><a class="dropdown-item" href="managerprofile.htm">Profile</a></li>
                    <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout.htm">Sign Out</a>
                </ul>
            </div>
            </div> 
              </div>            
      </header>
                    
            <div id="container">
                <div class="row">
                <nav class="col-sm-2 d-none d-sm-block bg-light sidebar">
                    <div>
                        <img src="img/avatar-login.png" width="100%" height="auto"/>
                        <h4 align="center"> ${user.getFirstName()} ${user.getLastName()}</h4>
                    </div>
                   
                    <div class="sidebar-sticky">
                      <ul class="nav flex-column">
                        <li class="nav-item">
                          <a class="nav-link active" href="#">
                            <span data-feather="home"></span>
                            Dashboard <span class="sr-only">(current)</span>
                          </a>
                        </li>
                      </ul>
                    </div>
            </nav>
                    <div class="col-sm-8" id="profile">
                        <h3 class="container-header">Manager Dashboard</h3>
                        <div class="row align-items-center">
                            <div class="col-12 col-sm-8">
                                <ul class="nav nav-pills">
                                    <li class="nav-item">
                                        <a
                                          class="nav-link "
                                          href="managerlogin.htm"
                                          >Check Messages</a
                                        >
                                      </li>
                                      <li class="nav-item">
                                        <a class="nav-link active" href="#"
                                          >Check Service Request</a
                                        >
                                      </li>
                                </ul>
                            
                            
                                 <br>
                                 <br>
                    <h3>Service Requests</h3>
                    <br>  
                    
                        <c:forEach var="customer" items="${customerlist}">                        
                        <c:forEach var="request" items="${customer.getCustomerRequest()}">
                            <c:if test="${(request.getStatus() ne 'Complete') && (request.getStatus() ne 'Assigned')}">
                                <div class="card">
                                <div class="card-body">
                                  <form action="managersubmitrequest.htm" method="post"> 
                            <input type="hidden" name="currlogin" value="${customer.getId()}"/>
                                    
                            <b>Customer Name :</b><c:out value=" ${request.getLogin().getFirstName()} ${request.getLogin().getLastName()}"/> 
                            <input type="hidden" name="currlogin" value="${request.getLogin().getId()}"/>
                                   <br>
                            <b>Customer Phone Number :</b><c:out value=" ${request.getLogin().getPhoneNumber()}"/>
                                    <br>
                            <b>Customer Address :</b><c:out value=" ${request.getLogin().getAddress()}"/>   
                                    <br>
                            
                                   Request ID :<c:out value=" ${request.getRequestID()}"/>
                                   <input type="hidden" name="reqID" value="${request.getRequestID()}"/>
                                   
                                   <br>
                                   Request Type :<c:out value=" ${request.getRequestType()}"/>
                                   <input type="hidden" name="reqType" value="${request.getRequestType()}"/>
                                   <br>
                                   Request Description :<c:out value=" ${request.getRequestDesc()}"/>
                                   <input type="hidden" name="reqDesc" value="${request.getRequestDesc()}"/>
                                   <br>
                                   
                                   Assign Worker :
                                   <select class="custom-select mr-sm-2" name="getworker" id="getWorker">
                                       <option>Not Assigned</option>
                                       <c:forEach var="worker" items="${workerlist}">
                                           <option value="${worker.getFirstName()} ${worker.getLastName()}">
                                      <c:out value="${worker.getFirstName()} ${worker.getLastName()}"/></option>
                                       </c:forEach>
                                   </select>

                                   <br>
                                   Status:
                                   <select class="custom-select mr-sm-2" name="getStatus" id="getStatus">
                                      <option>Not Assigned</option>
                                      <option value="Assigned">Assigned</option>
                                    </select>
                                   <br>
                                   <br>
                                   
                                   <div class="col-md-10">
                                  <button type="submit" class="btn btn-primary">
                                    Submit Service Request
                                  </button>
                                    </div>
                                   
                                   <br>
                        </form>
                                   
                                   </div>
                                   </div> 
                            </c:if>  
                            <br>
                        </c:forEach>
                        
                        </c:forEach>

                    
                </div> 
                </div> 
                </div>
                </div>
                </div>

    </body>
</html>
