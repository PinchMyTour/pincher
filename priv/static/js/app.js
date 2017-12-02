var closeBulmaAlerts = function () {
  $(".bulma-delete").on("click", function (){
    console.log("Closing bulma cautions!");
    $(".bulma-sign-errors").css("display", "none");
  });
};

var pinchMeClicked = function () {
  $(".pinch-me").on("click", function () {
    console.log("Pinch clicked... Saving location.")
    $(this).css("background", "#5b97f7");
  });
};

window.startJSApp = function() {
  closeBulmaAlerts();
  pinchMeClicked();
};