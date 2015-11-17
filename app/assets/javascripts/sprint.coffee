$(document).ready ->
  $('.one_issue').draggable
    helper: 'clone'
    containment: 'document'
    start: ->
      dragDrop = $(this).data('id')
      success: (response) ->
        console.log 'response'
      return
  $('.issues_c').droppable drop: (event, ui) ->
    ui.draggable.appendTo $(this)
    $.ajax
      url: 'issues/update'
      data: sprint_id: dragDrop
      type: 'put'
    return
  return
