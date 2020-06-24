structure GdkDragContext :>
  GDK_DRAG_CONTEXT
    where type 'a class = 'a GdkDragContextClass.class
    where type drag_protocol_t = GdkDragProtocol.t
    where type 'a window_class = 'a GdkWindowClass.class
    where type 'a device_class = 'a GdkDeviceClass.class
    where type drag_action_t = GdkDragAction.t
    where type drag_cancel_reason_t = GdkDragCancelReason.t =
  struct
    val getType_ = _import "gdk_drag_context_get_type" : unit -> GObjectType.FFI.val_;
    val getActions_ = _import "gdk_drag_context_get_actions" : GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p -> GdkDragAction.FFI.val_;
    val getDestWindow_ = _import "gdk_drag_context_get_dest_window" : GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val getDevice_ = _import "gdk_drag_context_get_device" : GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p -> GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p;
    val getDragWindow_ = _import "gdk_drag_context_get_drag_window" : GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p -> GdkWindowClass.FFI.opt GdkWindowClass.FFI.p;
    val getProtocol_ = _import "gdk_drag_context_get_protocol" : GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p -> GdkDragProtocol.FFI.val_;
    val getSelectedAction_ = _import "gdk_drag_context_get_selected_action" : GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p -> GdkDragAction.FFI.val_;
    val getSourceWindow_ = _import "gdk_drag_context_get_source_window" : GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val getSuggestedAction_ = _import "gdk_drag_context_get_suggested_action" : GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p -> GdkDragAction.FFI.val_;
    val manageDnd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_drag_context_manage_dnd" :
              GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p
               * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkDragAction.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setDevice_ = fn x1 & x2 => (_import "gdk_drag_context_set_device" : GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p -> unit;) (x1, x2)
    val setHotspot_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_drag_context_set_hotspot" :
              GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GdkDragContextClass.class
    type drag_protocol_t = GdkDragProtocol.t
    type 'a window_class = 'a GdkWindowClass.class
    type 'a device_class = 'a GdkDeviceClass.class
    type drag_action_t = GdkDragAction.t
    type drag_cancel_reason_t = GdkDragCancelReason.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getActions self = (GdkDragContextClass.FFI.withPtr ---> GdkDragAction.FFI.fromVal) getActions_ self
    fun getDestWindow self = (GdkDragContextClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getDestWindow_ self
    fun getDevice self = (GdkDragContextClass.FFI.withPtr ---> GdkDeviceClass.FFI.fromPtr false) getDevice_ self
    fun getDragWindow self = (GdkDragContextClass.FFI.withPtr ---> GdkWindowClass.FFI.fromOptPtr false) getDragWindow_ self
    fun getProtocol self = (GdkDragContextClass.FFI.withPtr ---> GdkDragProtocol.FFI.fromVal) getProtocol_ self
    fun getSelectedAction self = (GdkDragContextClass.FFI.withPtr ---> GdkDragAction.FFI.fromVal) getSelectedAction_ self
    fun getSourceWindow self = (GdkDragContextClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getSourceWindow_ self
    fun getSuggestedAction self = (GdkDragContextClass.FFI.withPtr ---> GdkDragAction.FFI.fromVal) getSuggestedAction_ self
    fun manageDnd self (ipcWindow, actions) =
      (
        GdkDragContextClass.FFI.withPtr
         &&&> GdkWindowClass.FFI.withPtr
         &&&> GdkDragAction.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        manageDnd_
        (
          self
           & ipcWindow
           & actions
        )
    fun setDevice self device = (GdkDragContextClass.FFI.withPtr &&&> GdkDeviceClass.FFI.withPtr ---> I) setDevice_ (self & device)
    fun setHotspot self (hotX, hotY) =
      (
        GdkDragContextClass.FFI.withPtr
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
