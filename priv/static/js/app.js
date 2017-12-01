var closeBulmaAlerts = function () {
  $(".bulma-delete").on("click", function (){
    console.log("Closing bulma cautions!");
    $(".bulma-sign-errors").css("display", "none");
  });
};


window.startJSApp = function() {
  closeBulmaAlerts();
};