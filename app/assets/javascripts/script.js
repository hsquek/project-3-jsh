// event delegation (.live)
var selected
var previous
$(document).on('click', 'td', function (e) {
  $('.day').css({'background-color': ''})
  var book_date = $(e.currentTarget)
                      .clone()    // clone the element
                      .children() // select all the children
                      .remove()   // remove all the children
                      .end()  // again go back to selected element
                      .text()
                      .replace(/[\n\s]/g, '')

  $(e.currentTarget).css('background-color', 'yellow')

  $('#booking_booking_date').val(book_date)
  previous = $(e.currentTarget)
})
