signature GTK_FONT_SELECTION =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val fontNameProp : ('a class_t, string option, string option) Property.readwrite
    val previewTextProp : ('a class_t, string option, string option) Property.readwrite
  end
