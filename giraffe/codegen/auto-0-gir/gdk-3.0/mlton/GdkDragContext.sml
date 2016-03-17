structure GdkDragContext :>
  GDK_DRAG_CONTEXT
    where type 'a class = 'a GdkDragContextClass.class
    where type drag_protocol_t = GdkDragProtocol.t
    where type 'a window_class = 'a GdkWindowClass.class
    where type drag_action_t = GdkDragAction.t
    where type 'a device_class = 'a GdkDeviceClass.class =
  struct
    val getType_ = _import "gdk_drag_context_get_type" : unit -> GObjectType.C.val_;
    val getActions_ = _import "gdk_drag_context_get_actions" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkDragAction.C.val_;
    val getDestWindow_ = _import "gdk_drag_context_get_dest_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDevice_ = _import "gdk_drag_context_get_device" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getProtocol_ = _import "gdk_drag_context_get_protocol" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkDragProtocol.C.val_;
    val getSelectedAction_ = _import "gdk_drag_context_get_selected_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkDragAction.C.val_;
    val getSourceWindow_ = _import "gdk_drag_context_get_source_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSuggestedAction_ = _import "gdk_drag_context_get_suggested_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkDragAction.C.val_;
    val setDevice_ = fn x1 & x2 => (_import "gdk_drag_context_set_device" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GdkDragContextClass.class
    type drag_protocol_t = GdkDragProtocol.t
    type 'a window_class = 'a GdkWindowClass.class
    type drag_action_t = GdkDragAction.t
    type 'a device_class = 'a GdkDeviceClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getActions self = (GObjectObjectClass.C.withPtr ---> GdkDragAction.C.fromVal) getActions_ self
    fun getDestWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getDestWindow_ self
    fun getDevice self = (GObjectObjectClass.C.withPtr ---> GdkDeviceClass.C.fromPtr false) getDevice_ self
    fun getProtocol self = (GObjectObjectClass.C.withPtr ---> GdkDragProtocol.C.fromVal) getProtocol_ self
    fun getSelectedAction self = (GObjectObjectClass.C.withPtr ---> GdkDragAction.C.fromVal) getSelectedAction_ self
    fun getSourceWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getSourceWindow_ self
    fun getSuggestedAction self = (GObjectObjectClass.C.withPtr ---> GdkDragAction.C.fromVal) getSuggestedAction_ self
    fun setDevice self device = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setDevice_ (self & device)
  end
