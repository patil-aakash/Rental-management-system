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
        <title>Customer Request</title>
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
                          <a class="nav-link" href="customerlogin.htm">
                            <span data-feather="home"></span>
                            Dashboard <span class="sr-only">(current)</span>
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="customerlogin.htm">
                            <span data-feather="shopping-cart"></span>
                            Send a Message
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active" href="#">
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
                        <h3 class="container-header">Submit a Service Request</h3>
                                    <ul class="nav nav-tabs">
            <li class="nav-item">
              <a
                class="nav-link active"
                href="#submitrequest"
                role="tab"
                data-toggle="tab"
                >Submit Request</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#requesthistory" role="tab" data-toggle="tab"
                >Request History</a
              >
            </li>
          </ul>
            <br>
                
            <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade show active" id="submitrequest">
              <h3></h3>
                <form action="customersubmitrequest.htm" method="POST">
                                <div class="form-group row">
                                    <label class="col-12 col-md-3 col-form-label" for="problemCategory">Select Problem Category</label>
                                    <div class="col-md-5">
                                    <select class="custom-select mr-sm-2" id="problemCategory" name="problemCategory">
                                      <option selected>Select the problem category</option>
                                      <option value="appliance">Appliance</option>
                                      <option value="doors">Doors and Locks</option>
                                      <option value="electrical">Electrical and lighting</option>
                                      <option value="plumbing">Plumbing and bath</option>
                                      <option value="general">General</option>
                                    </select>
                                    </div>
                                </div>
                                
                                <div class="form-group row">                 
                                    <label class="col-12 col-md-3 col-form-label" for="problemdesc">
                                     Please provide more detail
                                    </label>
                                    <div class="col-md-5">
                                        <textarea
                                        class="form-control"
                                        id="problemdesc"
                                        name="problemdesc"
                                        rows="2"
                                        required
                                      ></textarea>
                                   </div>
                                </div>
                                
                                <div class="form-group row">
                                <label for="name" class="col-12 col-md-3 col-form-label"
                                  >Name</label
                                >
                                <div class="col-md-5">
                                    <input
                                    type="text"
                                    value="${login.getFirstName()} ${login.getLastName()}"
                                    class="form-control"
                                    name="userName"
                                    readonly
                                    />
                                </div>
                                </div>
                            <div class="form-group row">
                                <label for="name" class="col-12 col-md-3 col-form-label"
                                  >Phone Number</label
                                >
                                <div class="col-md-5">
                                    <input
                                    type="text"
                                    value="${login.getPhoneNumber()}"
                                    class="form-control"
                                    name="userPhone"
                                    readonly
                                    />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="name" class="col-12 col-md-3 col-form-label"
                                  >Address</label
                                >
                                <div class="col-md-5">
                                    <input
                                    type="text"
                                    value="${login.getAddress()}"
                                    class="form-control"
                                    name="userAddress"
                                    readonly
                                    />
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="offset-md-3 col-md-10">
                                  <button type="submit" class="btn btn-primary">
                                    Submit Service Request
                                  </button>
                                </div>
                            </div>
                        </form>
            </div>
                        
              <div role="tabpanel" class="tab-pane fade" id="requesthistory">
              <h3>Request History</h3>
              <p class="d-none d-sm-block">
                <form action="customerrequesthistory.htm" method="post">
                  <div class="form-group row">
                    <label for="name" class="col-12 col-md-3 col-form-label"
                      >Name</label
                    >
                    <div class="col-md-8">
                        <input
                        type="text"
                        value="${user.getFirstName()} ${user.getLastName()}"
                        class="form-control"
                        readonly/>
                        
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="offset-md-3 col-md-10">
                      <button type="submit" class="btn btn-primary">
                        Get  History
                      </button>
                    </div>
                  </div>
                </form>
              </p>
            </div>
            </div>
                        
                            
                    </div>
                    
                </div>
            </div>
    </body>
</html>
