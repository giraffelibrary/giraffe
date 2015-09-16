signature GTK_FONT_CHOOSER_DIALOG =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a font_chooser_class_t
    type 'a window_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asFontChooser : 'a class_t -> base font_chooser_class_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> 'a window_class_t
       -> base class_t
  end
