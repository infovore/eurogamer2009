try{Typekit.load();}catch(e){}

$(document).ready(function() {
  $(".explanation").hide();
  $("p.explanation-link a").click(function() {
    $(this).hide();
    $(".explanation").fadeIn();
    return false;
  });
});