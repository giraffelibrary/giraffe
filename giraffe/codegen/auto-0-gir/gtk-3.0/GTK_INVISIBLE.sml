signature GTK_INVISIBLE =
  sig
    type 'a class_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newForScreen : 'a Gdk.ScreenClass.t -> base class_t
    val getScreen : 'a class_t -> base Gdk.ScreenClass.t
    val setScreen :
      'a class_t
       -> 'b Gdk.ScreenClass.t
       -> unit
    val screenProp : ('a class_t, base Gdk.ScreenClass.t option, 'b Gdk.ScreenClass.t option) Property.readwrite
  end
