$(document).on('turbolinks:load', function () {
  // alert('test')

  // nav bar dropdown jquery plugin
  $('.dropdown-button').dropdown()

  // session create modal box collapsible
  $('.collapsible').collapsible()

  // modal box jquery plugin
  $('.modal').modal()

  // select jquery plugin
  $('select').material_select()

  // on change listener on select pax to change amount
  $('select#booking_pax').change(function () {
    $amount = parseInt($('span#session_price').text()) * parseInt($('select#booking_pax').val())
    $('span#booking_amount').text($amount)
  })

  $('.carousel').carousel({
    dist: 0,
    shift: 0,
    padding: 20
  })

  $('.button-collapse').sideNav({

  })

  $('ul.tabs').tabs()

  $('.materialboxed').materialbox()

  // custom jquery function
  // favourite events
  $('.favourite')
  .on('ajax:error', function (e, data, status, xhr) {
    alert('FAILED')
  })
  .on('ajax:success', function (e, data, status, xhr) {
    if (data.favourite) {
      $(this).text('Unfavourite')
    } else if (data.favourite === false) {
      $(this).text('Favourite')
    }
  })

  // $('#favourite').on('submit', function (e)
  //   e.preventDefault()
  //   console.log(this)
  //   $.ajax({
  //     url: '/fav_events/create',
  //     type: 'POST'
  //   })
  //   .done(function (json) {
  //     $('#favourite').css('background-color', 'blue')
  //     alert(json)
  //   })
  //   .always(function (xhr, status) {
  //     alert('The request is complete!')
  //   })
  // })

})
