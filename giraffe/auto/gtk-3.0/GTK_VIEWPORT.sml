signature GTK_VIEWPORT =
  sig
    type 'a class_t
    type shadowtype_t
    type 'a adjustmentclass_t
    type 'a scrollableclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asScrollable : 'a class_t -> base scrollableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a adjustmentclass_t
       -> 'b adjustmentclass_t
       -> base class_t
    val getBinWindow : 'a class_t -> base Gdk.WindowClass.t
    val getShadowType : 'a class_t -> shadowtype_t
    val getViewWindow : 'a class_t -> base Gdk.WindowClass.t
    val setShadowType :
      'a class_t
       -> shadowtype_t
       -> unit
    val shadowTypeProp : ('a class_t, shadowtype_t, shadowtype_t) Property.readwrite
  end
