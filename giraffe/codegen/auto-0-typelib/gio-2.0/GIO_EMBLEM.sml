signature GIO_EMBLEM =
  sig
    type 'a class_t
    type 'a iconclass_t
    type emblemorigin_t
    type t = base class_t
    val asIcon : 'a class_t -> base iconclass_t
    val getType : unit -> GObject.Type.t
    val new : 'a iconclass_t -> base class_t
    val newWithOrigin :
      'a iconclass_t
       -> emblemorigin_t
       -> base class_t
    val getIcon : 'a class_t -> base iconclass_t
    val getOrigin : 'a class_t -> emblemorigin_t
    val iconProp : ('a class_t, base GObject.ObjectClass.t option, 'b GObject.ObjectClass.t option) Property.readwrite
    val originProp : ('a class_t, emblemorigin_t, emblemorigin_t) Property.readwrite
  end
