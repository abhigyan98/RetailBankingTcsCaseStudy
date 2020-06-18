<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/136b4fde49.js" crossorigin="anonymous"></script>
</head>
<style>

      .footer{
        background-color: rgba(0, 0, 0, 0.89);
      }
      #footer{
        
        bottom: 0;
        /* margin-top: auto; */
        border-top: solid 5px yellow;
        /* padding: -80px; */
        /* height: 150px; */
      }

      #copyright{
        background-color: #141414;
        height: 40px;
        color: white;
      }

      .foottext{
        color:white;
        font-size: 13px;
        text-align: justify;
      }

      #icon{
        color: #FFFB00;
      }

    </style>
<body>
	<div class="container-fluid footer" id="footer">
	
      <div class="row">
        
        <div class="col foottext">
          <div class="row py-2">
            <div class="col-6">
              <p><span style="color:#FFFB00;font-size: 1.0rem;padding-left:40px;">About Us</span></p>
                <p style="padding-left:40px;">FedChoice Bank was founded on 14th June 2016 with the objective of providing the bank details services based on retail banking operation. The Retail Internet Banking of FedChoice Bank offers a plethora of products and services, to cater its customers by providing certain animus services with an easy volving offers and ways to do the required job without hurdling the process</p>
            </div>
          
            <div class="col-2">
              <p><span style="color:#FFFB00;font-size: 1.0rem;">Services</span></p>
                <a>Retail and Consumer Banking</a><br> 
                <a>Personal Internet Banking</a><br>
                <a>Corporate Internet Banking</a><br>
                <a>Debit and Credit cards</a>
            </div>
  
            <div class="col-3">
              <p><span style="color:#FFFB00;font-size: 1.0rem;">Contact Us</span></p>
                <a>Email: customer.services@fedchoice.com</a><br>
                <a>Contact No : 022-42406778, 022-54567890</a><br>
                <a>Address : Corporate Office, Madame Cama Road,
                Nariman Point, Mumbai, Maharashtra 400021</a>
            </div>
  
          </div>	
        </div>
      
      </div>
  
    <div class="row py-2" id="copyright">
      <div class="col-2"></div>
      <div class="col-6" style="font-weight: bold;">Copyright <i class="far fa-copyright"></i> All rights reserved by <span style="color:#FFFB00;">FedChoice Bank</span></div>
      <div class="col-4">
        <p>
          <span style="color:#FFFB00;font-size:15px;">Connect With Us </span>
          <i class="fab fa-facebook-square" id="icon"> </i> 
          <i class="fab fa-twitter-square" id="icon"> </i> 
          <i class="fab fa-google-plus-g" id="icon"> </i> 
          <i class="fab fa-linkedin" id="icon"> </i>
        </p> 
      </div>
    </div>
    
    
  </div>
</body>
</html>