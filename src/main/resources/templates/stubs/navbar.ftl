<div class="fixedmenu">
	<div class="container">
		<div class="row">
			<a class="navbar-brand" href="/home">
				<img src="/static/asher/img/logo.png" alt="">
			</a>
			<nav class="navbar pull-right" role="navigation">
				<div class="collapse navbar-collapse">
					<ul id="main-menu" class="nav navbar-nav">
						<!--
						<li class="dropdown">
							<a data-target="#" href="#">
								Videos <i class="fa fa-angle-down menucaret">
						</i>
						</a>
							<ul class="dropdown-menu">
								<li><a href="services">All</a></li>
								<li><a href="about-us">Popular</a></li>
								<li><a href="knowledge-base">Recently Added</a></li>
								<li><a href="testimonials">Series</a></li>
								<li class="dropdown"><a href="#">Level Menu</a>
									<ul class="dropdown-menu">
										<li><a href="#">Some Item</a></li>
										<li><a href="#">Another Item</a></li>
										<li><a href="#">More Items</a></li>
									</ul>
								</li>
							</ul>
						</li>
						-->
						<li>
							<a href="/video">Videos</a>
						</li>
						<li>
							<a href="/about">About</a>
						</li>
						<li>
							<a href="/contact">Contact</a>
						</li>
						<li>
							<a href="/secure/user">${(auth)?string('Account', 'Login')}</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/events">Retreats</a></li>
								<li><a href="/intensives">Marriage<br/>Intensives</a></li>
								<li><a href="/devotional">Weekly Marriage<br/>Devotional</a></li>
								<li><a href="/donate">Donate</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</div>