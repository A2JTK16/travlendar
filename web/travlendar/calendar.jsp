<%-- 
    Document   : index
    Created on : Sep 19, 2017, 4:34:45 PM
    Author     : Fadhlan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Admin-Panel/Assets2/css/stylecalnedar.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Admin-Panel/Assets2/css/responsive-calendar.css">
<title>JSP Page</title>
<meta charset='utf-8' />
<link href='calendar-event/fullcalendar.min.css' rel='stylesheet' />
<link href='calendar-event/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='calendar-event/lib/moment.min.js'></script>
<script src='calendar-event/lib/jquery.min.js'></script>
<script src='calendar-event/fullcalendar.min.js'></script>
<script>

	$(document).ready(function() {
		
            $.ajax({
                dataType : "json",
                contentType : "application/json",
                url: "/Travlendar2A/index?action=getlistEvent",
                success: function(data)
                {
                    var lastDate;
                    
                    $('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listWeek'
			},
			defaultDate: '2009-09-22',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: $.map(data, function(item,i)
                                {
                                    var event = new Object();
                                    event.title = item.title;
                                    event.start = moment(item.start).utc();
                                    event.end = moment(item.end).utc();
                                    event.id = item.id;
                                    lastDate = moment(item.start).format('YYYY-MM-DD');
                                    return event;
                                })
                    
                        });
                        
                        $('#calendar').fullCalendar('gotoDate', lastDate);
                }   
            });
        });	
</script>
<style>

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>


    
                
<div class="jarak-atas">

</div> <!--jarak-atas-->

<div class="menu-atas">
	<div class="header">
            <div class="logonya">
                <img src="${pageContext.request.contextPath}/../Admin-Panel/Assets2/icon/logo.png">
            </div>
            <div class="logo">
                <h1>Travelendar</h1>
            </div> <!--logo-->
                
          
                <div class="kotak-acount">
                   <div  class="acount-nama">
                        Admin Acount    
                   </div>  
                    
                   <div class="dropdown">
                       <button onclick="myFunction()" class="dropbtn">
                           
                           <div class="icon-account">
                            <img src="../Assets2/icon/Account.png">
                           </div>
                           
                       </button>
                      <div id="myDropdown" class="dropdown-content">
                        <a href="#home">Home</a>
                        <a href="#about">Profile</a>
                        <a href="../index.jsp">Logout</a>
                      </div>
                    </div>
                </div> <!--kotak-acount-->

                    <script>
                    /* When the user clicks on the button, 
                    toggle between hiding and showing the dropdown content */
                    function myFunction() {
                        document.getElementById("myDropdown").classList.toggle("show");
                    }

                    // Close the dropdown if the user clicks outside of it
                    window.onclick = function(event) {
                      if (!event.target.matches('.dropbtn')) {

                        var dropdowns = document.getElementsByClassName("dropdown-content");
                        var i;
                        for (i = 0; i < dropdowns.length; i++) {
                          var openDropdown = dropdowns[i];
                          if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                          }
                        }
                      }
                    };
                    </script>                    
              <!-->  </div>
                </div> <!--kotak-acount-->
	</div> <!--header-->
        
     
</div> <!--menu-atas-->    
    
    
<div class="wadah">
	
	<div class="main">
		
            
            <%@include file="/Admin-Panel/Teamplate/Sidebar/sidebar.jsp" %>

		<div class="middle">
               
				<div class="judul-manage"> MANAGE CALENDAR EVENT </div>
				

		</div> <!--middle-->
		
		<div class="middle">
                  <!--  <div class="kotak-traveller">
                    
				    	
							    <div class="modal-header">
							      <h5>Add New Event</h5>
							    </div>
							 
							    <form class="login-form">
                                                               
                                                                <select class="dropdown-location" style="border: 1px solid black ; margin: 10px; margin-right: 40px">
                                                                     <option value="StartingLocation">Starting Location ...</option>
                                                                     <option value="SLocation1">Bandung</option>
                                                                     <option value="SLocation2">Bekasi</option>
                                                                     <option value="SLocation3">Bogor</option>
                                                                     <option value="SLocation4">Ciamis</option>
                                                                     <option value="SLocation5">Cirebon</option>
                                                                     <option value="SLocation6">Indramayu</option>
                                                                     <option value="SLocation6">Kuningan</option>
                                                                     <option value="SLocation6">Kuningan</option>
                                                                     <option value="SLocation6">Majalengka</option>
                                                                     <option value="SLocation6">Pangandaran</option>
                                                                     <option value="SLocation6">Purwakarta</option>
                                                                     <option value="SLocation6">Subang</option>
                                                                     <option value="SLocation6">Sukabumi</option>
                                                                     <option value="SLocation6">Sumedang</option>
                                                                     <option value="SLocation6">Tasikmalaya</option>
                                                                </select>
                                                                
                                                                    <div style="margin: 5px; height: 80px ;width: auto;">
							      <input style="padding: 5px; margin: 5px;height:50px; width: 300px;" type="text" placeholder="Start Date..."/>
                                                              <select class="dropdown-time" style="border:1px solid black; margin-right: 10px ;margin-left:5px">
                                                                     <option value="StartingLocation">Hours</option>
                                                                     <option value="SLocation1">01</option>
                                                                     <option value="SLocation2">02</option>
                                                                     <option value="SLocation3">03</option>
                                                                     <option value="SLocation4">04</option>
                                                                     <option value="SLocation5">05</option>
                                                                     <option value="SLocation6">06</option>
                                                                     <option value="SLocation6">07</option>
                                                                     <option value="SLocation6">08</option>
                                                                     <option value="SLocation6">09</option>
                                                                     <option value="SLocation6">10</option>
                                                                     <option value="SLocation6">11</option>
                                                                     <option value="SLocation6">12</option>
                                                              </select>
                                                              
                                                              <select class="dropdown-time" style="border:1px solid black ">
                                                                     <option value="StartingLocation">Minute</option>
                                                                     <option value="SLocation1">01</option>
                                                                     <option value="SLocation2">02</option>
                                                                     <option value="SLocation3">03</option>
                                                                     <option value="SLocation4">04</option>
                                                                     <option value="SLocation5">05</option>
                                                                     <option value="SLocation6">06</option>
                                                                     <option value="SLocation6">07</option>
                                                                     <option value="SLocation6">08</option>
                                                                     <option value="SLocation6">09</option>
                                                                     <option value="SLocation6">10</option>
                                                                     <option value="SLocation6">11</option>
                                                                     <option value="SLocation6">12</option>
                                                              </select>
                                                                </div>
                                                              
                                                                <select class="dropdown-location" style="border: 1px solid black; margin: 10px">
                                                                     <option value="StartingLocation">Destination Location ...</option>
                                                                     <option value="SLocation1">Bandung</option>
                                                                     <option value="SLocation2">Bekasi</option>
                                                                     <option value="SLocation3">Bogor</option>
                                                                     <option value="SLocation4">Ciamis</option>
                                                                     <option value="SLocation5">Cirebon</option>
                                                                     <option value="SLocation6">Indramayu</option>
                                                                     <option value="SLocation6">Kuningan</option>
                                                                     <option value="SLocation6">Kuningan</option>
                                                                     <option value="SLocation6">Majalengka</option>
                                                                     <option value="SLocation6">Pangandaran</option>
                                                                     <option value="SLocation6">Purwakarta</option>
                                                                     <option value="SLocation6">Subang</option>
                                                                     <option value="SLocation6">Sukabumi</option>
                                                                     <option value="SLocation6">Sumedang</option>
                                                                     <option value="SLocation6">Tasikmalaya</option>
                                                                </select>
                                                              
                                                                
                                                                <div style="margin: 5px; height: 80px ;width: auto; float: next; position: relative">
							      <input style="padding: 5px; margin: 5px;height: 50px; width: 300px;" type="text" placeholder="End Date..."/>
                                                              <select class="dropdown-time" style="border:1px solid black; margin-right: 10px;margin-left:5px ">
                                                                     <option value="StartingLocation">Hours</option>
                                                                     <option value="SLocation1">01</option>
                                                                     <option value="SLocation2">02</option>
                                                                     <option value="SLocation3">03</option>
                                                                     <option value="SLocation4">04</option>
                                                                     <option value="SLocation5">05</option>
                                                                     <option value="SLocation6">06</option>
                                                                     <option value="SLocation6">07</option>
                                                                     <option value="SLocation6">08</option>
                                                                     <option value="SLocation6">09</option>
                                                                     <option value="SLocation6">10</option>
                                                                     <option value="SLocation6">11</option>
                                                                     <option value="SLocation6">12</option>
                                                              </select>
                                                              
                                                              <select class="dropdown-time" style="border:1px solid black ">
                                                                     <option value="StartingLocation">Minute</option>
                                                                     <option value="SLocation1">01</option>
                                                                     <option value="SLocation2">02</option>
                                                                     <option value="SLocation3">03</option>
                                                                     <option value="SLocation4">04</option>
                                                                     <option value="SLocation5">05</option>
                                                                     <option value="SLocation6">06</option>
                                                                     <option value="SLocation6">07</option>
                                                                     <option value="SLocation6">08</option>
                                                                     <option value="SLocation6">09</option>
                                                                     <option value="SLocation6">10</option>
                                                                     <option value="SLocation6">11</option>
                                                                     <option value="SLocation6">12</option>
                                                              </select>
                                                                </div>
                                                                <button style="width: 90px; height: 40px"> Save </button>							     
							    </form>
							
							
				  
                    </div> -->
                    
                    <div class="kotak-traveller">
			<div id='calendar'></div>
			
			
                    </div>
                  
                    <div class="kotak-traveller">
                        <a href="../Event/index.jsp"><button id="myBtn"> + Add New Event </button></a>
                    </div> <!--kotak-traveller-->
		</div> <!--/ .middle -->
                
               

		
	</div> <!--/ .main -->
 
 			<script>
			
				function show()
				{
					if(document.getElementById("hidden-mobile").style.display == 'none')
						document.getElementById("hidden-mobile").style.display = 'block';
					else
						document.getElementById("hidden-mobile").style.display = 'none';
				}
				
				// Get the modal
				var modal = document.getElementById('myModal');

				// Get the button that opens the modal
				var btn = document.getElementById("myBtn");

				// Get the <span> element that closes the modal
				//var span = document.getElementsByClassName("close")[0];

				// When the user clicks the button, open the modal 
				btn.onclick = function() {
				    modal.style.display = "block";
				}

				// When the user clicks on <span> (x), close the modal
				//span.onclick = function() {
				//    modal.style.display = "none";
				//}

				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
				    if (event.target == modal) {
				        modal.style.display = "none";
				    }
				};
			</script>
 
</div> <!--wadah-->

<div class="footer-atas">
	
	</div> <!--footer-atas-->

	<div class="footer-bawah">
    <div class="footer">
        <div class="copyright">
        Travelendar
        </div> <!--copyright-->

        <div class="copyright2">
        Copyright &copy; 2017 travlendar.com | Designed by A2 JTK Polban
        </div>
    </div>

</body>
</html>
