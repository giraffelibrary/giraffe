structure GdkDragContext :>
  GDK_DRAG_CONTEXT
    where type 'a class = 'a GdkDragContextClass.class
    where type drag_protocol_t = GdkDragProtocol.t
    where type 'a window_class = 'a GdkWindowClass.class
    where type drag_action_t = GdkDragAction.t
    where type 'a device_class = 'a GdkDeviceClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_drag_context_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getActions_ = call (load_sym libgdk "gdk_drag_context_get_actions") (GdkDragContextClass.PolyML.cPtr --> GdkDragAction.PolyML.cVal)
      val getDestWindow_ = call (load_sym libgdk "gdk_drag_context_get_dest_window") (GdkDragContextClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getDevice_ = call (load_sym libgdk "gdk_drag_context_get_device") (GdkDragContextClass.PolyML.cPtr --> GdkDeviceClass.PolyML.cPtr)
      val getProtocol_ = call (load_sym libgdk "gdk_drag_context_get_protocol") (GdkDragContextClass.PolyML.cPtr --> GdkDragProtocol.PolyML.cVal)
      val getSelectedAction_ = call (load_sym libgdk "gdk_drag_context_get_selected_action") (GdkDragContextClass.PolyML.cPtr --> GdkDragAction.PolyML.cVal)
      val getSourceWindow_ = call (load_sym libgdk "gdk_drag_context_get_source_window") (GdkDragContextClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getSuggestedAction_ = call (load_sym libgdk "gdk_drag_context_get_suggested_action") (GdkDragContextClass.PolyML.cPtr --> GdkDragAction.PolyML.cVal)
      val setDevice_ = call (load_sym libgdk "gdk_drag_context_set_device") (GdkDragContextClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
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
