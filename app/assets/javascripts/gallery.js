$('.picture_link').click(function() {
  var pswpElement = document.querySelectorAll('.pswp')[0];
  var element = $(this);

  var items = [];
  $('.picture_preview > .picture_link').each(function() {
    var el = $(this);
    var msrc = el.children('img').attr('src');
    items.push({src: el.attr('href'), w: el.data('w'), h: el.data('h'), msrc: msrc, title: el.data('title')});
  });

  var options = {index: element.data('index'), galleryUID: 'pics'};
  var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
  gallery.init();

  return false;
});

$('.map_link').click(function() {
  var pswpElement = document.querySelectorAll('.pswp')[0];
  var element = $(this);

  var items = [];
  $('.map_preview > .map_link').each(function() {
    var el = $(this);
    var msrc = el.children('img').attr('src');
    items.push({src: el.attr('href'), w: el.data('w'), h: el.data('h'), msrc: msrc, title: el.data('title')});
  });

  var options = {index: element.data('index'), galleryUID: 'maps'};
  var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
  gallery.init();

  return false;
});

$(function() {
  var url = window.location.href;

  var idx = url.indexOf('#&gid=pics&pid=');
  if (idx != -1) {
    var pid = url.substring(idx + 15);
    var index = parseInt(pid) - 1;
    if (index > -1) {
      var pswpElement = document.querySelectorAll('.pswp')[0];
      var element = $(this);

      var items = [];
      $('.picture_preview > .picture_link').each(function() {
        var el = $(this);
        var msrc = el.children('img').attr('src');
        items.push({src: el.attr('href'), w: el.data('w'), h: el.data('h'), msrc: msrc, title: el.data('title')});
      });

      var options = {index: index, galleryUID: 'pics'};
      var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
      gallery.init();
    }
    return false;
  }

  idx = url.indexOf('#&gid=maps&pid=');
  if (idx != -1) {
    var pid = url.substring(idx + 15);
    var index = parseInt(pid) - 1;
    if (index > -1) {
      var pswpElement = document.querySelectorAll('.pswp')[0];
      var element = $(this);

      var items = [];
      $('.map_preview > .map_link').each(function() {
        var el = $(this);
        var msrc = el.children('img').attr('src');
        items.push({src: el.attr('href'), w: el.data('w'), h: el.data('h'), msrc: msrc, title: el.data('title')});
      });

      var options = {index: index, galleryUID: 'maps'};
      var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
      gallery.init();
    }
    return false;
  }
});
