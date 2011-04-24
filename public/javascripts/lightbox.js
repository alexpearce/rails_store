/*
 * Lightbox for AlexPearce.me
 * 
 * @version 0.1
 *
 * @author Alex Pearce <alex [at] alexpearce [dot] me>
 *
 * @license http://creativecommons.org/licenses/by-sa/3.0/
 *
 * @usage
 *   if ($('html.ie6').length === 0) lightbox.init($('a:has(img)'));
 *
 * @comments I try to use 'pure' JS when applicable here, but trying
 * things likes animations and complex selectors is pointless when
 * jQuery offers such compatibility and scope.
*/
var lightbox = {
	
	// lightbox container
	$overlay: null,
	
	// the anchor that was clicked to open the lightbox
	$anchor: null,
	
	// group of elements with the same rel attribute
	relGroup: null,
	
	// is the browser IE? won't work without the html tag trick
	isIE: null,
	
	// accepts a selector that, when clicked, shows the lightbox
	init: function(selector) {
	  
	  // only setup the overlay if we haven't already
	  if (this.$overlay === null) {
	    // shortcut to the body tag
  		var bd = document.body;

      // create the lightbox fragment
  	  var lb = '';
  	  lb += '<div class="png_bg" id="lightbox">';
  	  lb +=   '<div class="png_bg" id="lightboxClose"></div>';
  	  lb +=   '<div class="png_bg" id="lightboxNext"></div>';
  	  lb +=   '<div class="png_bg" id="lightboxPrev"></div>';
  	  lb +=   '<div id="lightboxImg"><img></div><p></p>';
  	  lb += '</div>';

  		// http://stackoverflow.com/questions/814564/inserting-html-elements-with-javascript
  		var fragment = document.createDocumentFragment();
  		var temp = document.createElement('div');
  		temp.innerHTML = lb;
  		while (temp.firstChild) {
  		  fragment.appendChild(temp.firstChild);
  		}

  		// append the fragment to the inside of the body, at the top
  		bd.insertBefore(fragment, bd.childNodes[0]);

  		// we've got the overlay now, so assign some properties		
  		var overlay = document.getElementById('lightbox');
  		this.$overlay = $(overlay);

  		// close the lightbox when..
  	  overlay.onclick = function(event) {
  		  // only close if the lightbox itself is clicked

  		  // http://annevankesteren.nl/2005/07/dom-3-events
  		  if (!event) event = window.event;
  		  var target = event.target ? event.target : event.srcElement;

  			switch(target.id) {
  				case 'lightbox':
  					lightbox.close();
  					break;
  				case 'lightboxClose':
  					lightbox.close();
  					break;
  				case 'lightboxNext':
  					lightbox.next();
  					break;
  				case 'lightboxPrev':
  					lightbox.prev();
  					break;
  				default:
  					break;
  			}
  		};

  		bd.onkeydown = function(event) {
  		  // right arrow
  		  if (event.keyCode === 39) lightbox.next();
  		  // left arrow
  			if (event.keyCode === 37) lightbox.prev();
  			// esc || x
  			if (event.keyCode === 27 || event.keyCode === 88) lightbox.close();
  		};

  		// check for IE
  		lightbox._isIE();
  		
  	}

		// activate the lightbox when the selector is clicked
		// using jQuery here allows complex selectors
		selector.click(function(event) {
			lightbox.open(event);
		});
		
	},
	
	open: function(event) {
		// stop the browser following the link
		event.preventDefault();

		// get the the link that was clicked
		this.$anchor = $(event.currentTarget);
		
		var rel = event.currentTarget.rel;
		
		// anchor belongs to a group
		if (rel) this.$relGroup = $('a[rel=' + rel +']');
		
		// if there's more than one anchor in the rel group, show the next/prev buttons
		var disp = '';
		if (this.$relGroup.length !== 1) {
		  disp = '';
		} else {
		  disp = 'none';
		}
		document.getElementById('lightboxNext').style.display = disp;
	  document.getElementById('lightboxPrev').style.display = disp;
		
		lightbox.$overlay.fadeIn('200', function() {
		  $(this).show();
		});

		this.displayImage();
	},
	
	displayImage: function() {
		
		// cache the blurb and image element
		var $p = this.$overlay.find('p');
		
		// get the DOM element, rather the jQuery object
		var img = this.$overlay.find('img')[0];
		var $imgContainer = $('#lightboxImg');
		
		// hide the blurb and image container
		$p.hide();
		
		if (this.isIE === true) {
		  $imgContainer.css('visibility', 'hidden');
		} else {
		  $imgContainer.hide();
		}
		
		$(img).removeAttr('src').removeAttr('width').removeAttr('height');
		
		// bind the image onload to a function
		img.onload = function() {
		
			// figure out the scale factor
			var maxY = $(window).height() - 200;
			var maxX = $(window).width() - 75;
			var imgY = this.height;
			var imgX = this.width;
			var scale = Math.min(maxY/imgY, maxX/imgX, 1);
			
			// resize and position the image
		  this.height = imgY * scale;
		  this.width = imgX * scale;
		  $(this).css({
		    'marginTop' : (imgY * scale) / -2,
		    'marginLeft' : (imgX * scale) / -2
		  });
			
			if (lightbox.isIE === true) {
			  $imgContainer.css('visibility', 'visible');
			} else {
			  $imgContainer.fadeIn();
			}

			var title = lightbox.$anchor.attr('title');
			$p.text(title).fadeIn('200');
		};
		
		// assign the href of the clicked anchor to the src of the image
		img.src = this.$anchor.attr('href');	
	},
	
	next: function() {
		if (!this.$relGroup) return;
		var idx = this.$relGroup.index(this.$anchor);
		// if the current image is the last in the group,
		// we'll need to cycle back to the first
		if (idx === (this.$relGroup.length - 1)) idx = 0;
		else idx += 1;
		this.$anchor = $(this.$relGroup[idx]);
		this.displayImage();
	},
	
	prev: function() {
		if (!this.$relGroup) return;
		var idx = this.$relGroup.index(this.$anchor);
		// if the current image is the first in the group,
		// we'll need to cycle forward to the first
		if (idx === 0) idx = this.$relGroup.length - 1;
		else idx -= 1;
		this.$anchor = $(this.$relGroup[idx]);
		this.displayImage();
	},
	
	close: function() {
		this.$overlay.fadeOut('200');
		this.relGroup = null;
	},
	
	_isIE: function() {
	  var ie6 = $('html.ie6');
	  var ie7 = $('html.ie7');
	  var ie8 = $('html.ie8');
	  this.isIE = (ie8.length !== 0 || ie7.length !== 0 || ie6.length !== 0) ? true : false;
	}

};