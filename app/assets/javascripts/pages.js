$(document).on('turbolinks:load', function(){
  // alert('test')
  $('.dropdown-button').dropdown()

  $('.carousel').carousel({
            dist:0,
            shift:0,
            padding:20,
  })

  $('.modal').modal();
  $(".button-collapse").sideNav({

  });
  $('.collapsible').collapsible()

})
