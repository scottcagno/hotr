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
}

// google plus
window.___gcfg = {
	lang: 'en-US',
	parsetags: 'onload'
};