structure GtkWindow :>
  GTK_WINDOW
    where type 'a class = 'a GtkWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a window_group_class = 'a GtkWindowGroupClass.class
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a application_class = 'a GtkApplicationClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type window_type_t = GtkWindowType.t
    where type window_position_t = GtkWindowPosition.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_window_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_window_new") (GtkWindowType.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val getDefaultIconName_ = call (getSymbol "gtk_window_get_default_icon_name") (cVoid --> Utf8.PolyML.cOutPtr)
      val setAutoStartupNotification_ = call (getSymbol "gtk_window_set_auto_startup_notification") (GBool.PolyML.cVal --> cVoid)
      val setDefaultIcon_ = call (getSymbol "gtk_window_set_default_icon") (GdkPixbufPixbufClass.PolyML.cPtr --> cVoid)
      val setDefaultIconFromFile_ = call (getSymbol "gtk_window_set_default_icon_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val setDefaultIconName_ = call (getSymbol "gtk_window_set_default_icon_name") (Utf8.PolyML.cInPtr --> cVoid)
      val setInteractiveDebugging_ = call (getSymbol "gtk_window_set_interactive_debugging") (GBool.PolyML.cVal --> cVoid)
      val activateDefault_ = call (getSymbol "gtk_window_activate_default") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val activateFocus_ = call (getSymbol "gtk_window_activate_focus") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val activateKey_ = call (getSymbol "gtk_window_activate_key") (GtkWindowClass.PolyML.cPtr &&> GdkEventKeyRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val addAccelGroup_ = call (getSymbol "gtk_window_add_accel_group") (GtkWindowClass.PolyML.cPtr &&> GtkAccelGroupClass.PolyML.cPtr --> cVoid)
      val addMnemonic_ =
        call (getSymbol "gtk_window_add_mnemonic")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cPtr
             --> cVoid
          )
      val beginMoveDrag_ =
        call (getSymbol "gtk_window_begin_move_drag")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val beginResizeDrag_ =
        call (getSymbol "gtk_window_begin_resize_drag")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GdkWindowEdge.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val close_ = call (getSymbol "gtk_window_close") (GtkWindowClass.PolyML.cPtr --> cVoid)
      val deiconify_ = call (getSymbol "gtk_window_deiconify") (GtkWindowClass.PolyML.cPtr --> cVoid)
      val fullscreen_ = call (getSymbol "gtk_window_fullscreen") (GtkWindowClass.PolyML.cPtr --> cVoid)
      val fullscreenOnMonitor_ =
        call (getSymbol "gtk_window_fullscreen_on_monitor")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GdkScreenClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val getAcceptFocus_ = call (getSymbol "gtk_window_get_accept_focus") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getApplication_ = call (getSymbol "gtk_window_get_application") (GtkWindowClass.PolyML.cPtr --> GtkApplicationClass.PolyML.cOptPtr)
      val getAttachedTo_ = call (getSymbol "gtk_window_get_attached_to") (GtkWindowClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getDecorated_ = call (getSymbol "gtk_window_get_decorated") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDefaultSize_ =
        call (getSymbol "gtk_window_get_default_size")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getDefaultWidget_ = call (getSymbol "gtk_window_get_default_widget") (GtkWindowClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getDeletable_ = call (getSymbol "gtk_window_get_deletable") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDestroyWithParent_ = call (getSymbol "gtk_window_get_destroy_with_parent") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFocus_ = call (getSymbol "gtk_window_get_focus") (GtkWindowClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getFocusOnMap_ = call (getSymbol "gtk_window_get_focus_on_map") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFocusVisible_ = call (getSymbol "gtk_window_get_focus_visible") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getGravity_ = call (getSymbol "gtk_window_get_gravity") (GtkWindowClass.PolyML.cPtr --> GdkGravity.PolyML.cVal)
      val getGroup_ = call (getSymbol "gtk_window_get_group") (GtkWindowClass.PolyML.cPtr --> GtkWindowGroupClass.PolyML.cPtr)
      val getHasResizeGrip_ = call (getSymbol "gtk_window_get_has_resize_grip") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHideTitlebarWhenMaximized_ = call (getSymbol "gtk_window_get_hide_titlebar_when_maximized") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIcon_ = call (getSymbol "gtk_window_get_icon") (GtkWindowClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getIconName_ = call (getSymbol "gtk_window_get_icon_name") (GtkWindowClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getMnemonicModifier_ = call (getSymbol "gtk_window_get_mnemonic_modifier") (GtkWindowClass.PolyML.cPtr --> GdkModifierType.PolyML.cVal)
      val getMnemonicsVisible_ = call (getSymbol "gtk_window_get_mnemonics_visible") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getModal_ = call (getSymbol "gtk_window_get_modal") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getOpacity_ = call (getSymbol "gtk_window_get_opacity") (GtkWindowClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getPosition_ =
        call (getSymbol "gtk_window_get_position")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getResizable_ = call (getSymbol "gtk_window_get_resizable") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getResizeGripArea_ = call (getSymbol "gtk_window_get_resize_grip_area") (GtkWindowClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRole_ = call (getSymbol "gtk_window_get_role") (GtkWindowClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getScreen_ = call (getSymbol "gtk_window_get_screen") (GtkWindowClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getSize_ =
        call (getSymbol "gtk_window_get_size")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getSkipPagerHint_ = call (getSymbol "gtk_window_get_skip_pager_hint") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSkipTaskbarHint_ = call (getSymbol "gtk_window_get_skip_taskbar_hint") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTitle_ = call (getSymbol "gtk_window_get_title") (GtkWindowClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getTitlebar_ = call (getSymbol "gtk_window_get_titlebar") (GtkWindowClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getTransientFor_ = call (getSymbol "gtk_window_get_transient_for") (GtkWindowClass.PolyML.cPtr --> GtkWindowClass.PolyML.cOptPtr)
      val getTypeHint_ = call (getSymbol "gtk_window_get_type_hint") (GtkWindowClass.PolyML.cPtr --> GdkWindowTypeHint.PolyML.cVal)
      val getUrgencyHint_ = call (getSymbol "gtk_window_get_urgency_hint") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getWindowType_ = call (getSymbol "gtk_window_get_window_type") (GtkWindowClass.PolyML.cPtr --> GtkWindowType.PolyML.cVal)
      val hasGroup_ = call (getSymbol "gtk_window_has_group") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hasToplevelFocus_ = call (getSymbol "gtk_window_has_toplevel_focus") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val iconify_ = call (getSymbol "gtk_window_iconify") (GtkWindowClass.PolyML.cPtr --> cVoid)
      val isActive_ = call (getSymbol "gtk_window_is_active") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isMaximized_ = call (getSymbol "gtk_window_is_maximized") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val maximize_ = call (getSymbol "gtk_window_maximize") (GtkWindowClass.PolyML.cPtr --> cVoid)
      val mnemonicActivate_ =
        call (getSymbol "gtk_window_mnemonic_activate")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val move_ =
        call (getSymbol "gtk_window_move")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val parseGeometry_ = call (getSymbol "gtk_window_parse_geometry") (GtkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val present_ = call (getSymbol "gtk_window_present") (GtkWindowClass.PolyML.cPtr --> cVoid)
      val presentWithTime_ = call (getSymbol "gtk_window_present_with_time") (GtkWindowClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val propagateKeyEvent_ = call (getSymbol "gtk_window_propagate_key_event") (GtkWindowClass.PolyML.cPtr &&> GdkEventKeyRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val removeAccelGroup_ = call (getSymbol "gtk_window_remove_accel_group") (GtkWindowClass.PolyML.cPtr &&> GtkAccelGroupClass.PolyML.cPtr --> cVoid)
      val removeMnemonic_ =
        call (getSymbol "gtk_window_remove_mnemonic")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cPtr
             --> cVoid
          )
      val reshowWithInitialSize_ = call (getSymbol "gtk_window_reshow_with_initial_size") (GtkWindowClass.PolyML.cPtr --> cVoid)
      val resize_ =
        call (getSymbol "gtk_window_resize")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val resizeGripIsVisible_ = call (getSymbol "gtk_window_resize_grip_is_visible") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val resizeToGeometry_ =
        call (getSymbol "gtk_window_resize_to_geometry")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setAcceptFocus_ = call (getSymbol "gtk_window_set_accept_focus") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setApplication_ = call (getSymbol "gtk_window_set_application") (GtkWindowClass.PolyML.cPtr &&> GtkApplicationClass.PolyML.cOptPtr --> cVoid)
      val setAttachedTo_ = call (getSymbol "gtk_window_set_attached_to") (GtkWindowClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setDecorated_ = call (getSymbol "gtk_window_set_decorated") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setDefault_ = call (getSymbol "gtk_window_set_default") (GtkWindowClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setDefaultGeometry_ =
        call (getSymbol "gtk_window_set_default_geometry")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setDefaultSize_ =
        call (getSymbol "gtk_window_set_default_size")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setDeletable_ = call (getSymbol "gtk_window_set_deletable") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setDestroyWithParent_ = call (getSymbol "gtk_window_set_destroy_with_parent") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setFocus_ = call (getSymbol "gtk_window_set_focus") (GtkWindowClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setFocusOnMap_ = call (getSymbol "gtk_window_set_focus_on_map") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setFocusVisible_ = call (getSymbol "gtk_window_set_focus_visible") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setGeometryHints_ =
        call (getSymbol "gtk_window_set_geometry_hints")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> GdkGeometryRecord.PolyML.cOptPtr
             &&> GdkWindowHints.PolyML.cVal
             --> cVoid
          )
      val setGravity_ = call (getSymbol "gtk_window_set_gravity") (GtkWindowClass.PolyML.cPtr &&> GdkGravity.PolyML.cVal --> cVoid)
      val setHasResizeGrip_ = call (getSymbol "gtk_window_set_has_resize_grip") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setHasUserRefCount_ = call (getSymbol "gtk_window_set_has_user_ref_count") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setHideTitlebarWhenMaximized_ = call (getSymbol "gtk_window_set_hide_titlebar_when_maximized") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setIcon_ = call (getSymbol "gtk_window_set_icon") (GtkWindowClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> cVoid)
      val setIconFromFile_ =
        call (getSymbol "gtk_window_set_icon_from_file")
          (
            GtkWindowClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setIconName_ = call (getSymbol "gtk_window_set_icon_name") (GtkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setKeepAbove_ = call (getSymbol "gtk_window_set_keep_above") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setKeepBelow_ = call (getSymbol "gtk_window_set_keep_below") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMnemonicModifier_ = call (getSymbol "gtk_window_set_mnemonic_modifier") (GtkWindowClass.PolyML.cPtr &&> GdkModifierType.PolyML.cVal --> cVoid)
      val setMnemonicsVisible_ = call (getSymbol "gtk_window_set_mnemonics_visible") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setModal_ = call (getSymbol "gtk_window_set_modal") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setOpacity_ = call (getSymbol "gtk_window_set_opacity") (GtkWindowClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setPosition_ = call (getSymbol "gtk_window_set_position") (GtkWindowClass.PolyML.cPtr &&> GtkWindowPosition.PolyML.cVal --> cVoid)
      val setResizable_ = call (getSymbol "gtk_window_set_resizable") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRole_ = call (getSymbol "gtk_window_set_role") (GtkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setScreen_ = call (getSymbol "gtk_window_set_screen") (GtkWindowClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> cVoid)
      val setSkipPagerHint_ = call (getSymbol "gtk_window_set_skip_pager_hint") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSkipTaskbarHint_ = call (getSymbol "gtk_window_set_skip_taskbar_hint") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setStartupId_ = call (getSymbol "gtk_window_set_startup_id") (GtkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setTitle_ = call (getSymbol "gtk_window_set_title") (GtkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setTitlebar_ = call (getSymbol "gtk_window_set_titlebar") (GtkWindowClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setTransientFor_ = call (getSymbol "gtk_window_set_transient_for") (GtkWindowClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cOptPtr --> cVoid)
      val setTypeHint_ = call (getSymbol "gtk_window_set_type_hint") (GtkWindowClass.PolyML.cPtr &&> GdkWindowTypeHint.PolyML.cVal --> cVoid)
      val setUrgencyHint_ = call (getSymbol "gtk_window_set_urgency_hint") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setWmclass_ =
        call (getSymbol "gtk_window_set_wmclass")
          (
            GtkWindowClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val stick_ = call (getSymbol "gtk_window_stick") (GtkWindowClass.PolyML.cPtr --> cVoid)
      val unfullscreen_ = call (getSymbol "gtk_window_unfullscreen") (GtkWindowClass.PolyML.cPtr --> cVoid)
      val unmaximize_ = call (getSymbol "gtk_window_unmaximize") (GtkWindowClass.PolyML.cPtr --> cVoid)
      val unstick_ = call (getSymbol "gtk_window_unstick") (GtkWindowClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a window_group_class = 'a GtkWindowGroupClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a application_class = 'a GtkApplicationClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type window_type_t = GtkWindowType.t
    type window_position_t = GtkWindowPosition.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new type' = (GtkWindowType.FFI.withVal ---> GtkWindowClass.FFI.fromPtr false) new_ type'
    fun getDefaultIconName () = (I ---> Utf8.FFI.fromPtr 0) getDefaultIconName_ ()
    fun setAutoStartupNotification setting = (GBool.FFI.withVal ---> I) setAutoStartupNotification_ setting
    fun setDefaultIcon icon = (GdkPixbufPixbufClass.FFI.withPtr false ---> I) setDefaultIcon_ icon
    fun setDefaultIconFromFile filename = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> ignore) setDefaultIconFromFile_ (filename & [])
    fun setDefaultIconName name = (Utf8.FFI.withPtr 0 ---> I) setDefaultIconName_ name
    fun setInteractiveDebugging enable = (GBool.FFI.withVal ---> I) setInteractiveDebugging_ enable
    fun activateDefault self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) activateDefault_ self
    fun activateFocus self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) activateFocus_ self
    fun activateKey self event = (GtkWindowClass.FFI.withPtr false &&&> GdkEventKeyRecord.FFI.withPtr false ---> GBool.FFI.fromVal) activateKey_ (self & event)
    fun addAccelGroup self accelGroup = (GtkWindowClass.FFI.withPtr false &&&> GtkAccelGroupClass.FFI.withPtr false ---> I) addAccelGroup_ (self & accelGroup)
    fun addMnemonic self (keyval, target) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GtkWidgetClass.FFI.withPtr false
         ---> I
      )
        addMnemonic_
        (
          self
           & keyval
           & target
        )
    fun beginMoveDrag
      self
      (
        button,
        rootX,
        rootY,
        timestamp
      ) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        beginMoveDrag_
        (
          self
           & button
           & rootX
           & rootY
           & timestamp
        )
    fun beginResizeDrag
      self
      (
        edge,
        button,
        rootX,
        rootY,
        timestamp
      ) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GdkWindowEdge.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        beginResizeDrag_
        (
          self
           & edge
           & button
           & rootX
           & rootY
           & timestamp
        )
    fun close self = (GtkWindowClass.FFI.withPtr false ---> I) close_ self
    fun deiconify self = (GtkWindowClass.FFI.withPtr false ---> I) deiconify_ self
    fun fullscreen self = (GtkWindowClass.FFI.withPtr false ---> I) fullscreen_ self
    fun fullscreenOnMonitor self (screen, monitor) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GdkScreenClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        fullscreenOnMonitor_
        (
          self
           & screen
           & monitor
        )
    fun getAcceptFocus self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAcceptFocus_ self
    fun getApplication self = (GtkWindowClass.FFI.withPtr false ---> GtkApplicationClass.FFI.fromOptPtr false) getApplication_ self before GtkWindowClass.FFI.touchPtr self
    fun getAttachedTo self = (GtkWindowClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getAttachedTo_ self before GtkWindowClass.FFI.touchPtr self
    fun getDecorated self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDecorated_ self
    fun getDefaultSize self =
      let
        val width
         & height
         & () =
          (
            GtkWindowClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getDefaultSize_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (width, height)
      end
    fun getDefaultWidget self = (GtkWindowClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getDefaultWidget_ self before GtkWindowClass.FFI.touchPtr self
    fun getDeletable self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDeletable_ self
    fun getDestroyWithParent self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDestroyWithParent_ self
    fun getFocus self = (GtkWindowClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getFocus_ self before GtkWindowClass.FFI.touchPtr self
    fun getFocusOnMap self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFocusOnMap_ self
    fun getFocusVisible self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFocusVisible_ self
    fun getGravity self = (GtkWindowClass.FFI.withPtr false ---> GdkGravity.FFI.fromVal) getGravity_ self
    fun getGroup self = (GtkWindowClass.FFI.withPtr false ---> GtkWindowGroupClass.FFI.fromPtr false) getGroup_ self before GtkWindowClass.FFI.touchPtr self
    fun getHasResizeGrip self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasResizeGrip_ self
    fun getHideTitlebarWhenMaximized self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHideTitlebarWhenMaximized_ self
    fun getIcon self = (GtkWindowClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr false) getIcon_ self before GtkWindowClass.FFI.touchPtr self
    fun getIconName self = (GtkWindowClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getIconName_ self before GtkWindowClass.FFI.touchPtr self
    fun getMnemonicModifier self = (GtkWindowClass.FFI.withPtr false ---> GdkModifierType.FFI.fromVal) getMnemonicModifier_ self
    fun getMnemonicsVisible self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getMnemonicsVisible_ self
    fun getModal self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getModal_ self
    fun getOpacity self = (GtkWindowClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getOpacity_ self
    fun getPosition self =
      let
        val rootX
         & rootY
         & () =
          (
            GtkWindowClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPosition_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (rootX, rootY)
      end
    fun getResizable self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getResizable_ self
    fun getResizeGripArea self =
      let
        val rect & retVal = (GtkWindowClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal) getResizeGripArea_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun getRole self = (GtkWindowClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getRole_ self before GtkWindowClass.FFI.touchPtr self
    fun getScreen self = (GtkWindowClass.FFI.withPtr false ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self before GtkWindowClass.FFI.touchPtr self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GtkWindowClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getSize_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (width, height)
      end
    fun getSkipPagerHint self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSkipPagerHint_ self
    fun getSkipTaskbarHint self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSkipTaskbarHint_ self
    fun getTitle self = (GtkWindowClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getTitle_ self before GtkWindowClass.FFI.touchPtr self
    fun getTitlebar self = (GtkWindowClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getTitlebar_ self before GtkWindowClass.FFI.touchPtr self
    fun getTransientFor self = (GtkWindowClass.FFI.withPtr false ---> GtkWindowClass.FFI.fromOptPtr false) getTransientFor_ self before GtkWindowClass.FFI.touchPtr self
    fun getTypeHint self = (GtkWindowClass.FFI.withPtr false ---> GdkWindowTypeHint.FFI.fromVal) getTypeHint_ self
    fun getUrgencyHint self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUrgencyHint_ self
    fun getWindowType self = (GtkWindowClass.FFI.withPtr false ---> GtkWindowType.FFI.fromVal) getWindowType_ self
    fun hasGroup self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasGroup_ self
    fun hasToplevelFocus self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasToplevelFocus_ self
    fun iconify self = (GtkWindowClass.FFI.withPtr false ---> I) iconify_ self
    fun isActive self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) isActive_ self
    fun isMaximized self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) isMaximized_ self
    fun maximize self = (GtkWindowClass.FFI.withPtr false ---> I) maximize_ self
    fun mnemonicActivate self (keyval, modifier) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        mnemonicActivate_
        (
          self
           & keyval
           & modifier
        )
    fun move self (x, y) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        move_
        (
          self
           & x
           & y
        )
    fun parseGeometry self geometry = (GtkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) parseGeometry_ (self & geometry)
    fun present self = (GtkWindowClass.FFI.withPtr false ---> I) present_ self
    fun presentWithTime self timestamp = (GtkWindowClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) presentWithTime_ (self & timestamp)
    fun propagateKeyEvent self event = (GtkWindowClass.FFI.withPtr false &&&> GdkEventKeyRecord.FFI.withPtr false ---> GBool.FFI.fromVal) propagateKeyEvent_ (self & event)
    fun removeAccelGroup self accelGroup = (GtkWindowClass.FFI.withPtr false &&&> GtkAccelGroupClass.FFI.withPtr false ---> I) removeAccelGroup_ (self & accelGroup)
    fun removeMnemonic self (keyval, target) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GtkWidgetClass.FFI.withPtr false
         ---> I
      )
        removeMnemonic_
        (
          self
           & keyval
           & target
        )
    fun reshowWithInitialSize self = (GtkWindowClass.FFI.withPtr false ---> I) reshowWithInitialSize_ self
    fun resize self (width, height) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        resize_
        (
          self
           & width
           & height
        )
    fun resizeGripIsVisible self = (GtkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) resizeGripIsVisible_ self
    fun resizeToGeometry self (width, height) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        resizeToGeometry_
        (
          self
           & width
           & height
        )
    fun setAcceptFocus self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAcceptFocus_ (self & setting)
    fun setApplication self application = (GtkWindowClass.FFI.withPtr false &&&> GtkApplicationClass.FFI.withOptPtr false ---> I) setApplication_ (self & application)
    fun setAttachedTo self attachWidget = (GtkWindowClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setAttachedTo_ (self & attachWidget)
    fun setDecorated self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setDecorated_ (self & setting)
    fun setDefault self defaultWidget = (GtkWindowClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setDefault_ (self & defaultWidget)
    fun setDefaultGeometry self (width, height) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setDefaultGeometry_
        (
          self
           & width
           & height
        )
    fun setDefaultSize self (width, height) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setDefaultSize_
        (
          self
           & width
           & height
        )
    fun setDeletable self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setDeletable_ (self & setting)
    fun setDestroyWithParent self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setDestroyWithParent_ (self & setting)
    fun setFocus self focus = (GtkWindowClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setFocus_ (self & focus)
    fun setFocusOnMap self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setFocusOnMap_ (self & setting)
    fun setFocusVisible self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setFocusVisible_ (self & setting)
    fun setGeometryHints
      self
      (
        geometryWidget,
        geometry,
        geomMask
      ) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withOptPtr false
         &&&> GdkGeometryRecord.FFI.withOptPtr false
         &&&> GdkWindowHints.FFI.withVal
         ---> I
      )
        setGeometryHints_
        (
          self
           & geometryWidget
           & geometry
           & geomMask
        )
    fun setGravity self gravity = (GtkWindowClass.FFI.withPtr false &&&> GdkGravity.FFI.withVal ---> I) setGravity_ (self & gravity)
    fun setHasResizeGrip self value = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHasResizeGrip_ (self & value)
    fun setHasUserRefCount self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHasUserRefCount_ (self & setting)
    fun setHideTitlebarWhenMaximized self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHideTitlebarWhenMaximized_ (self & setting)
    fun setIcon self icon = (GtkWindowClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withOptPtr false ---> I) setIcon_ (self & icon)
    fun setIconFromFile self filename =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setIconFromFile_
        (
          self
           & filename
           & []
        )
    fun setIconName self name = (GtkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setKeepBelow_ (self & setting)
    fun setMnemonicModifier self modifier = (GtkWindowClass.FFI.withPtr false &&&> GdkModifierType.FFI.withVal ---> I) setMnemonicModifier_ (self & modifier)
    fun setMnemonicsVisible self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setMnemonicsVisible_ (self & setting)
    fun setModal self modal = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setModal_ (self & modal)
    fun setOpacity self opacity = (GtkWindowClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setOpacity_ (self & opacity)
    fun setPosition self position = (GtkWindowClass.FFI.withPtr false &&&> GtkWindowPosition.FFI.withVal ---> I) setPosition_ (self & position)
    fun setResizable self resizable = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setResizable_ (self & resizable)
    fun setRole self role = (GtkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setRole_ (self & role)
    fun setScreen self screen = (GtkWindowClass.FFI.withPtr false &&&> GdkScreenClass.FFI.withPtr false ---> I) setScreen_ (self & screen)
    fun setSkipPagerHint self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSkipPagerHint_ (self & setting)
    fun setSkipTaskbarHint self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSkipTaskbarHint_ (self & setting)
    fun setStartupId self startupId = (GtkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setStartupId_ (self & startupId)
    fun setTitle self title = (GtkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    fun setTitlebar self titlebar = (GtkWindowClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setTitlebar_ (self & titlebar)
    fun setTransientFor self parent = (GtkWindowClass.FFI.withPtr false &&&> GtkWindowClass.FFI.withOptPtr false ---> I) setTransientFor_ (self & parent)
    fun setTypeHint self hint = (GtkWindowClass.FFI.withPtr false &&&> GdkWindowTypeHint.FFI.withVal ---> I) setTypeHint_ (self & hint)
    fun setUrgencyHint self setting = (GtkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUrgencyHint_ (self & setting)
    fun setWmclass self (wmclassName, wmclassClass) =
      (
        GtkWindowClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        setWmclass_
        (
          self
           & wmclassName
           & wmclassClass
        )
    fun stick self = (GtkWindowClass.FFI.withPtr false ---> I) stick_ self
    fun unfullscreen self = (GtkWindowClass.FFI.withPtr false ---> I) unfullscreen_ self
    fun unmaximize self = (GtkWindowClass.FFI.withPtr false ---> I) unmaximize_ self
    fun unstick self = (GtkWindowClass.FFI.withPtr false ---> I) unstick_ self
    local
      open ClosureMarshal Signal
    in
      fun activateDefaultSig f = signal "activate-default" (void ---> ret_void) f
      fun activateFocusSig f = signal "activate-focus" (void ---> ret_void) f
      fun enableDebuggingSig f = signal "enable-debugging" (get 0w1 boolean ---> ret boolean) f
      fun keysChangedSig f = signal "keys-changed" (void ---> ret_void) f
      fun setFocusSig f = signal "set-focus" (get 0w1 GtkWidgetClass.t ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val acceptFocusProp =
        {
          name = "accept-focus",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val applicationProp =
        {
          name = "application",
          gtype = fn () => C.gtype GtkApplicationClass.tOpt (),
          get = fn x => fn () => C.get GtkApplicationClass.tOpt x,
          set = fn x => C.set GtkApplicationClass.tOpt x,
          init = fn x => C.set GtkApplicationClass.tOpt x
        }
      val attachedToProp =
        {
          name = "attached-to",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val decoratedProp =
        {
          name = "decorated",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val defaultHeightProp =
        {
          name = "default-height",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val defaultWidthProp =
        {
          name = "default-width",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val deletableProp =
        {
          name = "deletable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val destroyWithParentProp =
        {
          name = "destroy-with-parent",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val focusOnMapProp =
        {
          name = "focus-on-map",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val focusVisibleProp =
        {
          name = "focus-visible",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gravityProp =
        {
          name = "gravity",
          gtype = fn () => C.gtype GdkGravity.t (),
          get = fn x => fn () => C.get GdkGravity.t x,
          set = fn x => C.set GdkGravity.t x,
          init = fn x => C.set GdkGravity.t x
        }
      val hasResizeGripProp =
        {
          name = "has-resize-grip",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val hasToplevelFocusProp =
        {
          name = "has-toplevel-focus",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val hideTitlebarWhenMaximizedProp =
        {
          name = "hide-titlebar-when-maximized",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val iconProp =
        {
          name = "icon",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val iconNameProp =
        {
          name = "icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val isActiveProp =
        {
          name = "is-active",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val isMaximizedProp =
        {
          name = "is-maximized",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val mnemonicsVisibleProp =
        {
          name = "mnemonics-visible",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val modalProp =
        {
          name = "modal",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val resizableProp =
        {
          name = "resizable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val resizeGripVisibleProp =
        {
          name = "resize-grip-visible",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val roleProp =
        {
          name = "role",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val screenProp =
        {
          name = "screen",
          gtype = fn () => C.gtype GdkScreenClass.tOpt (),
          get = fn x => fn () => C.get GdkScreenClass.tOpt x,
          set = fn x => C.set GdkScreenClass.tOpt x,
          init = fn x => C.set GdkScreenClass.tOpt x
        }
      val skipPagerHintProp =
        {
          name = "skip-pager-hint",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val skipTaskbarHintProp =
        {
          name = "skip-taskbar-hint",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val startupIdProp =
        {
          name = "startup-id",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val titleProp =
        {
          name = "title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val transientForProp =
        {
          name = "transient-for",
          gtype = fn () => C.gtype GtkWindowClass.tOpt (),
          get = fn x => fn () => C.get GtkWindowClass.tOpt x,
          set = fn x => C.set GtkWindowClass.tOpt x,
          init = fn x => C.set GtkWindowClass.tOpt x
        }
      val typeProp =
        {
          name = "type",
          gtype = fn () => C.gtype GtkWindowType.t (),
          get = fn x => fn () => C.get GtkWindowType.t x,
          set = ignore,
          init = fn x => C.set GtkWindowType.t x
        }
      val typeHintProp =
        {
          name = "type-hint",
          gtype = fn () => C.gtype GdkWindowTypeHint.t (),
          get = fn x => fn () => C.get GdkWindowTypeHint.t x,
          set = fn x => C.set GdkWindowTypeHint.t x,
          init = fn x => C.set GdkWindowTypeHint.t x
        }
      val urgencyHintProp =
        {
          name = "urgency-hint",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val windowPositionProp =
        {
          name = "window-position",
          gtype = fn () => C.gtype GtkWindowPosition.t (),
          get = fn x => fn () => C.get GtkWindowPosition.t x,
          set = fn x => C.set GtkWindowPosition.t x,
          init = fn x => C.set GtkWindowPosition.t x
        }
    end
  end
