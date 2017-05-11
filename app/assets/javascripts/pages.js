$(document).on('turbolinks:load', function () {
  // tooltip
  $('.tooltipped').tooltip({delay: 50})

  // nav bar dropdown jquery plugin
  $('.dropdown-button').dropdown()

  // session create modal box collapsible
  $('.collapsible').collapsible()

  // modal box jquery plugin
  $('.modal').modal()

  // select jquery plugin
  $('select').material_select()

  // back to top scroll
  $('#tpBtn').click(function(){
    $("body, html").animate({
    scrollTop: $("body").position().top
},500)
  })

  // on change listener on select pax to change amount
  $('select#booking_pax').on('change', function (e) {
    $amount = parseInt($('span#session_price').text()) * parseInt($('select#booking_pax').val())
    $('span#booking_amount').text($amount)
  })

  // category filter on events index
  $('select#event_category_id').on('change', function (e) {
    console.log($(this).val())
    $.ajax({
      url: '/filter_events',
      data: {
        category_id: $(this).val()
      },
      type: 'POST'
    })
  })
  // category filter on crafters index
  $('select#crafter_category_id').on('change', function (e) {
    console.log($(this).val())
    $.ajax({
      url: '/filter_crafters',
      data: {
        category_id: $(this).val()
      },
      type: 'GET'
    })
  })
  // keyup listener on search bar to send ajax request
  $('#autocomplete-events').on('keyup', function (e) {
    if ($(this).val().length === 0) {
      $('div.search-item-list').empty()
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
      $.ajax({
        url: '/search_enter_events',
        data: {
          search_input: $(this).val()
        }
      }).done(function (res) {
        $('#autocomplete-events').val('')
        $('div.search-item-list').empty()
      })
    }
  })

  $('#autocomplete-crafters').on('keyup', function (e) {
    if ($(this).val().length === 0) {
      $('div.search-item-list').empty()
    } else if ($(this).val().length >= 3 && e.key !== 'Enter') {
      console.log('ajax without enter key')
      $.ajax({
        url: '/search_crafters',
        data: {
          search_input: $(this).val()
        }
      })
    } else if ($(this).val().length >= 3 && e.key === 'Enter') {
      console.log('ajax with enter key')
      $.ajax({
        url: '/search_enter_crafters',
        data: {
          search_input: $(this).val()
        }
      }).done(function (res) {
        $('#autocomplete-crafters').val('')
        $('div.search-item-list').empty()
      })
    }
  })
  // to close search populated list if outside of element is clicked
  $(document).on('click', function (event) {
    if (!$(event.target).closest('.search-events').length) {
      $('div.search-item-list').empty()
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

    $('#carouselPrevButton').click(function() {
        $('.carousel').carousel('prev');
    });

    $('#carouselNextButton').click(function() {
        $('.carousel').carousel('next');
    });



    $('#carouselPrevButton').hover(
      function(){$(this).css('background-color', 'tomato');
      },
      function(){$(this).css('background-color', 'white');
    })

  $('#carouselNextButton').hover(
    function(){$(this).css('background-color', 'tomato');
    },
    function(){$(this).css('background-color', 'white');
  })


  $('.button-collapse').sideNav({

  })

  $('ul.tabs').tabs()

  $('.materialboxed').materialbox()

  // custom jquery function
  // favourite events
  $('.favourite')
  .on('ajax:success', function (e, data, status, xhr) {
    if (data.favourite) {
      $(this)
      .html('<i class="small material-icons">favorite</i>')
    } else if (data.favourite === false) {
      $(this).html('<i class="small material-icons">favorite_border</i>')
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
