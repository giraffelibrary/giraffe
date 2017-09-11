signature GTK_PANED =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type orientation_t
    type 'a widget_class
    type scroll_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : orientation_t -> base class
    val add1 :
      'a class
       -> 'b widget_class
       -> unit
    val add2 :
      'a class
       -> 'b widget_class
       -> unit
    val getChild1 : 'a class -> base widget_class option
    val getChild2 : 'a class -> base widget_class option
    val getHandleWindow : 'a class -> base Gdk.WindowClass.class
    val getPosition : 'a class -> LargeInt.int
    val pack1 :
      'a class
       -> 'b widget_class
           * bool
           * bool
       -> unit
    val pack2 :
      'a class
       -> 'b widget_class
           * bool
           * bool
       -> unit
    val setPosition :
      'a class
       -> LargeInt.int
       -> unit
    val acceptPositionSig : (unit -> bool) -> 'a class Signal.t
    val cancelPositionSig : (unit -> bool) -> 'a class Signal.t
    val cycleChildFocusSig : (bool -> bool) -> 'a class Signal.t
    val cycleHandleFocusSig : (bool -> bool) -> 'a class Signal.t
    val moveHandleSig : (scroll_type_t -> bool) -> 'a class Signal.t
    val toggleHandleFocusSig : (unit -> bool) -> 'a class Signal.t
    val maxPositionProp : ('a class, LargeInt.int) Property.readonly
    val minPositionProp : ('a class, LargeInt.int) Property.readonly
    val positionProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val positionSetProp : ('a class, bool, bool) Property.readwrite
  end
