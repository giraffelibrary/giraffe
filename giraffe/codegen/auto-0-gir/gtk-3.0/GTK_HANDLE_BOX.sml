signature GTK_HANDLE_BOX =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a widget_class_t
    type shadow_type_t
    type position_type_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getChildDetached : 'a class_t -> bool
    val getHandlePosition : 'a class_t -> position_type_t
    val getShadowType : 'a class_t -> shadow_type_t
    val getSnapEdge : 'a class_t -> position_type_t
    val setHandlePosition :
      'a class_t
       -> position_type_t
       -> unit
    val setShadowType :
      'a class_t
       -> shadow_type_t
       -> unit
    val setSnapEdge :
      'a class_t
       -> position_type_t
       -> unit
    val childAttachedSig : (base widget_class_t -> unit) -> 'a class_t Signal.signal
    val childDetachedSig : (base widget_class_t -> unit) -> 'a class_t Signal.signal
    val childDetachedProp : ('a class_t, bool) Property.readonly
    val handlePositionProp : ('a class_t, position_type_t, position_type_t) Property.readwrite
    val shadowTypeProp : ('a class_t, shadow_type_t, shadow_type_t) Property.readwrite
    val snapEdgeProp : ('a class_t, position_type_t, position_type_t) Property.readwrite
    val snapEdgeSetProp : ('a class_t, bool, bool) Property.readwrite
  end
