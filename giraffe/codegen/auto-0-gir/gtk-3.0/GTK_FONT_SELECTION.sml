signature GTK_FONT_SELECTION =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val fontNameProp : ('a class, string option, string option) Property.readwrite
    val previewTextProp : ('a class, string option, string option) Property.readwrite
  end
