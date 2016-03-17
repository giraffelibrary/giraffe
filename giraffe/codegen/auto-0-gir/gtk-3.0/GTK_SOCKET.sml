signature GTK_SOCKET =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addId :
      'a class
       -> Xlib.Window.t
       -> unit
    val getId : 'a class -> Xlib.Window.t
    val getPlugWindow : 'a class -> base Gdk.WindowClass.class
    val plugAddedSig : (unit -> unit) -> 'a class Signal.signal
    val plugRemovedSig : (unit -> bool) -> 'a class Signal.signal
  end
