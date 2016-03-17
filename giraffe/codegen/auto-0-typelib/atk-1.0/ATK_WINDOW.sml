signature ATK_WINDOW =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val activateSig : (unit -> unit) -> 'a class Signal.signal
    val createSig : (unit -> unit) -> 'a class Signal.signal
    val deactivateSig : (unit -> unit) -> 'a class Signal.signal
    val destroySig : (unit -> unit) -> 'a class Signal.signal
    val maximizeSig : (unit -> unit) -> 'a class Signal.signal
    val minimizeSig : (unit -> unit) -> 'a class Signal.signal
    val moveSig : (unit -> unit) -> 'a class Signal.signal
    val resizeSig : (unit -> unit) -> 'a class Signal.signal
    val restoreSig : (unit -> unit) -> 'a class Signal.signal
  end
