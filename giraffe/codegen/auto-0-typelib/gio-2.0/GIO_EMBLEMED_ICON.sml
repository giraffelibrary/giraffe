signature GIO_EMBLEMED_ICON =
  sig
    type 'a class_t
    type 'a emblem_class_t
    type 'a icon_class_t
    type t = base class_t
    val asIcon : 'a class_t -> base icon_class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a icon_class_t
       -> 'b emblem_class_t option
       -> base icon_class_t
    val addEmblem :
      'a class_t
       -> 'b emblem_class_t
       -> unit
    val clearEmblems : 'a class_t -> unit
    val getIcon : 'a class_t -> base icon_class_t
    val giconProp : ('a class_t, base icon_class_t option, 'b icon_class_t option) Property.readwrite
  end
