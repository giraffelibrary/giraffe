signature GTK_FONT_SELECTION =
  sig
    type 'a class_t
    type 'a orientableclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val fontNameProp : ('a class_t, string option, string option) Property.readwrite
    val previewTextProp : ('a class_t, string option, string option) Property.readwrite
  end
