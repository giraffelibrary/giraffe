signature GDK_FRAME_CLOCK =
  sig
    type 'a class
    type frame_timings_t
    type frame_clock_phase_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val beginUpdating : 'a class -> unit
    val endUpdating : 'a class -> unit
    val getCurrentTimings : 'a class -> frame_timings_t
    val getFrameCounter : 'a class -> LargeInt.int
    val getFrameTime : 'a class -> LargeInt.int
    val getHistoryStart : 'a class -> LargeInt.int
    val getTimings :
      'a class
       -> LargeInt.int
       -> frame_timings_t
    val requestPhase :
      'a class
       -> frame_clock_phase_t
       -> unit
    val afterPaintSig : (unit -> unit) -> 'a class Signal.t
    val beforePaintSig : (unit -> unit) -> 'a class Signal.t
    val flushEventsSig : (unit -> unit) -> 'a class Signal.t
    val layoutSig : (unit -> unit) -> 'a class Signal.t
    val paintSig : (unit -> unit) -> 'a class Signal.t
    val resumeEventsSig : (unit -> unit) -> 'a class Signal.t
    val updateSig : (unit -> unit) -> 'a class Signal.t
  end
