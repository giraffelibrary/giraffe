structure GtkHandleBox :>
  GTK_HANDLE_BOX
    where type 'a class = 'a GtkHandleBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type shadow_type_t = GtkShadowType.t
    where type position_type_t = GtkPositionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_handle_box_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_handle_box_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getChildDetached_ = call (getSymbol "gtk_handle_box_get_child_detached") (GtkHandleBoxClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHandlePosition_ = call (getSymbol "gtk_handle_box_get_handle_position") (GtkHandleBoxClass.PolyML.cPtr --> GtkPositionType.PolyML.cVal)
      val getShadowType_ = call (getSymbol "gtk_handle_box_get_shadow_type") (GtkHandleBoxClass.PolyML.cPtr --> GtkShadowType.PolyML.cVal)
      val getSnapEdge_ = call (getSymbol "gtk_handle_box_get_snap_edge") (GtkHandleBoxClass.PolyML.cPtr --> GtkPositionType.PolyML.cVal)
      val setHandlePosition_ = call (getSymbol "gtk_handle_box_set_handle_position") (GtkHandleBoxClass.PolyML.cPtr &&> GtkPositionType.PolyML.cVal --> cVoid)
      val setShadowType_ = call (getSymbol "gtk_handle_box_set_shadow_type") (GtkHandleBoxClass.PolyML.cPtr &&> GtkShadowType.PolyML.cVal --> cVoid)
      val setSnapEdge_ = call (getSymbol "gtk_handle_box_set_snap_edge") (GtkHandleBoxClass.PolyML.cPtr &&> GtkPositionType.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkHandleBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type shadow_type_t = GtkShadowType.t
    type position_type_t = GtkPositionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkHandleBoxClass.FFI.fromPtr false) new_ ()
    fun getChildDetached self = (GtkHandleBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getChildDetached_ self
    fun getHandlePosition self = (GtkHandleBoxClass.FFI.withPtr false ---> GtkPositionType.FFI.fromVal) getHandlePosition_ self
    fun getShadowType self = (GtkHandleBoxClass.FFI.withPtr false ---> GtkShadowType.FFI.fromVal) getShadowType_ self
    fun getSnapEdge self = (GtkHandleBoxClass.FFI.withPtr false ---> GtkPositionType.FFI.fromVal) getSnapEdge_ self
    fun setHandlePosition self position = (GtkHandleBoxClass.FFI.withPtr false &&&> GtkPositionType.FFI.withVal ---> I) setHandlePosition_ (self & position)
    fun setShadowType self type' = (GtkHandleBoxClass.FFI.withPtr false &&&> GtkShadowType.FFI.withVal ---> I) setShadowType_ (self & type')
    fun setSnapEdge self edge = (GtkHandleBoxClass.FFI.withPtr false &&&> GtkPositionType.FFI.withVal ---> I) setSnapEdge_ (self & edge)
    local
      open ClosureMarshal Signal
    in
      fun childAttachedSig f = signal "child-attached" (get 0w1 GtkWidgetClass.t ---> ret_void) f
      fun childDetachedSig f = signal "child-detached" (get 0w1 GtkWidgetClass.t ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val childDetachedProp =
        {
          name = "child-detached",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val handlePositionProp =
        {
          name = "handle-position",
          gtype = fn () => C.gtype GtkPositionType.t (),
          get = fn x => fn () => C.get GtkPositionType.t x,
          set = fn x => C.set GtkPositionType.t x,
          init = fn x => C.set GtkPositionType.t x
        }
      val shadowTypeProp =
        {
          name = "shadow-type",
          gtype = fn () => C.gtype GtkShadowType.t (),
          get = fn x => fn () => C.get GtkShadowType.t x,
          set = fn x => C.set GtkShadowType.t x,
          init = fn x => C.set GtkShadowType.t x
        }
      val snapEdgeProp =
        {
          name = "snap-edge",
          gtype = fn () => C.gtype GtkPositionType.t (),
          get = fn x => fn () => C.get GtkPositionType.t x,
          set = fn x => C.set GtkPositionType.t x,
          init = fn x => C.set GtkPositionType.t x
        }
      val snapEdgeSetProp =
        {
          name = "snap-edge-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
