structure GdkDragContext :>
  GDK_DRAG_CONTEXT
    where type 'a class = 'a GdkDragContextClass.class
    where type drag_protocol_t = GdkDragProtocol.t
    where type 'a window_class = 'a GdkWindowClass.class
    where type drag_action_t = GdkDragAction.t
    where type 'a device_class = 'a GdkDeviceClass.class =
  struct
    val getType_ = _import "gdk_drag_context_get_type" : unit -> GObjectType.FFI.val_;
    val getActions_ = _import "gdk_drag_context_get_actions" : GdkDragContextClass.FFI.notnull GdkDragContextClass.FFI.p -> GdkDragAction.FFI.val_;
    val getDestWindow_ = _import "gdk_drag_context_get_dest_window" : GdkDragContextClass.FFI.notnull GdkDragContextClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val getDevice_ = _import "gdk_drag_context_get_device" : GdkDragContextClass.FFI.notnull GdkDragContextClass.FFI.p -> GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p;
    val getProtocol_ = _import "gdk_drag_context_get_protocol" : GdkDragContextClass.FFI.notnull GdkDragContextClass.FFI.p -> GdkDragProtocol.FFI.val_;
    val getSelectedAction_ = _import "gdk_drag_context_get_selected_action" : GdkDragContextClass.FFI.notnull GdkDragContextClass.FFI.p -> GdkDragAction.FFI.val_;
    val getSourceWindow_ = _import "gdk_drag_context_get_source_window" : GdkDragContextClass.FFI.notnull GdkDragContextClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val getSuggestedAction_ = _import "gdk_drag_context_get_suggested_action" : GdkDragContextClass.FFI.notnull GdkDragContextClass.FFI.p -> GdkDragAction.FFI.val_;
    val setDevice_ = fn x1 & x2 => (_import "gdk_drag_context_set_device" : GdkDragContextClass.FFI.notnull GdkDragContextClass.FFI.p * GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GdkDragContextClass.class
    type drag_protocol_t = GdkDragProtocol.t
    type 'a window_class = 'a GdkWindowClass.class
    type drag_action_t = GdkDragAction.t
    type 'a device_class = 'a GdkDeviceClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getActions self = (GdkDragContextClass.FFI.withPtr ---> GdkDragAction.FFI.fromVal) getActions_ self
    fun getDestWindow self = (GdkDragContextClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getDestWindow_ self
    fun getDevice self = (GdkDragContextClass.FFI.withPtr ---> GdkDeviceClass.FFI.fromPtr false) getDevice_ self
    fun getProtocol self = (GdkDragContextClass.FFI.withPtr ---> GdkDragProtocol.FFI.fromVal) getProtocol_ self
    fun getSelectedAction self = (GdkDragContextClass.FFI.withPtr ---> GdkDragAction.FFI.fromVal) getSelectedAction_ self
    fun getSourceWindow self = (GdkDragContextClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getSourceWindow_ self
    fun getSuggestedAction self = (GdkDragContextClass.FFI.withPtr ---> GdkDragAction.FFI.fromVal) getSuggestedAction_ self
    fun setDevice self device = (GdkDragContextClass.FFI.withPtr &&&> GdkDeviceClass.FFI.withPtr ---> I) setDevice_ (self & device)
  end
