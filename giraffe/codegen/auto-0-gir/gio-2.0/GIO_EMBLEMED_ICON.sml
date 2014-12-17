signature GIO_EMBLEMED_ICON =
  sig
    type 'a class_t
    type 'a emblemclass_t
    type 'a iconclass_t
    type t = base class_t
    val asIcon : 'a class_t -> base iconclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a iconclass_t
       -> 'b emblemclass_t option
       -> base iconclass_t
    val addEmblem :
      'a class_t
       -> 'b emblemclass_t
       -> unit
    val clearEmblems : 'a class_t -> unit
    val getIcon : 'a class_t -> base iconclass_t
    val giconProp : ('a class_t, base iconclass_t option, 'b iconclass_t option) Property.readwrite
  end
