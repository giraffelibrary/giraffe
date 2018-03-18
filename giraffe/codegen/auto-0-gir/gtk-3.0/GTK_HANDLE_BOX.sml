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
    val childDetachedProp : {get : 'a class -> bool}
    val handlePositionProp :
      {
        get : 'a class -> position_type_t,
        set :
          position_type_t
           -> 'a class
           -> unit,
        new : position_type_t -> 'a class Property.t
      }
    val shadowTypeProp :
      {
        get : 'a class -> shadow_type_t,
        set :
          shadow_type_t
           -> 'a class
           -> unit,
        new : shadow_type_t -> 'a class Property.t
      }
    val snapEdgeProp :
      {
        get : 'a class -> position_type_t,
        set :
          position_type_t
           -> 'a class
           -> unit,
        new : position_type_t -> 'a class Property.t
      }
    val snapEdgeSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
