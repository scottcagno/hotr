<div id="carousel" class="slide" data-ride="carousel" data-pause="5">
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
</div>