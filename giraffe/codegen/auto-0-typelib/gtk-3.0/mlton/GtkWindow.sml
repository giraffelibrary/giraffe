structure GtkWindow :>
  GTK_WINDOW
    where type 'a class = 'a GtkWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a window_group_class = 'a GtkWindowGroupClass.class
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a application_class = 'a GtkApplicationClass.class
    where type window_type_t = GtkWindowType.t
    where type window_position_t = GtkWindowPosition.t =
  struct
    val getType_ = _import "gtk_window_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_window_new" : GtkWindowType.FFI.val_ -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getDefaultIconName_ = _import "gtk_window_get_default_icon_name" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val setAutoStartupNotification_ = _import "gtk_window_set_auto_startup_notification" : GBool.FFI.val_ -> unit;
    val setDefaultIcon_ = _import "gtk_window_set_default_icon" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> unit;
    val setDefaultIconFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_window_set_default_icon_from_file" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setDefaultIconName_ = _import "mlton_gtk_window_set_default_icon_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val activateDefault_ = _import "gtk_window_activate_default" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val activateFocus_ = _import "gtk_window_activate_focus" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val activateKey_ = fn x1 & x2 => (_import "gtk_window_activate_key" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GdkEventKeyRecord.FFI.notnull GdkEventKeyRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val addAccelGroup_ = fn x1 & x2 => (_import "gtk_window_add_accel_group" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p -> unit;) (x1, x2)
    val addMnemonic_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_add_mnemonic" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GUInt32.FFI.val_
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
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
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GUInt32.FFI.val_
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
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GdkWindowEdge.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GUInt32.FFI.val_
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
    val deiconify_ = _import "gtk_window_deiconify" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;
    val fullscreen_ = _import "gtk_window_fullscreen" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;
    val getAcceptFocus_ = _import "gtk_window_get_accept_focus" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getApplication_ = _import "gtk_window_get_application" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GtkApplicationClass.FFI.notnull GtkApplicationClass.FFI.p;
    val getDecorated_ = _import "gtk_window_get_decorated" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getDefaultSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_get_default_size" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefaultWidget_ = _import "gtk_window_get_default_widget" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getDeletable_ = _import "gtk_window_get_deletable" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getDestroyWithParent_ = _import "gtk_window_get_destroy_with_parent" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getFocus_ = _import "gtk_window_get_focus" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getFocusOnMap_ = _import "gtk_window_get_focus_on_map" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getFocusVisible_ = _import "gtk_window_get_focus_visible" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getGravity_ = _import "gtk_window_get_gravity" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GdkGravity.FFI.val_;
    val getGroup_ = _import "gtk_window_get_group" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GtkWindowGroupClass.FFI.notnull GtkWindowGroupClass.FFI.p;
    val getHasResizeGrip_ = _import "gtk_window_get_has_resize_grip" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getIcon_ = _import "gtk_window_get_icon" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
    val getIconName_ = _import "gtk_window_get_icon_name" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getMnemonicModifier_ = _import "gtk_window_get_mnemonic_modifier" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GdkModifierType.FFI.val_;
    val getMnemonicsVisible_ = _import "gtk_window_get_mnemonics_visible" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getModal_ = _import "gtk_window_get_modal" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getOpacity_ = _import "gtk_window_get_opacity" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GDouble.FFI.val_;
    val getPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_get_position" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getResizable_ = _import "gtk_window_get_resizable" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getResizeGripArea_ = fn x1 & x2 => (_import "gtk_window_get_resize_grip_area" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * CairoRectangleIntRecord.FFI.notnull CairoRectangleIntRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getRole_ = _import "gtk_window_get_role" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getScreen_ = _import "gtk_window_get_screen" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p;
    val getSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_get_size" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSkipPagerHint_ = _import "gtk_window_get_skip_pager_hint" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getSkipTaskbarHint_ = _import "gtk_window_get_skip_taskbar_hint" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getTitle_ = _import "gtk_window_get_title" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getTransientFor_ = _import "gtk_window_get_transient_for" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p;
    val getTypeHint_ = _import "gtk_window_get_type_hint" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GdkWindowTypeHint.FFI.val_;
    val getUrgencyHint_ = _import "gtk_window_get_urgency_hint" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val getWindowType_ = _import "gtk_window_get_window_type" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GtkWindowType.FFI.val_;
    val hasGroup_ = _import "gtk_window_has_group" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val hasToplevelFocus_ = _import "gtk_window_has_toplevel_focus" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val iconify_ = _import "gtk_window_iconify" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;
    val isActive_ = _import "gtk_window_is_active" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val maximize_ = _import "gtk_window_maximize" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;
    val mnemonicActivate_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_mnemonic_activate" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GUInt32.FFI.val_
               * GdkModifierType.FFI.val_
               -> GBool.FFI.val_;
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
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val present_ = _import "gtk_window_present" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;
    val presentWithTime_ = fn x1 & x2 => (_import "gtk_window_present_with_time" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val propagateKeyEvent_ = fn x1 & x2 => (_import "gtk_window_propagate_key_event" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GdkEventKeyRecord.FFI.notnull GdkEventKeyRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val removeAccelGroup_ = fn x1 & x2 => (_import "gtk_window_remove_accel_group" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p -> unit;) (x1, x2)
    val removeMnemonic_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_remove_mnemonic" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GUInt32.FFI.val_
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val reshowWithInitialSize_ = _import "gtk_window_reshow_with_initial_size" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;
    val resize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_resize" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val resizeGripIsVisible_ = _import "gtk_window_resize_grip_is_visible" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> GBool.FFI.val_;
    val resizeToGeometry_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_resize_to_geometry" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAcceptFocus_ = fn x1 & x2 => (_import "gtk_window_set_accept_focus" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setApplication_ = fn x1 & x2 => (_import "gtk_window_set_application" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * unit GtkApplicationClass.FFI.p -> unit;) (x1, x2)
    val setDecorated_ = fn x1 & x2 => (_import "gtk_window_set_decorated" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setDefault_ = fn x1 & x2 => (_import "gtk_window_set_default" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setDefaultGeometry_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_set_default_geometry" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDeletable_ = fn x1 & x2 => (_import "gtk_window_set_deletable" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setDestroyWithParent_ = fn x1 & x2 => (_import "gtk_window_set_destroy_with_parent" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setFocus_ = fn x1 & x2 => (_import "gtk_window_set_focus" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setFocusOnMap_ = fn x1 & x2 => (_import "gtk_window_set_focus_on_map" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setFocusVisible_ = fn x1 & x2 => (_import "gtk_window_set_focus_visible" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setGeometryHints_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_window_set_geometry_hints" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * unit GtkWidgetClass.FFI.p
               * unit GdkGeometryRecord.FFI.p
               * GdkWindowHints.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setGravity_ = fn x1 & x2 => (_import "gtk_window_set_gravity" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GdkGravity.FFI.val_ -> unit;) (x1, x2)
    val setHasResizeGrip_ = fn x1 & x2 => (_import "gtk_window_set_has_resize_grip" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHasUserRefCount_ = fn x1 & x2 => (_import "gtk_window_set_has_user_ref_count" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "gtk_window_set_icon" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * unit GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val setIconFromFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_window_set_icon_from_file" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setKeepAbove_ = fn x1 & x2 => (_import "gtk_window_set_keep_above" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setKeepBelow_ = fn x1 & x2 => (_import "gtk_window_set_keep_below" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMnemonicModifier_ = fn x1 & x2 => (_import "gtk_window_set_mnemonic_modifier" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GdkModifierType.FFI.val_ -> unit;) (x1, x2)
    val setMnemonicsVisible_ = fn x1 & x2 => (_import "gtk_window_set_mnemonics_visible" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setModal_ = fn x1 & x2 => (_import "gtk_window_set_modal" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setOpacity_ = fn x1 & x2 => (_import "gtk_window_set_opacity" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setPosition_ = fn x1 & x2 => (_import "gtk_window_set_position" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GtkWindowPosition.FFI.val_ -> unit;) (x1, x2)
    val setResizable_ = fn x1 & x2 => (_import "gtk_window_set_resizable" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRole_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_window_set_role" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setScreen_ = fn x1 & x2 => (_import "gtk_window_set_screen" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> unit;) (x1, x2)
    val setSkipPagerHint_ = fn x1 & x2 => (_import "gtk_window_set_skip_pager_hint" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSkipTaskbarHint_ = fn x1 & x2 => (_import "gtk_window_set_skip_taskbar_hint" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setStartupId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_window_set_startup_id" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTransientFor_ = fn x1 & x2 => (_import "gtk_window_set_transient_for" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * unit GtkWindowClass.FFI.p -> unit;) (x1, x2)
    val setTypeHint_ = fn x1 & x2 => (_import "gtk_window_set_type_hint" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GdkWindowTypeHint.FFI.val_ -> unit;) (x1, x2)
    val setUrgencyHint_ = fn x1 & x2 => (_import "gtk_window_set_urgency_hint" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setWmclass_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_window_set_wmclass" :
              GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val stick_ = _import "gtk_window_stick" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;
    val unfullscreen_ = _import "gtk_window_unfullscreen" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;
    val unmaximize_ = _import "gtk_window_unmaximize" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;
    val unstick_ = _import "gtk_window_unstick" : GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;
    type 'a class = 'a GtkWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a window_group_class = 'a GtkWindowGroupClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a application_class = 'a GtkApplicationClass.class
    type window_type_t = GtkWindowType.t
    type window_position_t = GtkWindowPosition.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new type' = (GtkWindowType.FFI.withVal ---> GtkWindowClass.FFI.fromPtr false) new_ type'
    fun getDefaultIconName () = (I ---> Utf8.FFI.fromPtr 0) getDefaultIconName_ ()
    fun setAutoStartupNotification setting = (GBool.FFI.withVal ---> I) setAutoStartupNotification_ setting
    fun setDefaultIcon icon = (GdkPixbufPixbufClass.FFI.withPtr ---> I) setDefaultIcon_ icon
    fun setDefaultIconFromFile filename = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) setDefaultIconFromFile_ (filename & [])
    fun setDefaultIconName name = (Utf8.FFI.withPtr ---> I) setDefaultIconName_ name
    fun activateDefault self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) activateDefault_ self
    fun activateFocus self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) activateFocus_ self
    fun activateKey self event = (GtkWindowClass.FFI.withPtr &&&> GdkEventKeyRecord.FFI.withPtr ---> GBool.FFI.fromVal) activateKey_ (self & event)
    fun addAccelGroup self accelGroup = (GtkWindowClass.FFI.withPtr &&&> GtkAccelGroupClass.FFI.withPtr ---> I) addAccelGroup_ (self & accelGroup)
    fun addMnemonic self (keyval, target) =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GtkWidgetClass.FFI.withPtr
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
        GtkWindowClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
        GtkWindowClass.FFI.withPtr
         &&&> GdkWindowEdge.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
    fun deiconify self = (GtkWindowClass.FFI.withPtr ---> I) deiconify_ self
    fun fullscreen self = (GtkWindowClass.FFI.withPtr ---> I) fullscreen_ self
    fun getAcceptFocus self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getAcceptFocus_ self
    fun getApplication self = (GtkWindowClass.FFI.withPtr ---> GtkApplicationClass.FFI.fromPtr false) getApplication_ self
    fun getDecorated self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getDecorated_ self
    fun getDefaultSize self =
      let
        val width
         & height
         & () =
          (
            GtkWindowClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getDefaultSize_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (width, height)
      end
    fun getDefaultWidget self = (GtkWindowClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getDefaultWidget_ self
    fun getDeletable self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getDeletable_ self
    fun getDestroyWithParent self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getDestroyWithParent_ self
    fun getFocus self = (GtkWindowClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getFocus_ self
    fun getFocusOnMap self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getFocusOnMap_ self
    fun getFocusVisible self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getFocusVisible_ self
    fun getGravity self = (GtkWindowClass.FFI.withPtr ---> GdkGravity.FFI.fromVal) getGravity_ self
    fun getGroup self = (GtkWindowClass.FFI.withPtr ---> GtkWindowGroupClass.FFI.fromPtr false) getGroup_ self
    fun getHasResizeGrip self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasResizeGrip_ self
    fun getIcon self = (GtkWindowClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getIcon_ self
    fun getIconName self = (GtkWindowClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getIconName_ self
    fun getMnemonicModifier self = (GtkWindowClass.FFI.withPtr ---> GdkModifierType.FFI.fromVal) getMnemonicModifier_ self
    fun getMnemonicsVisible self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getMnemonicsVisible_ self
    fun getModal self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getModal_ self
    fun getOpacity self = (GtkWindowClass.FFI.withPtr ---> GDouble.FFI.fromVal) getOpacity_ self
    fun getPosition self =
      let
        val rootX
         & rootY
         & () =
          (
            GtkWindowClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPosition_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (rootX, rootY)
      end
    fun getResizable self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getResizable_ self
    fun getResizeGripArea self =
      let
        val rect & retVal = (GtkWindowClass.FFI.withPtr &&&> CairoRectangleIntRecord.FFI.withNewPtr ---> CairoRectangleIntRecord.FFI.fromPtr true && GBool.FFI.fromVal) getResizeGripArea_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun getRole self = (GtkWindowClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getRole_ self
    fun getScreen self = (GtkWindowClass.FFI.withPtr ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GtkWindowClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getSize_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (width, height)
      end
    fun getSkipPagerHint self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getSkipPagerHint_ self
    fun getSkipTaskbarHint self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getSkipTaskbarHint_ self
    fun getTitle self = (GtkWindowClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getTransientFor self = (GtkWindowClass.FFI.withPtr ---> GtkWindowClass.FFI.fromPtr false) getTransientFor_ self
    fun getTypeHint self = (GtkWindowClass.FFI.withPtr ---> GdkWindowTypeHint.FFI.fromVal) getTypeHint_ self
    fun getUrgencyHint self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getUrgencyHint_ self
    fun getWindowType self = (GtkWindowClass.FFI.withPtr ---> GtkWindowType.FFI.fromVal) getWindowType_ self
    fun hasGroup self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) hasGroup_ self
    fun hasToplevelFocus self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) hasToplevelFocus_ self
    fun iconify self = (GtkWindowClass.FFI.withPtr ---> I) iconify_ self
    fun isActive self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) isActive_ self
    fun maximize self = (GtkWindowClass.FFI.withPtr ---> I) maximize_ self
    fun mnemonicActivate self (keyval, modifier) =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
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
        GtkWindowClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        move_
        (
          self
           & x
           & y
        )
    fun parseGeometry self geometry = (GtkWindowClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) parseGeometry_ (self & geometry)
    fun present self = (GtkWindowClass.FFI.withPtr ---> I) present_ self
    fun presentWithTime self timestamp = (GtkWindowClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) presentWithTime_ (self & timestamp)
    fun propagateKeyEvent self event = (GtkWindowClass.FFI.withPtr &&&> GdkEventKeyRecord.FFI.withPtr ---> GBool.FFI.fromVal) propagateKeyEvent_ (self & event)
    fun removeAccelGroup self accelGroup = (GtkWindowClass.FFI.withPtr &&&> GtkAccelGroupClass.FFI.withPtr ---> I) removeAccelGroup_ (self & accelGroup)
    fun removeMnemonic self (keyval, target) =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GtkWidgetClass.FFI.withPtr
         ---> I
      )
        removeMnemonic_
        (
          self
           & keyval
           & target
        )
    fun reshowWithInitialSize self = (GtkWindowClass.FFI.withPtr ---> I) reshowWithInitialSize_ self
    fun resize self (width, height) =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        resize_
        (
          self
           & width
           & height
        )
    fun resizeGripIsVisible self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) resizeGripIsVisible_ self
    fun resizeToGeometry self (width, height) =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        resizeToGeometry_
        (
          self
           & width
           & height
        )
    fun setAcceptFocus self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAcceptFocus_ (self & setting)
    fun setApplication self application = (GtkWindowClass.FFI.withPtr &&&> GtkApplicationClass.FFI.withOptPtr ---> I) setApplication_ (self & application)
    fun setDecorated self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDecorated_ (self & setting)
    fun setDefault self defaultWidget = (GtkWindowClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setDefault_ (self & defaultWidget)
    fun setDefaultGeometry self (width, height) =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
        GtkWindowClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setDefaultSize_
        (
          self
           & width
           & height
        )
    fun setDeletable self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDeletable_ (self & setting)
    fun setDestroyWithParent self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDestroyWithParent_ (self & setting)
    fun setFocus self focus = (GtkWindowClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setFocus_ (self & focus)
    fun setFocusOnMap self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFocusOnMap_ (self & setting)
    fun setFocusVisible self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFocusVisible_ (self & setting)
    fun setGeometryHints
      self
      (
        geometryWidget,
        geometry,
        geomMask
      ) =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> GdkGeometryRecord.FFI.withOptPtr
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
    fun setGravity self gravity = (GtkWindowClass.FFI.withPtr &&&> GdkGravity.FFI.withVal ---> I) setGravity_ (self & gravity)
    fun setHasResizeGrip self value = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHasResizeGrip_ (self & value)
    fun setHasUserRefCount self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHasUserRefCount_ (self & setting)
    fun setIcon self icon = (GtkWindowClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withOptPtr ---> I) setIcon_ (self & icon)
    fun setIconFromFile self filename =
      (
        GtkWindowClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        setIconFromFile_
        (
          self
           & filename
           & []
        )
    fun setIconName self name = (GtkWindowClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setKeepBelow_ (self & setting)
    fun setMnemonicModifier self modifier = (GtkWindowClass.FFI.withPtr &&&> GdkModifierType.FFI.withVal ---> I) setMnemonicModifier_ (self & modifier)
    fun setMnemonicsVisible self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setMnemonicsVisible_ (self & setting)
    fun setModal self modal = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setModal_ (self & modal)
    fun setOpacity self opacity = (GtkWindowClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setOpacity_ (self & opacity)
    fun setPosition self position = (GtkWindowClass.FFI.withPtr &&&> GtkWindowPosition.FFI.withVal ---> I) setPosition_ (self & position)
    fun setResizable self resizable = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setResizable_ (self & resizable)
    fun setRole self role = (GtkWindowClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setRole_ (self & role)
    fun setScreen self screen = (GtkWindowClass.FFI.withPtr &&&> GdkScreenClass.FFI.withPtr ---> I) setScreen_ (self & screen)
    fun setSkipPagerHint self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSkipPagerHint_ (self & setting)
    fun setSkipTaskbarHint self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSkipTaskbarHint_ (self & setting)
    fun setStartupId self startupId = (GtkWindowClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setStartupId_ (self & startupId)
    fun setTitle self title = (GtkWindowClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GtkWindowClass.FFI.withPtr &&&> GtkWindowClass.FFI.withOptPtr ---> I) setTransientFor_ (self & parent)
    fun setTypeHint self hint = (GtkWindowClass.FFI.withPtr &&&> GdkWindowTypeHint.FFI.withVal ---> I) setTypeHint_ (self & hint)
    fun setUrgencyHint self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUrgencyHint_ (self & setting)
    fun setWmclass self (wmclassName, wmclassClass) =
      (
        GtkWindowClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setWmclass_
        (
          self
           & wmclassName
           & wmclassClass
        )
    fun stick self = (GtkWindowClass.FFI.withPtr ---> I) stick_ self
    fun unfullscreen self = (GtkWindowClass.FFI.withPtr ---> I) unfullscreen_ self
    fun unmaximize self = (GtkWindowClass.FFI.withPtr ---> I) unmaximize_ self
    fun unstick self = (GtkWindowClass.FFI.withPtr ---> I) unstick_ self
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
