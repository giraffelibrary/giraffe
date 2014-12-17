signature GTK_LAYOUT =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a scrollableclass_t
    type 'a adjustmentclass_t
    type 'a widgetclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asScrollable : 'a class_t -> base scrollableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a adjustmentclass_t option
       -> 'b adjustmentclass_t option
       -> base class_t
    val getBinWindow : 'a class_t -> base Gdk.WindowClass.t
    val getSize : 'a class_t -> LargeInt.int * LargeInt.int
    val move :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val put :
      'a class_t
       -> 'b widgetclass_t
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
