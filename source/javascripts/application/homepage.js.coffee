$(document).ready ->
  $('.nav-button').jPushMenu()

$('nav ul li').click (e) ->
  sec = $(e.target).data 'sec'
  $('#main').attr('class', '').toggleClass 'active'
  false



