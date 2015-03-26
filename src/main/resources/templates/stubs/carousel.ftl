<div id="carousel" class="slide" data-ride="carousel" data-pause="5">
	<ol class="carousel-indicators">
		<li data-target="#carousel" data-slide-to="0" class="active"></li>
		<li data-target="#carousel" data-slide-to="1"></li>
		<li data-target="#carousel" data-slide-to="2"></li>
        <#if video??>
			<li data-target="#carousel" data-slide-to="3"></li>
        </#if>
	</ol>
	<div class="carousel-inner">
		<div class="item active">
			<div class="">
				<img src="/static/img/banner/1.jpg" class="img-responsive">
			</div>
		</div>
		<div class="item">
			<a href="/challenge">
				<div class="">
					<img src="/static/img/banner/2.jpg" class="img-responsive">
				</div>
			</a>
		</div>
		<div class="item">
			<a href="/video/all">
				<div class="">
					<img src="/static/img/banner/3.jpg" class="img-responsive">
				</div>
			</a>
		</div>
		<#if video??>
			<div class="item">
				<a href="/video/id/${video.id}">
					<div>
						<img src="${video.thumb}" class="img-responsive">
						<div class="middle">
							<i class="fa fa-play-circle fa-5x"></i>
						</div>
					</div>
				</a>
			</div>
		</#if>
	</div>
	<a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#carousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>