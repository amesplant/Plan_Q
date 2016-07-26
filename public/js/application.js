$(document).ready(function() {

  // toggle the log-in and regsitration window
  $(".message a").on("click", function() {
    $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
  });

  $(".register-form").on("submit", function() {
    // stop the form from being submitted if I was called
    event.preventDefault();

    // capture the form so that we can extract the url(action) and method (get/post) and data from form
    var newUserForm = $(this);
    // where does the form get sent to?
    var url = $(this).attr("action");
    // get or post?
    var method = $(this).attr("method");
    // capture the data from the form
    var formData = newUserForm.serialize();

    $.ajax({
      url: url,
      method: method,
      data: formData
    })
    .done(function(response) {
      // capture the message that the route returns back once the call is made to it
      // expecting to get back @errors
      // send back as a JSON
      console.log(response);
    });

    console.log("submitting form");
  });

});
