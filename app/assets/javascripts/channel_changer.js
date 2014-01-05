(function($, undefined) {
  if ($.ingamefame !== undefined) {
    $.error('ingamefame has already been loaded!');
  }

  var ingamefame;
  var $document = $(document);

  $.ingamefame = ingamefame = {

    changeChannel: function(gameName) {
      $.ajax({
        type: "GET",
        url: '/channels/next',
        data: {
          game_name: gameName
        }
      }).success(function(data) {
        $(".js-ingamefame-tv").html(ingamefame.videoPlayer(data["channel"]["name"]));
      });
    },

    videoPlayer: function(channelName) {
      return "<object style=\"width: 100%;height: 100%;\" type=\"application/x-shockwave-flash\" height=\"378\" width=\"620\" id=\"live_embed_player_flash\" data=\"http://www.twitch.tv/widgets/live_embed_player.swf?channel=" + channelName + "\" bgcolor=\"#000000\"><param name=\"allowFullScreen\" value=\"true\" /><param name=\"allowScriptAccess\" value=\"always\" /><param name=\"allowNetworking\" value=\"all\" /><param name=\"movie\" value=\"http://www.twitch.tv/widgets/live_embed_player.swf\" /><param name=\"flashvars\" value=\"hostname=www.twitch.tv&channel=" + channelName + "&auto_play=true&start_volume=25\" /></object>";
    }
  };

  $document.ready(function() {
    $(".js-channel-listing").on("click", ".js-channel", function() {
      ingamefame.changeChannel($(this).data("game-name"));
    });
  });
})(jQuery)