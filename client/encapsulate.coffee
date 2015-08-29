encapsulate = (handler) ->
  (event, template) ->
    event.stopPropagation()
    event.stopImmediatePropagation()
    handler.apply(@, arguments)

grab = (handler) ->
  (event, template) ->
    $target = $(event.target)
    if not $target.closest(".pass-to-router").length
      event.preventDefault()
    handler.apply(@, arguments)

secure = (handler) ->
  (event, template) ->
    if Meteor.userId()
      handler.apply(@, arguments)
    else
      $(Spire.document.body).find("#loginPopup").modal("show")

