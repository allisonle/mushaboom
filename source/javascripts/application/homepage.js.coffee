$(document).ready ->
  $('.nav-button').jPushMenu()

$('nav ul li').click (e) ->
  sec = $(e.target).data 'sec'
  klass = $(e.target).data 'klass'
  $main = $('#main')
  $bg = $('#content-wrapper')
  $bg.css 'background-position', sec
  $main.attr 'class', "active #{klass}"
  false



