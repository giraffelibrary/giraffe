signature GTK_FONT_CHOOSER_DIALOG =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a fontchooserclass_t
    type 'a windowclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asFontChooser : 'a class_t -> base fontchooserclass_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> 'a windowclass_t
       -> base class_t
  end
