signature GTK_APPLICATION =
  sig
    type 'a class
    type 'a window_class
    type t = base class
    val asActionGroup : 'a class -> base Gio.ActionGroupClass.class
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> Gio.ApplicationFlags.t
       -> base class
    val addWindow :
      'a class
       -> 'b window_class
       -> unit
    val removeWindow :
      'a class
       -> 'b window_class
       -> unit
    val windowAddedSig : (base window_class -> unit) -> 'a class Signal.signal
    val windowRemovedSig : (base window_class -> unit) -> 'a class Signal.signal
  end
