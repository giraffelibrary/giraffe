signature GTK_LAYOUT =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a scrollable_class_t
    type 'a adjustment_class_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asScrollable : 'a class_t -> base scrollable_class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a adjustment_class_t option
       -> 'b adjustment_class_t option
       -> base class_t
    val getBinWindow : 'a class_t -> base Gdk.WindowClass.t
    val getSize : 'a class_t -> LargeInt.int * LargeInt.int
    val move :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val put :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setSize :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val heightProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val widthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
