<div id="events" class="container information">
    <blockquote><h2>Events</h2></blockquote>
    <div class="row">
        <div class="col-lg-2 hidden-xs hidden-sm">
            <img src="/static/img/home/brucekaren.jpg" class="img-responsive">
        </div>
        <div class="col-lg-10">
            <h2>Dr. Bruce McCracken <span class="text-muted">and his wife Karen</span></h2>
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
    <div class="row container">
        <h1>Marriage Retreats</h1>
        <ul class="list-group">
            <#setting datetime_format="iso"/>
            <#list events as event>
                <li class="list-group-item">
                    <h4>
                        <strong>${event.name.text}</strong><br/>
                        ${event.venue.address.city}, ${event.venue.address.region}<br/>
                        ${(event.start.local?datetime)?date} - ${(event.end.local?datetime)?date}
                    </h4>
                    <#if event.capacity gt 0>
                        <p class="text-success">${event.capacity} Spots Open</p>
                        <p><a href="${event.url}" target="_blank">Sign Up</a></p>
                    <#else/>
                            <p class="text-danger">Sold Out</p>
                    </#if>
                </li>
            </#list>
        </ul>
    </div>
    <div class="row container">
        <h1>Marriage Intensives</h1>
        <ul class="list-group">
            <li class="list-group-item">
                <h4>
                    <strong>What is a “Fan the Flame Marriage Intensive”?</strong>
                </h4>
                <p class="text-muted">
                    Our marriage intensives are more than a couple’s weekend retreat. They are intimate personalized
                    coaching sessions designed to help you identify and address your specific needs. Our intensives
                    are more than a series of one hour counseling sessions. You will receive over 15 hours of
                    personalized counseling, coaching and marriage building exercises that will help “fan the flame”
                    of your marriage back to life.
                </p>
            </li>
            <li class="list-group-item">
                <h4>
                    <strong>Where are these intesives held?</strong>
                </h4>
                <p class="text-muted">
                    We want you to get away from the distractions and daily routines that complicate your life so you
                    can focus on yourselves and your marriage. You will be our guests in Lancaster, PA. we’ll provide
                    you with your own private room and bath and all of your linens, towels and meals.  Your job is to
                    get away … relax … and concentrate on yourselves and your marriage … our job is to focus on you.
                </p>
            </li>
            <li class="list-group-item">
                <h4>
                    <strong>Hew Hope and Beginning</strong>
                </h4>
                <p class="text-muted">
                    We’re here to tell you that God works miracles every day in the lives of couples and that He could
                    be preparing you for one right now!! House on the Rock Marriage Intensives are scheduled on an
                    as-needed basis due to the personal nature of the marriage situation.  Times are available either
                    during the week, or over a weekend.  Please call for pricing.  (717) 299-8969
                </p>
            </li>
        </ul>
    </div>
</div>