<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="canonical" href="http://www.jointjs.com/" />
        <meta name="description" content="Create interactive diagrams in JavaScript easily. JointJS plugins for ERD, Org chart, FSA, UML, PN, DEVS, LDM diagrams are ready to use." />
        <meta name="keywords" content="JointJS, JavaScript, diagrams, diagramming library, UML, charts" />

        <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" rel="stylesheet" type="text/css" />
        <link href='http://fonts.googleapis.com/css?family=Montserrat:700' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="http://jointjs.com/cms/styles/styles.api.min.css" />
        <link rel="stylesheet" href="http://jointjs.com/css/tutorial.css" />

        <link rel="apple-touch-icon" sizes="57x57" href="http://jointjs.com/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="http://jointjs.com/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="http://jointjs.com/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="http://jointjs.com/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="http://jointjs.com/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="http://jointjs.com/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="http://jointjs.com/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="http://jointjs.com/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="http://jointjs.com/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="http://jointjs.com/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="http://jointjs.com/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="http://jointjs.com/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="http://jointjs.com/favicon/favicon-16x16.png">
<link rel="manifest" href="http://jointjs.com/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">



        <title>JointJS - JavaScript diagramming library - Demos.</title>
        
    </head>

    <script>
      SVGElement.prototype.getTransformToElement = SVGElement.prototype.getTransformToElement || function(toElement) {
          return toElement.getScreenCTM().inverse().multiply(this.getScreenCTM());
      };
    </script>

    <script src="http://jointjs.com/js/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="http://jointjs.com/js/vendor/lodash/lodash.min.js"></script>
<script type="text/javascript" src="http://jointjs.com/js/vendor/backbone/backbone-min.js"></script>

    <body>
       <!--  <header class="simple-header">

    <div class="logo">
        <a href="http://jointjs.com">JointJS</a>
    </div>end logo

    <nav>
        <ul>
            <li ><a href="http://jointjs.com/download">Download</a></li>
            <li class="active"><a href="http://jointjs.com/demos">Demos</a></li>
            <li ><a href="http://jointjs.com/license">License</a></li>
            <li ><a href="http://jointjs.com/tutorial">Tutorials</a></li>
            <li ><a href="http://jointjs.com/docs">Documentation</a>
              <ul class="submenu">
                <li ><a href="http://jointjs.com/api">JointJS Core API</a></li>
                <li ><a href="http://jointjs.com/rappid/docs">Rappid API</a></li>
              </ul>
            </li>
            <li ><a href="http://jointjs.com/support">Support</a></li>
            <li ><a href="http://jointjs.com/faq">FAQ</a></li>
            <li ><a href="http://jointjs.com/about-rappid">Rappid</a></li>
        </ul>
    </nav>
</header> -->


        <main class="content layout_sidebar">
          <!-- <nav class="sidebar-container demos">
  <ul>
    <li><a href="http://jointjs.com/demos">Rappid Demos</a>
      <ul>
        <li><a class="rappid-example-app-icon" href="http://jointjs.com/rappid">Rappid Example App</a></li>
        <li><a class="charts" href="http://jointjs.com/demos/charts">Charts</a></li>
        <li><a class="business-process" href="http://jointjs.com/rappid/bpmn">Business Process Model and Notation</a></li>
        <li><a class="visualizer" href="http://jointjs.com/demos/javascript-ast">JavaScript AST visualizer</a></li>
        <li><a class="shortest-path" href="http://jointjs.com/demos/shortest-path">Shortest Path Finder</a></li>
        <li><a class="orgchart" href="http://jointjs.com/demos/orgchart">Orgchart</a></li>
        <li><a class="dialog-generator" href="http://jointjs.com/demos/qad">Dialog Generator</a></li>
      </ul>
    </li>
    <li><a href="http://jointjs.com/demos">Demos</a>
      <ul>
        <li><a class="finite-state-machines" href="http://jointjs.com/demos/fsa">Finite State Machines</a></li>
        <li><a class="organizational-charts" href="http://jointjs.com/demos/org">Organizational Charts</a></li>
        <li><a class="ER-Diagrams" href="http://jointjs.com/demos/erd">ER Diagrams</a></li>
        <li><a class="discrete-event-system-specification" href="http://jointjs.com/demos/devs">Discrete Event System Specification</a></li>
        <li><a class="chess" href="http://jointjs.com/demos/chess">Chess</a></li>
        <li><a class="petri-nets" href="http://jointjs.com/demos/pn">Petri Nets</a></li>
        <li><a class="links" href="http://jointjs.com/demos/links">Links</a></li>
        <li><a class="UML-class-diagrams" href="http://jointjs.com/demos/umlcd">UML Class Diagrams</a></li>
        <li><a class="UML-Statechart-Diagrams" href="http://jointjs.com/demos/umlsc">UML Statechart Diagrams</a></li>
        <li><a class="logic-circuits" href="http://jointjs.com/demos/logic">Logic Circuits</a></li>
        <li><a class="Smart-Routing" href="http://jointjs.com/demos/routing">Smart Routing</a></li>
        <li><a class="paper_attributes" href="http://jointjs.com/demos/paper">Paper Attributes</a></li>
      </ul>
    </li>
  </ul>

</nav> -->


          <section class="demos-container umlcd">

	<article>
	  <h2>Unified Modeling Language</h2>
	  <h3>The Class Diagram</h3>
	</article>

	<div class="example">
	  <div id="paper" class="paper"></div>
	  <!-- <a target="_blank" href="http://jointjs.com/js/demos/umlcd.js" title="source code">source code to this demo</a> -->
	  <!-- <pre data-src="http://jointjs.com/js/demos/umlcd.js" class="demo-source"></pre> -->

	</div><!--end example-->

        <link href="http://jointjs.com/css/jointjs/v0.9.5/joint.min.css" rel="stylesheet">
        <script type="text/javascript" src="http://jointjs.com/js/jointjs/v0.9.5/joint.min.js"></script>
        <script src="http://jointjs.com/js/demos/umlcd.js"></script>

</section>


        </main>

        <script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-5029684-2']);
    _gaq.push(['_setAllowLinker', true]);
    _gaq.push(['_trackPageview']);

    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
</script>


        <script src="http://jointjs.com/cms/scripts/main.js"></script>
        <link rel="stylesheet" href="http://jointjs.com/vendor/prism/prism.css">
        <script src="http://jointjs.com/vendor/prism/prism.js"></script>
    </body>
</html>
