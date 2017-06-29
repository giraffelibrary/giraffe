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
      val getType_ = call (getSymbol "gtk_handle_box_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_handle_box_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getChildDetached_ = call (getSymbol "gtk_handle_box_get_child_detached") (GtkHandleBoxClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHandlePosition_ = call (getSymbol "gtk_handle_box_get_handle_position") (GtkHandleBoxClass.PolyML.cPtr --> GtkPositionType.PolyML.cVal)
      val getShadowType_ = call (getSymbol "gtk_handle_box_get_shadow_type") (GtkHandleBoxClass.PolyML.cPtr --> GtkShadowType.PolyML.cVal)
      val getSnapEdge_ = call (getSymbol "gtk_handle_box_get_snap_edge") (GtkHandleBoxClass.PolyML.cPtr --> GtkPositionType.PolyML.cVal)
      val setHandlePosition_ = call (getSymbol "gtk_handle_box_set_handle_position") (GtkHandleBoxClass.PolyML.cPtr &&> GtkPositionType.PolyML.cVal --> PolyMLFFI.cVoid)
      val setShadowType_ = call (getSymbol "gtk_handle_box_set_shadow_type") (GtkHandleBoxClass.PolyML.cPtr &&> GtkShadowType.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSnapEdge_ = call (getSymbol "gtk_handle_box_set_snap_edge") (GtkHandleBoxClass.PolyML.cPtr &&> GtkPositionType.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkHandleBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type shadow_type_t = GtkShadowType.t
    type position_type_t = GtkPositionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkHandleBoxClass.FFI.fromPtr false) new_ ()
    fun getChildDetached self = (GtkHandleBoxClass.FFI.withPtr ---> GBool.FFI.fromVal) getChildDetached_ self
    fun getHandlePosition self = (GtkHandleBoxClass.FFI.withPtr ---> GtkPositionType.FFI.fromVal) getHandlePosition_ self
    fun getShadowType self = (GtkHandleBoxClass.FFI.withPtr ---> GtkShadowType.FFI.fromVal) getShadowType_ self
    fun getSnapEdge self = (GtkHandleBoxClass.FFI.withPtr ---> GtkPositionType.FFI.fromVal) getSnapEdge_ self
    fun setHandlePosition self position = (GtkHandleBoxClass.FFI.withPtr &&&> GtkPositionType.FFI.withVal ---> I) setHandlePosition_ (self & position)
    fun setShadowType self type' = (GtkHandleBoxClass.FFI.withPtr &&&> GtkShadowType.FFI.withVal ---> I) setShadowType_ (self & type')
    fun setSnapEdge self edge = (GtkHandleBoxClass.FFI.withPtr &&&> GtkPositionType.FFI.withVal ---> I) setSnapEdge_ (self & edge)
    local
      open ClosureMarshal Signal
    in
      fun childAttachedSig f = signal "child-attached" (get 0w1 GtkWidgetClass.t ---> ret_void) f
      fun childDetachedSig f = signal "child-detached" (get 0w1 GtkWidgetClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val childDetachedProp = {get = fn x => get "child-detached" boolean x}
      val handlePositionProp =
        {
          get = fn x => get "handle-position" GtkPositionType.t x,
          set = fn x => set "handle-position" GtkPositionType.t x
        }
      val shadowTypeProp =
        {
          get = fn x => get "shadow-type" GtkShadowType.t x,
          set = fn x => set "shadow-type" GtkShadowType.t x
        }
      val snapEdgeProp =
        {
          get = fn x => get "snap-edge" GtkPositionType.t x,
          set = fn x => set "snap-edge" GtkPositionType.t x
        }
      val snapEdgeSetProp =
        {
          get = fn x => get "snap-edge-set" boolean x,
          set = fn x => set "snap-edge-set" boolean x
        }
    end
  end
