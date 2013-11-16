signature GIO_PROXY_RESOLVER =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class_t
    val isSupported : 'a class_t -> bool
  end
