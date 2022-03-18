<%-- 
    Document   : customerlogin
    Created on : 27 Mar, 2020, 7:09:01 PM
    Author     : Pranali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Customer Login</title>
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
                    <li><a class="dropdown-item" href="customerprofile.htm">Profile</a></li>
                    <li><a class="dropdown-item" href="customerAccount.htm">Account Settings</a></li>
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
                        <li class="nav-item">
                          <a class="nav-link" href="#" data-toggle="modal" data-target="#customermessage">
                            <span data-feather="shopping-cart"></span>
                            Send a Message
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="customerservicerequest.htm">
                            <span data-feather="users"></span>
                            Submit a Service Request
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="customerpayment.htm">
                            <span data-feather="bar-chart-2"></span>
                            Make a Payment
                          </a>
                        </li>
                      </ul>
                    </div>
            </nav>
                    <div class="col-sm-8" id="profile">
                        <h3 class="container-header">Welcome to MiCasa!</h3>
                    </div>
                    
                <div id="customermessage" class="modal fade" role="dialog">
                <div class="modal-dialog modal-lg" role="content">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Send a Message</h4>
                      <button type="button" class="close" data-dismiss="modal">
                        &times;
                      </button>
                    </div>
                    <div class="modal-body">
                      <form action="customersendmail.htm" method="POST">
                        <div class="form-row">
                          <div class="form-group col-sm-4">
                            <label for="from"
                              >From</label
                            >
                            <input
                              type="email"
                              class="form-control form-control-sm mr-1"
                              id="from"
                              name="from"
                              value="${user.getEmail()}"
                              readonly
                            />
                          </div>
                        </div>
                          
                          <div class="form-row">
                          <div class="form-group col-sm-4">
                            <label for="to"
                              >To</label
                            >
                            <input
                              type="email"
                              class="form-control form-control-sm mr-1"
                              id="to"
                              name="to"
                              value="micasahere@gmail.com"
                              readonly
                            />
                          </div>
                        </div>
                        
                        <div class="form-row">
                          <div class="form-group col-sm-4">
                            <label for="title"
                              >Title</label
                            >
                            <input
                              type="text"
                              class="form-control form-control-sm mr-1"
                              id="title"
                              name="title"
                              required
                            />
                          </div>
                        </div>
                        
                        <div class="form-row">
                          <div class="form-group col-sm-8">
                            <label for="msgBody"
                              >Message</label>
                            <textarea
                                class="form-control"
                                id="msgBody"
                                name="msgBody"
                                rows="3"
                                required
                              ></textarea>
                          </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-sm-8">
                            <button
                            type="button"
                            class="btn btn-secondary btn-sm ml-auto"
                            data-dismiss="modal"
                          >
                            Cancel
                          </button>
                          <button type="submit" class="btn btn-primary btn-sm ml-1">
                            Send
                          </button>
                            </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
            </div>
                    
                </div>
            </div>
    </body>
</html>
