<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="tracking.java.common" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="icons8-in-transit-100.png" />
    <title>Home</title>
    
    <link rel="stylesheet" href="<%=common.url%>//style.css" />
   
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="http://localhost:8085/courier_management_system1/slick/slick.css" />
    <link rel="stylesheet" href="http://localhost:8085/courier_management_system1/slick/slick-theme.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.min.js"></script>
    <link rel="stylesheet" href="http://localhost:8085/courier_management_system1/slick/slick.css" />
    <link rel="stylesheet" href="http://localhost:8085/courier_management_system1/slick/slick-theme.css" />
    <link rel="stylesheet" href="http://localhost:8085/courier_management_system1/css/fm.revealator.jquery.css" />
    <script src="https://use.fontawesome.com/f3e9facb88.js"></script>
</head>
<style>
body {
  font-family: sans-serif;
  background-image: url(${pageContext.request.contextPath}/img/Slider-Revolution-SendReceive-1920x1080-Delivery_00-1.jpg);
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  color: var(--third-color);
  overflow-x: hidden;
}

</style>

<body id="home">
    <header class="header">
      <h2><a href="index.jsp">SPEED POST</a></h2>
      <nav style="flex: 0.4; margin-right: 30px">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#service">Services</a></li>
        <li><a href="#contact">Contact</a></li>
        <li><a href="login.jsp">Login</a></li>
      </nav>

      <input type="checkbox" class="checkbox" id="chk" />
      <label class="label" for="chk">
        <i class="fas fa-sun"></i>
        <i class="fas fa-moon"></i>
        <div class="ball"></div>
      </label>
    </header>

    <section class="banner-area">
      <h1 style="margin-top: 100px">GET THE FASTEST SERVICE</h1>
      <h1>FOR YOUR PRODUCT</h1>
      <div class="break"></div>
      <h2 class="parcel-here">Trace & Track</h2>
      <div class="break"></div>
      <div class="welcome_form">
        <form action="search" method="post">
          <input
            class="form-control"
            type="text"
           
            name="pid"
            value="<c:out value="${a.pid}" />"
           
          />
         
          <button
            class="submit"
            type="submit"
          >
            <i class="fas fa-search"></i>
          </button>
        </form>
      </div>
      <div class="break"></div>

      <div style="margin-bottom: 30px" class="break"></div>
      <div class="con" id="customers">
        <table style="width:700px; height:100px;">
          <tr>
            <th colspan="2">Date</th>
            <th colspan="2">Status</th>
            <th colspan="2">Location</th>
             
          </tr>
          
       <c:forEach items="${t}" var="t">
          <tr>
        <td colspan="2"><c:out  value="${t.tdate}"/><br><c:out  value="${t.ttime}"/></td>
          <td colspan="2"><c:out value="${t.tprocess}" /></td>   
        <td colspan="2"><c:out value="${t.tevent}" /></td>      
              
        </tr>
           </c:forEach>
        </table>
      </div>
    </section>

    <!-- New Section -->
    <div class="about-area" id="about">
      <div class="flex">
        <hr class="hr-text" data-content="ABOUT" />
        <div class="row row-flex">
          <div class="box-1 revealator-zoomin">
            <h2>AbOUT US</h2>
            <p>
              Established in June 2014, this company was formed with a mission
              in mind; that is to provide a simplified shipping platform where
              businesses could book any manner of consignment for delivery at
              prices they couldn't achieve themselves, backed up with the
              knowledge and expertise of an industry veteran (the Managing
              Director).
            </p>
            <button class="button type1">Read more</button>
          </div>
          <div class="box-2 revealator-zoomin">
            <div class="slider">
              <div class="slides">
                <!--radio buttons start-->
                <input type="radio" name="radio-btn" id="radio1" />
                <input type="radio" name="radio-btn" id="radio2" />
                <input type="radio" name="radio-btn" id="radio3" />
                <input type="radio" name="radio-btn" id="radio4" />
                <!--radio buttons end-->
                <!--slide images start-->
                <div class="slide first">
                  <img src="img/parcel.jpg" alt="" />
                </div>
                <div class="slide">
                  <img
                    src="img/customer-receiving-parcel-from-delivery-man_23-2148579145.jpg"
                    alt=""
                  />
                </div>
                <div class="slide">
                  <img
                    src="img/crop-customer-receiving-parcel-with-courier_23-2147801241.jpg"
                    alt=""
                  />
                </div>
                <div class="slide">
                  <img
                    src="img/customer-with-face-mask-receiving-parcel-from-delivery-man_23-2148579147.jpg"
                    alt=""
                  />
                </div>

                <!--slide images end-->
                <!--automatic navigation start-->
                <div class="navigation-auto">
                  <div class="auto-btn1"></div>
                  <div class="auto-btn2"></div>
                  <div class="auto-btn3"></div>
                  <div class="auto-btn4"></div>
                </div>
                <!--automatic navigation end-->
              </div>
              <!--manual navigation start-->
              <div class="navigation-manual">
                <label for="radio1" class="manual-btn"></label>
                <label for="radio2" class="manual-btn"></label>
                <label for="radio3" class="manual-btn"></label>
                <label for="radio4" class="manual-btn"></label>
              </div>
              <!--manual navigation end-->
            </div>
          </div>
        </div>

        <div class="row margin-top space-around row-flex-1">
          <div class="single-about-us-bottom revealator-zoomin">
            <div class="icon">
              <i class="fas fa-truck-loading"></i>
            </div>
            <h4>WHAT WE DO</h4>
            <p>
              Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam
              nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
              erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci
              tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
              consequat. Duis autem vel eum iriure dolor in hendrerit in
              vulputate velit esse molestie consequat,
            </p>
          </div>
          <div
            class="single-about-us-bottom revealator-zoomin revealator-delay1"
            style="margin-left: 20px; margin-right: 20px"
          >
            <div class="icon">
              <i class="fas fa-history"></i>
            </div>
            <h4>OUR HISTORY</h4>
            <p>
              Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam
              nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
              erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci
              tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
              consequat. Duis autem vel eum iriure dolor in hendrerit in
              vulputate velit esse molestie consequat,
            </p>
          </div>
          <div
            class="single-about-us-bottom revealator-zoomin revealator-delay2"
          >
            <div class="icon">
              <i class="fas fa-bullseye"></i>
            </div>
            <h4>OUR MISSION</h4>
            <p>
              Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam
              nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
              erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci
              tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
              consequat. Duis autem vel eum iriure dolor in hendrerit in
              vulputate velit esse molestie consequat,
            </p>
          </div>
        </div>
      </div>
    </div>
    <!-- Section closed -->

    <!-- New section -->
    <div class="row information">
      <div class="info">
        <h2 class="counter">126</h2>
        <h5>Satisfied</h5>
      </div>
      <div class="info">
        <h2 class="counter">34</h2>
        <h5>Branches</h5>
      </div>
      <div class="info">
        <h2 class="counter">120</h2>
        <h5>Active Workers</h5>
      </div>
      <div class="info">
        <h2 class="counter">3546</h2>
        <h5>Product Delivered</h5>
      </div>
    </div>
    <!--Section closed-->

    <!-- New Section -->
    <div class="about-area" id="service">
      <div class="flex">
        <hr class="hr-text" data-content="SERVICES" />
        <div class="row row-flex-2">
          <div class="revealator-zoomin">
            <div class="service">
              <img src="img/truck.png" width="50px" />
              <h3>Domestic &amp; International Delivery</h3>
              <p>
                No matter where you’re shipping to, just book online and get it
                delivered worldwide from renowned domestic and international
                couriers.
              </p>
            </div>
          </div>
          <div class="revealator-zoomin">
            <div class="service">
              <img src="img/megaphone.png" width="50px" />
              <h3>MARKETING TOOLS</h3>
              <p>
                Take your brand to the next level by customizing your own
                promotional message to your receivers! With marketing tools, you
                can now bring your brand to light and make your promotional
                message pop in front of your customers.
              </p>
            </div>
          </div>
          <div class="revealator-zoomin">
            <div class="service">
              <img src="img/smartphone.png" width="50px" />
              <h3>TRACKING SMS</h3>
              <p>
                Still sending tracking number to receivers manually? You may get
                it done automatically with every order in Speed Post.
              </p>
            </div>
          </div>
          <div class="revealator-zoomin">
            <div class="service">
              <img src="img/shop.png" width="50px" />
              <h3>PICK UP/DROP-OFF POINTS</h3>
              <p>
                Dislike waiting? Just drop-off your parcel to courier branch or
                convenient stores near you. There are 3000+ points across
                Malaysia eg MyNews, 99 Speedmart, Caring Pharmacy and many more.
              </p>
            </div>
          </div>
          <div class="revealator-zoomin">
            <div class="service">
              <img src="img/location.png" width="50px" />
              <h3>EASYTRACK</h3>
              <p>
                See all your latest parcel statuses in a glance under All
                Parcels. You may easily check on shipment progress without
                needing to track one by one.
              </p>
            </div>
          </div>
          <div class="revealator-zoomin">
            <div class="service">
              <img src="img/settings.png" width="50px" />
              <h3>ECOMMERCE INTEGRATIONS</h3>
              <p>
                You may easily integrate your online store with us to
                automatically import order details to your EasyParcel dashboard
                as soon as a sale is made with no need for manual entry of data.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Section closed -->

    <!-- New Section -->
    <div class="information-2">
      <div style="align-items: center" class="flex">
        <div class="best-courier">
          <h3>Courier Partners</h3>
          <span>Best courier options under one platform</span>
        </div>

        <div class="container">
          <div class="logo-slider">
            <div class="item">
              <a href="#"><img src="img/skynet.jpeg" alt="" /></a>
            </div>
            <div class="item">
              <a href="#"><img src="img/Pos_Laju.jpg" alt="" /></a>
            </div>
            <div class="item">
              <a href="#"><img src="img/Logo_J&T_Merah_Square.jpg" alt="" /></a>
            </div>
            <div class="item">
              <a href="#"><img src="img/fedex.png" alt="" /></a>
            </div>
            <div class="item">
              <a href="#"><img src="img/dhl.png" alt="" /></a>
            </div>
            <div class="item">
              <a href="#"><img src="img/shopee.png" alt="" /></a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Closed Section -->

    <!-- New Section -->
    <div class="about-area" id="contact">
      <div class="flex">
        <hr class="hr-text" data-content="CONTACT" />

        <div class="container-2">
          <div class="box revealator-zoomin">
            <div class="imgBx">
              <img src="img/call.png" />
            </div>
            <div class="content">
              <div class="icon">
                <img src="img/call black.png" />
              </div>
              <h3>Phone No</h3>
              <h4>+60123456789</h4>
              <h4>+60198765432</h4>
            </div>
          </div>
          <div class="box revealator-zoomin revealator-delay1">
            <div class="imgBx">
              <img src="img/email.png" />
            </div>
            <div class="content">
              <div class="icon">
                <img src="img/email black.png" />
              </div>
              <h3>Email</h3>
              <h4>support@speedpost.com</h4>
              <h4>care@speedpost.com</h4>
            </div>
          </div>
          <div class="box revealator-zoomin revealator-delay2">
            <div class="imgBx">
              <img src="img/map.png" />
            </div>
            <div class="content">
              <div class="icon">
                <img src="img/map black.png" />
              </div>
              <h3>Address</h3>
              <h4>67,Jalan Purnama 21</h4>
              <h4>Taman Setia</h4>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Closed Section -->

    <footer>
      <div class="flex">
        <div class="row justify-content">
          <div class="company">
            <h3 class="title-section">COMPANY</h3>
            <div class="row">
              <div class="items" style="margin-right: 100px">
                <ul>
                  <li>About SpeedPost</li>
                  <li>Our Portfolio</li>
                  <li>Investor</li>
                  <li>Relations</li>
                  <li>Careers</li>
                </ul>
              </div>
              <div class="items">
                <ul>
                  <li>SpeedPost Blog</li>
                  <li>Corporate</li>
                  <li>Responsibility</li>
                  <li>Newsroom</li>
                  <li>Contact Us</li>
                </ul>
              </div>
            </div>
          </div>

          <div class="flex">
            <div class="company">
              <h3 class="title-section">MORE FROM SPEEDPOST</h3>
              <div class="row">
                <div class="items" style="margin-right: 100px">
                  <ul>
                    <li>Speed Post Compatible</li>
                    <li>Developer Resource Center</li>
                    <li>Speed Post Logistics</li>
                    <li>Speed Post Cross Border</li>
                    <li>ShopRunner</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="flex">
            <div class="company">
              <h3 class="title-section">SOCIALS</h3>
              <div class="row">
                <div class="items" style="margin-right: 100px">
                  <ul>
                    <li><i class="fab fa-facebook"></i> Facebook</li>
                    <li><i class="fab fa-twitter"></i> Twitter</li>
                    <li><i class="fab fa-instagram"></i> Instagram</li>
                    <li><i class="fab fa-tiktok"></i> TikTok</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <h2 style="text-align: center; margin-top: 40px; font-size: 20px">
          Designed by
          <span
            ><a href="https://github.com/adsyahir" target="_tab"
              >Adam Syahir</a
            ></span
          >
        </h2>
      </div>
    </footer>

    <script src="http://localhost:8085/courier_management_system1/js/jquery-3.6.0.js"></script>
    <script src="http://localhost:8085/courier_management_system1/js/fm.revealator.jquery.js"></script>
    <script src="http://localhost:8085/courier_management_system1/slick/slick.min.js"></script>
    <script src="http://localhost:8085/courier_management_system1/slick/slick.js"></script>

    <script>
      $(window).on("scroll", function () {
        if ($(window).scrollTop() > 50) {
          $(".header").addClass("active");
        } else {
          //remove the background property so it comes transparent again (defined in your css)
          $(".header").removeClass("active");
        }
      });
      $("input[type='search']").on("input", function () {
        canChangeColor();
      });

      function canChangeColor() {
        var can = true;

        $("input[type='search']").each(function () {
          if ($(this).val() == "") {
            can = false;
            $(".search").css({ color: "transparent" });
          }
        });

        if (can) {
          $(".search").css({ color: "white" });
          $(".search").css({ cursor: "pointer" });
        } else {
          $(".search").css({ color: "transparent" });
        }
      }
      var counter = 1;
      setInterval(function () {
        document.getElementById("radio" + counter).checked = true;
        counter++;
        if (counter > 4) {
          counter = 1;
        }
      }, 3000);
      $(".logo-slider").slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        dots: true,
        arrows: true,
        autoplaySpeed: 2000,
        infinite: true,
      });
      $(document).ready(function () {
        $(".counter").counterUp({
          delay: 10,
          time: 1200,
        });
      });

      const toggleSwitch = document.getElementById("chk");

      function switchTheme(e) {
        if (e.target.checked) {
          document.documentElement.setAttribute("data-theme", "light");
          localStorage.setItem("theme", "light"); //add this
        } else {
          document.documentElement.setAttribute("data-theme", "dark");
          localStorage.setItem("theme", "dark"); //add this
        }
      }

      toggleSwitch.addEventListener("change", switchTheme, false);

      const currentTheme = localStorage.getItem("theme")
        ? localStorage.getItem("theme")
        : null;

      if (currentTheme) {
        document.documentElement.setAttribute("data-theme", currentTheme);

        if (currentTheme === "light") {
          toggleSwitch.checked = true;
        }
      }
      $(document).ready(function () {
        $("html,body").animate({ scrollTop: 0 }, 100); //100ms for example
      });
    </script>
  </body>
</html>