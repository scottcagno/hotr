<div id="carousel" class="carousel slide" data-ride="carousel" data-pause="">
	<div class="carousel-inner">
		<div class="item active">
			<img src="/static/img/banner/1.jpg">
			<div class="container">
			</div>
		</div>
		<div class="item">
			<a href="${(auth?? && auth)?string('/secure/challenge', '/challenge')}">
				<img src="/static/img/banner/2.jpg">
			</a>
		</div>
		<div class="item">
			<a href="${(auth?? && auth)?string('/secure/video/all', '/video/all')}">
				<img src="/static/img/banner/3.jpg">
			</a>
		</div>
	</div>
	<span class="left carousel-control"></span>
	<span class="right carousel-control"></span>
</div>