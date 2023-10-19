$(document).on("ajax:success", "#like-button", function(event, data) {
    if (data.liked) {
      $(this).text("Liked");
    } else {
      $(this).text("Like");
    }
    $("#likes-count").text(data.likes_count);
});