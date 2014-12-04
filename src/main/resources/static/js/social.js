// facebook
function fbShare() {
	FB.ui({
		method: 'feed',
		link: shareLink,
		picture: thumb,
		name: 'Fan The Flame Dates',
		caption: 'Challenge Accepted',
		description: message
	});
};

// google plus
window.___gcfg = {
	lang: 'en-US',
	parsetags: 'onload'
};

function vidShare() {
	FB.ui({
		method: 'feed',
		link: shareLink,
		picture: thumb,
		width: 480,
		height: 360,
        source : videoURL,
		name: 'Fan The Flame Dates',
		caption: 'New Video',
		description: 'We added a new Videos'
	});
};