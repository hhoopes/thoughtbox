$(document).ready(function(){

  $(".toggle-status").click(function(event){
    event.preventDefault();
    toggleStatus(this)
    updateLink(this)
  });

  var toggleStatus = function(context) {
    $(context).parent().parent().find(".link").toggleClass("read")
  }

  function updateLink(context) {
    id = $(context).parent().parent().find(".link").attr("id")
    $.ajax({
      url: "/api/v1/links" + id + ".json",
      method: "put",
      dataType: "json",
      data: { }
    })
  }

})
