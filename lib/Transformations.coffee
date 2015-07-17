Transformations =
  cls: (collection, fallback, object) ->
    object.cls and collection[object.cls] or fallback
  static: (cls, object) ->
    if object instanceof cls or not object then object else new cls(object)
  dynamic: (collection, fallback, object) ->
    cls = @cls(collection, fallback, object)
    throw new Error("Can't find #{collection._name}.#{cls} class") if not cls
    Transformations.static(cls, object)
