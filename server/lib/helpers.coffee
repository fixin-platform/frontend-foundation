secure = (method) -> ->
  throw new Meteor.Error("User:unauthenticated", "User not authenticated") if not @userId
  method.apply(@, arguments)

admin = (method) -> ->
  throw new Meteor.Error("User:insufficient-permissions", "Admin only") if not isAdmin(@userId)
  method.apply(@, arguments)

editor = (method) -> ->
  throw new Meteor.Error("User:insufficient-permissions", "Editor or Admin only") if not (isAdmin(@userId) or isEditor(@userId))
  method.apply(@, arguments)

isAdmin = (userId) ->
  userId and Users.findOne(userId)?.isAdmin

isEditor = (userId) ->
  userId and Users.findOne(userId)?.isEditor

introspect = (func) ->
  return ->
    try
      return func.apply(@, arguments)
    catch exception
      Meteor._debug(exception)
      Meteor._debug(arguments)
      throw exception
