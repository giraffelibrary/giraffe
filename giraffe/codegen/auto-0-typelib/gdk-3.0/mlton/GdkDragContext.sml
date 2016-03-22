structure GdkDragContext :>
  GDK_DRAG_CONTEXT
    where type 'a class = 'a GdkDragContextClass.class
    where type drag_protocol_t = GdkDragProtocol.t
    where type 'a window_class = 'a GdkWindowClass.class
    where type drag_action_t = GdkDragAction.t
    where type 'a device_class = 'a GdkDeviceClass.class =
  struct
    val getType_ = _import "gdk_drag_context_get_type" : unit -> GObjectType.C.val_;
    val getActions_ = _import "gdk_drag_context_get_actions" : GdkDragContextClass.C.notnull GdkDragContextClass.C.p -> GdkDragAction.C.val_;
    val getDestWindow_ = _import "gdk_drag_context_get_dest_window" : GdkDragContextClass.C.notnull GdkDragContextClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getDevice_ = _import "gdk_drag_context_get_device" : GdkDragContextClass.C.notnull GdkDragContextClass.C.p -> GdkDeviceClass.C.notnull GdkDeviceClass.C.p;
    val getProtocol_ = _import "gdk_drag_context_get_protocol" : GdkDragContextClass.C.notnull GdkDragContextClass.C.p -> GdkDragProtocol.C.val_;
    val getSelectedAction_ = _import "gdk_drag_context_get_selected_action" : GdkDragContextClass.C.notnull GdkDragContextClass.C.p -> GdkDragAction.C.val_;
    val getSourceWindow_ = _import "gdk_drag_context_get_source_window" : GdkDragContextClass.C.notnull GdkDragContextClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getSuggestedAction_ = _import "gdk_drag_context_get_suggested_action" : GdkDragContextClass.C.notnull GdkDragContextClass.C.p -> GdkDragAction.C.val_;
    val setDevice_ = fn x1 & x2 => (_import "gdk_drag_context_set_device" : GdkDragContextClass.C.notnull GdkDragContextClass.C.p * GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GdkDragContextClass.class
    type drag_protocol_t = GdkDragProtocol.t
    type 'a window_class = 'a GdkWindowClass.class
    type drag_action_t = GdkDragAction.t
    type 'a device_class = 'a GdkDeviceClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getActions self = (GdkDragContextClass.C.withPtr ---> GdkDragAction.C.fromVal) getActions_ self
    fun getDestWindow self = (GdkDragContextClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getDestWindow_ self
    fun getDevice self = (GdkDragContextClass.C.withPtr ---> GdkDeviceClass.C.fromPtr false) getDevice_ self
    fun getProtocol self = (GdkDragContextClass.C.withPtr ---> GdkDragProtocol.C.fromVal) getProtocol_ self
    fun getSelectedAction self = (GdkDragContextClass.C.withPtr ---> GdkDragAction.C.fromVal) getSelectedAction_ self
    fun getSourceWindow self = (GdkDragContextClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getSourceWindow_ self
    fun getSuggestedAction self = (GdkDragContextClass.C.withPtr ---> GdkDragAction.C.fromVal) getSuggestedAction_ self
    fun setDevice self device = (GdkDragContextClass.C.withPtr &&&> GdkDeviceClass.C.withPtr ---> I) setDevice_ (self & device)
  end
