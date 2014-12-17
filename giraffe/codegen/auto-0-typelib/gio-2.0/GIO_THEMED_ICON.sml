signature GIO_THEMED_ICON =
  sig
    type 'a class_t
    type 'a iconclass_t
    type t = base class_t
    val asIcon : 'a class_t -> base iconclass_t
    val getType : unit -> GObject.Type.t
    val new : string -> base iconclass_t
    val newWithDefaultFallbacks : string -> base iconclass_t
    val appendName :
      'a class_t
       -> string
       -> unit
    val prependName :
      'a class_t
       -> string
       -> unit
    val nameProp : ('a class_t, string option) Property.writeonly
    val useDefaultFallbacksProp : ('a class_t, bool, bool) Property.readwrite
  end
