(function($, undefined) {

  var igfSession;
  var $document = $(document);

  $.igfSession = igfSession = {
    session: ".js-igf-session",
    buttons: ".js-form-button",
    signupForm: ".js-signup-form",
    loginForm: ".js-login-form",
    message: ".js-session-message",

    signupSuccess: function(user) {
      igfSession.login();
    },

    signupFailure: function(errors) {
      $(igfSession.signupForm).find(igfSession.message).html(errors).stop().fadeIn(400);
    },

    loginSuccess: function(user) {
      console.log("butts");
      console.log(user);
      igfSession.login();
    },

    loginFailure: function(errors) {
      $(igfSession.loginForm).find(igfSession.message).html(errors).stop().fadeIn(200);
    },

    login: function() {
      //get user data needed for display
      //load channels into changer
      //animate
    }
  }

  $(document).ready(function() {
    $(igfSession.session).each(function() {
      var $session = $(this);
      var buttons = $session.find(igfSession.buttons);
      buttons.click(function() {
        var form = $session.find(".js-" + $(this).data("type") + "-form");
        var direction = form.css("left") == "auto" ? "right" : "left";
        var options = {};
        options[direction] = 0;

        buttons.fadeOut(200);
        form.stop().animate(options, 400);
      });

      $session.find("form").each(function() {
        $(this).submit(function() {
          $(igfSession.message).stop().fadeOut(200);
        });
      });
    });
  })

})(jQuery);