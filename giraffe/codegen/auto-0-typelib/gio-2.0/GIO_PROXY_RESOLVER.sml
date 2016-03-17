signature GIO_PROXY_RESOLVER =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class
    val isSupported : 'a class -> bool
  end
