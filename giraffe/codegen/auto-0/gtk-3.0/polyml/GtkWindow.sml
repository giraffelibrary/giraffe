structure GtkWindow :>
  GTK_WINDOW
    where type 'a class_t = 'a GtkWindowClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a windowgroupclass_t = 'a GtkWindowGroupClass.t
    where type 'a accelgroupclass_t = 'a GtkAccelGroupClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type 'a applicationclass_t = 'a GtkApplicationClass.t
    where type windowtype_t = GtkWindowType.t
    where type windowposition_t = GtkWindowPosition.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_window_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_window_new") (GtkWindowType.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getDefaultIconName_ = call (load_sym libgtk "gtk_window_get_default_icon_name") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val setAutoStartupNotification_ = call (load_sym libgtk "gtk_window_set_auto_startup_notification") (FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setDefaultIcon_ = call (load_sym libgtk "gtk_window_set_default_icon") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setDefaultIconFromFile_ = call (load_sym libgtk "gtk_window_set_default_icon_from_file") (FFI.PolyML.String.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.PolyML.Bool.VAL)
      val setDefaultIconName_ = call (load_sym libgtk "gtk_window_set_default_icon_name") (FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val activateDefault_ = call (load_sym libgtk "gtk_window_activate_default") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val activateFocus_ = call (load_sym libgtk "gtk_window_activate_focus") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val activateKey_ = call (load_sym libgtk "gtk_window_activate_key") (GObjectObjectClass.PolyML.PTR &&> GdkEventKeyRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val addAccelGroup_ = call (load_sym libgtk "gtk_window_add_accel_group") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val addMnemonic_ =
        call (load_sym libgtk "gtk_window_add_mnemonic")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val beginMoveDrag_ =
        call (load_sym libgtk "gtk_window_begin_move_drag")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.VOID
          )
      val beginResizeDrag_ =
        call (load_sym libgtk "gtk_window_begin_resize_drag")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkWindowEdge.PolyML.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.VOID
          )
      val deiconify_ = call (load_sym libgtk "gtk_window_deiconify") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val fullscreen_ = call (load_sym libgtk "gtk_window_fullscreen") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getAcceptFocus_ = call (load_sym libgtk "gtk_window_get_accept_focus") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getApplication_ = call (load_sym libgtk "gtk_window_get_application") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDecorated_ = call (load_sym libgtk "gtk_window_get_decorated") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getDefaultSize_ =
        call (load_sym libgtk "gtk_window_get_default_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.REF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.VOID
          )
      val getDefaultWidget_ = call (load_sym libgtk "gtk_window_get_default_widget") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDeletable_ = call (load_sym libgtk "gtk_window_get_deletable") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getDestroyWithParent_ = call (load_sym libgtk "gtk_window_get_destroy_with_parent") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getFocus_ = call (load_sym libgtk "gtk_window_get_focus") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFocusOnMap_ = call (load_sym libgtk "gtk_window_get_focus_on_map") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getFocusVisible_ = call (load_sym libgtk "gtk_window_get_focus_visible") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getGravity_ = call (load_sym libgtk "gtk_window_get_gravity") (GObjectObjectClass.PolyML.PTR --> GdkGravity.PolyML.VAL)
      val getGroup_ = call (load_sym libgtk "gtk_window_get_group") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getHasResizeGrip_ = call (load_sym libgtk "gtk_window_get_has_resize_grip") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getIcon_ = call (load_sym libgtk "gtk_window_get_icon") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getIconName_ = call (load_sym libgtk "gtk_window_get_icon_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getMnemonicModifier_ = call (load_sym libgtk "gtk_window_get_mnemonic_modifier") (GObjectObjectClass.PolyML.PTR --> GdkModifierType.PolyML.VAL)
      val getMnemonicsVisible_ = call (load_sym libgtk "gtk_window_get_mnemonics_visible") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getModal_ = call (load_sym libgtk "gtk_window_get_modal") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getOpacity_ = call (load_sym libgtk "gtk_window_get_opacity") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Double.VAL)
      val getPosition_ =
        call (load_sym libgtk "gtk_window_get_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.REF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.VOID
          )
      val getResizable_ = call (load_sym libgtk "gtk_window_get_resizable") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getResizeGripArea_ = call (load_sym libgtk "gtk_window_get_resize_grip_area") (GObjectObjectClass.PolyML.PTR &&> CairoRectangleIntRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getRole_ = call (load_sym libgtk "gtk_window_get_role") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getScreen_ = call (load_sym libgtk "gtk_window_get_screen") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getSize_ =
        call (load_sym libgtk "gtk_window_get_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.REF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.VOID
          )
      val getSkipPagerHint_ = call (load_sym libgtk "gtk_window_get_skip_pager_hint") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getSkipTaskbarHint_ = call (load_sym libgtk "gtk_window_get_skip_taskbar_hint") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getTitle_ = call (load_sym libgtk "gtk_window_get_title") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getTransientFor_ = call (load_sym libgtk "gtk_window_get_transient_for") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getTypeHint_ = call (load_sym libgtk "gtk_window_get_type_hint") (GObjectObjectClass.PolyML.PTR --> GdkWindowTypeHint.PolyML.VAL)
      val getUrgencyHint_ = call (load_sym libgtk "gtk_window_get_urgency_hint") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getWindowType_ = call (load_sym libgtk "gtk_window_get_window_type") (GObjectObjectClass.PolyML.PTR --> GtkWindowType.PolyML.VAL)
      val hasGroup_ = call (load_sym libgtk "gtk_window_has_group") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val hasToplevelFocus_ = call (load_sym libgtk "gtk_window_has_toplevel_focus") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val iconify_ = call (load_sym libgtk "gtk_window_iconify") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val isActive_ = call (load_sym libgtk "gtk_window_is_active") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val maximize_ = call (load_sym libgtk "gtk_window_maximize") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val mnemonicActivate_ =
        call (load_sym libgtk "gtk_window_mnemonic_activate")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> GdkModifierType.PolyML.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val move_ =
        call (load_sym libgtk "gtk_window_move")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val parseGeometry_ = call (load_sym libgtk "gtk_window_parse_geometry") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val present_ = call (load_sym libgtk "gtk_window_present") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val presentWithTime_ = call (load_sym libgtk "gtk_window_present_with_time") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> FFI.PolyML.VOID)
      val propagateKeyEvent_ = call (load_sym libgtk "gtk_window_propagate_key_event") (GObjectObjectClass.PolyML.PTR &&> GdkEventKeyRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val removeAccelGroup_ = call (load_sym libgtk "gtk_window_remove_accel_group") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val removeMnemonic_ =
        call (load_sym libgtk "gtk_window_remove_mnemonic")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val reshowWithInitialSize_ = call (load_sym libgtk "gtk_window_reshow_with_initial_size") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val resize_ =
        call (load_sym libgtk "gtk_window_resize")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val resizeGripIsVisible_ = call (load_sym libgtk "gtk_window_resize_grip_is_visible") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val resizeToGeometry_ =
        call (load_sym libgtk "gtk_window_resize_to_geometry")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val setAcceptFocus_ = call (load_sym libgtk "gtk_window_set_accept_focus") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setApplication_ = call (load_sym libgtk "gtk_window_set_application") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setDecorated_ = call (load_sym libgtk "gtk_window_set_decorated") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setDefault_ = call (load_sym libgtk "gtk_window_set_default") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setDefaultGeometry_ =
        call (load_sym libgtk "gtk_window_set_default_geometry")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val setDefaultSize_ =
        call (load_sym libgtk "gtk_window_set_default_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val setDeletable_ = call (load_sym libgtk "gtk_window_set_deletable") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setDestroyWithParent_ = call (load_sym libgtk "gtk_window_set_destroy_with_parent") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setFocus_ = call (load_sym libgtk "gtk_window_set_focus") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setFocusOnMap_ = call (load_sym libgtk "gtk_window_set_focus_on_map") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setFocusVisible_ = call (load_sym libgtk "gtk_window_set_focus_visible") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setGeometryHints_ =
        call (load_sym libgtk "gtk_window_set_geometry_hints")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GdkGeometryRecord.PolyML.OPTPTR
             &&> GdkWindowHints.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setGravity_ = call (load_sym libgtk "gtk_window_set_gravity") (GObjectObjectClass.PolyML.PTR &&> GdkGravity.PolyML.VAL --> FFI.PolyML.VOID)
      val setHasResizeGrip_ = call (load_sym libgtk "gtk_window_set_has_resize_grip") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setHasUserRefCount_ = call (load_sym libgtk "gtk_window_set_has_user_ref_count") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setIcon_ = call (load_sym libgtk "gtk_window_set_icon") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setIconFromFile_ =
        call (load_sym libgtk "gtk_window_set_icon_from_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val setIconName_ = call (load_sym libgtk "gtk_window_set_icon_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INOPTPTR --> FFI.PolyML.VOID)
      val setKeepAbove_ = call (load_sym libgtk "gtk_window_set_keep_above") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setKeepBelow_ = call (load_sym libgtk "gtk_window_set_keep_below") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setMnemonicModifier_ = call (load_sym libgtk "gtk_window_set_mnemonic_modifier") (GObjectObjectClass.PolyML.PTR &&> GdkModifierType.PolyML.VAL --> FFI.PolyML.VOID)
      val setMnemonicsVisible_ = call (load_sym libgtk "gtk_window_set_mnemonics_visible") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setModal_ = call (load_sym libgtk "gtk_window_set_modal") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setOpacity_ = call (load_sym libgtk "gtk_window_set_opacity") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Double.VAL --> FFI.PolyML.VOID)
      val setPosition_ = call (load_sym libgtk "gtk_window_set_position") (GObjectObjectClass.PolyML.PTR &&> GtkWindowPosition.PolyML.VAL --> FFI.PolyML.VOID)
      val setResizable_ = call (load_sym libgtk "gtk_window_set_resizable") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setRole_ = call (load_sym libgtk "gtk_window_set_role") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setScreen_ = call (load_sym libgtk "gtk_window_set_screen") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setSkipPagerHint_ = call (load_sym libgtk "gtk_window_set_skip_pager_hint") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setSkipTaskbarHint_ = call (load_sym libgtk "gtk_window_set_skip_taskbar_hint") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setStartupId_ = call (load_sym libgtk "gtk_window_set_startup_id") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setTitle_ = call (load_sym libgtk "gtk_window_set_title") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setTransientFor_ = call (load_sym libgtk "gtk_window_set_transient_for") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setTypeHint_ = call (load_sym libgtk "gtk_window_set_type_hint") (GObjectObjectClass.PolyML.PTR &&> GdkWindowTypeHint.PolyML.VAL --> FFI.PolyML.VOID)
      val setUrgencyHint_ = call (load_sym libgtk "gtk_window_set_urgency_hint") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setWmclass_ =
        call (load_sym libgtk "gtk_window_set_wmclass")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val stick_ = call (load_sym libgtk "gtk_window_stick") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unfullscreen_ = call (load_sym libgtk "gtk_window_unfullscreen") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unmaximize_ = call (load_sym libgtk "gtk_window_unmaximize") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unstick_ = call (load_sym libgtk "gtk_window_unstick") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkWindowClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a windowgroupclass_t = 'a GtkWindowGroupClass.t
    type 'a accelgroupclass_t = 'a GtkAccelGroupClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type 'a applicationclass_t = 'a GtkApplicationClass.t
    type windowtype_t = GtkWindowType.t
    type windowposition_t = GtkWindowPosition.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new type' = (GtkWindowType.C.withVal ---> GtkWindowClass.C.fromPtr false) new_ type'
    fun getDefaultIconName () = (I ---> FFI.String.fromPtr false) getDefaultIconName_ ()
    fun setAutoStartupNotification setting = (FFI.Bool.withVal ---> I) setAutoStartupNotification_ setting
    fun setDefaultIcon icon = (GObjectObjectClass.C.withPtr ---> I) setDefaultIcon_ icon
    fun setDefaultIconFromFile filename = (FFI.String.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.fromVal) setDefaultIconFromFile_ (filename & [])
    fun setDefaultIconName name = (FFI.String.withConstPtr ---> I) setDefaultIconName_ name
    fun activateDefault self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) activateDefault_ self
    fun activateFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) activateFocus_ self
    fun activateKey self event = (GObjectObjectClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.fromVal) activateKey_ (self & event)
    fun addAccelGroup self accelGroup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addAccelGroup_ (self & accelGroup)
    fun addMnemonic self keyval target =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word32.withVal
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Word32.withVal
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Word32.withVal
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
    fun getAcceptFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getAcceptFocus_ self
    fun getApplication self = (GObjectObjectClass.C.withPtr ---> GtkApplicationClass.C.fromPtr false) getApplication_ self
    fun getDecorated self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getDecorated_ self
    fun getDefaultSize self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getDefaultSize_
            (
              self
               & 0
               & 0
            )
      in
        (width, height)
      end
    fun getDefaultWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getDefaultWidget_ self
    fun getDeletable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getDeletable_ self
    fun getDestroyWithParent self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getDestroyWithParent_ self
    fun getFocus self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getFocus_ self
    fun getFocusOnMap self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getFocusOnMap_ self
    fun getFocusVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getFocusVisible_ self
    fun getGravity self = (GObjectObjectClass.C.withPtr ---> GdkGravity.C.fromVal) getGravity_ self
    fun getGroup self = (GObjectObjectClass.C.withPtr ---> GtkWindowGroupClass.C.fromPtr false) getGroup_ self
    fun getHasResizeGrip self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getHasResizeGrip_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getIcon_ self
    fun getIconName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getIconName_ self
    fun getMnemonicModifier self = (GObjectObjectClass.C.withPtr ---> GdkModifierType.C.fromVal) getMnemonicModifier_ self
    fun getMnemonicsVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getMnemonicsVisible_ self
    fun getModal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getModal_ self
    fun getOpacity self = (GObjectObjectClass.C.withPtr ---> FFI.Double.fromVal) getOpacity_ self
    fun getPosition self =
      let
        val rootX
         & rootY
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getPosition_
            (
              self
               & 0
               & 0
            )
      in
        (rootX, rootY)
      end
    fun getResizable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getResizable_ self
    fun getResizeGripArea self =
      let
        val rect & retVal = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withNewPtr ---> CairoRectangleIntRecord.C.fromPtr true && FFI.Bool.fromVal) getResizeGripArea_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun getRole self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getRole_ self
    fun getScreen self = (GObjectObjectClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getSize_
            (
              self
               & 0
               & 0
            )
      in
        (width, height)
      end
    fun getSkipPagerHint self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getSkipPagerHint_ self
    fun getSkipTaskbarHint self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getSkipTaskbarHint_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getTitle_ self
    fun getTransientFor self = (GObjectObjectClass.C.withPtr ---> GtkWindowClass.C.fromPtr false) getTransientFor_ self
    fun getTypeHint self = (GObjectObjectClass.C.withPtr ---> GdkWindowTypeHint.C.fromVal) getTypeHint_ self
    fun getUrgencyHint self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getUrgencyHint_ self
    fun getWindowType self = (GObjectObjectClass.C.withPtr ---> GtkWindowType.C.fromVal) getWindowType_ self
    fun hasGroup self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) hasGroup_ self
    fun hasToplevelFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) hasToplevelFocus_ self
    fun iconify self = (GObjectObjectClass.C.withPtr ---> I) iconify_ self
    fun isActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isActive_ self
    fun maximize self = (GObjectObjectClass.C.withPtr ---> I) maximize_ self
    fun mnemonicActivate self keyval modifier =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word32.withVal
         &&&> GdkModifierType.C.withVal
         ---> FFI.Bool.fromVal
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> I
      )
        move_
        (
          self
           & x
           & y
        )
    fun parseGeometry self geometry = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) parseGeometry_ (self & geometry)
    fun present self = (GObjectObjectClass.C.withPtr ---> I) present_ self
    fun presentWithTime self timestamp = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> I) presentWithTime_ (self & timestamp)
    fun propagateKeyEvent self event = (GObjectObjectClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.fromVal) propagateKeyEvent_ (self & event)
    fun removeAccelGroup self accelGroup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeAccelGroup_ (self & accelGroup)
    fun removeMnemonic self keyval target =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word32.withVal
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> I
      )
        resize_
        (
          self
           & width
           & height
        )
    fun resizeGripIsVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) resizeGripIsVisible_ self
    fun resizeToGeometry self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> I
      )
        resizeToGeometry_
        (
          self
           & width
           & height
        )
    fun setAcceptFocus self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setAcceptFocus_ (self & setting)
    fun setApplication self application = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setApplication_ (self & application)
    fun setDecorated self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setDecorated_ (self & setting)
    fun setDefault self defaultWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setDefault_ (self & defaultWidget)
    fun setDefaultGeometry self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> I
      )
        setDefaultSize_
        (
          self
           & width
           & height
        )
    fun setDeletable self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setDeletable_ (self & setting)
    fun setDestroyWithParent self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setDestroyWithParent_ (self & setting)
    fun setFocus self focus = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setFocus_ (self & focus)
    fun setFocusOnMap self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setFocusOnMap_ (self & setting)
    fun setFocusVisible self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setFocusVisible_ (self & setting)
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
    fun setHasResizeGrip self value = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setHasResizeGrip_ (self & value)
    fun setHasUserRefCount self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setHasUserRefCount_ (self & setting)
    fun setIcon self icon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setIcon_ (self & icon)
    fun setIconFromFile self filename =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        setIconFromFile_
        (
          self
           & filename
           & []
        )
    fun setIconName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setKeepBelow_ (self & setting)
    fun setMnemonicModifier self modifier = (GObjectObjectClass.C.withPtr &&&> GdkModifierType.C.withVal ---> I) setMnemonicModifier_ (self & modifier)
    fun setMnemonicsVisible self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setMnemonicsVisible_ (self & setting)
    fun setModal self modal = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setModal_ (self & modal)
    fun setOpacity self opacity = (GObjectObjectClass.C.withPtr &&&> FFI.Double.withVal ---> I) setOpacity_ (self & opacity)
    fun setPosition self position = (GObjectObjectClass.C.withPtr &&&> GtkWindowPosition.C.withVal ---> I) setPosition_ (self & position)
    fun setResizable self resizable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setResizable_ (self & resizable)
    fun setRole self role = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setRole_ (self & role)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setScreen_ (self & screen)
    fun setSkipPagerHint self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setSkipPagerHint_ (self & setting)
    fun setSkipTaskbarHint self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setSkipTaskbarHint_ (self & setting)
    fun setStartupId self startupId = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setStartupId_ (self & startupId)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setTransientFor_ (self & parent)
    fun setTypeHint self hint = (GObjectObjectClass.C.withPtr &&&> GdkWindowTypeHint.C.withVal ---> I) setTypeHint_ (self & hint)
    fun setUrgencyHint self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setUrgencyHint_ (self & setting)
    fun setWmclass self wmclassName wmclassClass =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
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
