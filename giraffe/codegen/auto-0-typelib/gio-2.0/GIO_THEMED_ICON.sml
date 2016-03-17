signature GIO_THEMED_ICON =
  sig
    type 'a class
    type 'a icon_class
    type t = base class
    val asIcon : 'a class -> base icon_class
    val getType : unit -> GObject.Type.t
    val new : string -> base icon_class
    val newWithDefaultFallbacks : string -> base icon_class
    val appendName :
      'a class
       -> string
       -> unit
    val prependName :
      'a class
       -> string
       -> unit
    val nameProp : ('a class, string option) Property.writeonly
    val useDefaultFallbacksProp : ('a class, bool, bool) Property.readwrite
  end
