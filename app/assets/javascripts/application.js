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
	$('body').find('.schedule.inbound').find('.F').addClass('show');
	$('body').find('.schedule.outbound').find('.F').addClass('show');

	$('#id_r_desc').change(function() {
		$('#first').text("select");
		$('#other').text("stop");
		var id = $('#id_r_desc option:selected').val();
			$('body').find('.schedule.inbound').find('li').removeClass('show');
			$('body').find('.schedule.outbound').find('li').removeClass('show');
		if (id == "1") {
			$('body').find('.schedule.inbound').find('.F').addClass('show');
			$('body').find('.schedule.outbound').find('.F').addClass('show');
		} else if (id == "2") {
			$('body').find('.schedule.inbound').find('.J').addClass('show');
			$('body').find('.schedule.outbound').find('.J').addClass('show');
		}
	});

	$('li').on('click', function() {
		var route = $(this).data('route');
		var direction = $(this).data('direction');
		var stop = $(this).data('stop');

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
			    if (firstPred.indexOf("no predictions") >= 0)
				   	$('#first').text(firstPred);
				else if (firstPred > 1)
				   	$('#first').text(firstPred + "minutes");
				else
					$('#first').text(firstPred + "minute");
			    if (otherPred.indexOf("no other predictions") >= 0)
				   	$('#other').text(otherPred);
				else if (firstPred > 1)
				   	$('#other').text(otherPred + "minutes");
				else
					$('#other').text(otherPred + "minute");
        })
	});

//	$('#id_r_desc').change(function() {

//		$('option[value="1"]').on('selected', function() {
//			$('body').find('.schedule.inbound').find('.F').css('display', 'block');
//		});

//	});

});