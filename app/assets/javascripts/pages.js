$(document).on('turbolinks:load', function(){
  // alert('test')

  // nav bar dropdown jquery plugin
  $('.dropdown-button').dropdown()

  // session create modal box collapsible
  $('.collapsible').collapsible()

  // modal box jquery plugin
  $('.modal').modal()
  // var $navUser = $('ul#dropdown1 li a')

  $('.carousel').carousel({
            dist:0,
            shift:0,
            padding:20,
  })

  $(".button-collapse").sideNav({

  });
  $('.collapsible').collapsible()

})
