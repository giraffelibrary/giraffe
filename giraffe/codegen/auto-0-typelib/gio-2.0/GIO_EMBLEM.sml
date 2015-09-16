signature GIO_EMBLEM =
  sig
    type 'a class_t
    type 'a icon_class_t
    type emblem_origin_t
    type t = base class_t
    val asIcon : 'a class_t -> base icon_class_t
    val getType : unit -> GObject.Type.t
    val new : 'a icon_class_t -> base class_t
    val newWithOrigin :
      'a icon_class_t
       -> emblem_origin_t
       -> base class_t
    val getIcon : 'a class_t -> base icon_class_t
    val getOrigin : 'a class_t -> emblem_origin_t
    val iconProp : ('a class_t, base GObject.ObjectClass.t option, 'b GObject.ObjectClass.t option) Property.readwrite
    val originProp : ('a class_t, emblem_origin_t, emblem_origin_t) Property.readwrite
  end
