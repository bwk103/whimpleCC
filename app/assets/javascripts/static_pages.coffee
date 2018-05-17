# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

toggleMenu = -> 
    console.log(this.parentNode.childNodes)

window.onload = ->
    menuBtn = document.getElementsByClassName('menu-btn')[0]
    menuBtn.addEventListener 'click', toggleMenu
