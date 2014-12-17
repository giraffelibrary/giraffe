signature GIO_THREADED_SOCKET_SERVICE =
  sig
    type 'a class_t
    type 'a socketconnectionclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : LargeInt.int -> base class_t
    val runSig :
      (base socketconnectionclass_t
        -> base GObject.ObjectClass.t
        -> bool)
       -> 'a class_t Signal.signal
    val maxThreadsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
