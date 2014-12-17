signature GTK_CONTAINER =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type widgetpathrecord_t
    type 'a adjustmentclass_t
    type 'a widgetclass_t
    type resizemode_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val add :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val checkResize : 'a class_t -> unit
    val childGetProperty :
      'a class_t
       -> 'b widgetclass_t
       -> string
       -> GObject.ValueRecord.t
       -> unit
    val childNotify :
      'a class_t
       -> 'b widgetclass_t
       -> string
       -> unit
    val childSetProperty :
      'a class_t
       -> 'b widgetclass_t
       -> string
       -> GObject.ValueRecord.t
       -> unit
    val getBorderWidth : 'a class_t -> LargeInt.int
    val getFocusChild : 'a class_t -> base widgetclass_t option
    val getFocusHadjustment : 'a class_t -> base adjustmentclass_t
    val getFocusVadjustment : 'a class_t -> base adjustmentclass_t
    val getPathForChild :
      'a class_t
       -> 'b widgetclass_t
       -> widgetpathrecord_t
    val getResizeMode : 'a class_t -> resizemode_t
    val propagateDraw :
      'a class_t
       -> 'b widgetclass_t
       -> Cairo.ContextRecord.t
       -> unit
    val remove :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val resizeChildren : 'a class_t -> unit
    val setBorderWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val setFocusChild :
      'a class_t
       -> 'b widgetclass_t option
       -> unit
    val setFocusHadjustment :
      'a class_t
       -> 'b adjustmentclass_t
       -> unit
    val setFocusVadjustment :
      'a class_t
       -> 'b adjustmentclass_t
       -> unit
    val setReallocateRedraws :
      'a class_t
       -> bool
       -> unit
    val setResizeMode :
      'a class_t
       -> resizemode_t
       -> unit
    val unsetFocusChain : 'a class_t -> unit
    val addSig : (base widgetclass_t -> unit) -> 'a class_t Signal.signal
    val checkResizeSig : (unit -> unit) -> 'a class_t Signal.signal
    val removeSig : (base widgetclass_t -> unit) -> 'a class_t Signal.signal
    val setFocusChildSig : (base widgetclass_t option -> unit) -> 'a class_t Signal.signal
    val borderWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val childProp : ('a class_t, 'b widgetclass_t option) Property.writeonly
    val resizeModeProp : ('a class_t, resizemode_t, resizemode_t) Property.readwrite
  end
