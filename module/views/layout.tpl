<!DOCTYPE html>
%#Set default values
%if not 'js' in locals(): js = []
%if not 'title' in locals(): title = 'No title'
%if not 'css' in locals(): css = []
%if not 'print_menu' in locals(): print_menu = True
%if not 'print_header' in locals(): print_header = True
%if not 'print_footer' in locals(): print_footer = True
%if not 'refresh' in locals(): refresh = False
%if not 'user' in locals(): user = None
%if not 'app' in locals(): app = None

%print "APP is", app

%# If not need, disable the top right banner
%if not 'top_right_banner_state' in locals(): top_right_banner_state = 0

%# For the menu selection
%if not 'menu_part' in locals(): menu_part = ''

<html lang="en">
<head>
	<meta charset="utf-8">
	<title>{{title or 'No title'}}</title>

<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->

<!--[if lt IE 9]>
<script src="/static/js/html5.js"></script>
<script src="/static/js/json2.js"></script>
<![endif]-->

<!-- Le styles -->
<link href="/static/css/bootstrap.css" rel="stylesheet">
<link href="/static/css/font-awesome.css" rel="stylesheet">
<link href="/static/css/custom/layout.css" rel="stylesheet">
<link href="/static/css/elements/jquery.meow.css" rel="stylesheet">
<link href="/static/css/elements/header-element.css" rel="stylesheet">
<link href="/static/css/custom/deptree.css" rel="stylesheet">
<link href="/static/css/custom/buttons.css" rel="stylesheet">
<link href="/static/css/elements/jquery.pageslide.css" rel="stylesheet">
<!-- css3 effect for pulse is not available on IE It's not real comment, if so it will not work. -->

<!--[IF !IE]> -->
<link href="/static/css/elements/pulse.css" rel="stylesheet">
<!-- <![ENDIF]-->

<!-- Warning, this version of datepicker came from http://dl.dropbox.com/u/143355/datepicker/datepicker.html -->
<link href="/static/css/custom/datepicker.css" rel="stylesheet">

%# And now for css files
%for p in css:
<link rel="stylesheet" type="text/css" href="/static/{{p}}">
%end

<!-- Le javascript
	================================================== -->
	
	<script src="/static/js/jquery.js"></script>
	<script src="/static/js/jquery-ui-1.8.17.custom.min.js"></script>
	<script src="/static/js/shinkenui.js"></script>
	<script src="/static/js/snap.js"></script>
	<script src="/static/js/demo.js"></script>
	<script src="/static/js/bootstrap.js"></script>
	<script src="/static/js/jquery.pageslide.js"></script>
	<!-- Warning, this version of datepicker came from http://dl.dropbox.com/u/143355/datepicker/datepicker.html -->
	<script src="/static/js/bootstrap-datepicker.js"></script>
	<!-- Warning, this version of typeahead came from https://gist.github.com/1866577 -->
	<script src="/static/js/bootstrap-typeahead.js"></script>
	<script src="/static/js/jquery.meow.js"></script>
	<script src="/static/js/jquery-jsonp-2.2.1.min.js"></script>
	<script src="/static/js/jquery.hotkeys.js"></script>
	<!-- From http://joequery.github.com/Stupid-Table-Plugin/ -->
	<script src="/static/js/jquery-stupidtable.min.js"></script>
	<script src="/static/js/spin.min.js"></script>

	<!--Shinken ones-->
	%if refresh:
	<script>
		var app_refresh_period = {{app.refresh_period}};
	</script>
	<script src="/static/js/shinken-refresh.js"></script>
	%end
	<script src="/static/js/shinken-actions.js"></script>
	<script src="/static/js/shinken-deptree.js"></script>
	<script src="/static/js/shinken-greeting.js"></script>
	<script src="/static/js/shinken-opacity.js"></script>
	<script src="/static/js/shinken-modals.js"></script>
	<script src="/static/js/shinken-widgets.js"></script>
	<script src="/static/js/shinken-canvas.js"></script>
	<script src="/static/js/shinken-treemap.js"></script>
	<script src="/static/js/shinken-aggregation.js"></script>

	%# End of classic js import. Now call for specific ones
	%for p in js:
	<script type="text/javascript" src="/static/{{p}}"></script>
	%end
</head>

<body>
	%if print_menu:
		%include side_nav_element globals()
	%end
	<div id="content" class="snap-content">
		%if print_header:
			%include nav_element globals()
		%end	
		<div class="container" style="padding-top:50px;">
			%include
		</div>
	</div>

	<script type="text/javascript">
		var snapper = new Snap({
			element: document.getElementById('content')
		});
		addEvent(document.getElementById('ol'), 'click', function(){
			snapper.open('left');
		});
	</script>

	%if print_footer:
		%include footer_element
	%end
	<!-- The modal div that will be shown when we want, and after put in it the data we want -->
	<div class="modal fade" id="modal"></div>
</body>
</html>
