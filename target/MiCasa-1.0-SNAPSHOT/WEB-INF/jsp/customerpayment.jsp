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
    <link rel=“stylesheet” href=“https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css”>
    <!--<script src=“https://code.jquery.com/jquery-1.12.4.js”></script>-->
    <!--<script src=“https://code.jquery.com/ui/1.12.1/jquery-ui.js”></script>-->
    <script 
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
    </script>

    <script>
      $(function () {
        $("#datepicker").datepicker({ minDate: 0});
      });
    </script>
        <title>Payment</title>  
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
                          <a class="nav-link" href="customerservicerequest.htm">
                            <span data-feather="users"></span>
                            Submit a Service Request
                          </a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active" href="#">
                            <span data-feather="bar-chart-2"></span>
                            Make a Payment
                          </a>
                        </li>
                      </ul>
                    </div>
            </nav>
                    <div class="col-sm-8" id="profile">
                        <h3 class="container-header">Payment Center</h3>
                        
              <div class="row align-items-center">
              <div class="col-12 col-sm-8">
            <ul class="nav nav-tabs">
            <li class="nav-item">
              <a
                class="nav-link active"
                href="#payment"
                role="tab"
                data-toggle="tab"
                >Make Payment</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#history" role="tab" data-toggle="tab"
                >Show Payment History</a
              >
            </li>
          </ul>
                  <br>
                  <br>
            <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade show active" id="payment">
              <!--<h3>Pay Rent</h3>-->
                <form action="customerconfirmpayment.htm" method="post">
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
                    <label for="datetime" class="col-12 col-md-3 col-form-label"
                      >Date</label
                    >
                    <div class="col-md-8">
                      <input
                        type="date"
                        class="form-control"
                        id="datepicker"
                        name="datetime"
                        required
                      />
                    </div>
                  </div>
                  
                  <div class="form-group row">
                    <label for="amount" class="col-12 col-md-3 col-form-label"
                      >Amount</label
                    >
                    <div class="col-md-8">
                      <input
                        type="number"
                        class="form-control"
                        name="amount"
                        placeholder="Amount"
                        min="1"
                        required
                      />
                    </div>
                  </div>    

                  <div class="form-group row">
                    <div class="offset-md-3 col-md-10">
                      <button type="submit" class="btn btn-primary">
                        Make Payment
                      </button>
                    </div>
                  </div>
                </form>
            </div>
                        
              <div role="tabpanel" class="tab-pane fade" id="history">
              <h3>Payment History</h3>
              <p class="d-none d-sm-block">
                <form action="customerpaymenthistory.htm" method="post">
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
                        Get Payment History
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
          </div>
        </div>

    </body>
</html>
