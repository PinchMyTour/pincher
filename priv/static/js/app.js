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
    getCurrentLatLong();
  });
};

function showPosition(position) {
  var lat = position.coords.latitude;
  var lng = position.coords.longitude;
  console.log(lat);
  console.log(lng);
}

var getCurrentLatLong = function () {
  navigator.geolocation.getCurrentPosition(showPosition);
}

var alertTriggers = function () {
  $(".alert").alert();
};

window.startJSApp = function() {
  closeBulmaAlerts();
  // alertTriggers();
  pinchMeClicked();
};
