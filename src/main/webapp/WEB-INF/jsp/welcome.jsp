<%-- 
    Document   : welcome
    Created on : 24 Mar, 2020, 1:20:46 AM
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
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/additional-methods.js"></script>
    <script 
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
    </script>
        <title>Mi Casa</title>
    </head>
    <body>
      <header>
        <div class="navbar navbar-dark bg-dark box-shadow">
          <div class="container d-flex justify-content-center">
            <a href="#" class="navbar-brand d-flex align-items-center">
              <img src="img/house.png" width="30" height="25"/>
              <strong>Mi Casa</strong>
            </a>
          </div>
        </div>
      </header>
        
        <div class="container">
            <div class="row row-content">
                <div class="col-sm-4 offset-sm-4">
                    <a href="#" class="btn btn-info btn-lg btn-block" role="button" aria-disabled="true" data-toggle="modal" data-target="#loginModal">
                        New User? Get Started Now
                    </a>
    
                </div>      
            </div>
            
            <div id="loginModal" class="modal fade" role="dialog">
                <div class="modal-dialog modal-lg" role="content">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Sign Up</h4>
                      <button type="button" class="close" data-dismiss="modal">
                        &times;
                      </button>
                    </div>
                    <div class="modal-body">
                      <form action="register.htm" method="POST" id="registerForm">
                        <div class="form-row">
                          <div class="form-group col-sm-4">
                            <label for="firstName"
                              >First Name</label
                            >
                            <input
                              type="text"
                              class="form-control form-control-sm mr-1"
                              id="firstName"
                              name="firstName"
                              placeholder="First Name"
                              minlength="2"
                              required
                            />
                          </div>
                          <div class="form-group col-sm-4">
                            <label for="lastName"
                              >Last Name</label
                            >
                            <input
                              type="text"
                              class="form-control form-control-sm mr-1"
                              id="lastName"
                              name="lastName"
                              placeholder="Last Name"
                              minlength="2"
                              required
                            />
                          </div>
                        </div>
                          
                        <div class="form-row">
                          <div class="form-group col-sm-4">
                            <label for="InputEmail"
                              >Email address</label
                            >
                            <input
                              type="email"
                              class="form-control form-control-sm mr-1"
                              id="InputEmail"
                              name="InputEmail"
                              placeholder="Enter email"
                              required
                            />
                          </div>
                          <div class="form-group col-sm-4">
                            <label for="InputPassword"
                              >Password</label
                            >
                            <input
                              type="password"
                              class="form-control form-control-sm mr-1"
                              id="InputPassword"
                              name="InputPassword"
                              placeholder="Password"
                              required
                            />
                          </div>
                        </div>
                          
                        <div class="form-row">
                          <div class="form-group col-sm-4">
                            <label for="telNumber"
                              >Phone Number</label
                            >
                            <input
                              type="tel"
                              class="form-control form-control-sm mr-1"
                              id="telNumber"
                              name="telNumber"
                              placeholder="US Phone Number"
                              required
                            />
                          </div>
                        </div>
                        
                        <div class="form-row">
                          <div class="form-group col-sm-8">
                            <label for="address"
                              >Address</label>
                            <textarea
                                class="form-control"
                                id="address"
                                name="address"
                                rows="2"
                                placeholder="Address"
                                required
                              ></textarea>
                          </div>
                        </div>
                        
                          <div class="form-row">
                            <div class="form-group col-sm-8">
                                <label 
                              >Select Role: </label
                            >
                             <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="role" id="Customer" value="Customer" required>
                                <label class="form-check-label" for="Customer">Customer</label>       
                             </div>
                             <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="role" id="Manager" value="Manager">
                                <label class="form-check-label" for="Manager">Manager</label>
                             </div>
                             <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="role" id="Worker" value="Worker">
                                <label class="form-check-label" for="Worker">Worker</label>
                             </div>
                            </div>
                          </div>

                        <div class="form-row">
                          <button
                            type="button"
                            class="btn btn-secondary btn-sm ml-auto"
                            data-dismiss="modal"
                          >
                            Cancel
                          </button>
                          <button type="submit" class="btn btn-primary btn-sm ml-1">
                            Sign in
                          </button>
                        </div>
                          <input type="hidden" value="register" name="option" />
                      </form>
                    </div>
                  </div>
                </div>
            </div>
            
            <div class="row">
                <div class="offset-sm-4 col-sm-4">
                    <div class="new-separator"><span>OR</span></div>
                </div>
            </div>
            
            
<!--            <div class="row row-content">
                <div class="col-sm-8 offset-sm-4">
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                          <a class="nav-link active" data-toggle="pill" href="#">Customer</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#">Manager</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#">Admin</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" data-toggle="pill" href="#">Worker</a>
                        </li>
                    </ul>
                </div>
            </div>-->
            
            <div class="row align-items-center">
                <div class="offset-sm-4 col-sm-4">
                    <h6 style="color: red; font-style: italic" >${message1}</h6>
                    <form action="login.htm" method="POST">
                        <div class="form-group">
                          <label for="InputEmail">Email address</label>
                          <input type="email" class="form-control" id="InputEmail1" name="InputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                        </div>
                        <div class="form-group">
                          <label for="InputPassword">Password</label>
                          <input type="password" class="form-control" id="InputPassword1" 
                                 name="InputPassword1" placeholder="Password" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <input type="hidden" value="login" name="option" />
                    </form>
                </div>
            </div>
            
        </div>
        <script>
        $("#registerForm").validate({
  rules: {
    telNumber: {
      required: true,
      phoneUS: true
    }
  }
});
        </script>
    </body>
</html>
