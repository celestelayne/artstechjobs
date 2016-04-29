// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require masonry/jquery.masonry
//= require masonry/jquery.event-drag
//= require masonry/jquery.infinitescroll.min
//= require masonry/modernizr-transitions
//= require masonry/jquery.event-drag
//= require isotope/jquery.isotope
//= require_tree .

$(function(){
	console.log("this works");

	var $container = $('#masonry-container');

	// MASONRY GRID

	$container.masonry({
	  itemSelector: '.grid-item',
	  // set columnWidth a fraction of the container width
	  columnWidth: '.grid-sizer',
	  percentPosition: true,
	  gutterWidth: 5
	});

	// initialize isotope
	var $grid = $('.grid').isotope({
  	// options
  	itemSelector: '.grid-item',
  	layoutMode: 'fitRows',
  // 	transitionDuration: '2.0',
  // 	hiddenStyle: {
		//   opacity: 0
		// },
		// visibleStyle: {
		//   opacity: 1,
		//   transform: 'scale(1)'
		// },
		// filter: function(){
		// 		// console.log('Sanity Check: main.js is working!');
		// 		var anchor_tag = $(this).find('.grid-tags a');
		// 		var anchor_text = anchor_tag.text().toLowerCase();
		// 		var tagname = anchor_text.replace(/\s/g, '');
		// 		console.log(tagname)
		// 		return tagname;
		// 	}
		getSortData: {
	    item_tag: function( itemTag ) { // function
	      var tagname = $(itemTag).find('.grid-tags a');
	      // var anchor_text = anchor_tag.text().toLowerCase();
	      // var tagname = anchor_text.replace(/\s/g, '');
	      // console.log(tagname)
	     	// var grid_item = $(itemTag);
	     	// console.log(itemTag)
				// grid_item.attr('data-sort-value',tagname);
	      return tagname;
	    }
	  }
	  // sortBy : 'item_tag',
 	 //  masonry: {
   //  columnWidth: '.grid-sizer'
	  // }
	});

	// bind filter on select change
	$('#Job_Function').on( 'change', function() {
		// get filter value from option value
		var filterValue = this.value;
		console.log("The selected input is... " + filterValue);
		$grid.isotope({ filter: filterValue });
	});

	
	// MASONRY INFINITE SCROLLING

  $container.infinitescroll({
  	navSelector  : 'nav.pagination',
  	nextSelector : 'nav.pagination a[rel=next]',
  	itemSelector : '.job',
  	behavior: 'local',
  	debug        : true,
  	loading: {
        finishedMsg: 'No more pages to load.',
        img: 'http://i.imgur.com/6RMhx.gif'
      }
  },
  	function( newElements ) {
  		// console.log(newElements);
  		var $newElems = $( newElements ).css({ opacity: 0 });
  		$newElems.animate({ opacity: 1 });
  		$container.isotope( 'appended', $newElems );
  	}
	);

});