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
      <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script>
    <script 
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
    </script>
        <title>Worker Login</title>
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
                    <li><a class="dropdown-item" href="#">Profile</a></li>
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
                          <a class="nav-link active" href="workerlogin.htm">
                            <span data-feather="home"></span>
                            Dashboard <span class="sr-only">(current)</span>
                          </a>
                        </li>
                      </ul>
                    </div>
            </nav>
                    <div class="col-sm-8" id="profile">
                        <h3 class="container-header">Edit my Profile</h3>
                        <p>Your Profile Picture</p>
                        <form action="customerprofilephoto.htm" method="POST">
                            <div class="form-group-row">
                            <input type="file" id="img" name="img">
                            <button type="submit" class="btn btn-primary">
                                    Change Profile Picture
                            </button>
                        </div>
                        </form>
                        
                        <br>
                        <br>
                        
                        <form action="customerprofileedit.htm" method="POST" id="workerprofile">
                            <div class="form-group row">
                                <label for="name" class="col-12 col-md-3 col-form-label"
                                  >First Name</label
                                >
                                <div class="col-md-5">
                                    <input
                                    type="text"
                                    value="${user.getFirstName()}"
                                    class="form-control"
                                    name="firstName"
                                    minlength="2"
                                    />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="name" class="col-12 col-md-3 col-form-label"
                                  >Last Name</label
                                >
                                <div class="col-md-5">
                                    <input
                                    type="text"
                                    value="${user.getLastName()}"
                                    class="form-control"
                                    name="lastName"
                                    minlength="2"
                                    />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="name" class="col-12 col-md-3 col-form-label"
                                  >Email</label
                                >
                                <div class="col-md-5">
                                    <input
                                    type="email"
                                    value="${user.getEmail()}"
                                    class="form-control"
                                    name="userEmail"
                                    />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="name" class="col-12 col-md-3 col-form-label"
                                  >Phone Number</label
                                >
                                <div class="col-md-5">
                                    <input
                                    type="tel"
                                    value="${user.getPhoneNumber()}"
                                    class="form-control"
                                    name="userPhone"
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
                                    value="${user.getAddress()}"
                                    class="form-control"
                                    name="userAddress"
                                    />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="password" class="col-12 col-md-3 col-form-label"
                                  >Update Password</label
                                >
                                <div class="col-md-5">
                                    <input
                                    type="password"
                                    value="${user.getPassword()}"
                                    class="form-control"
                                    name="password"
                                    />
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="offset-md-3 col-md-10">
                                  <button type="submit" class="btn btn-primary">
                                    Save Changes
                                  </button>
                                </div>
                            </div>
                            </form>
                            <div class="col-sm-5">
                                    <label for="name" class="col-12 col-md-5 col-form-label"
                                      >Do you want to delete the account?</label
                                    >
                                    <a href="#" class="btn btn-warning" role="button" aria-disabled="true" data-toggle="modal" data-target="#confirmDelete">
                                        Delete Account
                                    </a>
                            </div> 
                            
                <div id="confirmDelete" class="modal fade" role="dialog">
                <div class="modal-dialog modal-md" role="content">
                  <div class="modal-content">
                    <div class="modal-body">
                      <form action="customeraccountdelete.htm" method="POST">
                        <div class="form-row">
                          <div class="form-group col-sm-4">
                            <label
                              >Confirm Delete ?</label
                            >
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
                            Delete
                          </button>
                        </div>
                          <input type="hidden" value="register" name="option" />
                      </form>
                    </div>
                  </div>
                </div>
            </div>
                        
                    </div> 
                    
                </div>
            </div>
        <script>
                $("#workerprofile").validate({
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
