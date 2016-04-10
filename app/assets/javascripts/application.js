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
//= require_tree .

$(window).load( function(){
	
	// console.log('Sanity Check: main.js is working!');
	

	function checkStatus() {
		console.log('Sanity Check: main.js is working!');
		var jobCard = $('.job');
		var check = $('.grid-item');
		if (check == null) {
			setTimeout("checkStatus()", 100);
		} else {
			var gridTagNames = $('.grid-tags > a');
			for ( var i = 0; i < gridTagNames.length; i++){
				var gridTag = gridTagNames[i].text;
				// var gridTagLowerCase = gridTag.split(' ').join('').toLowerCase();
				console.log(i, gridTag)
			}
			for ( var i = 0; i < jobCard.length; i++){
				jobCard.addClass(gridTag);
			}
			
			// console.log(gridTagLowerCase)
			// console.log(check)
		}

	}

	$('.grid').isotope({
	  // options
	  itemSelector: '.grid-item',
	  layoutMode: 'fitRows'
	});

	$('#city-select').on('change', function(){
		var jobFunction = $('#Job_Function').val().toLowerCase();

		$('.grid').isotope({ filter: filterValue });
	});

	checkStatus();
});