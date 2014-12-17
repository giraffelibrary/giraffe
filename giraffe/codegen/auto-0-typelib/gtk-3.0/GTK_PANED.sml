signature GTK_PANED =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a orientableclass_t
    type orientation_t
    type 'a widgetclass_t
    type scrolltype_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val new : orientation_t -> base class_t
    val add1 :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val add2 :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val getChild1 : 'a class_t -> base widgetclass_t option
    val getChild2 : 'a class_t -> base widgetclass_t option
    val getHandleWindow : 'a class_t -> base Gdk.WindowClass.t
    val getPosition : 'a class_t -> LargeInt.int
    val pack1 :
      'a class_t
       -> 'b widgetclass_t
       -> bool
       -> bool
       -> unit
    val pack2 :
      'a class_t
       -> 'b widgetclass_t
       -> bool
       -> bool
       -> unit
    val setPosition :
      'a class_t
       -> LargeInt.int
       -> unit
    val acceptPositionSig : (unit -> bool) -> 'a class_t Signal.signal
    val cancelPositionSig : (unit -> bool) -> 'a class_t Signal.signal
    val cycleChildFocusSig : (bool -> bool) -> 'a class_t Signal.signal
    val cycleHandleFocusSig : (bool -> bool) -> 'a class_t Signal.signal
    val moveHandleSig : (scrolltype_t -> bool) -> 'a class_t Signal.signal
    val toggleHandleFocusSig : (unit -> bool) -> 'a class_t Signal.signal
    val maxPositionProp : ('a class_t, LargeInt.int) Property.readonly
    val minPositionProp : ('a class_t, LargeInt.int) Property.readonly
    val positionProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val positionSetProp : ('a class_t, bool, bool) Property.readwrite
  end
