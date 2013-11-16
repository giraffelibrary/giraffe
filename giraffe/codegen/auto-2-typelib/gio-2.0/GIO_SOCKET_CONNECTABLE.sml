signature GIO_SOCKET_CONNECTABLE =
  sig
    type 'a class_t
    type 'a socketaddressenumeratorclass_t
    val getType : unit -> GObject.Type.t
    val enumerate : 'a class_t -> base socketaddressenumeratorclass_t
    val proxyEnumerate : 'a class_t -> base socketaddressenumeratorclass_t
  end
