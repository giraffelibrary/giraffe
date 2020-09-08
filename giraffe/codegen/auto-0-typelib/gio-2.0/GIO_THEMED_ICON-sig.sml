signature GIO_THEMED_ICON =
  sig
    type 'a class
    type 'a icon_class
    type t = base class
    val asIcon : 'a class -> base icon_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val newFromNames : Utf8CPtrArrayN.t -> base class
    val newWithDefaultFallbacks : string -> base class
    val appendName :
      'a class
       -> string
       -> unit
    val getNames : 'a class -> Utf8CPtrArray.t
    val prependName :
      'a class
       -> string
       -> unit
    val nameProp : ('a class, unit, unit, string option -> unit) Property.t
    val useDefaultFallbacksProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
  end
