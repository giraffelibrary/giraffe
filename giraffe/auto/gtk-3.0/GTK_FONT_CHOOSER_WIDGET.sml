signature GTK_FONT_CHOOSER_WIDGET =
  sig
    type 'a class_t
    type 'a orientableclass_t
    type 'a fontchooserclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asFontChooser : 'a class_t -> base fontchooserclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
  end
