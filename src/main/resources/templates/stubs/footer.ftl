<#import "global.ftl" as glob/>
<#assign caption = 'Fan the Flame Dates'/>
<#assign message = 'Grow your marriage with Fan the Flame Dates'/>
<#assign shareLink = glob.host/>
<div class="container">
    <hr/>
	<footer>
        <span class="pull-left text-white">
            <i class="fa fa-copyright"></i> 2015 Fan The Flame
        </span>
        <span class="pull-right">
            <a href="#" onclick="fbShare()"><i class="fa fa-facebook"></i></a>
			<a href="#">
				<span
					class="g-interactivepost"
					data-contenturl="${shareLink}"
					data-clientid="472352253568-brmvt0cpld8fua3qlbj4ssdj6s3ak70c.apps.googleusercontent.com"
					data-cookiepolicy="single_host_origin"
					data-prefilltext="${message}"
					data-calltoactionlabel="VISIT"
					data-calltoactionurl="${shareLink}"
					data-calltoactiondeeplinkid="/pages/create">
					<i class="fa fa-google-plus"></i>
				</span>
			</a>
			<a href="https://twitter.com/share?url=${shareLink}&text=${message}&count=none"
			   onclick="window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;"	>
				<i class="fa fa-twitter"></i>
			</a>
			&nbsp;|&nbsp;
            <a href="/donate">Donate</a>&nbsp;|&nbsp;
            <a href="/terms">Terms</a>
        </span>
	</footer>
</div>

<script src="https://apis.google.com/js/client:platform.js" async defer></script>
<script>
// facebook
function fbShare() {
	FB.ui({
		method: 'feed',
		link: '${shareLink}',
		name: 'Fan The Flame Dates',
		caption: '${caption}',
		description: '${message}'
	});
};

// google plus
window.___gcfg = {
	lang: 'en-US',
	parsetags: 'onload'
};
</script>
