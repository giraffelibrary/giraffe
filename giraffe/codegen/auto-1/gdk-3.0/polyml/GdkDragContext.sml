structure GdkDragContext :>
  GDK_DRAG_CONTEXT
    where type 'a class_t = 'a GdkDragContextClass.t
    where type dragprotocol_t = GdkDragProtocol.t
    where type 'a windowclass_t = 'a GdkWindowClass.t
    where type dragaction_t = GdkDragAction.t
    where type 'a deviceclass_t = 'a GdkDeviceClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_drag_context_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getActions_ = call (load_sym libgdk "gdk_drag_context_get_actions") (GObjectObjectClass.PolyML.PTR --> GdkDragAction.PolyML.VAL)
      val getDestWindow_ = call (load_sym libgdk "gdk_drag_context_get_dest_window") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDevice_ = call (load_sym libgdk "gdk_drag_context_get_device") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getProtocol_ = call (load_sym libgdk "gdk_drag_context_get_protocol") (GObjectObjectClass.PolyML.PTR --> GdkDragProtocol.PolyML.VAL)
      val getSelectedAction_ = call (load_sym libgdk "gdk_drag_context_get_selected_action") (GObjectObjectClass.PolyML.PTR --> GdkDragAction.PolyML.VAL)
      val getSourceWindow_ = call (load_sym libgdk "gdk_drag_context_get_source_window") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getSuggestedAction_ = call (load_sym libgdk "gdk_drag_context_get_suggested_action") (GObjectObjectClass.PolyML.PTR --> GdkDragAction.PolyML.VAL)
      val setDevice_ = call (load_sym libgdk "gdk_drag_context_set_device") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GdkDragContextClass.t
    type dragprotocol_t = GdkDragProtocol.t
    type 'a windowclass_t = 'a GdkWindowClass.t
    type dragaction_t = GdkDragAction.t
    type 'a deviceclass_t = 'a GdkDeviceClass.t
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
