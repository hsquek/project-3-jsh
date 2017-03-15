// event delegation (.live)
//
// $(document).on('click', 'td', function (e) {
//   if (!$(e.currentTarget).text().match(/No more available slots/)) {
//     $('.day').css({'background-color': ''})
//     var bookDate = $(e.currentTarget)
//     .clone()    // clone the element
//     .children() // select all the children
//     .remove()   // remove all the children
//     .end()  // again go back to selected element
//     .text()
//     .replace(/[\n\s]/g, '')
//
//     $(e.currentTarget).css('background-color', 'yellow')
//
//     $('.booking_date_input').val(bookDate)
//   }
//
// })

$(document).on('mouseover', 'a', function (e) {
  if ($(e.currentTarget).text().match(/Next/) || $(e.currentTarget).text().match(/Previous/)) {
    $(e.currentTarget).attr('data-remote', true)
  }
})
