structure GtkHandleBox :>
  GTK_HANDLE_BOX
    where type 'a class = 'a GtkHandleBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type shadow_type_t = GtkShadowType.t
    where type position_type_t = GtkPositionType.t =
  struct
    val getType_ = _import "gtk_handle_box_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_handle_box_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getChildDetached_ = _import "gtk_handle_box_get_child_detached" : GtkHandleBoxClass.C.notnull GtkHandleBoxClass.C.p -> FFI.Bool.C.val_;
    val getHandlePosition_ = _import "gtk_handle_box_get_handle_position" : GtkHandleBoxClass.C.notnull GtkHandleBoxClass.C.p -> GtkPositionType.C.val_;
    val getShadowType_ = _import "gtk_handle_box_get_shadow_type" : GtkHandleBoxClass.C.notnull GtkHandleBoxClass.C.p -> GtkShadowType.C.val_;
    val getSnapEdge_ = _import "gtk_handle_box_get_snap_edge" : GtkHandleBoxClass.C.notnull GtkHandleBoxClass.C.p -> GtkPositionType.C.val_;
    val setHandlePosition_ = fn x1 & x2 => (_import "gtk_handle_box_set_handle_position" : GtkHandleBoxClass.C.notnull GtkHandleBoxClass.C.p * GtkPositionType.C.val_ -> unit;) (x1, x2)
    val setShadowType_ = fn x1 & x2 => (_import "gtk_handle_box_set_shadow_type" : GtkHandleBoxClass.C.notnull GtkHandleBoxClass.C.p * GtkShadowType.C.val_ -> unit;) (x1, x2)
    val setSnapEdge_ = fn x1 & x2 => (_import "gtk_handle_box_set_snap_edge" : GtkHandleBoxClass.C.notnull GtkHandleBoxClass.C.p * GtkPositionType.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkHandleBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type shadow_type_t = GtkShadowType.t
    type position_type_t = GtkPositionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkHandleBoxClass.C.fromPtr false) new_ ()
    fun getChildDetached self = (GtkHandleBoxClass.C.withPtr ---> FFI.Bool.C.fromVal) getChildDetached_ self
    fun getHandlePosition self = (GtkHandleBoxClass.C.withPtr ---> GtkPositionType.C.fromVal) getHandlePosition_ self
    fun getShadowType self = (GtkHandleBoxClass.C.withPtr ---> GtkShadowType.C.fromVal) getShadowType_ self
    fun getSnapEdge self = (GtkHandleBoxClass.C.withPtr ---> GtkPositionType.C.fromVal) getSnapEdge_ self
    fun setHandlePosition self position = (GtkHandleBoxClass.C.withPtr &&&> GtkPositionType.C.withVal ---> I) setHandlePosition_ (self & position)
    fun setShadowType self type' = (GtkHandleBoxClass.C.withPtr &&&> GtkShadowType.C.withVal ---> I) setShadowType_ (self & type')
    fun setSnapEdge self edge = (GtkHandleBoxClass.C.withPtr &&&> GtkPositionType.C.withVal ---> I) setSnapEdge_ (self & edge)
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
