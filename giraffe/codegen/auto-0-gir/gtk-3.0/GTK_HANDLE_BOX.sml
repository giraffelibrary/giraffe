signature GTK_HANDLE_BOX =
  sig
    type 'a class_t
    type positiontype_t
    type shadowtype_t
    type 'a widgetclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getChildDetached : 'a class_t -> bool
    val getHandlePosition : 'a class_t -> positiontype_t
    val getShadowType : 'a class_t -> shadowtype_t
    val getSnapEdge : 'a class_t -> positiontype_t
    val setHandlePosition :
      'a class_t
       -> positiontype_t
       -> unit
    val setShadowType :
      'a class_t
       -> shadowtype_t
       -> unit
    val setSnapEdge :
      'a class_t
       -> positiontype_t
       -> unit
    val childAttachedSig : (base widgetclass_t -> unit) -> 'a class_t Signal.signal
    val childDetachedSig : (base widgetclass_t -> unit) -> 'a class_t Signal.signal
    val childDetachedProp : ('a class_t, bool) Property.readonly
    val handlePositionProp : ('a class_t, positiontype_t, positiontype_t) Property.readwrite
    val shadowTypeProp : ('a class_t, shadowtype_t, shadowtype_t) Property.readwrite
    val snapEdgeProp : ('a class_t, positiontype_t, positiontype_t) Property.readwrite
    val snapEdgeSetProp : ('a class_t, bool, bool) Property.readwrite
  end
