structure GdkDragContext :>
  GDK_DRAG_CONTEXT
    where type 'a class = 'a GdkDragContextClass.class
    where type drag_protocol_t = GdkDragProtocol.t
    where type 'a window_class = 'a GdkWindowClass.class
    where type 'a device_class = 'a GdkDeviceClass.class
    where type drag_action_t = GdkDragAction.t
    where type drag_cancel_reason_t = GdkDragCancelReason.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_drag_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getActions_ = call (getSymbol "gdk_drag_context_get_actions") (GdkDragContextClass.PolyML.cPtr --> GdkDragAction.PolyML.cVal)
      val getDestWindow_ = call (getSymbol "gdk_drag_context_get_dest_window") (GdkDragContextClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getDevice_ = call (getSymbol "gdk_drag_context_get_device") (GdkDragContextClass.PolyML.cPtr --> GdkDeviceClass.PolyML.cPtr)
      val getDragWindow_ = call (getSymbol "gdk_drag_context_get_drag_window") (GdkDragContextClass.PolyML.cPtr --> GdkWindowClass.PolyML.cOptPtr)
      val getProtocol_ = call (getSymbol "gdk_drag_context_get_protocol") (GdkDragContextClass.PolyML.cPtr --> GdkDragProtocol.PolyML.cVal)
      val getSelectedAction_ = call (getSymbol "gdk_drag_context_get_selected_action") (GdkDragContextClass.PolyML.cPtr --> GdkDragAction.PolyML.cVal)
      val getSourceWindow_ = call (getSymbol "gdk_drag_context_get_source_window") (GdkDragContextClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getSuggestedAction_ = call (getSymbol "gdk_drag_context_get_suggested_action") (GdkDragContextClass.PolyML.cPtr --> GdkDragAction.PolyML.cVal)
      val manageDnd_ =
        call (getSymbol "gdk_drag_context_manage_dnd")
          (
            GdkDragContextClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GdkDragAction.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setDevice_ = call (getSymbol "gdk_drag_context_set_device") (GdkDragContextClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> cVoid)
      val setHotspot_ =
        call (getSymbol "gdk_drag_context_set_hotspot")
          (
            GdkDragContextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GdkDragContextClass.class
    type drag_protocol_t = GdkDragProtocol.t
    type 'a window_class = 'a GdkWindowClass.class
    type 'a device_class = 'a GdkDeviceClass.class
    type drag_action_t = GdkDragAction.t
    type drag_cancel_reason_t = GdkDragCancelReason.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getActions self = (GdkDragContextClass.FFI.withPtr false ---> GdkDragAction.FFI.fromVal) getActions_ self
    fun getDestWindow self = (GdkDragContextClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getDestWindow_ self before GdkDragContextClass.FFI.touchPtr self
    fun getDevice self = (GdkDragContextClass.FFI.withPtr false ---> GdkDeviceClass.FFI.fromPtr false) getDevice_ self before GdkDragContextClass.FFI.touchPtr self
    fun getDragWindow self = (GdkDragContextClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromOptPtr false) getDragWindow_ self before GdkDragContextClass.FFI.touchPtr self
    fun getProtocol self = (GdkDragContextClass.FFI.withPtr false ---> GdkDragProtocol.FFI.fromVal) getProtocol_ self
    fun getSelectedAction self = (GdkDragContextClass.FFI.withPtr false ---> GdkDragAction.FFI.fromVal) getSelectedAction_ self
    fun getSourceWindow self = (GdkDragContextClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getSourceWindow_ self before GdkDragContextClass.FFI.touchPtr self
    fun getSuggestedAction self = (GdkDragContextClass.FFI.withPtr false ---> GdkDragAction.FFI.fromVal) getSuggestedAction_ self
    fun manageDnd self (ipcWindow, actions) =
      (
        GdkDragContextClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withPtr false
         &&&> GdkDragAction.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        manageDnd_
        (
          self
           & ipcWindow
           & actions
        )
    fun setDevice self device = (GdkDragContextClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> I) setDevice_ (self & device)
    fun setHotspot self (hotX, hotY) =
      (
        GdkDragContextClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setHotspot_
        (
          self
           & hotX
           & hotY
        )
    local
      open ClosureMarshal Signal
    in
      fun actionChangedSig f = signal "action-changed" (get 0w1 GdkDragAction.t ---> ret_void) f
      fun cancelSig f = signal "cancel" (get 0w1 GdkDragCancelReason.t ---> ret_void) f
      fun dndFinishedSig f = signal "dnd-finished" (void ---> ret_void) f
      fun dropPerformedSig f = signal "drop-performed" (get 0w1 int ---> ret_void) f
    end
  end
