<%-- 
    Document   : products.jsp
    Created on : Feb 25, 2017, 12:26:46 PM
    Author     : karsol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Products</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script type = "text/javascript">
         $(document).ready(function(){
         $("#subcatformodels").empty();
         $("#brandformodels").empty();
         $.ajax({
             method:"POST",
             url:"http://localhost:8084/Maincat",
             data: {'status':'getmc'},
             success:function(data){
                        j=JSON.parse(data);
                        $("#maincatformodels").empty();
                        
                        $("#maincatformodels").append("<option selected disabled >Select a Main Category</option>");
                        for(var i=0;i<j.length;i++)
                        {
                            
                            $("#maincatformodels").append("<option value='"+j[i].pc1id+"'>"+j[i].mctitle+"</option>");
                        }
                        
                    },
                    error:function(err){
                        alert("error"+err);
                    }
             
         })

        $("#maincatformodels").change(function(){

		
               selected=$("#maincatformodels option:selected").val();
                
                $.ajax({
                    method:"POST",
                    url:"http://localhost:8084/Subcat",
                    data: {'main':selected,'status':"getsc"},
                    success:function(data){
                         j2=JSON.parse(data);
                         
                        $("#subcatformodels").empty();
                        $("#brandformodels").empty();
                        $("#subcatformodels").append("<option selected disabled >Select a Sub Category</option>");
                        for(var x=0;x<j2.length;x++)
                        {
                            
                            $("#subcatformodels").append("<option value='"+j2[x].pc2id+"'>"+j2[x].sctitle+"</option>");
                        }
                    },
                    error:function(err){
                        alert("error"+err);
                    }
                });
                });
        $("#subcatformodels").change(function(){

		
               selected=$("#subcatformodels option:selected").val();
                
                $.ajax({
                    method:"POST",
                    url:"http://localhost:8084/Brand",
                    data: {'sub':selected,'status':"gettype"},
                    success:function(data){
                         
                        
                        
                         j2=JSON.parse(data);
                       
                        $("#brandformodels").empty();
                           $("#brandformodels").append("<option selected disabled >Select a Brand</option>");
                        for(var x=0;x<j2.length;x++)
                        {
                            
                            $("#brandformodels").append("<option value='"+j2[x].pc3id+"'>"+j2[x].typetitle+"</option>");
                        }
                        
                    },
                    error:function(err){
                        alert("error"+err);
                    }
                });
                
                });
});




      </script>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
    
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>E</b>CS</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Ecell</b>Street</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>
                <!-- inner menu: contains the messages -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <!-- User Image -->
                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                      </div>
                      <!-- Message title and timestamp -->
                      <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <!-- The message -->
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <!-- end message -->
                </ul>
                <!-- /.menu -->
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- /.messages-menu -->

          <!-- Notifications Menu -->
          <li class="dropdown notifications-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- Inner Menu: contains the notifications -->
                <ul class="menu">
                  <li><!-- start notification -->
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <!-- end notification -->
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- Inner menu: contains the tasks -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <!-- Task title and progress text -->
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <!-- The progress bar -->
                      <div class="progress xs">
                        <!-- Change the css width attribute to simulate progress -->
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
             
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">Ecellstreet</span>
            </a>
            <ul class="dropdown-menu">
             
              <li class="user-header">
                

                <p>
                  Ecellstreet
                  <small>Admin info</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="adminprofile.jsp" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel" style="padding-bottom: 50px;">
      
        <div class="pull-left info">
          <p>Ecellstreet</p>
          
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- search form (Optional) -->
     
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
       
        <!-- Optionally, you can add icons to the links -->
        <li ><a href="main.jsp"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
        <li class="treeview active">
            <a href="products.jsp"><i class="fa fa-cubes"></i> <span>Products</span><span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span></a>
             <ul class="treeview-menu">
                  <li><a href="products.jsp">All Products</a></li>
                 <li><a href="productaddmaincat.jsp">Main Category</a></li>
                 <li><a href="productaddsubcat.jsp">Sub Category</a></li>
                 <li ><a href="productaddbrand.jsp">Brand</a></li>
                 <li   class="active"><a href="productaddmodel.jsp">Product Model</a></li>
                 <li ><a href="productaddproduct.jsp">Product</a></li>
          </ul>
        </li> 
        <li><a href="users.jsp"><i class="fa fa-users"></i> <span>Users</span></a></li>
        <li><a href="reviews.jsp"><i class="fa fa-reply"></i> <span>Reviews</span></a></li>
        <li><a href="specialoffer.jsp"><i class="fa fa-bell-o"></i> <span>Special Offer</span></a></li>
        <li><a href="vouchers.jsp"><i class="fa fa-credit-card"></i> <span>Vouchers</span></a></li>
        <li><a href="orders.jsp"><i class="fa fa-clipboard"></i> <span>Orders</span></a></li>
        
        
       
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> <div class="row">
              <div class="col-md-2">
        <small>Add new Products</small>
                </div>
        </div>
      </h1>
      <ol class="breadcrumb">
        <li> Products</li>
        <li >Main Category</li>
        <li class="active">Add Main Category</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content form-group">
        
         <div align="center" class="row">
             <div align="center" style="" class="col-md-4 center">
                 
             </div>
             <div align="center" style="" class="col-md-4 center">
                 <h4>Add Models</h4>
             </div>
             <div align="center" style="" class="col-md-4 center">
                 
             </div>   
         </div>
        
        
        <form action="Model" method="post">
        <div style="margin-top: 10px;" class="row form-group">
            <div align="center" style="" class="col-md-4 center">
            </div>   
            <div class="col-md-4">
                <label for="maincatformodels">Select Main Category</label>
                <select class="form-control" id="maincatformodels">
                 
               </select> 
            </div>
            <div align="center" style="" class="col-md-4 center">
            </div>   
        </div>
        <div style="margin-top: 10px;" class="row form-group">
            <div align="center" style="" class="col-md-4 center">
            </div>   
            <div class="col-md-4">
                <label for="subcatformodels">Select Sub Category</label>
                <select class="form-control" id="subcatformodels">
                
               </select> 
            </div>
            <div align="center" style="" class="col-md-4 center">
            </div>   
        </div>
        <div style="margin-top: 10px;" class="row form-group">
            <div align="center" style="" class="col-md-4 center">
            </div>   
            <div class="col-md-4">
                <label for="brandformodels">Select Brand</label>
                <select class="form-control" id="brandformodels" name="brandformodels">
                
               </select> 
            </div>
            <div align="center" style="" class="col-md-4 center">
            </div>   
        </div>
        <div style="margin-top: 50px;" class="row form-group">
            <div align="center" style="" class="col-md-4 center">
            </div>   
            <div class="col-md-4">
                <label for="model">Title</label>
                <input type="text" class="form-control" id="modeltitle" name="modeltitle" required/>
            </div>
            <div align="center" style="" class="col-md-4 center">
            </div>   
        </div>
        <div style="margin-top: 10px;" class="row form-group">
            <div align="center" style="" class="col-md-4 center">
            </div>   
            <div class="col-md-4">
                <label for="modelsortorder">Sort Order</label>
                <input type="number" class="form-control" name="modelsortorder" id="modelsortorder" required/>
            </div>
            <div align="center" style="" class="col-md-4 center">
            </div>   
        </div>
        <div style="margin-top: 10px;" class="row form-group">
            <div align="center" style="" class="col-md-4 center">
            </div>   
            <div class="col-md-4">
                <label for="modelimage">Image name</label>
                <input type="text" class="form-control" name="modelimage" id="modelimage" required/>
            </div>
            <div align="center" style="" class="col-md-4 center">
            </div>   
        </div>
        <div style="margin-top: 10px;" class="row form-group">
            <div align="center" style="" class="col-md-4 center">
            </div>   
            <div class="col-md-4">
                <label for="modelvisible">Visible</label>
                   <div class="radio">
                     <label><input type="radio" value="1" id="modelvisible" name="modelvisible">Yes</label>
                   </div>
                   <div class="radio">
                     <label><input type="radio" value="0" id="modelvisible" name="modelvisible">No</label>
                   </div>
                   
            </div>
            <div align="center" style="" class="col-md-4 center">
            </div>   
        </div>
        
       
        <div style="margin-top: 10px;" class="row form-group">
            <div align="center" style="" class="col-md-3 center">
            </div>   
            <div class="col-md-2">
                <input type="submit" value="Add" id="addmodelbut" name="addmodelbut" class="btn btn-success form-control" />
            </div>
            <div class="col-md-3">
                <a href="productaddproduct.jsp" class="btn btn-primary form-control" role="button">Add Products</a>
            </div>
            <div class="col-md-1">
                <a href="productaddmodel.jsp" class="btn btn-info form-control" role="button">Back</a>
            </div> 
        </div>    
       </form>
  
    </section>
</div>
  
        </div>

    
   
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                  <span class="label label-danger pull-right">70%</span>
                </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.3 -->

<!-- Bootstrap 3.3.6 -->
 
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>

<script src="bootstrap/js/validator.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>
</html>

