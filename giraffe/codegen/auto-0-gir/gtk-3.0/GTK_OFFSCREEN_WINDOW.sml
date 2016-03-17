signature GTK_OFFSCREEN_WINDOW =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getPixbuf : 'a class -> base GdkPixbuf.PixbufClass.class
    val getSurface : 'a class -> Cairo.SurfaceRecord.t
  end
