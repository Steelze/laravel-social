<!DOCTYPE html>
<html lang="en">
	
    <head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="keywords" content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page" />
		<meta name="robots" content="index, follow" />
		<title>Social</title>

        <!-- Stylesheets
        ================================================= -->
		<link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}" />
		<link rel="stylesheet" href="{{ asset('css/style.css') }}" />
        <link rel="stylesheet" href="{{ asset('css/ionicons.min.css') }}" />
        <link rel="stylesheet" href="{{ asset('css/font-awesome.min.css') }}" />
        
    
        <!--Google Font-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i" rel="stylesheet">
        
        <!--Favicon-->
        <link rel="shortcut icon" type="image/ico" href="{{ asset('images/fav.ico') }}"/>
	</head>
	<body>
        <!-- Top Banner
        ================================================= -->
		<section id="banner">
			<div class="container">
                @yield('content')
            </div>
		</section>
		<footer id="footer">
            <div class="copyright">
                <p></p>
            </div>
		</footer>

    <!-- Scripts
    ================================================= -->
    <script src="{{ asset('js/jquery-3.1.1.min.js') }}"></script>
    <script src="{{ asset('js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('js/jquery.appear.min.js') }}"></script>
    <script src="{{ asset('js/jquery.incremental-counter.js') }}"></script>
    <script src="{{ asset('js/script.js') }}"></script>
    
	</body>

<!-- Mirrored from thunder-team.com/friend-finder/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 28 Sep 2018 16:06:58 GMT -->
</html>
