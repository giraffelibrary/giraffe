signature GTK_CONTAINER =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type widget_path_record_t
    type 'a adjustment_class_t
    type 'a widget_class_t
    type resize_mode_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val add :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val checkResize : 'a class_t -> unit
    val childGetProperty :
      'a class_t
       -> 'b widget_class_t
       -> string
       -> GObject.ValueRecord.t
       -> unit
    val childNotify :
      'a class_t
       -> 'b widget_class_t
       -> string
       -> unit
    val childSetProperty :
      'a class_t
       -> 'b widget_class_t
       -> string
       -> GObject.ValueRecord.t
       -> unit
    val getBorderWidth : 'a class_t -> LargeInt.int
    val getFocusChild : 'a class_t -> base widget_class_t option
    val getFocusHadjustment : 'a class_t -> base adjustment_class_t
    val getFocusVadjustment : 'a class_t -> base adjustment_class_t
    val getPathForChild :
      'a class_t
       -> 'b widget_class_t
       -> widget_path_record_t
    val getResizeMode : 'a class_t -> resize_mode_t
    val propagateDraw :
      'a class_t
       -> 'b widget_class_t
       -> Cairo.ContextRecord.t
       -> unit
    val remove :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val resizeChildren : 'a class_t -> unit
    val setBorderWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val setFocusChild :
      'a class_t
       -> 'b widget_class_t option
       -> unit
    val setFocusHadjustment :
      'a class_t
       -> 'b adjustment_class_t
       -> unit
    val setFocusVadjustment :
      'a class_t
       -> 'b adjustment_class_t
       -> unit
    val setReallocateRedraws :
      'a class_t
       -> bool
       -> unit
    val setResizeMode :
      'a class_t
       -> resize_mode_t
       -> unit
    val unsetFocusChain : 'a class_t -> unit
    val addSig : (base widget_class_t -> unit) -> 'a class_t Signal.signal
    val checkResizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val removeSig : (base widget_class_t -> unit) -> 'a class_t Signal.signal
    val setFocusChildSig : (base widget_class_t option -> unit) -> 'a class_t Signal.signal
    val borderWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val childProp : ('a class_t, 'b widget_class_t option) Property.writeonly
    val resizeModeProp : ('a class_t, resize_mode_t, resize_mode_t) Property.readwrite
  end
