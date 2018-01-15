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
        <link rel="stylesheet" type="text/css" href="../css/home.css">
        <link rel="stylesheet" type="text/css" href="../css/responsivehome.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
        <title>Create Your Account</title>
    </head>
    <body>
        <div class="logoup">
            <img src="../images/trav.svg">
        </div><!--menu-atas-->
        <div class="wadah1">
        <!-- Modal content -->
            <div class="modal-content">			    	
		<div class="form2">
                    
                    <div class="modal-header">
                        <h1> Create Your Account </h1>
                    </div>
                    
                    <form class="register-form" id="regForm">
                        <input class="wajibdiisi" type="text" name="traveller_fullname" placeholder="Fullname ..."/>
			<input class="wajibdiisi" type="text" name="traveller_username" placeholder="Username ..."/>
                        <input class="wajibdiisi" type="text" name="traveller_email" placeholder="Email ..."/>
			<input class="wajibdiisi" type="password" name="traveller_password" placeholder="Password ..."/>
                        <input type="text" name="traveller_address" placeholder="Your Home Address ..."/>
                        <br>	
                    </form>
                    <button class="b-signup" id="tblSignup">Sign Up</button>
                    <a href="../"><button class="b-back">Back</button></a>
                    <!--<a href="listuser.html"><button class="b-back">Show List User</button></a>-->
		</div>			
            </div> <!--modal content-->
        </div>           
        <%--<%@include file="footer.jsp" %>--%>
        
        <script src="../js/jquery.min.js"></script>
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
                function objectifyForm(formArray)
                {
                    var retObj = {};
                    for(var field in formArray)
                    {
                        retObj[field['name']] = field['value'];
                    }
                    return retObj;
                }
                
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
                            url: "../index",
                            data: {action: 'registerUser', json: JSON.stringify(formData) },
                            async: false, // dikirim ketika semua beres
                            timeout: 5000,
                            success: function(msgStatus)
                            {
                                if(msgStatus.status === "OK")
                                {
                                    confirm(msgStatus.title + "\n" + msgStatus.message);
    //                                $('.modal-content').html('<a href="../"><button class="b-signin">' + msgStatus.message +' </button></a>');
                                    window.location = "../";
                                }
                                else 
                                {                                   
                                    confirm(msgStatus.title + "\n" + msgStatus.message);
                                }
                            },
                            failure: function(errMsg) {
                                confirm(errMsg);
                            }
                        });
                    }
                    else
                        confirm("Mohon fullname, username, email, password Wajib Diisi!");
                });
            });
            
            
        </script>
        
    </body>
</html>

