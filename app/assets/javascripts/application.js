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


  if ($('#card-element').length > 0) {
    var stripe = Stripe('pk_test_JiTB1PCW3WRsvRTDbQePyQ3D');
    var elements = stripe.elements();
    var card = elements.create('card');
    card.mount('#card-element');

    function setOutcome(result) {
      var errorElement = document.querySelector('.error');
      errorElement.classList.add('hidden')

      if (result.token) {
        var tokenInput = document.querySelector('#one_off_payment_token');
        tokenInput.value = result.token.id;
      } else if (result.error) {
        errorElement.textContent = result.error.message;
        errorElement.classList.remove('hidden')
      }
    }

    card.on('change', function(event) {
      setOutcome(event);
    });

    document.querySelector('form').addEventListener('submit', function(e) {
      var form = document.querySelector('form');
      stripe.createToken(card).then(setOutcome);
      var tokenInput = document.querySelector('#one_off_payment_token');
      if (tokenInput.value === '') {
        e.preventDefault();
      }
    });
  }
});
