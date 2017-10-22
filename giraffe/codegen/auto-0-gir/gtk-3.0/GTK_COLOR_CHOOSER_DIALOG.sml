signature GTK_COLOR_CHOOSER_DIALOG =
  sig
    type 'a class
    type 'a buildable_class
    type 'a color_chooser_class
    type 'a window_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asColorChooser : 'a class -> base color_chooser_class
    val getType : unit -> GObject.Type.t
    val new : string option * 'a window_class option -> base class
    val showEditorProp : ('a class, bool, bool) Property.readwrite
  end
