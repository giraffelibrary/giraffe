signature GIO_CANCELLABLE =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getCurrent : unit -> base class_t
    val cancel : 'a class_t -> unit
    val disconnect :
      'a class_t
       -> LargeInt.int
       -> unit
    val getFd : 'a class_t -> LargeInt.int
    val isCancelled : 'a class_t -> bool
    val makePollfd :
      'a class_t
       -> GLib.PollFDRecord.t
       -> bool
    val popCurrent : 'a class_t -> unit
    val pushCurrent : 'a class_t -> unit
    val releaseFd : 'a class_t -> unit
    val reset : 'a class_t -> unit
    val setErrorIfCancelled : 'a class_t -> bool
    val cancelledSig : (unit -> unit) -> 'a class_t Signal.signal
  end
