<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="tracking.java.common" %>
<!DOCTYPE html>
<html lang="en">
  <head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="icons8-in-transit-100.png" />
    <title>Home</title>
    
    <link rel="stylesheet" href="<%=common.url%>/style.css" />
   
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
      <div class="container-3">
        <div class="logo">Staff Login</div>
        <div class="login-item">
          <form action="LoginController" method="post" class="form form-login">
            <div class="form-field">
              <label class="user" for="login-username"
                ><span class="hidden">Username</span></label
              >
              <input
                id="login-username"
                type="text"
                class="form-input"
                placeholder="Username"
                name="sid"
                required
              />
            </div>
            <div class="form-field">
              <label class="lock" for="login-password"
                ><span class="hidden">Password</span></label
              >
              <input
                id="login-password"
                type="password"
                class="form-input"
                name="spassword"
                placeholder="Password"
                required
              />
            </div>

            <div class="form-field">
              <input type="submit" value="Log in" />
            </div>
          </form>
        </div>
      </div>
    </section>

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

    <script src="jquery-3.6.0.js"></script>
    <script src="fm.revealator.jquery.js"></script>
    <script src="slick/slick.min.js"></script>
    <script src="slick/slick.js"></script>
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
    