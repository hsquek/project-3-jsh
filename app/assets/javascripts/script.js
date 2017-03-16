// event delegation (.live)

// toggle calendar indicator
$(document).on('click', 'td > a', function (e) {
  if (!$(e.currentTarget).text().match(/No more available slots/) && ($(e.currentTarget).text().match(/Book/)) ||  $(e.currentTarget).text().match(/Invite/)) {
    $('.day').css({'background-color': ''})
    // var bookDate = $(e.currentTarget)
    // .clone()    // clone the element
    // .children() // select all the children
    // .remove()   // remove all the children
    // .end()  // again go back to selected element
    // .text()
    // .replace(/[\n\s]/g, '')

    $(e.currentTarget).parent().css('background-color', 'yellow')
  }
})

// AJAX renders on toggle of calendar months
$(document).on('mouseover', 'a', function (e) {
  if ($(e.currentTarget).text().match(/Next/) || $(e.currentTarget).text().match(/Previous/)) {
    $(e.currentTarget).attr('data-remote', true)
  }
})

// hide form on toggle of facility types
$(document).on('click', '.fac-types', function (e) {
  $('#booking-form').empty()
})

// hide form and reset calendar indicator on form submit
$(document).on('click', '.btn-submit', function (e) {
  $('#booking-form').hide()
  $('.day').css({'background-color': ''})
})

// show form again
$(document).on('click', 'td > a', function () {
  $('#booking-form').show()
})
