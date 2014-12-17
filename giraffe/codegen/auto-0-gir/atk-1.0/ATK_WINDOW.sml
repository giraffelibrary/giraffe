signature ATK_WINDOW =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val activateSig : (unit -> unit) -> 'a class_t Signal.signal
    val createSig : (unit -> unit) -> 'a class_t Signal.signal
    val deactivateSig : (unit -> unit) -> 'a class_t Signal.signal
    val destroySig : (unit -> unit) -> 'a class_t Signal.signal
    val maximizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val minimizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val moveSig : (unit -> unit) -> 'a class_t Signal.signal
    val resizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val restoreSig : (unit -> unit) -> 'a class_t Signal.signal
  end
