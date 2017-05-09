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
  $('select#booking_pax').on('change', function (e) {
    $amount = parseInt($('span#session_price').text()) * parseInt($('select#booking_pax').val())
    $('span#booking_amount').text($amount)
  })

  // on change listener on category select to send ajax request
  $('select#event_category_id').on('change', function (e) {
    console.log($(this).val())
    $.ajax({
      url: '/filter_events',
      data: {
        category_id: $(this).val()
      },
      type: 'GET'
    })
  })

  $('#autocomplete').on('keyup', function (e) {
    console.log($(this).val())

    if ($(this).val().length === 0) {
      $('div#search-item-list').empty()
    } else if ($(this).val().length >= 3 && e.key !== 'Enter') {
      console.log('ajax without enter key')
      $.ajax({
        url: '/search_events',
        data: {
          search_input: $(this).val()
        }
      })
    } else if ($(this).val().length >= 3 && e.key === 'Enter') {
      console.log('ajax with enter key')
      $('div#search-item-list').empty()
      $.ajax({
        url: '/search_enter_events',
        data: {
          search_input: $(this).val()
        }
      }).done(function (res) {
        $('#autocomplete').val('')
      })
    }
  })

  // $('#autocomplete').on('keyup', function (e) {
  //   if (e.key === 'Enter') {
  //     console.log(e.key)
  //     $('div#search-item-list').empty()
  //     $.ajax({
  //       url: '/search_events',
  //       data: {
  //         enter: true,
  //         search_input: $(this).val()
  //       }
  //     })
  //   }
  // })

  // $('#autocomplete').on('keypress', function (e) {
  //   console.log($(this).val())
  //   $.ajax({
  //     url: '/search_events',
  //     data: {
  //       search_input: $(this).val()
  //     },
  //     type: 'GET',
  //     dataType: 'json'
  //   })
  //   .done(function (response) {
  //     console.log(response.data)
  //
  //   })
  // })

  // search bar autocomplete jquery-ui
//   $('input#autocomplete').autocomplete({
//   source: '/search_events',
//   minLength: 3,
//   select: function (event, ui) {
//     console.log('autocomplete working')
//     // window.location.href = '/patient/' + ui.item.value
//   }
// })


  // $('select#event_category_id').on('change', function (e) {
  //   console.log($(this).val())
  //   $.ajax({
  //     url: '/filter_events',
  //     data: {
  //       category_id: $(this).val()
  //     },
  //     type: 'GET'
  //   }).always(function (xhr, status) {
  //     alert('Request sent!')
  //   }).done(function (json) {
  //     console.log(json.data)
  //     // $('div#event-list').html("<%= escape_javascript(render partial: 'events/event', collection: @filtered) %>")
  //   })
  // })


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
