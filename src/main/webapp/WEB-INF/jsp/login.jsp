<%--
  Created by IntelliJ IDEA.
  User: tarang
  Date: 29/11/19
  Time: 7:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>APro | Login</title>

    <!-- Global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/global_assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/layout.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/components.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/colors.min.css" rel="stylesheet" type="text/css">
    <!-- /global stylesheets -->
    <style>
        #iiitbimage {
            display: block;
            max-width: 50%;
            height: auto;
        }
    </style>
    <!-- Core JS files -->
    <script src="${pageContext.request.contextPath}/global_assets/js/main/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/main/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/loaders/blockui.min.js"></script>
    <!-- /core JS files -->

    <!-- Theme JS files -->
    <!-- Theme JS files -->
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/notifications/pnotify.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/forms/validation/validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/forms/inputs/touchspin.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/forms/selects/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/forms/styling/switch.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/forms/styling/switchery.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/forms/styling/uniform.min.js"></script>

    <script src="${pageContext.request.contextPath}/assets/js/rest_api.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
    <!-- /theme JS files -->
   <script>
       $(document).ready(function(){
           // Initialize
           var validator = $('#loginForm').submit(function (event) {
               event.preventDefault();
           }).validate({
               ignore: 'input[type=hidden], .select2-search__field', // ignore hidden fields
               errorClass: 'validation-invalid-label',
               successClass: 'validation-valid-label',
               validClass: 'validation-valid-label',
               highlight: function(element, errorClass) {
                   $(element).removeClass(errorClass);
               },
               unhighlight: function(element, errorClass) {
                   $(element).removeClass(errorClass);
               },
               success: function(label) {
                   label.addClass('validation-valid-label').text('Success.'); // remove to hide Success message
               },

               // Different components require proper error label placement
               errorPlacement: function(error, element) {

                   // Unstyled checkboxes, radios
                   if (element.parents().hasClass('form-check')) {
                       error.appendTo( element.parents('.form-check').parent() );
                   }

                   // Input with icons and Select2
                   else if (element.parents().hasClass('form-group-feedback') || element.hasClass('select2-hidden-accessible')) {
                       error.appendTo( element.parent() );
                   }

                   // Input group, styled file input
                   else if (element.parent().is('.uniform-uploader, .uniform-select') || element.parents().hasClass('input-group')) {
                       error.appendTo( element.parent().parent() );
                   }

                   // Other elements
                   else {
                       error.insertAfter(element);
                   }
               },
               rules: {
                   password: {
                       minlength: 5
                   },
                   repeat_password: {
                       equalTo: '#password'
                   },
                   email: {
                       email: true
                   },
                   repeat_email: {
                       equalTo: '#email'
                   },
                   minimum_characters: {
                       minlength: 10
                   },
                   maximum_characters: {
                       maxlength: 10
                   },
                   minimum_number: {
                       min: 10
                   },
                   maximum_number: {
                       max: 10
                   },
                   number_range: {
                       range: [10, 20]
                   },
                   url: {
                       url: true
                   },
                   date: {
                       date: true
                   },
                   date_iso: {
                       dateISO: true
                   },
                   numbers: {
                       number: true
                   },
                   digits: {
                       digits: true
                   },
                   creditcard: {
                       creditcard: true
                   },
                   basic_checkbox: {
                       minlength: 2
                   },
                   styled_checkbox: {
                       minlength: 2
                   },
                   switchery_group: {
                       minlength: 2
                   },
                   switch_group: {
                       minlength: 2
                   }
               },
               messages: {
                   custom: {
                       required: 'This is a custom error message'
                   },
                   basic_checkbox: {
                       minlength: 'Please select at least {0} checkboxes'
                   },
                   styled_checkbox: {
                       minlength: 'Please select at least {0} checkboxes'
                   },
                   switchery_group: {
                       minlength: 'Please select at least {0} switches'
                   },
                   switch_group: {
                       minlength: 'Please select at least {0} switches'
                   },
                   agree: 'Please accept our policy'
               },
               submitHandler: function () {
                    var user = $('#userName').val();
                    var pass = $('#passWord').val();
                    var url = '/home/login';
                    jsonData = {};
                    jsonData['email'] = user;
                    jsonData['password'] = pass;
                    var jsonResponse = postRequest(url,jsonData);
                   if(jsonResponse[1]===false){
                       new PNotify({
                           title: 'Error',
                           text: 'Unbale to login. Try loging again.',
                           addclass: 'bg-danger border-danger'
                       });
                   }else{
                       window.location.href = window.location.origin+'/course/view';
                   }
               }
           });

       });
   </script>
</head>

<body>

<%--<!-- Main navbar -->--%>
<%--<div class="navbar navbar-expand-md navbar-dark">--%>
<%--    <div class="navbar-brand">--%>
<%--        <a href="index.html" class="d-inline-block">--%>
<%--            <img src="../../../../global_assets/images/logo_light.png" alt="">--%>
<%--        </a>--%>
<%--    </div>--%>

<%--    <div class="d-md-none">--%>
<%--        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile">--%>
<%--            <i class="icon-tree5"></i>--%>
<%--        </button>--%>
<%--    </div>--%>

<%--    <div class="collapse navbar-collapse" id="navbar-mobile">--%>
<%--        <ul class="navbar-nav">--%>
<%--            <li class="nav-item dropdown">--%>
<%--                <a href="#" class="navbar-nav-link dropdown-toggle caret-0" data-toggle="dropdown">--%>
<%--                    <i class="icon-git-compare"></i>--%>
<%--                    <span class="d-md-none ml-2">Git updates</span>--%>
<%--                    <span class="badge badge-pill bg-warning-400 ml-auto ml-md-0">9</span>--%>
<%--                </a>--%>

<%--                <div class="dropdown-menu dropdown-content wmin-md-350">--%>
<%--                    <div class="dropdown-content-header">--%>
<%--                        <span class="font-weight-semibold">Git updates</span>--%>
<%--                        <a href="#" class="text-default"><i class="icon-sync"></i></a>--%>
<%--                    </div>--%>

<%--                    <div class="dropdown-content-body dropdown-scrollable">--%>
<%--                        <ul class="media-list">--%>
<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <a href="#" class="btn bg-transparent border-primary text-primary rounded-round border-2 btn-icon"><i class="icon-git-pull-request"></i></a>--%>
<%--                                </div>--%>

<%--                                <div class="media-body">--%>
<%--                                    Drop the IE <a href="#">specific hacks</a> for temporal inputs--%>
<%--                                    <div class="text-muted font-size-sm">4 minutes ago</div>--%>
<%--                                </div>--%>
<%--                            </li>--%>

<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <a href="#" class="btn bg-transparent border-warning text-warning rounded-round border-2 btn-icon"><i class="icon-git-commit"></i></a>--%>
<%--                                </div>--%>

<%--                                <div class="media-body">--%>
<%--                                    Add full font overrides for popovers and tooltips--%>
<%--                                    <div class="text-muted font-size-sm">36 minutes ago</div>--%>
<%--                                </div>--%>
<%--                            </li>--%>

<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <a href="#" class="btn bg-transparent border-info text-info rounded-round border-2 btn-icon"><i class="icon-git-branch"></i></a>--%>
<%--                                </div>--%>

<%--                                <div class="media-body">--%>
<%--                                    <a href="#">Chris Arney</a> created a new <span class="font-weight-semibold">Design</span> branch--%>
<%--                                    <div class="text-muted font-size-sm">2 hours ago</div>--%>
<%--                                </div>--%>
<%--                            </li>--%>

<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <a href="#" class="btn bg-transparent border-success text-success rounded-round border-2 btn-icon"><i class="icon-git-merge"></i></a>--%>
<%--                                </div>--%>

<%--                                <div class="media-body">--%>
<%--                                    <a href="#">Eugene Kopyov</a> merged <span class="font-weight-semibold">Master</span> and <span class="font-weight-semibold">Dev</span> branches--%>
<%--                                    <div class="text-muted font-size-sm">Dec 18, 18:36</div>--%>
<%--                                </div>--%>
<%--                            </li>--%>

<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <a href="#" class="btn bg-transparent border-primary text-primary rounded-round border-2 btn-icon"><i class="icon-git-pull-request"></i></a>--%>
<%--                                </div>--%>

<%--                                <div class="media-body">--%>
<%--                                    Have Carousel ignore keyboard events--%>
<%--                                    <div class="text-muted font-size-sm">Dec 12, 05:46</div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>

<%--                    <div class="dropdown-content-footer bg-light">--%>
<%--                        <a href="#" class="text-grey mr-auto">All updates</a>--%>
<%--                        <div>--%>
<%--                            <a href="#" class="text-grey" data-popup="tooltip" title="Mark all as read"><i class="icon-radio-unchecked"></i></a>--%>
<%--                            <a href="#" class="text-grey ml-2" data-popup="tooltip" title="Bug tracker"><i class="icon-bug2"></i></a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--        </ul>--%>

<%--        <span class="navbar-text ml-md-3 mr-md-auto">--%>
<%--				<span class="badge bg-success">Online</span>--%>
<%--			</span>--%>

<%--        <ul class="navbar-nav">--%>
<%--            <li class="nav-item dropdown">--%>
<%--                <a href="#" class="navbar-nav-link dropdown-toggle caret-0" data-toggle="dropdown">--%>
<%--                    <i class="icon-people"></i>--%>
<%--                    <span class="d-md-none ml-2">Users</span>--%>
<%--                </a>--%>

<%--                <div class="dropdown-menu dropdown-menu-right dropdown-content wmin-md-300">--%>
<%--                    <div class="dropdown-content-header">--%>
<%--                        <span class="font-weight-semibold">Users online</span>--%>
<%--                        <a href="#" class="text-default"><i class="icon-search4 font-size-base"></i></a>--%>
<%--                    </div>--%>

<%--                    <div class="dropdown-content-body dropdown-scrollable">--%>
<%--                        <ul class="media-list">--%>
<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <img src="../../../../global_assets/images/placeholders/placeholder.jpg" width="36" height="36" class="rounded-circle" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="media-body">--%>
<%--                                    <a href="#" class="media-title font-weight-semibold">Jordana Ansley</a>--%>
<%--                                    <span class="d-block text-muted font-size-sm">Lead web developer</span>--%>
<%--                                </div>--%>
<%--                                <div class="ml-3 align-self-center"><span class="badge badge-mark border-success"></span></div>--%>
<%--                            </li>--%>

<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <img src="../../../../global_assets/images/placeholders/placeholder.jpg" width="36" height="36" class="rounded-circle" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="media-body">--%>
<%--                                    <a href="#" class="media-title font-weight-semibold">Will Brason</a>--%>
<%--                                    <span class="d-block text-muted font-size-sm">Marketing manager</span>--%>
<%--                                </div>--%>
<%--                                <div class="ml-3 align-self-center"><span class="badge badge-mark border-danger"></span></div>--%>
<%--                            </li>--%>

<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <img src="../../../../global_assets/images/placeholders/placeholder.jpg" width="36" height="36" class="rounded-circle" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="media-body">--%>
<%--                                    <a href="#" class="media-title font-weight-semibold">Hanna Walden</a>--%>
<%--                                    <span class="d-block text-muted font-size-sm">Project manager</span>--%>
<%--                                </div>--%>
<%--                                <div class="ml-3 align-self-center"><span class="badge badge-mark border-success"></span></div>--%>
<%--                            </li>--%>

<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <img src="../../../../global_assets/images/placeholders/placeholder.jpg" width="36" height="36" class="rounded-circle" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="media-body">--%>
<%--                                    <a href="#" class="media-title font-weight-semibold">Dori Laperriere</a>--%>
<%--                                    <span class="d-block text-muted font-size-sm">Business developer</span>--%>
<%--                                </div>--%>
<%--                                <div class="ml-3 align-self-center"><span class="badge badge-mark border-warning-300"></span></div>--%>
<%--                            </li>--%>

<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <img src="../../../../global_assets/images/placeholders/placeholder.jpg" width="36" height="36" class="rounded-circle" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="media-body">--%>
<%--                                    <a href="#" class="media-title font-weight-semibold">Vanessa Aurelius</a>--%>
<%--                                    <span class="d-block text-muted font-size-sm">UX expert</span>--%>
<%--                                </div>--%>
<%--                                <div class="ml-3 align-self-center"><span class="badge badge-mark border-grey-400"></span></div>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>

<%--                    <div class="dropdown-content-footer bg-light">--%>
<%--                        <a href="#" class="text-grey mr-auto">All users</a>--%>
<%--                        <a href="#" class="text-grey"><i class="icon-gear"></i></a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </li>--%>

<%--            <li class="nav-item dropdown">--%>
<%--                <a href="#" class="navbar-nav-link dropdown-toggle caret-0" data-toggle="dropdown">--%>
<%--                    <i class="icon-bubbles4"></i>--%>
<%--                    <span class="d-md-none ml-2">Messages</span>--%>
<%--                    <span class="badge badge-pill bg-warning-400 ml-auto ml-md-0">2</span>--%>
<%--                </a>--%>

<%--                <div class="dropdown-menu dropdown-menu-right dropdown-content wmin-md-350">--%>
<%--                    <div class="dropdown-content-header">--%>
<%--                        <span class="font-weight-semibold">Messages</span>--%>
<%--                        <a href="#" class="text-default"><i class="icon-compose"></i></a>--%>
<%--                    </div>--%>

<%--                    <div class="dropdown-content-body dropdown-scrollable">--%>
<%--                        <ul class="media-list">--%>
<%--                            <li class="media">--%>
<%--                                <div class="mr-3 position-relative">--%>
<%--                                    <img src="../../../../global_assets/images/placeholders/placeholder.jpg" width="36" height="36" class="rounded-circle" alt="">--%>
<%--                                </div>--%>

<%--                                <div class="media-body">--%>
<%--                                    <div class="media-title">--%>
<%--                                        <a href="#">--%>
<%--                                            <span class="font-weight-semibold">James Alexander</span>--%>
<%--                                            <span class="text-muted float-right font-size-sm">04:58</span>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>

<%--                                    <span class="text-muted">who knows, maybe that would be the best thing for me...</span>--%>
<%--                                </div>--%>
<%--                            </li>--%>

<%--                            <li class="media">--%>
<%--                                <div class="mr-3 position-relative">--%>
<%--                                    <img src="../../../../global_assets/images/placeholders/placeholder.jpg" width="36" height="36" class="rounded-circle" alt="">--%>
<%--                                </div>--%>

<%--                                <div class="media-body">--%>
<%--                                    <div class="media-title">--%>
<%--                                        <a href="#">--%>
<%--                                            <span class="font-weight-semibold">Margo Baker</span>--%>
<%--                                            <span class="text-muted float-right font-size-sm">12:16</span>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>

<%--                                    <span class="text-muted">That was something he was unable to do because...</span>--%>
<%--                                </div>--%>
<%--                            </li>--%>

<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <img src="../../../../global_assets/images/placeholders/placeholder.jpg" width="36" height="36" class="rounded-circle" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="media-body">--%>
<%--                                    <div class="media-title">--%>
<%--                                        <a href="#">--%>
<%--                                            <span class="font-weight-semibold">Jeremy Victorino</span>--%>
<%--                                            <span class="text-muted float-right font-size-sm">22:48</span>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>

<%--                                    <span class="text-muted">But that would be extremely strained and suspicious...</span>--%>
<%--                                </div>--%>
<%--                            </li>--%>

<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <img src="../../../../global_assets/images/placeholders/placeholder.jpg" width="36" height="36" class="rounded-circle" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="media-body">--%>
<%--                                    <div class="media-title">--%>
<%--                                        <a href="#">--%>
<%--                                            <span class="font-weight-semibold">Beatrix Diaz</span>--%>
<%--                                            <span class="text-muted float-right font-size-sm">Tue</span>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>

<%--                                    <span class="text-muted">What a strenuous career it is that I've chosen...</span>--%>
<%--                                </div>--%>
<%--                            </li>--%>

<%--                            <li class="media">--%>
<%--                                <div class="mr-3">--%>
<%--                                    <img src="../../../../global_assets/images/placeholders/placeholder.jpg" width="36" height="36" class="rounded-circle" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="media-body">--%>
<%--                                    <div class="media-title">--%>
<%--                                        <a href="#">--%>
<%--                                            <span class="font-weight-semibold">Richard Vango</span>--%>
<%--                                            <span class="text-muted float-right font-size-sm">Mon</span>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>

<%--                                    <span class="text-muted">Other travelling salesmen live a life of luxury...</span>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>

<%--                    <div class="dropdown-content-footer justify-content-center p-0">--%>
<%--                        <a href="#" class="bg-light text-grey w-100 py-2" data-popup="tooltip" title="Load more"><i class="icon-menu7 d-block top-0"></i></a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </li>--%>

<%--            <li class="nav-item dropdown dropdown-user">--%>
<%--                <a href="#" class="navbar-nav-link dropdown-toggle" data-toggle="dropdown">--%>
<%--                    <img src="../../../../global_assets/images/placeholders/placeholder.jpg" class="rounded-circle" alt="">--%>
<%--                    <span>Victoria</span>--%>
<%--                </a>--%>

<%--                <div class="dropdown-menu dropdown-menu-right">--%>
<%--                    <a href="#" class="dropdown-item"><i class="icon-user-plus"></i> My profile</a>--%>
<%--                    <a href="#" class="dropdown-item"><i class="icon-coins"></i> My balance</a>--%>
<%--                    <a href="#" class="dropdown-item"><i class="icon-comment-discussion"></i> Messages <span class="badge badge-pill bg-blue ml-auto">58</span></a>--%>
<%--                    <div class="dropdown-divider"></div>--%>
<%--                    <a href="#" class="dropdown-item"><i class="icon-cog5"></i> Account settings</a>--%>
<%--                    <a href="#" class="dropdown-item"><i class="icon-switch2"></i> Logout</a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<!-- /main navbar -->--%>


<!-- Page content -->
<div class="page-content">

    <!-- Main content -->
    <div class="content-wrapper">

        <!-- Content area -->
        <div class="content d-flex justify-content-center align-items-center">

            <!-- Login form -->
            <form class="login-form" id="loginForm" action="#">
                <div class="card mb-0">
                    <div class="card-body">
                        <div class="text-center mb-3">
<%--                            <i class="icon-reading icon-2x text-slate-300 border-slate-300 border-3 rounded-round p-3 mb-3 mt-1"></i>--%>
                            <div class="content d-flex justify-content-center align-items-center">
                                <img src="${pageContext.request.contextPath}/global_assets/iiitb_logo.jpg" class="card-img img-fluid" id="iiitbimage">
                            </div>
                            <h5 class="mb-0">Login to your account</h5>
                            <span class="d-block text-muted">Enter your credentials below</span>
                        </div>

                        <div class="form-group form-group-feedback form-group-feedback-left">
                            <input id="userName" type="text" class="form-control" placeholder="Username" required>
                            <div class="form-control-feedback">
                                <i class="icon-user text-muted"></i>
                            </div>
                        </div>

                        <div class="form-group form-group-feedback form-group-feedback-left">
                            <input id="passWord" type="password" name="password" class="form-control" placeholder="Password" required>
                            <div class="form-control-feedback">
                                <i class="icon-lock2 text-muted"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block">Sign in <i class="icon-circle-right2 ml-2"></i></button>
                        </div>

<%--                        <div class="text-center">--%>
<%--                            <a href="login_password_recover.html">Forgot password?</a>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </form>
            <!-- /login form -->

        </div>
        <!-- /content area -->


        <!-- Footer -->
        <div class="navbar navbar-expand-lg navbar-light">
            <div class="text-center d-lg-none w-100">
                <button type="button" class="navbar-toggler dropdown-toggle" data-toggle="collapse" data-target="#navbar-footer">
                    <i class="icon-unfold mr-2"></i>
                    Footer
                </button>
            </div>

            <div class="navbar-collapse collapse" id="navbar-footer">
					<span class="navbar-text">
						&copy; 2019 - 2021. <a href="#">APro | Acedemic Erp</a> by <a href="https://github.com/tarangparikh" target="_blank">Tarang Parikh</a> and <a href="https://github.com/tamasane" target="_blank">Tushar Masane</a>
					</span>

            </div>
        </div>
        <!-- /footer -->

    </div>
    <!-- /main content -->

</div>
<!-- /page content -->

</body>
</html>
