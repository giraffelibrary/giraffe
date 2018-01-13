signature GTK_CONTAINER =
  sig
    type 'a class
    type 'a buildable_class
    type widget_path_t
    type 'a adjustment_class
    type 'a widget_class
    type resize_mode_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val add :
      'a class
       -> 'b widget_class
       -> unit
    val checkResize : 'a class -> unit
    val childGetProperty :
      'a class
       -> 'b widget_class
           * string
           * GObject.ValueRecord.t
       -> unit
    val childNotify :
      'a class
       -> 'b widget_class * string
       -> unit
    val childNotifyByPspec :
      'a class
       -> 'b widget_class * 'c GObject.ParamSpecClass.class
       -> unit
    val childSetProperty :
      'a class
       -> 'b widget_class
           * string
           * GObject.ValueRecord.t
       -> unit
    val childType : 'a class -> GObject.Type.t
    val getBorderWidth : 'a class -> LargeInt.int
    val getFocusChild : 'a class -> base widget_class option
    val getFocusHadjustment : 'a class -> base adjustment_class option
    val getFocusVadjustment : 'a class -> base adjustment_class option
    val getPathForChild :
      'a class
       -> 'b widget_class
       -> widget_path_t
    val getResizeMode : 'a class -> resize_mode_t
    val propagateDraw :
      'a class
       -> 'b widget_class * Cairo.ContextRecord.t
       -> unit
    val remove :
      'a class
       -> 'b widget_class
       -> unit
    val resizeChildren : 'a class -> unit
    val setBorderWidth :
      'a class
       -> LargeInt.int
       -> unit
    val setFocusChild :
      'a class
       -> 'b widget_class option
       -> unit
    val setFocusHadjustment :
      'a class
       -> 'b adjustment_class
       -> unit
    val setFocusVadjustment :
      'a class
       -> 'b adjustment_class
       -> unit
    val setReallocateRedraws :
      'a class
       -> bool
       -> unit
    val setResizeMode :
      'a class
       -> resize_mode_t
       -> unit
    val unsetFocusChain : 'a class -> unit
    val addSig : (base widget_class -> unit) -> 'a class Signal.t
    val checkResizeSig : (unit -> unit) -> 'a class Signal.t
    val removeSig : (base widget_class -> unit) -> 'a class Signal.t
    val setFocusChildSig : (base widget_class option -> unit) -> 'a class Signal.t
    val borderWidthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val childProp : ('a class, 'b widget_class option) Property.writeonly
    val resizeModeProp : ('a class, resize_mode_t, resize_mode_t) Property.readwrite
  end
