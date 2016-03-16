structure GtkWindow :>
  GTK_WINDOW
    where type 'a class_t = 'a GtkWindowClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a window_group_class_t = 'a GtkWindowGroupClass.t
    where type 'a accel_group_class_t = 'a GtkAccelGroupClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type 'a application_class_t = 'a GtkApplicationClass.t
    where type window_type_t = GtkWindowType.t
    where type window_position_t = GtkWindowPosition.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_window_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_window_new") (GtkWindowType.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getDefaultIconName_ = call (load_sym libgtk "gtk_window_get_default_icon_name") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val setAutoStartupNotification_ = call (load_sym libgtk "gtk_window_set_auto_startup_notification") (FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDefaultIcon_ = call (load_sym libgtk "gtk_window_set_default_icon") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setDefaultIconFromFile_ = call (load_sym libgtk "gtk_window_set_default_icon_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val setDefaultIconName_ = call (load_sym libgtk "gtk_window_set_default_icon_name") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val activateDefault_ = call (load_sym libgtk "gtk_window_activate_default") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val activateFocus_ = call (load_sym libgtk "gtk_window_activate_focus") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val activateKey_ = call (load_sym libgtk "gtk_window_activate_key") (GObjectObjectClass.PolyML.cPtr &&> GdkEventKeyRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val addAccelGroup_ = call (load_sym libgtk "gtk_window_add_accel_group") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val addMnemonic_ =
        call (load_sym libgtk "gtk_window_add_mnemonic")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val beginMoveDrag_ =
        call (load_sym libgtk "gtk_window_begin_move_drag")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val beginResizeDrag_ =
        call (load_sym libgtk "gtk_window_begin_resize_drag")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GdkWindowEdge.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val deiconify_ = call (load_sym libgtk "gtk_window_deiconify") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val fullscreen_ = call (load_sym libgtk "gtk_window_fullscreen") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getAcceptFocus_ = call (load_sym libgtk "gtk_window_get_accept_focus") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getApplication_ = call (load_sym libgtk "gtk_window_get_application") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDecorated_ = call (load_sym libgtk "gtk_window_get_decorated") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getDefaultSize_ =
        call (load_sym libgtk "gtk_window_get_default_size")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getDefaultWidget_ = call (load_sym libgtk "gtk_window_get_default_widget") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDeletable_ = call (load_sym libgtk "gtk_window_get_deletable") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getDestroyWithParent_ = call (load_sym libgtk "gtk_window_get_destroy_with_parent") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFocus_ = call (load_sym libgtk "gtk_window_get_focus") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getFocusOnMap_ = call (load_sym libgtk "gtk_window_get_focus_on_map") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFocusVisible_ = call (load_sym libgtk "gtk_window_get_focus_visible") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getGravity_ = call (load_sym libgtk "gtk_window_get_gravity") (GObjectObjectClass.PolyML.cPtr --> GdkGravity.PolyML.cVal)
      val getGroup_ = call (load_sym libgtk "gtk_window_get_group") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getHasResizeGrip_ = call (load_sym libgtk "gtk_window_get_has_resize_grip") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIcon_ = call (load_sym libgtk "gtk_window_get_icon") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getIconName_ = call (load_sym libgtk "gtk_window_get_icon_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMnemonicModifier_ = call (load_sym libgtk "gtk_window_get_mnemonic_modifier") (GObjectObjectClass.PolyML.cPtr --> GdkModifierType.PolyML.cVal)
      val getMnemonicsVisible_ = call (load_sym libgtk "gtk_window_get_mnemonics_visible") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getModal_ = call (load_sym libgtk "gtk_window_get_modal") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getOpacity_ = call (load_sym libgtk "gtk_window_get_opacity") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getPosition_ =
        call (load_sym libgtk "gtk_window_get_position")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getResizable_ = call (load_sym libgtk "gtk_window_get_resizable") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getResizeGripArea_ = call (load_sym libgtk "gtk_window_get_resize_grip_area") (GObjectObjectClass.PolyML.cPtr &&> CairoRectangleIntRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getRole_ = call (load_sym libgtk "gtk_window_get_role") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getScreen_ = call (load_sym libgtk "gtk_window_get_screen") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSize_ =
        call (load_sym libgtk "gtk_window_get_size")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getSkipPagerHint_ = call (load_sym libgtk "gtk_window_get_skip_pager_hint") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getSkipTaskbarHint_ = call (load_sym libgtk "gtk_window_get_skip_taskbar_hint") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTitle_ = call (load_sym libgtk "gtk_window_get_title") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTransientFor_ = call (load_sym libgtk "gtk_window_get_transient_for") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getTypeHint_ = call (load_sym libgtk "gtk_window_get_type_hint") (GObjectObjectClass.PolyML.cPtr --> GdkWindowTypeHint.PolyML.cVal)
      val getUrgencyHint_ = call (load_sym libgtk "gtk_window_get_urgency_hint") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getWindowType_ = call (load_sym libgtk "gtk_window_get_window_type") (GObjectObjectClass.PolyML.cPtr --> GtkWindowType.PolyML.cVal)
      val hasGroup_ = call (load_sym libgtk "gtk_window_has_group") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hasToplevelFocus_ = call (load_sym libgtk "gtk_window_has_toplevel_focus") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val iconify_ = call (load_sym libgtk "gtk_window_iconify") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val isActive_ = call (load_sym libgtk "gtk_window_is_active") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val maximize_ = call (load_sym libgtk "gtk_window_maximize") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val mnemonicActivate_ =
        call (load_sym libgtk "gtk_window_mnemonic_activate")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val move_ =
        call (load_sym libgtk "gtk_window_move")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val parseGeometry_ = call (load_sym libgtk "gtk_window_parse_geometry") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val present_ = call (load_sym libgtk "gtk_window_present") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val presentWithTime_ = call (load_sym libgtk "gtk_window_present_with_time") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val propagateKeyEvent_ = call (load_sym libgtk "gtk_window_propagate_key_event") (GObjectObjectClass.PolyML.cPtr &&> GdkEventKeyRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val removeAccelGroup_ = call (load_sym libgtk "gtk_window_remove_accel_group") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val removeMnemonic_ =
        call (load_sym libgtk "gtk_window_remove_mnemonic")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val reshowWithInitialSize_ = call (load_sym libgtk "gtk_window_reshow_with_initial_size") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val resize_ =
        call (load_sym libgtk "gtk_window_resize")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val resizeGripIsVisible_ = call (load_sym libgtk "gtk_window_resize_grip_is_visible") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val resizeToGeometry_ =
        call (load_sym libgtk "gtk_window_resize_to_geometry")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setAcceptFocus_ = call (load_sym libgtk "gtk_window_set_accept_focus") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setApplication_ = call (load_sym libgtk "gtk_window_set_application") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setDecorated_ = call (load_sym libgtk "gtk_window_set_decorated") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDefault_ = call (load_sym libgtk "gtk_window_set_default") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setDefaultGeometry_ =
        call (load_sym libgtk "gtk_window_set_default_geometry")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setDefaultSize_ =
        call (load_sym libgtk "gtk_window_set_default_size")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setDeletable_ = call (load_sym libgtk "gtk_window_set_deletable") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDestroyWithParent_ = call (load_sym libgtk "gtk_window_set_destroy_with_parent") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFocus_ = call (load_sym libgtk "gtk_window_set_focus") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setFocusOnMap_ = call (load_sym libgtk "gtk_window_set_focus_on_map") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFocusVisible_ = call (load_sym libgtk "gtk_window_set_focus_visible") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setGeometryHints_ =
        call (load_sym libgtk "gtk_window_set_geometry_hints")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GdkGeometryRecord.PolyML.cOptPtr
             &&> GdkWindowHints.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setGravity_ = call (load_sym libgtk "gtk_window_set_gravity") (GObjectObjectClass.PolyML.cPtr &&> GdkGravity.PolyML.cVal --> FFI.PolyML.cVoid)
      val setHasResizeGrip_ = call (load_sym libgtk "gtk_window_set_has_resize_grip") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setHasUserRefCount_ = call (load_sym libgtk "gtk_window_set_has_user_ref_count") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setIcon_ = call (load_sym libgtk "gtk_window_set_icon") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setIconFromFile_ =
        call (load_sym libgtk "gtk_window_set_icon_from_file")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setIconName_ = call (load_sym libgtk "gtk_window_set_icon_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setKeepAbove_ = call (load_sym libgtk "gtk_window_set_keep_above") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setKeepBelow_ = call (load_sym libgtk "gtk_window_set_keep_below") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMnemonicModifier_ = call (load_sym libgtk "gtk_window_set_mnemonic_modifier") (GObjectObjectClass.PolyML.cPtr &&> GdkModifierType.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMnemonicsVisible_ = call (load_sym libgtk "gtk_window_set_mnemonics_visible") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setModal_ = call (load_sym libgtk "gtk_window_set_modal") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOpacity_ = call (load_sym libgtk "gtk_window_set_opacity") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPosition_ = call (load_sym libgtk "gtk_window_set_position") (GObjectObjectClass.PolyML.cPtr &&> GtkWindowPosition.PolyML.cVal --> FFI.PolyML.cVoid)
      val setResizable_ = call (load_sym libgtk "gtk_window_set_resizable") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setRole_ = call (load_sym libgtk "gtk_window_set_role") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setScreen_ = call (load_sym libgtk "gtk_window_set_screen") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setSkipPagerHint_ = call (load_sym libgtk "gtk_window_set_skip_pager_hint") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSkipTaskbarHint_ = call (load_sym libgtk "gtk_window_set_skip_taskbar_hint") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setStartupId_ = call (load_sym libgtk "gtk_window_set_startup_id") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setTitle_ = call (load_sym libgtk "gtk_window_set_title") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setTransientFor_ = call (load_sym libgtk "gtk_window_set_transient_for") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setTypeHint_ = call (load_sym libgtk "gtk_window_set_type_hint") (GObjectObjectClass.PolyML.cPtr &&> GdkWindowTypeHint.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUrgencyHint_ = call (load_sym libgtk "gtk_window_set_urgency_hint") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setWmclass_ =
        call (load_sym libgtk "gtk_window_set_wmclass")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val stick_ = call (load_sym libgtk "gtk_window_stick") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unfullscreen_ = call (load_sym libgtk "gtk_window_unfullscreen") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unmaximize_ = call (load_sym libgtk "gtk_window_unmaximize") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unstick_ = call (load_sym libgtk "gtk_window_unstick") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkWindowClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a window_group_class_t = 'a GtkWindowGroupClass.t
    type 'a accel_group_class_t = 'a GtkAccelGroupClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type 'a application_class_t = 'a GtkApplicationClass.t
    type window_type_t = GtkWindowType.t
    type window_position_t = GtkWindowPosition.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new type' = (GtkWindowType.C.withVal ---> GtkWindowClass.C.fromPtr false) new_ type'
    fun getDefaultIconName () = (I ---> Utf8.C.fromPtr false) getDefaultIconName_ ()
    fun setAutoStartupNotification setting = (FFI.Bool.C.withVal ---> I) setAutoStartupNotification_ setting
    fun setDefaultIcon icon = (GObjectObjectClass.C.withPtr ---> I) setDefaultIcon_ icon
    fun setDefaultIconFromFile filename = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) setDefaultIconFromFile_ (filename & [])
    fun setDefaultIconName name = (Utf8.C.withPtr ---> I) setDefaultIconName_ name
    fun activateDefault self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) activateDefault_ self
    fun activateFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) activateFocus_ self
    fun activateKey self event = (GObjectObjectClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.C.fromVal) activateKey_ (self & event)
    fun addAccelGroup self accelGroup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addAccelGroup_ (self & accelGroup)
    fun addMnemonic self keyval target =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        addMnemonic_
        (
          self
           & keyval
           & target
        )
    fun beginMoveDrag self button rootX rootY timestamp =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.UInt32.C.withVal
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
    fun beginResizeDrag self edge button rootX rootY timestamp =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkWindowEdge.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.UInt32.C.withVal
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
    fun deiconify self = (GObjectObjectClass.C.withPtr ---> I) deiconify_ self
    fun fullscreen self = (GObjectObjectClass.C.withPtr ---> I) fullscreen_ self
    fun getAcceptFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAcceptFocus_ self
    fun getApplication self = (GObjectObjectClass.C.withPtr ---> GtkApplicationClass.C.fromPtr false) getApplication_ self
    fun getDecorated self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDecorated_ self
    fun getDefaultSize self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getDefaultSize_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (width, height)
      end
    fun getDefaultWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getDefaultWidget_ self
    fun getDeletable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDeletable_ self
    fun getDestroyWithParent self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDestroyWithParent_ self
    fun getFocus self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getFocus_ self
    fun getFocusOnMap self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusOnMap_ self
    fun getFocusVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusVisible_ self
    fun getGravity self = (GObjectObjectClass.C.withPtr ---> GdkGravity.C.fromVal) getGravity_ self
    fun getGroup self = (GObjectObjectClass.C.withPtr ---> GtkWindowGroupClass.C.fromPtr false) getGroup_ self
    fun getHasResizeGrip self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasResizeGrip_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getIcon_ self
    fun getIconName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getIconName_ self
    fun getMnemonicModifier self = (GObjectObjectClass.C.withPtr ---> GdkModifierType.C.fromVal) getMnemonicModifier_ self
    fun getMnemonicsVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getMnemonicsVisible_ self
    fun getModal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getModal_ self
    fun getOpacity self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getOpacity_ self
    fun getPosition self =
      let
        val rootX
         & rootY
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPosition_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (rootX, rootY)
      end
    fun getResizable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getResizable_ self
    fun getResizeGripArea self =
      let
        val rect & retVal = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withNewPtr ---> CairoRectangleIntRecord.C.fromPtr true && FFI.Bool.C.fromVal) getResizeGripArea_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun getRole self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getRole_ self
    fun getScreen self = (GObjectObjectClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getSize_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (width, height)
      end
    fun getSkipPagerHint self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSkipPagerHint_ self
    fun getSkipTaskbarHint self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSkipTaskbarHint_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getTransientFor self = (GObjectObjectClass.C.withPtr ---> GtkWindowClass.C.fromPtr false) getTransientFor_ self
    fun getTypeHint self = (GObjectObjectClass.C.withPtr ---> GdkWindowTypeHint.C.fromVal) getTypeHint_ self
    fun getUrgencyHint self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUrgencyHint_ self
    fun getWindowType self = (GObjectObjectClass.C.withPtr ---> GtkWindowType.C.fromVal) getWindowType_ self
    fun hasGroup self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasGroup_ self
    fun hasToplevelFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasToplevelFocus_ self
    fun iconify self = (GObjectObjectClass.C.withPtr ---> I) iconify_ self
    fun isActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isActive_ self
    fun maximize self = (GObjectObjectClass.C.withPtr ---> I) maximize_ self
    fun mnemonicActivate self keyval modifier =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GdkModifierType.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        mnemonicActivate_
        (
          self
           & keyval
           & modifier
        )
    fun move self x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        move_
        (
          self
           & x
           & y
        )
    fun parseGeometry self geometry = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) parseGeometry_ (self & geometry)
    fun present self = (GObjectObjectClass.C.withPtr ---> I) present_ self
    fun presentWithTime self timestamp = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) presentWithTime_ (self & timestamp)
    fun propagateKeyEvent self event = (GObjectObjectClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.C.fromVal) propagateKeyEvent_ (self & event)
    fun removeAccelGroup self accelGroup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeAccelGroup_ (self & accelGroup)
    fun removeMnemonic self keyval target =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        removeMnemonic_
        (
          self
           & keyval
           & target
        )
    fun reshowWithInitialSize self = (GObjectObjectClass.C.withPtr ---> I) reshowWithInitialSize_ self
    fun resize self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        resize_
        (
          self
           & width
           & height
        )
    fun resizeGripIsVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) resizeGripIsVisible_ self
    fun resizeToGeometry self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        resizeToGeometry_
        (
          self
           & width
           & height
        )
    fun setAcceptFocus self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAcceptFocus_ (self & setting)
    fun setApplication self application = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setApplication_ (self & application)
    fun setDecorated self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDecorated_ (self & setting)
    fun setDefault self defaultWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setDefault_ (self & defaultWidget)
    fun setDefaultGeometry self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setDefaultGeometry_
        (
          self
           & width
           & height
        )
    fun setDefaultSize self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setDefaultSize_
        (
          self
           & width
           & height
        )
    fun setDeletable self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDeletable_ (self & setting)
    fun setDestroyWithParent self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDestroyWithParent_ (self & setting)
    fun setFocus self focus = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setFocus_ (self & focus)
    fun setFocusOnMap self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusOnMap_ (self & setting)
    fun setFocusVisible self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusVisible_ (self & setting)
    fun setGeometryHints self geometryWidget geometry geomMask =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GdkGeometryRecord.C.withOptPtr
         &&&> GdkWindowHints.C.withVal
         ---> I
      )
        setGeometryHints_
        (
          self
           & geometryWidget
           & geometry
           & geomMask
        )
    fun setGravity self gravity = (GObjectObjectClass.C.withPtr &&&> GdkGravity.C.withVal ---> I) setGravity_ (self & gravity)
    fun setHasResizeGrip self value = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasResizeGrip_ (self & value)
    fun setHasUserRefCount self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasUserRefCount_ (self & setting)
    fun setIcon self icon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setIcon_ (self & icon)
    fun setIconFromFile self filename =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setIconFromFile_
        (
          self
           & filename
           & []
        )
    fun setIconName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepBelow_ (self & setting)
    fun setMnemonicModifier self modifier = (GObjectObjectClass.C.withPtr &&&> GdkModifierType.C.withVal ---> I) setMnemonicModifier_ (self & modifier)
    fun setMnemonicsVisible self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setMnemonicsVisible_ (self & setting)
    fun setModal self modal = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setModal_ (self & modal)
    fun setOpacity self opacity = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setOpacity_ (self & opacity)
    fun setPosition self position = (GObjectObjectClass.C.withPtr &&&> GtkWindowPosition.C.withVal ---> I) setPosition_ (self & position)
    fun setResizable self resizable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setResizable_ (self & resizable)
    fun setRole self role = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setRole_ (self & role)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setScreen_ (self & screen)
    fun setSkipPagerHint self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSkipPagerHint_ (self & setting)
    fun setSkipTaskbarHint self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSkipTaskbarHint_ (self & setting)
    fun setStartupId self startupId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setStartupId_ (self & startupId)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setTransientFor_ (self & parent)
    fun setTypeHint self hint = (GObjectObjectClass.C.withPtr &&&> GdkWindowTypeHint.C.withVal ---> I) setTypeHint_ (self & hint)
    fun setUrgencyHint self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUrgencyHint_ (self & setting)
    fun setWmclass self wmclassName wmclassClass =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        setWmclass_
        (
          self
           & wmclassName
           & wmclassClass
        )
    fun stick self = (GObjectObjectClass.C.withPtr ---> I) stick_ self
    fun unfullscreen self = (GObjectObjectClass.C.withPtr ---> I) unfullscreen_ self
    fun unmaximize self = (GObjectObjectClass.C.withPtr ---> I) unmaximize_ self
    fun unstick self = (GObjectObjectClass.C.withPtr ---> I) unstick_ self
    local
      open ClosureMarshal Signal
    in
      fun activateDefaultSig f = signal "activate-default" (void ---> ret_void) f
      fun activateFocusSig f = signal "activate-focus" (void ---> ret_void) f
      fun keysChangedSig f = signal "keys-changed" (void ---> ret_void) f
      fun setFocusSig f = signal "set-focus" (get 0w1 GtkWidgetClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val acceptFocusProp =
        {
          get = fn x => get "accept-focus" boolean x,
          set = fn x => set "accept-focus" boolean x
        }
      val applicationProp =
        {
          get = fn x => get "application" GtkApplicationClass.tOpt x,
          set = fn x => set "application" GtkApplicationClass.tOpt x
        }
      val decoratedProp =
        {
          get = fn x => get "decorated" boolean x,
          set = fn x => set "decorated" boolean x
        }
      val defaultHeightProp =
        {
          get = fn x => get "default-height" int x,
          set = fn x => set "default-height" int x
        }
      val defaultWidthProp =
        {
          get = fn x => get "default-width" int x,
          set = fn x => set "default-width" int x
        }
      val deletableProp =
        {
          get = fn x => get "deletable" boolean x,
          set = fn x => set "deletable" boolean x
        }
      val destroyWithParentProp =
        {
          get = fn x => get "destroy-with-parent" boolean x,
          set = fn x => set "destroy-with-parent" boolean x
        }
      val focusOnMapProp =
        {
          get = fn x => get "focus-on-map" boolean x,
          set = fn x => set "focus-on-map" boolean x
        }
      val focusVisibleProp =
        {
          get = fn x => get "focus-visible" boolean x,
          set = fn x => set "focus-visible" boolean x
        }
      val gravityProp =
        {
          get = fn x => get "gravity" GdkGravity.t x,
          set = fn x => set "gravity" GdkGravity.t x
        }
      val hasResizeGripProp =
        {
          get = fn x => get "has-resize-grip" boolean x,
          set = fn x => set "has-resize-grip" boolean x
        }
      val hasToplevelFocusProp = {get = fn x => get "has-toplevel-focus" boolean x}
      val iconProp =
        {
          get = fn x => get "icon" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "icon" GdkPixbufPixbufClass.tOpt x
        }
      val iconNameProp =
        {
          get = fn x => get "icon-name" stringOpt x,
          set = fn x => set "icon-name" stringOpt x
        }
      val isActiveProp = {get = fn x => get "is-active" boolean x}
      val mnemonicsVisibleProp =
        {
          get = fn x => get "mnemonics-visible" boolean x,
          set = fn x => set "mnemonics-visible" boolean x
        }
      val modalProp =
        {
          get = fn x => get "modal" boolean x,
          set = fn x => set "modal" boolean x
        }
      val opacityProp =
        {
          get = fn x => get "opacity" double x,
          set = fn x => set "opacity" double x
        }
      val resizableProp =
        {
          get = fn x => get "resizable" boolean x,
          set = fn x => set "resizable" boolean x
        }
      val resizeGripVisibleProp = {get = fn x => get "resize-grip-visible" boolean x}
      val roleProp =
        {
          get = fn x => get "role" stringOpt x,
          set = fn x => set "role" stringOpt x
        }
      val screenProp =
        {
          get = fn x => get "screen" GdkScreenClass.tOpt x,
          set = fn x => set "screen" GdkScreenClass.tOpt x
        }
      val skipPagerHintProp =
        {
          get = fn x => get "skip-pager-hint" boolean x,
          set = fn x => set "skip-pager-hint" boolean x
        }
      val skipTaskbarHintProp =
        {
          get = fn x => get "skip-taskbar-hint" boolean x,
          set = fn x => set "skip-taskbar-hint" boolean x
        }
      val startupIdProp = {set = fn x => set "startup-id" stringOpt x}
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
      val transientForProp =
        {
          get = fn x => get "transient-for" GtkWindowClass.tOpt x,
          set = fn x => set "transient-for" GtkWindowClass.tOpt x
        }
      val typeProp =
        {
          get = fn x => get "type" GtkWindowType.t x,
          set = fn x => set "type" GtkWindowType.t x
        }
      val typeHintProp =
        {
          get = fn x => get "type-hint" GdkWindowTypeHint.t x,
          set = fn x => set "type-hint" GdkWindowTypeHint.t x
        }
      val urgencyHintProp =
        {
          get = fn x => get "urgency-hint" boolean x,
          set = fn x => set "urgency-hint" boolean x
        }
      val windowPositionProp =
        {
          get = fn x => get "window-position" GtkWindowPosition.t x,
          set = fn x => set "window-position" GtkWindowPosition.t x
        }
    end
  end
