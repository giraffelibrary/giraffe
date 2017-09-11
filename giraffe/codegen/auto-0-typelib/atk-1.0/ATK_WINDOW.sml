signature ATK_WINDOW =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val activateSig : (unit -> unit) -> 'a class Signal.t
    val createSig : (unit -> unit) -> 'a class Signal.t
    val deactivateSig : (unit -> unit) -> 'a class Signal.t
    val destroySig : (unit -> unit) -> 'a class Signal.t
    val maximizeSig : (unit -> unit) -> 'a class Signal.t
    val minimizeSig : (unit -> unit) -> 'a class Signal.t
    val moveSig : (unit -> unit) -> 'a class Signal.t
    val resizeSig : (unit -> unit) -> 'a class Signal.t
    val restoreSig : (unit -> unit) -> 'a class Signal.t
  end
