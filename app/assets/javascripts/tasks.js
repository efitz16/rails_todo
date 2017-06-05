$(document).ready(function(){
  $('.task-form-container').on('submit', function(e) {
    e.preventDefault();

    var target = e.target;

    $.ajax({
      url: target.action,
      method: 'post',
      data: $(target).serialize()
    }).done(function(response) {
      $('.tasks-container').append(response);
    });

    return false;
  });

  $('.tasks-container').on("click", ".edit-task", function(e) {
    e.preventDefault();



    $target = e.target;



    $.ajax({
      url: $target.href,
      method: "get"
    }).done(function(response){

      $('.tasks-container').find('#task-' + $target.id).replaceWith(response);
      console.log("edited");
    })
  })

});