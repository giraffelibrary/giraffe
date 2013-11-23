signature GTK_PLUG =
  sig
    type 'a class_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : Xlib.Window.t -> base class_t
    val newForDisplay :
      'a Gdk.DisplayClass.t
       -> Xlib.Window.t
       -> base class_t
    val construct :
      'a class_t
       -> Xlib.Window.t
       -> unit
    val constructForDisplay :
      'a class_t
       -> 'b Gdk.DisplayClass.t
       -> Xlib.Window.t
       -> unit
    val getEmbedded : 'a class_t -> bool
    val getId : 'a class_t -> Xlib.Window.t
    val getSocketWindow : 'a class_t -> base Gdk.WindowClass.t
    val embeddedSig : (unit -> unit) -> 'a class_t Signal.signal
    val embeddedProp : ('a class_t, bool) Property.readonly
    val socketWindowProp : ('a class_t, base Gdk.WindowClass.t option) Property.readonly
  end
