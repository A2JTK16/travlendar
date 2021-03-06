<%-- 
    Document   : index
    Created on : Nov 17, 2017, 4:55:08 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/home.css">
        <title>Travelendar</title>
    </head>
    <body>
        
        <div class="menu-atas">
            <div class="header">
                <div class="logonya">
                    <img src="images/travelendar2.png">

                </div>
                <div class="logo">
                    <img src="images/logo.png">
                </div> <!--logo-->


                <div class="tombol" style="float:right;">
                        <div class="sign-in">
                            <button id="myBtn">Sign In</button>
                        </div>
                </div>
            </div>
        </div> <!--menu-atas-->

        
        <div class="wadah1">
        <!-- Modal content -->
            <div class="modal-content">			    	
		<div class="form">
                    
                    <div class="modal-header">
                        <h1> Add Admin </h1>
                    </div>
                    
                    <form class="register-form" id="regForm">
                        <input class="wajibdiisi" type="text" name="fullname" placeholder="Fullname ..."/>
			<input class="wajibdiisi" type="text" name="username" placeholder="Username ..."/>
                        <input class="wajibdiisi" type="text" name="email" placeholder="Email ..."/>
			<input class="wajibdiisi" type="password" name="password" placeholder="Password ..."/>
                        <br>	
                    </form>
                    <button class="b-signup" id="tblSignup">Tambah Admin Now</button>
                    <a href="index.jsp"><button class="b-back">Back</button></a>
                    <a href="listadmin.html"><button class="b-back">Show List Admin</button></a>
		</div>			
            </div> <!--modal content-->
        </div>           
        <%@include file="footer.jsp" %>
        
        <script src="js/jquery.min.js"></script>
        <script>
            $(document).ready( function()  // Ketika web udah siap
            {   
                function getFormData($form)
                {
                    var unindexedArray = $form.serializeArray();
                    var indexedArray = {};
                    $.map(unindexedArray, function(n,i)
                    {
                        indexedArray[n['name']] = n['value'];
                    });
                    return indexedArray;
                }
                //ubah jsonarray form hasil serialize jadi json obj
                
                $('#tblSignup').click(function(){
                    // Serialize form to JSON Array
                    var formData = getFormData($('#regForm'));
                    var isValid = true; //diisi enggaknya
  
                    // cek kosong enggaknya
                    $('.wajibdiisi').each(function()
                    {
                       var eldt = $(this);
                       if(eldt.val() == "")
                       {
                           isValid = false;
                       }                           
                    });
                    
                    // jika diisi maka
                    if(isValid)
                    {
                        $.ajax({
                            type: "POST", // method post
                            url: "http://localhost:8080/Travlendar2A/index",
                            dataType:'JSON',
                            data: {action: 'addAdmin', json: JSON.stringify(formData) },
                            async: false, // dikirim ketika semua beres
                            complete: function(msgStatus)
                            {
                                var successMessage = JSON.stringify(msgStatus.responseText);
                                if(successMessage)
                                {
                                    alert(successMessage);
                                }
                            },
                            failure: function(errMsg) {
                                alert(errMsg);
                            }
                        });
                    }
                    else
                        alert("Mohon fullname, username, email, password Wajib Diisi!");
                });
            });
        </script>
        
    </body>
</html>

