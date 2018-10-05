<!DOCTYPE html>
<html lang="en">
	
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="keywords" content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page" />
		<meta name="robots" content="index, follow" />
        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <script>window.Laravel =  { csrfToken: '{{ csrf_token() }}' }</script>
		<title>News Feed | Check what your friends are doing</title>

        <!-- Stylesheets
        ================================================= -->
		<link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}" />
		<link rel="stylesheet" href="{{ asset('css/style.css') }}" />
        <link rel="stylesheet" href="{{ asset('css/ionicons.min.css') }}" />
        <link rel="stylesheet" href="{{ asset('css/jquery.scrollbar.css') }}" />
        <link rel="stylesheet" href="{{ asset('css/font-awesome.min.css') }}" />
    
        <!--Google Font-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i" rel="stylesheet">

        <!-- Scripts -->
        <script src="{{ asset('js/app.js') }}" defer></script>
        <!--Favicon-->
        <link rel="shortcut icon" type="image/ico" href="{{ asset('images/fav.ico') }}"/>
        @section('link-css')
        @show
	</head>
  <body>
    <div id="app">
        <!-- Header
        ================================================= -->
            <header id="header">
                <nav class="navbar navbar-default navbar-fixed-top menu" >
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" style="padding: 1px 15px" href="{{ url('/') }}"><img src="{{ asset('images/logo.png') }}" alt="logo" width="50px" /></a>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-right main-menu">
                                <li class="dropdown">
                                    <a href="{{ route('view.profile', Auth::user()->slug) }}" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">{{ Auth::user()->name }}</a>
                                </li>
                                <li class="dropdown">
                                    <a href="{{ route('messages') }}" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-comments" aria-hidden="true"></i></a>
                                </li>
                                <notification-bar></notification-bar>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog fa-spin fa-fw"></i></a>
                                    <ul class="dropdown-menu newsfeed-home">
                                        <li>
                                            <a class="dropdown-item" href="{{ route('logout') }}"
                                            onclick="event.preventDefault();
                                            document.getElementById('logout-form').submit();">
                                            {{ __('Logout') }}
                                            </a>
                                        </li>
                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            @csrf
                                        </form>
                                    </ul>
                                </li>
                            </ul>
                            <form class="navbar-form navbar-right hidden-sm" action="{{ route('search') }}" method="get">
                                <div class="form-group">
                                    <i class="icon ion-android-search"></i>
                                    <input type="text" class="form-control" name="data" placeholder="Search friends">
                                </div>
                            </form>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container -->
                </nav>
            </header>
        <!--Header End-->

        <div id="page-contents">
            <notification-show id="{{ Auth::user()->id }}"></notification-show>
            @yield('content')
        </div>

        <!-- Footer
        ================================================= -->
        <footer id="footer">
            <div class="copyright">
                <p></p>
            </div>
        </footer>
    </div>
    <!-- Scripts
    ================================================= -->
    <script src="{{ asset('js/jquery-3.1.1.min.js') }}"></script>
    <script src="{{ asset('js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('js/jquery.appear.min.js') }}"></script>
    <script src="{{ asset('js/jquery.incremental-counter.js') }}"></script>
    <script src="{{ asset('js/jquery.sticky-kit.min.js') }}"></script>
    <script src="{{ asset('js/jquery.scrollbar.min.js') }}"></script>
    <script src="{{ asset('js/script.js') }}"></script>
  </body>

</html>
