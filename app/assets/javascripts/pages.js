$(document).on('turbolinks:load', function() {
  // alert('test')

  // nav bar dropdown jquery plugin
  $('.dropdown-button').dropdown()

  // session create modal box collapsible
  $('.collapsible').collapsible()

  // modal box jquery plugin
  $('.modal').modal()

  // select jquery plugin
  $('select').material_select();

  // on change listener on select pax to change amount
  $('select#booking_pax').change(function() {
    $amount = parseInt($('span#session_price').text()) * parseInt($('select#booking_pax').val())
    $('span#booking_amount').text($amount)
})

  $('.carousel').carousel({
    dist: 0,
    shift: 0,
    padding: 20,
  })

  $(".button-collapse").sideNav({

  });
  $('.collapsible').collapsible()

  $('select').material_select();

   $('ul.tabs').tabs();

   $('.materialboxed').materialbox();

   


})
