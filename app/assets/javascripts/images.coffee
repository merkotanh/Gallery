ready = ->

  $('#pictures').imagesLoaded ->
    $('#pictures').masonry
      itemSelector: '.box'
      isFitWidth: true,
      gutterWidth: 0,
      isAnimated:true,
      animationOptions:{
              duration:100,
              easing:'linear',
              queue:false
       } 

$(document).on('turbolinks:load', ready)