signature GIO_APP_INFO_MONITOR =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val get : unit -> base class
    val changedSig : (unit -> unit) -> 'a class Signal.t
  end
