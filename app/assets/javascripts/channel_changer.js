(function($, undefined) {
  if ($.channelChanger !== undefined) {
    $.error('channelChanger has already been loaded!');
  }

  var channelChanger;
  var $document = $(document);

  $.channelChanger = channelChanger = {
    channelSelector: ".js-channel",
    channelListSelector: ".js-channel-listing",
    channel: window.channelChanger["currentChannel"],

    init: function() {
      // channelChanger.displayChannel(channelChanger.channel);
      var addChannel = function(channel_id, channel_type, channel_name) {
        //channels_controller#create
        $.ajax({
          type: "post",
          url: window.channelChanger["newUserChannelUrl"],
          data: {
            name: channel_name,
            channelable_type: channel_type,
            channelable_id: channel_id
          }
        })
        //use response to generate new channel
        $("<div class=\"channel\" data-channel-id=\"1\"").appendTo($(channelChanger.channelListSelector));
      };

      var removeChannel = function() {

      };

      $document.ready(function() {
        $(channelChanger.channelListSelector).on("click", channelChanger.channelSelector, function() {
          channelChanger.changeChannel($(this));
        });

        //bind on click to remove channel
      });
    },

    displayChannel: function(channel) {
      var videoPlayer = function(channel) {
        return "<object style=\"width: 100%;height: 100%;\" type=\"application/x-shockwave-flash\" height=\"378\" width=\"620\" id=\"live_embed_player_flash\" data=\"http://www.twitch.tv/widgets/live_embed_player.swf?channel=" + channelName + "\" bgcolor=\"#000000\"><param name=\"allowFullScreen\" value=\"true\" /><param name=\"allowScriptAccess\" value=\"always\" /><param name=\"allowNetworking\" value=\"all\" /><param name=\"movie\" value=\"http://www.twitch.tv/widgets/live_embed_player.swf\" /><param name=\"flashvars\" value=\"hostname=www.twitch.tv&channel=" + channel + "&auto_play=true&start_volume=25\" /></object>";
      };

      $(".js-ingamefame-tv").html(videoPlayer(channel));
    },

    changeChannel: function(channel) {
      $.ajax({
        type: "GET",
        url: '/channels/change',
        data: {
          channel_id: channel.data("channel-id")
        }
      }).success(function(data) {
        $(".js-channel-listing .active").removeClass("active");
        channel.addClass("active");
        // When channel is changed, create a new array of eligible streams
        channelChanger.displayChannel(data["channel"]["name"]);
      });
    }
  };
})(jQuery)