signature GTK_SOCKET =
  sig
    type 'a class_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addId :
      'a class_t
       -> Xlib.Window.t
       -> unit
    val getId : 'a class_t -> Xlib.Window.t
    val getPlugWindow : 'a class_t -> base Gdk.WindowClass.t
    val plugAddedSig : (unit -> unit) -> 'a class_t Signal.signal
    val plugRemovedSig : (unit -> bool) -> 'a class_t Signal.signal
  end
