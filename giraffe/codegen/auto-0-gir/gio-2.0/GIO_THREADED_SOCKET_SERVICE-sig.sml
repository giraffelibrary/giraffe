signature GIO_THREADED_SOCKET_SERVICE =
  sig
    type 'a class
    type 'a socket_connection_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : LargeInt.int -> base class
    val runSig : (base socket_connection_class * base GObject.ObjectClass.class -> bool) -> 'a class Signal.t
    val maxThreadsProp : ('a class, unit -> LargeInt.int, unit, LargeInt.int -> unit) Property.t
  end
