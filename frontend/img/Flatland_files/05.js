//when document is ready do the following...
// Creates a link or something for each anchor in a document
$(function() {
	$('.chapter a').attr({
		'rel':'external',
		'title': function(index,oV) {
			return 'Learn more about '+$(this).text()+' at Wiki';
		},
		'id': function(index,oV) {
			return 'wikilink-'+index;
		}
	});

	var newElem = $('<a href="#top"> back to top</a>');

	$('.chapter p').after(newElem);

	$('.footnote').insertBefore('#footer')
	.wrapAll('<ol id="notes">Footnotes</ol>')
	.wrap('<li></li>')
	;

});

