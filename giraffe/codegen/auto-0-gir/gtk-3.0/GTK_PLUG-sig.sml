signature GTK_PLUG =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : Xlib.Window.t -> base class
    val newForDisplay : 'a Gdk.DisplayClass.class * Xlib.Window.t -> base class
    val construct :
      'a class
       -> Xlib.Window.t
       -> unit
    val constructForDisplay :
      'a class
       -> 'b Gdk.DisplayClass.class * Xlib.Window.t
       -> unit
    val getEmbedded : 'a class -> bool
    val getId : 'a class -> Xlib.Window.t
    val getSocketWindow : 'a class -> base Gdk.WindowClass.class option
    val embeddedSig : (unit -> unit) -> 'a class Signal.t
    val embeddedProp : {get : 'a class -> bool}
    val socketWindowProp : {get : 'a class -> base Gdk.WindowClass.class option}
  end
