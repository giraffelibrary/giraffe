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
      val getActions_ = call (load_sym libgdk "gdk_drag_context_get_actions") (GObjectObjectClass.PolyML.cPtr --> GdkDragAction.PolyML.cVal)
      val getDestWindow_ = call (load_sym libgdk "gdk_drag_context_get_dest_window") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDevice_ = call (load_sym libgdk "gdk_drag_context_get_device") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getProtocol_ = call (load_sym libgdk "gdk_drag_context_get_protocol") (GObjectObjectClass.PolyML.cPtr --> GdkDragProtocol.PolyML.cVal)
      val getSelectedAction_ = call (load_sym libgdk "gdk_drag_context_get_selected_action") (GObjectObjectClass.PolyML.cPtr --> GdkDragAction.PolyML.cVal)
      val getSourceWindow_ = call (load_sym libgdk "gdk_drag_context_get_source_window") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSuggestedAction_ = call (load_sym libgdk "gdk_drag_context_get_suggested_action") (GObjectObjectClass.PolyML.cPtr --> GdkDragAction.PolyML.cVal)
      val setDevice_ = call (load_sym libgdk "gdk_drag_context_set_device") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
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
