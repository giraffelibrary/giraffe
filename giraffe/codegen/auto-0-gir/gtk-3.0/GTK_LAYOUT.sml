signature GTK_LAYOUT =
  sig
    type 'a class
    type 'a buildable_class
    type 'a scrollable_class
    type 'a adjustment_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asScrollable : 'a class -> base scrollable_class
    val getType : unit -> GObject.Type.t
    val new : 'a adjustment_class option * 'b adjustment_class option -> base class
    val getBinWindow : 'a class -> base Gdk.WindowClass.class
    val getSize : 'a class -> LargeInt.int * LargeInt.int
    val move :
      'a class
       -> 'b widget_class
           * LargeInt.int
           * LargeInt.int
       -> unit
    val put :
      'a class
       -> 'b widget_class
           * LargeInt.int
           * LargeInt.int
       -> unit
    val setSize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val heightProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val widthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
