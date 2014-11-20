<div class="container">
    <hr/>
	<footer>
        <span class="pull-left">
            <i class="fa fa-copyright"></i> 2014 Fan The Flame
        </span>
        <span class="pull-right">
            <a href="${(auth?? && auth)?string('/secure/donate', '/donate')}">Donate</a> |
            <a href="${(auth?? && auth)?string('/secure/terms', '/terms')}">Terms</a>
        </span>
	</footer>
</div>
