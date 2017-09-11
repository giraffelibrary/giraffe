signature GTK_HANDLE_BOX =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type shadow_type_t
    type position_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getChildDetached : 'a class -> bool
    val getHandlePosition : 'a class -> position_type_t
    val getShadowType : 'a class -> shadow_type_t
    val getSnapEdge : 'a class -> position_type_t
    val setHandlePosition :
      'a class
       -> position_type_t
       -> unit
    val setShadowType :
      'a class
       -> shadow_type_t
       -> unit
    val setSnapEdge :
      'a class
       -> position_type_t
       -> unit
    val childAttachedSig : (base widget_class -> unit) -> 'a class Signal.t
    val childDetachedSig : (base widget_class -> unit) -> 'a class Signal.t
    val childDetachedProp : ('a class, bool) Property.readonly
    val handlePositionProp : ('a class, position_type_t, position_type_t) Property.readwrite
    val shadowTypeProp : ('a class, shadow_type_t, shadow_type_t) Property.readwrite
    val snapEdgeProp : ('a class, position_type_t, position_type_t) Property.readwrite
    val snapEdgeSetProp : ('a class, bool, bool) Property.readwrite
  end
