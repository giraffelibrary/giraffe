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
    val iconProp :
      {
        get : 'a class -> base GObject.ObjectClass.class option,
        new : 'b GObject.ObjectClass.class option -> 'a class Property.t
      }
    val originProp :
      {
        get : 'a class -> emblem_origin_t,
        new : emblem_origin_t -> 'a class Property.t
      }
  end
