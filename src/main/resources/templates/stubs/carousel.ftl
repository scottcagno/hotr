<div id="carousel" class="carousel slide" data-ride="carousel" data-pause="">
	<!--<ol class="carousel-indicators">
		<li data-target="#carousel" data-slide-to="0" class="active"></li>
		<li data-target="#carousel" data-slide-to="1"></li>
		<li data-target="#carousel" data-slide-to="2"></li>
		<li data-target="#carousel" data-slide-to="3"></li>
	</ol>-->
	<div class="carousel-inner">
		<div class="item active">
			<img src="/static/img/banner/1.jpg">
			<div class="container">
				<!--<div class="carousel-caption">
					<h1>It's Easy</h1>
					<p>We've organized everything. You watch, talk, and enjoy time together.</p>
				</div>-->
			</div>
		</div>
		<div class="item">
			<a href="${(auth?? && auth)?string('/secure/challenge', '/challenge')}">
				<img src="/static/img/banner/2.jpg">
			</a>
			<!--<div class="container">
				<div class="carousel-caption">
					<h1>Connect With Your Spouse</h1>
					<p>Through meaningful conversations that help you grow together.</p>
				</div>
			</div>-->
		</div>
		<div class="item">
			<a href="${(auth?? && auth)?string('/secure/video/all', '/video/all')}">
				<img src="/static/img/banner/3.jpg">
			</a>
			<!--<div class="container">
				<div class="carousel-caption">
					<h1>Rekinding Romance</h1>
					<p>Fan the flames of your passion and intimacy.</p>
				</div>
			</div>-->
		</div>
		<!--<div class="item">
			<img src="/static/img/banner/o.png" width="1500">
			&lt;!&ndash;<div class="container">
				<div class="carousel-caption">
					<h1>Monthly Marriage Enrichment Program</h1>
					<p>Keep you love alive and growing.</p>
				</div>
			</div>&ndash;&gt;
		</div>-->
	</div>
</div>