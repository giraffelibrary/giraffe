signature GIO_PROXY_ADDRESS_ENUMERATOR =
  sig
    type 'a class_t
    type 'a socket_connectable_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val connectableProp : ('a class_t, base socket_connectable_class_t option, 'b socket_connectable_class_t option) Property.readwrite
    val uriProp : ('a class_t, string option, string option) Property.readwrite
  end
