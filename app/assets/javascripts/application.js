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
//= require bootstrap-sprockets
//= require moment
//= require forem
//= require_tree .



(function(){

  var parallax = document.querySelectorAll(".parallax"),
  speed = 0.5;

  window.onscroll = function(){
    [].slice.call(parallax).forEach(function(el,i){

      var windowYOffset = window.pageYOffset,
      elBackgrounPos = "50% " + (windowYOffset * speed) + "px";

      el.style.backgroundPosition = elBackgrounPos;

    });
  };
})();

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$('.left').click(function() {
  $('.carousel').carousel('right');
});

$('.right').click(function() {
  $('.carousel').carousel('left');
});

$(function() {
  $('.carousel').each(function() {
    $(this).carousel({
      interval: false
    });
  });
});


// Smooth scroll
// $('.inner-link').smoothScroll({offset: -96, speed: 800});
