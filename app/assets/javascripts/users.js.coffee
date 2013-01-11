# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#Gridalicious
jQuery ->
  $("#cardgrid").gridalicious
    #width: 246
    width: 246
    gutter: 20
    selector: '.card'
    animate: true
    animationOptions:
      speed: 50
      duration: 100

#TODO: make it dynamic length
jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page a').attr('href')
      if url &&  $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text('Fetching more products...')
        $.getScript(url)

#Modal popup button
jQuery ->
  $modal = $('#ajax-modal')
  $(document).on 'click', '.modallauncher', ->
    $modal.load $(this).attr('href'), '', ->
      $modal.modal()