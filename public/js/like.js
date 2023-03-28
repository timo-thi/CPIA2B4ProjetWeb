$(document).ready(function() {
		$('#wish').click(function() {
				$.ajax({
						type: "POST",
						url: "../public/api.php",
						data: {'wish_id': 1},
						success: function() {
							let current = $('#wished').attr('class');
							if (current == 'fa-sharp fa-regular fa-heart') {
								$('#wished').removeClass('fa-sharp fa-regular fa-heart');
								$('#wished').addClass('fa-solid fa-heart');
							} else {
								$('#wished').removeClass('fa-solid fa-heart');
								$('#wished').addClass('fa-sharp fa-regular fa-heart');
							}
						}
				});
		});
});