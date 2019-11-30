<%--
  Created by IntelliJ IDEA.
  User: tarang
  Date: 26/11/19
  Time: 5:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>APro | Specialisation | Create</title>

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
            max-width: 100%;
            height: auto;
        }
    </style>
    <!-- Core JS files -->
    <script src="${pageContext.request.contextPath}/global_assets/js/main/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/main/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/loaders/blockui.min.js"></script>
    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/notifications/pnotify.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/forms/validation/validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/forms/inputs/touchspin.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/forms/selects/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/forms/styling/switch.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/forms/styling/switchery.min.js"></script>
    <script src="${pageContext.request.contextPath}/global_assets/js/plugins/forms/styling/uniform.min.js"></script>

    <script src="${pageContext.request.contextPath}/assets/js/specialisation_validation.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/rest_api.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
    <!-- /theme JS files -->
    <script>
        $(document).ready(function(){
           var cc = $('#courseCount');
           var sc = $('#specialisationCount');
           var ccount = getCourseCount();
           var scount = getSpecialisationCount();
           //alert(JSON.stringify(scount));
           if(ccount[1]===false){
               cc.empty();
               cc.append('?');
           }else{
               cc.empty();
               cc.append(ccount[0]['result']);
           }
           // alert('getting');
           if(scount[1]===false){
               sc.empty();
               sc.append('?');
           }else{
               //alert(scount[0]['result']);
               sc.empty();
               sc.append(scount[0]['result']);

           }
        });
    </script>
</head>

<body>

<!-- Main navbar -->
<div class="navbar navbar-expand-md navbar-dark">
<%--    <div class="navbar-brand">--%>
<%--        <a href="../full/index.html" class="d-inline-block">--%>
<%--            <img src="../../../../global_assets/images/logo_light.png" alt="">--%>
<%--        </a>--%>
<%--    </div>--%>

    <div class="d-md-none">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile">
            <i class="icon-tree5"></i>
        </button>
        <button class="navbar-toggler sidebar-mobile-main-toggle" type="button">
            <i class="icon-paragraph-justify3"></i>
        </button>
    </div>

    <div class="collapse navbar-collapse" id="navbar-mobile">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="#" class="navbar-nav-link sidebar-control sidebar-main-toggle d-none d-md-block">
                    <i class="icon-paragraph-justify3"></i>
                </a>
            </li>
        </ul>

<%--        <ul class="navbar-nav ml-auto">--%>
<%--            <li class="nav-item">--%>
<%--                <a href="#" class="navbar-nav-link">--%>
<%--                    Text link--%>
<%--                </a>--%>
<%--            </li>--%>

<%--            <li class="nav-item dropdown">--%>
<%--                <a href="#" class="navbar-nav-link">--%>
<%--                    <i class="icon-bell2"></i>--%>
<%--                    <span class="d-md-none ml-2">Notifications</span>--%>
<%--                    <span class="badge badge-mark border-white ml-auto ml-md-0"></span>--%>
<%--                </a>--%>
<%--            </li>--%>

<%--            <li class="nav-item dropdown dropdown-user">--%>
<%--                <a href="#" class="navbar-nav-link dropdown-toggle" data-toggle="dropdown">--%>
<%--                    <img src="../../../../global_assets/images/image.png" class="rounded-circle" alt="">--%>
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
    </div>
</div>
<!-- /main navbar -->


<!-- Page content -->
<div class="page-content">

    <!-- Main sidebar -->
    <div class="sidebar sidebar-dark sidebar-main sidebar-expand-md">

        <!-- Sidebar mobile toggler -->
        <div class="sidebar-mobile-toggler text-center">
            <a href="#" class="sidebar-mobile-main-toggle">
                <i class="icon-arrow-left8"></i>
            </a>
            Navigation
            <a href="#" class="sidebar-mobile-expand">
                <i class="icon-screen-full"></i>
                <i class="icon-screen-normal"></i>
            </a>
        </div>
        <!-- /sidebar mobile toggler -->


        <!-- Sidebar content -->
        <div class="sidebar-content">

            <!-- User menu -->
            <div class="sidebar-user">
                <div class="card-body">
                    <div class="media">
                        <div class="mr-3">
                            <a href="#"><img src="../../../../global_assets/images/image.png" width="38" height="38" class="rounded-circle" alt=""></a>
                        </div>

                        <div class="media-body">
                            <div class="media-title font-weight-semibold">${sessionScope.get("token")}</div>
                            <div class="font-size-xs opacity-50">
                                <i class="icon-pin font-size-sm"></i> &nbsp;IIIT-B Bangalore
                            </div>
                        </div>

                        <div class="ml-3 align-self-center">
                            <a href="#" class="text-white"><i class="icon-cog3"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /user menu -->


            <!-- Main navigation -->
            <div class="card card-sidebar-mobile">
                <ul class="nav nav-sidebar" data-nav-type="accordion">

                    <!-- Main -->
                    <li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">Main</div> <i class="icon-menu" title="Main"></i></li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/course/view" class="nav-link">
                            <i class="icon-home4"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item nav-item-submenu">
                        <a href="#" class="nav-link"><i class="icon-book2"></i>
                            <span>Course</span>
                            <span  id="courseCount"  class="badge bg-danger-400 align-self-center ml-auto">0</span>
                        </a>
                        <ul class="nav nav-group-sub" data-submenu-title="Course">
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/course/create" class="nav-link"><i class="icon-pen-plus"></i><div class="col-6">Create</div><div class="col-6"></div> </a></li>
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/course/view" class="nav-link"><i class="icon-search4"></i> <div class="col-6">View</div><div class="col-6"></div> </a></li>
                        </ul>
                    </li>
                    <li class="nav-item nav-item-submenu nav-item-open nav-item-expanded">
                        <a href="#" class="nav-link"><i class="icon-book"></i>
                            <span>Specialisation</span>
                            <span id="specialisationCount" class="badge bg-danger-400 align-self-center ml-auto">0</span>
                        </a>
                        <ul class="nav nav-group-sub" data-submenu-title="Specialisation">
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/specialisation/create" class="nav-link active"><i class="icon-pen-plus"></i> <div class="col-6">Create</div><div class="col-6"></div> </a></li>
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/specialisation/view" class="nav-link"><i class="icon-search4"></i><div class="col-6">View</div><div class="col-6"></div> </a></li>
                        </ul>
                    </li>
<%--                    <li class="nav-item">--%>
<%--                        <a href="../full/changelog.html" class="nav-link">--%>
<%--                            <i class="icon-list-unordered"></i>--%>
<%--                            <span>Changelog</span>--%>
<%--                            <span class="badge bg-blue-400 align-self-center ml-auto">2.0</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>
                    <!-- /main -->

                </ul>
            </div>
            <!-- /main navigation -->

        </div>
        <!-- /sidebar content -->

    </div>
    <!-- /main sidebar -->


    <!-- Main content -->
    <div class="content-wrapper">

        <!-- Page header -->
        <div class="page-header page-header-light">
            <div class="page-header-content header-elements-md-inline">
                <div class="page-title d-flex">
                    <h4><i class="icon-arrow-left52 mr-2"></i> <span class="font-weight-semibold">Specialisation</span> - Add</h4>
<%--                    <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>--%>
                </div>

                <div class="">
                    <div class="row ">
                        <div class="col-8">
                        </div>
                        <div class="col-4 d-none d-md-block">
                            <img id="iiitbimage" class="card-img  text-right" src="${pageContext.request.contextPath}/global_assets/iiitb_logo.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>

            <div class="breadcrumb-line breadcrumb-line-light header-elements-md-inline">
                <div class="d-flex">
                    <div class="breadcrumb">
<%--                        <a href="index.html" class="breadcrumb-item"><i class="icon-home2 mr-2"></i> Home</a>--%>
                        <a href="#" class="breadcrumb-item">Specialisation</a>
                        <span class="breadcrumb-item active">Add</span>
                    </div>

                    <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
                </div>

<%--                <div class="header-elements d-none">--%>
<%--                    <div class="breadcrumb justify-content-center">--%>
<%--                        <a href="#" class="breadcrumb-elements-item">--%>
<%--                            Link--%>
<%--                        </a>--%>

<%--                        <div class="breadcrumb-elements-item dropdown p-0">--%>
<%--                            <a href="#" class="breadcrumb-elements-item dropdown-toggle" data-toggle="dropdown">--%>
<%--                                Dropdown--%>
<%--                            </a>--%>

<%--                            <div class="dropdown-menu dropdown-menu-right">--%>
<%--                                <a href="#" class="dropdown-item">Action</a>--%>
<%--                                <a href="#" class="dropdown-item">Another action</a>--%>
<%--                                <a href="#" class="dropdown-item">One more action</a>--%>
<%--                                <div class="dropdown-divider"></div>--%>
<%--                                <a href="#" class="dropdown-item">Separate action</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
        </div>
        <!-- /page header -->


        <!-- Content area -->
        <div class="content">

            <!-- Form validation -->
            <div class="card">
                <div class="card-header header-elements-inline">
                    <h5 class="card-title">Add Specialisation</h5>
                    <div class="header-elements">
                        <!-- <div class="list-icons">
                             <a class="list-icons-item" data-action="collapse"></a>
                             <a class="list-icons-item" data-action="reload"></a>
                             <a class="list-icons-item" data-action="remove"></a>
                         </div>-->
                    </div>
                </div>

                <div class="card-body">
                    <!--<p class="mb-4">Validate.js makes simple clientside form validation easy, whilst still offering plenty of customization options. The plugin comes bundled with a useful set of validation methods, including URL and email validation, while providing an API to write your own methods. All bundled methods come with default error messages in english and translations into 37 other languages. <strong>Note:</strong> <code>success</code> callback is configured for demo purposes only and can be removed in validation setup.</p>
                    -->
                    <form class="form-validate-jquery"  id="specialisationForm" action="#">
                        <fieldset class="mb-3">
                            <legend class="text-uppercase font-size-sm font-weight-bold">Basic Specialisation Addition</legend>

                            <div class="row">
                                <div class="col-md-6">
                                    <!-- Basic text input -->
                                    <div class="form-group row">
                                        <label class="col-form-label col-lg-3">Specialisation Name<span class="text-danger">*</span></label>
                                        <div class="col-lg-9">
                                            <input type="text" id="specialisationName" name="basic" class="form-control" required placeholder="Enter course name">
                                        </div>
                                    </div>
                                    <!-- /basic text input -->

                                    <!-- Basic text input -->
                                    <div class="form-group row">
                                        <label class="col-form-label col-lg-3">specialisation Tag<span class="text-danger">*</span></label>
                                        <div class="col-lg-9">
                                            <input type="text" id="specialisationTag" name="basicd_course_tag" class="form-control" required placeholder="Enter course tag">
                                        </div>
                                    </div>
                                    <!-- /basic text input -->

                                </div>
                                <div class="col-md-6">
                                    <!-- Maximum number -->
                                    <div class="form-group row">
                                        <label class="col-form-label col-lg-3">Credits <span class="text-danger">*</span></label>
                                        <div class="col-lg-9">
                                            <input type="text" id="specialisationCredits" name="maximum_number" class="form-control" required placeholder="Enter credits">
                                        </div>
                                    </div>
                                    <!-- /maximum number -->




                                </div>
                            </div>


                        </fieldset>




                        <div class="d-flex justify-content-end align-items-center">
                            <button type="reset" class="btn btn-light" id="reset">Reset <i class="icon-reload-alt ml-2"></i></button>
                            <button type="submit" class="btn btn-primary ml-3" id="submit">Submit <i class="icon-paperplane ml-2"></i></button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /form validation -->


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
