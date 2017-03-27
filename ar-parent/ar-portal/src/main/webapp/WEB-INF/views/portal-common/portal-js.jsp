<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="assets/js/jquery-1.11.1.min.js"></script>

<script type="text/javascript">
	$(function() {
		jQuery(".select2").select2({
			width : '100%',
			minimumResultsForSearch : -1
		});

		/* modal */
		$(".modal").click(function() {
			$('body').css({
				'margin-right' : '0px'
			});
		});

		/* center modal */
		function centerModals() {
			$('.modal').each(
					function(i) {
						var $clone = $(this).clone().css('display', 'block')
								.appendTo('body');
						var top = Math.round(($clone.height() - $clone.find(
								'.modal-content').height()) / 3);
						top = top > 0 ? top : 0;
						$clone.remove();
						$(this).find('.modal-content').css("margin-top", top);
					});
		}
		$('.modal').on('show.bs.modal', centerModals);
		setTimeout(function() {
			$(".goaway").fadeOut(1000);
		}, 2300);
		$(window).on('resize', centerModals);
	});
</script>

<!-- util js -->
<script type="text/javascript" src="assets/script/portal-common/util.js"></script>

<!-- common js -->
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/move-top.js"></script>
<script type="text/javascript" src="assets/js/easing.js"></script>
<script type="text/javascript" src="assets/js/megamenu.js"></script>
<script type="text/javascript" src="assets/js/simpleCart.min.js"></script>

<!-- Bracket1.5 -->
<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="assets/js/modernizr.min.js"></script>
<script src="assets/js/jquery.sparkline.min.js"></script>
<script src="assets/js/toggles.min.js"></script>
<script src="assets/js/retina.min.js"></script>
<script src="assets/js/jquery.cookies.js"></script>
<script src="assets/js/bootstrap-wizard.min.js"></script>
<script src="assets/js/select2.min.js"></script>
<script src="assets/js/jquery.validate.min.js"></script>
<script src="assets/js/custom.js"></script>

<script src="assets/js/fileinput.min.js"></script>
<script src="assets/js/fileinput_locale_zh.js"></script>
