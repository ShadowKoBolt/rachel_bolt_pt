//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require_tree .


document.addEventListener("turbolinks:load", function() {
  var changeCatchupContactInput = function() {
    if ($('#user_catchup_contact').val() === 'Skype') {
      $('[data-js-id="skype-username"]').removeClass('hidden');
    }
    else {
      $('[data-js-id="skype-username"]').addClass('hidden');
    }
  }

  $('#user_catchup_contact').change(changeCatchupContactInput);
  changeCatchupContactInput();
});
