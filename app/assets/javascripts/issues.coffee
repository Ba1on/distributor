# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
dragObject = {};

document.onmousedown = (e) ->
  if e.which isnt 1
  return

elem = e.target.closest('.draggable')

if not elem return 

dragObject.elem = elem
dragObject.downX = e.pageX
dragObject.downY = e.pageY