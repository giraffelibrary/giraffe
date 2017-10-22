signature GTK_FONT_CHOOSER_DIALOG =
  sig
    type 'a class
    type 'a buildable_class
    type 'a font_chooser_class
    type 'a window_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asFontChooser : 'a class -> base font_chooser_class
    val getType : unit -> GObject.Type.t
    val new : string option * 'a window_class option -> base class
  end
