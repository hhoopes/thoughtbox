$(document).ready(function(){

  $(".markAsRead").click(function(event){
    event.preventDefault();
    var id = $(this).parents(".eachLink").data("id")
    Link.updateDatabase(id, true, this);
  });

  $(".markAsUnread").click(function(event){
    event.preventDefault();
    var id = $(this).parents(".eachLink").data("id")
    Link.updateDatabase(id, false, this);
  });

  $("#searchLinks").keyup(function(event) {
    event.preventDefault();
    searchText = $(this).val();
    Link.filter(filterText);
  });
})

var Link = {
  filter: function(filterText) {
    $(".eachLink").each(function(i, link){
      var linkText = $(link).find(".linkTitle").text().toLowerCase();
      linkText.indexOf(filterText.toLowerCase()) >= 0 ?
        $(link).show() : $(link).hide();
    })
  },

  toggleStatus: function(status, context) {
    $(context).toggleClass("hidden");
    $(context).siblings().first().toggleClass("hidden");
    $(context).parent().siblings().first().toggleClass('read');
  },

  updateDatabase: function(id, status, context) {
    $.ajax({
      url: "/links/" + id + ".json",
      method: "put",
      dataType: "json",
      data: { link: {read: status} },
      success: function() {
        Link.toggleStatus(status, context);
      }
    })
  }
}
