signature GIO_EMBLEM =
  sig
    type 'a class
    type 'a icon_class
    type emblem_origin_t
    type t = base class
    val asIcon : 'a class -> base icon_class
    val getType : unit -> GObject.Type.t
    val new : 'a icon_class -> base class
    val newWithOrigin : 'a icon_class * emblem_origin_t -> base class
    val getIcon : 'a class -> base icon_class
    val getOrigin : 'a class -> emblem_origin_t
    val iconProp : ('a class, unit -> base GObject.ObjectClass.class option, unit, 'b GObject.ObjectClass.class option -> unit) Property.t
    val originProp : ('a class, unit -> emblem_origin_t, unit, emblem_origin_t -> unit) Property.t
  end
