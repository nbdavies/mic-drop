$(document).ready(function(){
  $("#container").on("submit", "#unrsvp", function(event){
    event.preventDefault();
    $unrsvp = $(this);
    request = $.ajax({
      url: "/rsvps/1",
      method: "delete",
      data: $(this).serialize()
    });
    request.done(function(responseData){
      $unrsvp.closest(".info-window").find("#attendees").text(responseData.attendees);
      var rsvp_form = '<form action="/rsvps" method="post" id="rsvp">'+
        '<input type="hidden" name="rsvp[event_id]" value='+responseData.id+'><input type="submit" value="RSVP" class="btn green"></form>'
      $unrsvp.replaceWith(rsvp_form);
      // $unrsvp.hide();
    });
  });

  $("#container").on("submit", "#rsvp", function(event){
    event.preventDefault();
    $rsvp = $(this);
    request = $.ajax({
      url: "/rsvps",
      method: "post",
      data: $(this).serialize()
    });
    request.done(function(responseData){
      $rsvp.closest(".info-window").find("#attendees").text(responseData.attendees);
      var unrsvp_form = '<form action="/rsvps/'+responseData.id+'" method="post" id="unrsvp">'+
        '<input type="hidden" name="_method" value="delete"><input type="hidden" name="rsvp[event_id]" value='+responseData.id+'><input type="submit" value="Flake Out" class="btn red"></form>'
      $rsvp.replaceWith(unrsvp_form);
    });
  });

  $("#container").on("submit", "#unfav", function(event){
    event.preventDefault();
    $unfav = $(this);
    request = $.ajax({
      url: "/subscriptions",
      method: "delete",
      data: $(this).serialize()
    });
    request.done(function(responseData){
      console.log(responseData)
      var fav_form = '<form action="/subscriptions" method="post" id="fav">'+
        '<input type="hidden" name="subscriptions[venue_name]" value="'+responseData[0]+'">'+
        '<input type="submit" value="Add to My Places" class="btn grey"></form>';
      $unfav.replaceWith(fav_form);
      });
    });

    $("#container").on("submit", "#fav", function(event){
    event.preventDefault();
    $fav = $(this);
    console.log(this)
    request = $.ajax({
      url: "/subscriptions",
      method: "post",
      data: $(this).serialize()
    });
    request.done(function(responseData){
      console.log(responseData)
      var unfav_form = '<form action="/subscriptions/'+responseData[0]+'" method="post" id="unfav">'+
        '<input type="hidden" name="_method" value="delete">'+
        '<input type="hidden" name="subscriptions[venue_name]" value="'+responseData[0]+'">'+
        '<input type="hidden" name="subscriptions[user_id]" value="'+responseData[1]+'">'+
        '<input type="submit" value="Remove from My Places" class="btn pink"></form>';
      $fav.replaceWith(unfav_form);
    });
  });


})
