<div id="events" class="container">
    <blockquote><h2>Marriage Retreats</h2></blockquote>
	<div class="row">
		<div class="col-lg-9">
    		<div class="row">
    	    	<div class="col-lg-4 hidden-xs hidden-sm">
    	    	    <img src="/static/img/home/brucekaren.jpg" class="img-responsive">
    	    	</div>
    	    	<div class="col-lg-7">
    	    	    <h2>Dr. Bruce McCracken <span class="text-muted"><br/>and his wife Karen</span></h2>
    	    	    <div class="col-xs-6 visible-xs-block visible-sm-block">
    	    	        <img src="/static/img/home/brucekaren.jpg" class="img-responsive">
    	    	    </div>
    	    	    <p class="lead">
    	    	        We explore varying topics throughout the year and invite you to join them on a
    	    	        destination weekend to laugh together, learn together and <em>FAN THE FLAME</em>
    	    	        of your marriage.
    	    	    </p>
    	    	    <em>
    	    	        “A long lasting marriage is built by two people who believe in, live by and work
    	    	        on the solemn promise they made.” – Darlene Schacht
    	    	    </em>
    	    	</div>
			</div>
			<div class="row">
				<h1>Marriage Retreats</h1>
				<ul class="list-group">
					<#setting datetime_format="iso"/>
					<#list events as event>
						<li class="list-group-item col-lg-12">
							<div class="col-lg-3">
								<h4>
									<img src="${event.logo.url}" class="img-responsive"/>
								</h4>
							</div>
							<div class="col-lg-6">
								<h4>
									<p><strong>${event.name.text}</strong></p>
									<p>
										${event.venue.address.city}, ${event.venue.address.region}<br/>
										${(event.start.local?datetime)?date} - ${(event.end.local?datetime)?date}
									</p>
								</h4>
								<p><a href="${event.url}" target="_blank">More Info</a></p>
							</div>
						</li>
					</#list>
				</ul>
			</div>
		</div>
		<div class="col-lg-3">
			<#if events?has_content>
				<br/>
				<div class="pull-right">
					<iframe src="http://www.eventbrite.com/calendar-widget?eid=${events[0].id}" frameborder="0" height="600" width="195" marginheight="0" marginwidth="0" scrolling="no" allowtransparency="true"></iframe>
				</div>
				<br/><br/><br/><br/>
			</#if>
		</div>
	</div>
</div>