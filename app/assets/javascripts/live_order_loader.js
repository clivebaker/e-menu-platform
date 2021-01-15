// Live Order Loader dismiss
$(document).ready(function () {
 $("#loader-status").hide(0).delay(850).show(0);
 $("#live-order-overlay").addClass("active");
 $(".progress-bar").animate(
  {
   width: "100%",
  },
  500
 );
 $("#dismiss-loader").on("click", function () {
  // hide loader
  $("#order-loader").addClass("hidden");
  // hide overlay
  $("#live-order-overlay").removeClass("active");
 });
});
