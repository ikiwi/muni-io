// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks

$(document).ready(function() {
	$('#id_r_desc').change(function() {
		var id = $('#id_r_desc option:selected').val()-1;
		var routes = ['F','J','KT','L','M','N','NX','1','1AX','1BX','2','3','5','6',
					  '8X','8AX','8BX','9','9L','10','12','14','14L','14X','16X','17',
					  '18','19','21','22','23','24','27','28','28L','29','30','30X',
					  '31','31AX','31BX','33','35','36','37','38','38AX','38BX','38L',
					  '39','71','71L','76X','81X','82X','83X','88','90','91','108',
					  'K_OWL','L_OWL','M_OWL','N_OWL','', 'T_OWL', '59','60','61'];
		$('.first.inbound').text("inbound");
		$('.other.inbound').text("");
		$('.first.outbound').text("outbound");
		$('.other.outbound').text("");
		$('body').find('.schedule.inbound').find('li').removeClass('show');
		$('body').find('.schedule.outbound').find('li').removeClass('show');

        $.ajax({
            url: '/home/get_ob_items',
            type: 'GET',
            data: {
                route : routes[id],
            }
        }).done(function(data) {
        	var tmp = $('body').find('.stops.outbound').find('.' + routes[id])
			if (tmp.data('route')) {
				$('body').find('.stops.outbound').find('.' + routes[id]).addClass('show');
			} else {
	        	var route = $(data).find('.' + routes[id])
				var direction_id = route.data('direction');
				var stop_id = route.data('stop')
				var stop_desc = route.data('desc');

	        	$.each(route, function() {
	        		var stop_id = route.data('stop')
	        		var stop_desc = route.data('desc')
		        	var li = $('<li/>')
		    		.addClass(routes[id])
		    		.addClass('show')
		    		.attr('data-route', routes[id])
		    		.attr('data-direction', direction_id)
		    		.attr('data-stop', stop_id)
		    		.text(stop_desc)
		    		.appendTo($('.stops.outbound'))
		    		route = route.next()
	        	})
	        }
    	})

        $.ajax({
            url: '/home/get_ib_items',
            type: 'GET',
            data: {
                route : routes[id],
            }
        }).done(function(data) {
        	var tmp = $('body').find('.stops.inbound').find('.' + routes[id])
			if (tmp.data('route')) {
				$('body').find('.stops.inbound').find('.' + routes[id]).addClass('show');
			} else {
	        	var route = $(data).find('.' + routes[id])
				var direction_id = $(data).find('.' + routes[id]).data('direction');
				var stop_id = $(data).find('.' + routes[id]).data('stop');
				var stop_desc = $(data).find('.' + routes[id]).data('desc');

	        	$.each(route, function() {
	        		var stop_id = route.data('stop')
	        		var stop_desc = route.data('desc')
		        	var li = $('<li/>')
		    		.addClass(routes[id])
		    		.addClass('show')
		    		.attr('data-route', routes[id])
		    		.attr('data-direction', direction_id)
		    		.attr('data-stop', stop_id)
		    		.text(stop_desc)
		    		.appendTo($('.stops.inbound'))
		    		route = route.next()
	        	})
	        }
        })

		$('body').find('.schedule.inbound').find('.' + routes[id]).addClass('show');
		$('body').find('.schedule.outbound').find('.' + routes[id]).addClass('show');

	});

	$('li').on('click', function() {
		$(this).parent('ul').find('li').removeClass('selected');
		$(this).addClass('selected');
	});

	$('.outbound li').on('click', function() {
        $.ajax({
            url: '/home/show',
            type: 'GET',
            data: {
                route : $(this).data('route'), 
                direction : $(this).data('direction'),
                stop : $(this).data('stop')
            }
        }).done(function(data) {
			    var firstPred = $(data).filter('#first').text();
			    var otherPred = $(data).filter('#other').text();
			    if (firstPred.indexOf("no predictions") >= 0 || firstPred.indexOf("Arriving") >= 0)
				   	$('.first.outbound').text(firstPred);
				else if (firstPred > 1)
				   	$('.first.outbound').text(firstPred + "minutes");
				else
					$('.first.outbound').text(firstPred + "minute");
			    if (otherPred.indexOf("no other predictions") >= 0 || otherPred.indexOf("Arriving") >= 0)
				   	$('.other.outbound').text(otherPred);
				else if (firstPred > 1)
				   	$('.other.outbound').text("[alt routes" + otherPred + "minutes]");
				else
					$('.other.outbound').text("[alt routes" + otherPred + "minute]");
        })
	});

	$('.inbound li').on('click', function() {
        $.ajax({
            url: '/home/show',
            type: 'GET',
            data: {
                route : $(this).data('route'), 
                direction : $(this).data('direction'),
                stop : $(this).data('stop')
            }
        }).done(function(data) {
			    var firstPred = $(data).filter('#first').text();
			    var otherPred = $(data).filter('#other').text();
			    if (firstPred.indexOf("no predictions") >= 0 || firstPred.indexOf("Arriving") >= 0)
				   	$('.first.inbound').text(firstPred);
				else if (firstPred > 1)
				   	$('.first.inbound').text(firstPred + "minutes");
				else
					$('.first.inbound').text(firstPred + "minute");

			    if (otherPred.indexOf("no other predictions") >= 0 || otherPred.indexOf("Arriving") >= 0)
				   	$('.other.inbound').text(otherPred);
				else if (firstPred > 1)
				   	$('.other.inbound').text("[alt routes" + otherPred + "minutes]");
				else
					$('.other.inbound').text("[alt routes" + otherPred + "minute]");
        })
	});
//	$('#id_r_desc').change(function() {

//		$('option[value="1"]').on('selected', function() {
//			$('body').find('.schedule.inbound').find('.F').css('display', 'block');
//		});

//	});

});