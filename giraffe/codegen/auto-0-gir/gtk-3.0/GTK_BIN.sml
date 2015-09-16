signature GTK_BIN =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val getChild : 'a class_t -> base widget_class_t
  end
