signature GTK_VIEWPORT =
  sig
    type 'a class
    type 'a buildable_class
    type 'a scrollable_class
    type 'a adjustment_class
    type shadow_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asScrollable : 'a class -> base scrollable_class
    val getType : unit -> GObject.Type.t
    val new :
      'a adjustment_class
       -> 'b adjustment_class
       -> base class
    val getBinWindow : 'a class -> base Gdk.WindowClass.class
    val getShadowType : 'a class -> shadow_type_t
    val getViewWindow : 'a class -> base Gdk.WindowClass.class
    val setShadowType :
      'a class
       -> shadow_type_t
       -> unit
    val shadowTypeProp : ('a class, shadow_type_t, shadow_type_t) Property.readwrite
  end
