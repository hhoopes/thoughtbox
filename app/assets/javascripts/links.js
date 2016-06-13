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

  $("#filterLinks").keyup(function(event) {
    event.preventDefault();
    text = $(this).val();
    Link.filterText(text);
  });

  $("#filterUnread").click(function(event) {
    event.preventDefault();
    Link.filterStatus(false)
  })

  $("#filterRead").click(function(event) {
    event.preventDefault();
    Link.filterStatus(true)
  })

  $("#sortAlpha").click(function(event) {
    event.preventDefault();
    Link.sortAlpha()
  })
})

var Link = {
  sortAlpha: function() {
    sorted =
    $(".eachLink").sort(function(link, link2){
      $(link).show();
      $(link2).show();
      var linkTitle = $(link).find(".linkTitle").text().toLowerCase();
      var linkTitle2 = $(link2).find(".linkTitle").text().toLowerCase();
      if (linkTitle < linkTitle2) {
        return -1;
      } else if(linkTitle > linkTitle2) {
        return 1;
      }
      else return 0;
    })
    $(".allLinks").replaceWith(sorted);
  },

  filterStatus: function(status) {
    $(".eachLink").each(function(i, link){
      if(status) {
        $(link).find(".read").length > 0 ? $(link).show() : $(link).hide();
      } else {
        $(link).find(".read").length === 0 ? $(link).show() : $(link).hide();
      }
    })
  },

  filterText: function(text) {
    $(".eachLink").each(function(i, link){
      var linkText = $(link).find(".linkTitle").text().toLowerCase();
      linkText.indexOf(text.toLowerCase()) >= 0 ?
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
