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
    val getType_ = _import "gtk_window_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_window_new" : GtkWindowType.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDefaultIconName_ = _import "gtk_window_get_default_icon_name" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val setAutoStartupNotification_ = _import "gtk_window_set_auto_startup_notification" : FFI.Bool.C.val_ -> unit;
    val setDefaultIcon_ = _import "gtk_window_set_default_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setDefaultIconFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_window_set_default_icon_from_file" :
              cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setDefaultIconName_ = _import "mlton_gtk_window_set_default_icon_name" : cstring * unit CPointer.t -> unit;
    val activateDefault_ = _import "gtk_window_activate_default" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val activateFocus_ = _import "gtk_window_activate_focus" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val activateKey_ = fn x1 & x2 => (_import "gtk_window_activate_key" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkEventKeyRecord.C.notnull GdkEventKeyRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val addAccelGroup_ = fn x1 & x2 => (_import "gtk_window_add_accel_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val addMnemonic_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_add_mnemonic" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val beginMoveDrag_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_window_begin_move_drag" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.UInt32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val beginResizeDrag_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_window_begin_resize_drag" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GdkWindowEdge.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.UInt32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val deiconify_ = _import "gtk_window_deiconify" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val fullscreen_ = _import "gtk_window_fullscreen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getAcceptFocus_ = _import "gtk_window_get_accept_focus" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getApplication_ = _import "gtk_window_get_application" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDecorated_ = _import "gtk_window_get_decorated" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getDefaultSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_get_default_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefaultWidget_ = _import "gtk_window_get_default_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDeletable_ = _import "gtk_window_get_deletable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getDestroyWithParent_ = _import "gtk_window_get_destroy_with_parent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getFocus_ = _import "gtk_window_get_focus" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFocusOnMap_ = _import "gtk_window_get_focus_on_map" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getFocusVisible_ = _import "gtk_window_get_focus_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getGravity_ = _import "gtk_window_get_gravity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkGravity.C.val_;
    val getGroup_ = _import "gtk_window_get_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getHasResizeGrip_ = _import "gtk_window_get_has_resize_grip" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIcon_ = _import "gtk_window_get_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getIconName_ = _import "gtk_window_get_icon_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getMnemonicModifier_ = _import "gtk_window_get_mnemonic_modifier" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkModifierType.C.val_;
    val getMnemonicsVisible_ = _import "gtk_window_get_mnemonics_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getModal_ = _import "gtk_window_get_modal" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getOpacity_ = _import "gtk_window_get_opacity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_get_position" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getResizable_ = _import "gtk_window_get_resizable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getResizeGripArea_ = fn x1 & x2 => (_import "gtk_window_get_resize_grip_area" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getRole_ = _import "gtk_window_get_role" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getScreen_ = _import "gtk_window_get_screen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_get_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSkipPagerHint_ = _import "gtk_window_get_skip_pager_hint" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getSkipTaskbarHint_ = _import "gtk_window_get_skip_taskbar_hint" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getTitle_ = _import "gtk_window_get_title" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getTransientFor_ = _import "gtk_window_get_transient_for" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getTypeHint_ = _import "gtk_window_get_type_hint" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkWindowTypeHint.C.val_;
    val getUrgencyHint_ = _import "gtk_window_get_urgency_hint" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getWindowType_ = _import "gtk_window_get_window_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkWindowType.C.val_;
    val hasGroup_ = _import "gtk_window_has_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val hasToplevelFocus_ = _import "gtk_window_has_toplevel_focus" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val iconify_ = _import "gtk_window_iconify" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val isActive_ = _import "gtk_window_is_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val maximize_ = _import "gtk_window_maximize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val mnemonicActivate_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_mnemonic_activate" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt.C.val_
               * GdkModifierType.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val move_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_move" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val parseGeometry_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_window_parse_geometry" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val present_ = _import "gtk_window_present" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val presentWithTime_ = fn x1 & x2 => (_import "gtk_window_present_with_time" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val propagateKeyEvent_ = fn x1 & x2 => (_import "gtk_window_propagate_key_event" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkEventKeyRecord.C.notnull GdkEventKeyRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val removeAccelGroup_ = fn x1 & x2 => (_import "gtk_window_remove_accel_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val removeMnemonic_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_remove_mnemonic" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val reshowWithInitialSize_ = _import "gtk_window_reshow_with_initial_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val resize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_resize" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val resizeGripIsVisible_ = _import "gtk_window_resize_grip_is_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val resizeToGeometry_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_resize_to_geometry" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAcceptFocus_ = fn x1 & x2 => (_import "gtk_window_set_accept_focus" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setApplication_ = fn x1 & x2 => (_import "gtk_window_set_application" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setDecorated_ = fn x1 & x2 => (_import "gtk_window_set_decorated" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setDefault_ = fn x1 & x2 => (_import "gtk_window_set_default" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setDefaultGeometry_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_set_default_geometry" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDefaultSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_set_default_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDeletable_ = fn x1 & x2 => (_import "gtk_window_set_deletable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setDestroyWithParent_ = fn x1 & x2 => (_import "gtk_window_set_destroy_with_parent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setFocus_ = fn x1 & x2 => (_import "gtk_window_set_focus" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setFocusOnMap_ = fn x1 & x2 => (_import "gtk_window_set_focus_on_map" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setFocusVisible_ = fn x1 & x2 => (_import "gtk_window_set_focus_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setGeometryHints_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_window_set_geometry_hints" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * unit GdkGeometryRecord.C.p
               * GdkWindowHints.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setGravity_ = fn x1 & x2 => (_import "gtk_window_set_gravity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkGravity.C.val_ -> unit;) (x1, x2)
    val setHasResizeGrip_ = fn x1 & x2 => (_import "gtk_window_set_has_resize_grip" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setHasUserRefCount_ = fn x1 & x2 => (_import "gtk_window_set_has_user_ref_count" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "gtk_window_set_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setIconFromFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_window_set_icon_from_file" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_window_set_icon_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setKeepAbove_ = fn x1 & x2 => (_import "gtk_window_set_keep_above" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setKeepBelow_ = fn x1 & x2 => (_import "gtk_window_set_keep_below" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setMnemonicModifier_ = fn x1 & x2 => (_import "gtk_window_set_mnemonic_modifier" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkModifierType.C.val_ -> unit;) (x1, x2)
    val setMnemonicsVisible_ = fn x1 & x2 => (_import "gtk_window_set_mnemonics_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setModal_ = fn x1 & x2 => (_import "gtk_window_set_modal" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setOpacity_ = fn x1 & x2 => (_import "gtk_window_set_opacity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setPosition_ = fn x1 & x2 => (_import "gtk_window_set_position" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkWindowPosition.C.val_ -> unit;) (x1, x2)
    val setResizable_ = fn x1 & x2 => (_import "gtk_window_set_resizable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setRole_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_window_set_role" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setScreen_ = fn x1 & x2 => (_import "gtk_window_set_screen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setSkipPagerHint_ = fn x1 & x2 => (_import "gtk_window_set_skip_pager_hint" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSkipTaskbarHint_ = fn x1 & x2 => (_import "gtk_window_set_skip_taskbar_hint" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setStartupId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_window_set_startup_id" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_window_set_title" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTransientFor_ = fn x1 & x2 => (_import "gtk_window_set_transient_for" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setTypeHint_ = fn x1 & x2 => (_import "gtk_window_set_type_hint" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkWindowTypeHint.C.val_ -> unit;) (x1, x2)
    val setUrgencyHint_ = fn x1 & x2 => (_import "gtk_window_set_urgency_hint" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setWmclass_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_window_set_wmclass" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val stick_ = _import "gtk_window_stick" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val unfullscreen_ = _import "gtk_window_unfullscreen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val unmaximize_ = _import "gtk_window_unmaximize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val unstick_ = _import "gtk_window_unstick" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
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
    fun getDefaultIconName () = (I ---> FFI.String.C.fromPtr false) getDefaultIconName_ ()
    fun setAutoStartupNotification setting = (FFI.Bool.C.withVal ---> I) setAutoStartupNotification_ setting
    fun setDefaultIcon icon = (GObjectObjectClass.C.withPtr ---> I) setDefaultIcon_ icon
    fun setDefaultIconFromFile filename = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) setDefaultIconFromFile_ (filename & [])
    fun setDefaultIconName name = (FFI.String.C.withConstPtr ---> I) setDefaultIconName_ name
    fun activateDefault self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) activateDefault_ self
    fun activateFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) activateFocus_ self
    fun activateKey self event = (GObjectObjectClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.C.fromVal) activateKey_ (self & event)
    fun addAccelGroup self accelGroup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addAccelGroup_ (self & accelGroup)
    fun addMnemonic self keyval target =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getDefaultSize_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
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
    fun getIconName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getIconName_ self
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
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPosition_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (rootX, rootY)
      end
    fun getResizable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getResizable_ self
    fun getResizeGripArea self =
      let
        val rect & retVal = (GObjectObjectClass.C.withPtr &&&> GdkRectangleRecord.C.withNewPtr ---> GdkRectangleRecord.C.fromPtr true && FFI.Bool.C.fromVal) getResizeGripArea_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun getRole self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getRole_ self
    fun getScreen self = (GObjectObjectClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getSize_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (width, height)
      end
    fun getSkipPagerHint self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSkipPagerHint_ self
    fun getSkipTaskbarHint self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSkipTaskbarHint_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getTitle_ self
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
         &&&> FFI.UInt.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        move_
        (
          self
           & x
           & y
        )
    fun parseGeometry self geometry = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) parseGeometry_ (self & geometry)
    fun present self = (GObjectObjectClass.C.withPtr ---> I) present_ self
    fun presentWithTime self timestamp = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) presentWithTime_ (self & timestamp)
    fun propagateKeyEvent self event = (GObjectObjectClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.C.fromVal) propagateKeyEvent_ (self & event)
    fun removeAccelGroup self accelGroup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeAccelGroup_ (self & accelGroup)
    fun removeMnemonic self keyval target =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        setIconFromFile_
        (
          self
           & filename
           & []
        )
    fun setIconName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepBelow_ (self & setting)
    fun setMnemonicModifier self modifier = (GObjectObjectClass.C.withPtr &&&> GdkModifierType.C.withVal ---> I) setMnemonicModifier_ (self & modifier)
    fun setMnemonicsVisible self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setMnemonicsVisible_ (self & setting)
    fun setModal self modal = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setModal_ (self & modal)
    fun setOpacity self opacity = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setOpacity_ (self & opacity)
    fun setPosition self position = (GObjectObjectClass.C.withPtr &&&> GtkWindowPosition.C.withVal ---> I) setPosition_ (self & position)
    fun setResizable self resizable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setResizable_ (self & resizable)
    fun setRole self role = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setRole_ (self & role)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setScreen_ (self & screen)
    fun setSkipPagerHint self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSkipPagerHint_ (self & setting)
    fun setSkipTaskbarHint self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSkipTaskbarHint_ (self & setting)
    fun setStartupId self startupId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setStartupId_ (self & startupId)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setTransientFor_ (self & parent)
    fun setTypeHint self hint = (GObjectObjectClass.C.withPtr &&&> GdkWindowTypeHint.C.withVal ---> I) setTypeHint_ (self & hint)
    fun setUrgencyHint self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUrgencyHint_ (self & setting)
    fun setWmclass self wmclassName wmclassClass =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
