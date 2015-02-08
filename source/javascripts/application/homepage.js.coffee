$(document).ready ->
  $('.nav-button').jPushMenu()

$('nav ul li').click (e) ->
  sec = $(e.target).data 'sec'
  bgColor = $(e.target).data 'bg'
  $main = $('#main')
  $bg = $('#content-wrapper')
  if $main.hasClass 'active'
    $bg.css 'background-position', sec
    $main.css 'background-color', bgColor
  else
    $main.addClass 'active'
  false



