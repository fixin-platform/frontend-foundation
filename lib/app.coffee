Foreach = {}

Foreach.strval = (value) -> value + ""
Foreach.intval = (value) -> parseInt(value, 10) or 0
Foreach.floatval = (value) -> parseFloat(value) or 0

Foreach.isDebug = Meteor.settings.public.isDebug
holy = {shit: !!~0} # for special occasions

object = if typeof(window) != "undefined" then window else GLOBAL
object.isDebug = Foreach.isDebug
if typeof(console) != "undefined" && console.log && _.isFunction(console.log)
  if not cl? then cl = _.bind(console.log, console)
  if not ct? then ct = _.bind(console.time, console)
  if not cte? then cte = _.bind(console.timeEnd, console)
  if not cd? then cd = (condition) -> debugger if not condition and Meteor.settings.public.isDebug
  if not ff? then ff = (collection) -> cl collection.find().fetch()
else
  if not cl? then cl = ->
  if not cd? then cd = ->
