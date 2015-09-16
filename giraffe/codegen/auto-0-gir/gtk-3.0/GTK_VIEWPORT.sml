signature GTK_VIEWPORT =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a scrollable_class_t
    type 'a adjustment_class_t
    type shadow_type_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asScrollable : 'a class_t -> base scrollable_class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a adjustment_class_t
       -> 'b adjustment_class_t
       -> base class_t
    val getBinWindow : 'a class_t -> base Gdk.WindowClass.t
    val getShadowType : 'a class_t -> shadow_type_t
    val getViewWindow : 'a class_t -> base Gdk.WindowClass.t
    val setShadowType :
      'a class_t
       -> shadow_type_t
       -> unit
    val shadowTypeProp : ('a class_t, shadow_type_t, shadow_type_t) Property.readwrite
  end
