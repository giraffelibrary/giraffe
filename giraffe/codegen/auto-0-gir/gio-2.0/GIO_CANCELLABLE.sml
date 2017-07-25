signature GIO_CANCELLABLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getCurrent : unit -> base class
    val cancel : 'a class -> unit
    val disconnect :
      'a class
       -> LargeInt.int
       -> unit
    val getFd : 'a class -> LargeInt.int
    val isCancelled : 'a class -> bool
    val popCurrent : 'a class -> unit
    val pushCurrent : 'a class -> unit
    val releaseFd : 'a class -> unit
    val reset : 'a class -> unit
    val setErrorIfCancelled : 'a class -> bool
    val cancelledSig : (unit -> unit) -> 'a class Signal.signal
  end
