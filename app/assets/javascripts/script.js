// event delegation (.live)
//

// $(document).on('ajaxSuccess', '#calendar', function (e) {
//   console.log($('td'));
//   $('td').forEach(function(item) {
//     item.text().replace(/[\n\s(\d*-\d\d-)]/g, '')
//
//   })
//   console.log($('td').text());
//
// })

$(document).on('click', 'td', function (e) {
  if (!$(e.currentTarget).text().match(/No more available slots/) && $(e.currentTarget).text().match(/Book/)) {
    $('.day').css({'background-color': ''})
    // var bookDate = $(e.currentTarget)
    // .clone()    // clone the element
    // .children() // select all the children
    // .remove()   // remove all the children
    // .end()  // again go back to selected element
    // .text()
    // .replace(/[\n\s]/g, '')

    $(e.currentTarget).css('background-color', 'yellow')
    // $(e.currentTarget).attr('data-remote', true)
    // window.location = $(e.currentTarget).find("a").attr("href");
    // return false;

    // $('.booking_date_input').val(bookDate)
    $('#booking-form').show()
  }

})

$(document).on('mouseover', 'a', function (e) {
  if ($(e.currentTarget).text().match(/Next/) || $(e.currentTarget).text().match(/Previous/)) {
    $(e.currentTarget).attr('data-remote', true)

  }
})

$(document).on('click', '.fac-types', function (e) {
  $('#booking-form').empty()
})

$(document).on('click', '.btn-submit', function (e) {
  $('#booking-form').hide()
  $('.day').css({'background-color': ''})
})
