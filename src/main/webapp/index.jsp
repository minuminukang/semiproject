<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/view/common/header.jsp"%>

  <script src="jquery-3.6.0.min.js"></script>
  <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88746c767ec969fd9dd8304966eb4179&libraries=clusterer"></script>
<body>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모모모 전기차</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"> ​
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/footers/">
    <!-- <link href="bootstrap.min.css" rel="stylesheet"> -->

    <style>
        /* 12/23(월) 헤더 수정한 부분 시작.*/
       
        .mySlides img {
            
            width: 100%;
            height: auto;
            padding: 0px;
        }
        
        .mySlides {
            display: none
        }
        
        img {
            vertical-align: middle;
        }
        /* Slideshow container */
        
        .slideshow-container {
            width: 100%;
            /* max-width: 1000px; */
            position: relative;
            margin: auto;
        }
        /* The dots/bullets/indicators */
        
        .dot {
            cursor: pointer;
            height: 10px;
            width: 10px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }
        
        .active,
        .dot:hover {
            background-color: #717171;
        }
        
        .text-muted {
            --bs-text-opacity: 1;
            color: green!important
        }
        
        .col-md-4 {
            flex: 0 0 auto;
            width: 33.33333333%
        }
        
        .list-unstyled {
            padding-left: 0;
            list-style: none
        }
        
        .d-flex {
            display: flex!important
        }
        
        .flex-wrap {
            flex-wrap: wrap!important
        }
        
        .align-items-center {
            align-items: center!important
        }
        
        .justify-content-between {
            justify-content: space-between!important
        }
        
        .justify-content-end {
            justify-content: flex-end!important
        }
        
        .container {
            width: 100%;
            padding-right: var(--bs-gutter-x, .75rem);
            padding-left: var(--bs-gutter-x, .75rem);
            margin-right: auto;
            margin-left: auto
        }
        
        .py-3 {
            padding-top: 1rem!important;
            padding-bottom: 1rem!important
        }
        
        .ms-3 {
            margin-left: 1rem!important
        }
        
        .my-4 {
            margin-top: 1.5rem!important;
            margin-bottom: 1.5rem!important
        }
        
        .border-top {
            border-top: 1px solid #dee2e6!important
        }
        
        .nav {
            display: flex;
            flex-wrap: wrap;
            padding-left: 0;
            margin-bottom: 0;
            list-style: none
        }
        
        @media (min-width:576px) {
            .container {
                max-width: 540px
            }
        }
        
        @media (min-width:768px) {
            .container {
                max-width: 720px
            }
        }
        
        @media (min-width:992px) {
            .container {
                max-width: 960px
            }
        }
        
        @media (min-width:1200px) {
            .container {
                max-width: 1140px
            }
        }
        
        @media (min-width:1400px) {
            .container {
                max-width: 1320px
            }
        }
        
        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }s
    </style>
</head>
<body>
   
    <section id="main-content1">
        <div class="slideshow-container">
        
            <div class="mySlides fade">
                <img src="<%=request.getContextPath()%>/view/resources/img/main_01.jpg" onclick="location.href='<%=request.getContextPath()%>/model/view';" style="cursor: pointer;">
            </div>

            <div class="mySlides fade ">
                <img src="<%=request.getContextPath()%>/view/resources/img/main_02.jpg" onclick="location.href='<%=request.getContextPath()%>/view/news';">
            </div>

            <div class="mySlides fade ">
                <img src="<%=request.getContextPath()%>/view/resources/img/main_03.jpg" onclick="location.href='<%=request.getContextPath()%>/board/board_list';" style="cursor: pointer;">
            </div>
            <div class="mySlides fade ">
                <img src="<%=request.getContextPath()%>/view/resources/img/main_04.jpg" onclick="location.href='<%=request.getContextPath()%>/model/view';" style="cursor: pointer;">
            </div>
            <div class="mySlides fade ">
                <img src="<%=request.getContextPath()%>/view/resources/img/main_05.jpg" onclick="location.href='<%=request.getContextPath()%>/view/mapSearch.jsp';" style="cursor: pointer;">
            </div>

            <div style="text-align:center ">
                <span class="dot" onclick="showSlidesClick(1)"></span>
                <span class="dot" onclick="showSlidesClick(2)"></span>
                <span class="dot" onclick="showSlidesClick(3)"></span>
                <span class="dot" onclick="showSlidesClick(4)"></span>
                <span class="dot" onclick="showSlidesClick(5)"></span>
            </div>
        </div>
    </section>

    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="facebook" viewBox="0 0 16 16" onclick="location.href='https://www.facebook.com/';" style="cursor: pointer;">
          <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
        </symbol>
        <symbol id="instagram" viewBox="0 0 16 16" onclick="location.href='https://www.instagram.com/?hl=ko';" style="cursor: pointer;">
            <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
        </symbol>
        <symbol id="twitter" viewBox="0 0 16 16" onclick="location.href='https://twitter.com/?lang=ko';" style="cursor: pointer;">
          <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
        </symbol>
    </svg>


   

    <script>
    


        var slideIndex = 0;
        showSlides();
        setInterval(() =>showSlides() , 4000);
        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none ";
            }
            slideIndex++;
            if (slideIndex > slides.length) {
                slideIndex = 1
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace("active ", " ");
            }
            slides[slideIndex - 1].style.display = "block ";
            dots[slideIndex - 1].className += " active ";
             //이미지 3초마다 바꾸주기
        }
        
        function showSlidesClick(index){
        	var i;
        	 var slides = document.getElementsByClassName("mySlides");
             var dots = document.getElementsByClassName("dot");
        	 for (i = 0; i < slides.length; i++) {
                 slides[i].style.display = "none ";
             }
        	 slideIndex = index;
        	 for (i = 0; i < dots.length; i++) {
                 dots[i].className = dots[i].className.replace("active ", " ");
             }
        	 slides[slideIndex - 1].style.display = "block ";
             dots[slideIndex - 1].className += " active ";
        	 
        }
        
       
        
    </script>


</body>

<%@ include file="/view/common/footer.jsp"%>