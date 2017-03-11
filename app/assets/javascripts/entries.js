$(".picture_link").click(function() {
  var pswpElement = document.querySelectorAll('.pswp')[0];
  var element = $(this);

  var items = [];
  $(".picture_link").each(function() {
    var el = $(this);
    var msrc = el.children("img").attr("src");
    items.push({src: el.attr("href"), w: el.data("w"), h: el.data("h"), msrc: msrc, title: el.data("title")});
  });

  var options = {index: element.data("index")};

  $(this).children("img").attr("alt");

  var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
  gallery.init();

  return false;
});

$(".map_link").click(function() {
  var pswpElement = document.querySelectorAll('.pswp')[0];
  var element = $(this);

  var items = [];
  $(".map_link").each(function() {
    var el = $(this);
    var msrc = el.children("img").attr("src");
    items.push({src: el.attr("href"), w: el.data("w"), h: el.data("h"), msrc: msrc, title: el.data("title")});
  });

  var options = {index: element.data("index")};

  $(this).children("img").attr("alt");

  var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
  gallery.init();

  return false;
});
