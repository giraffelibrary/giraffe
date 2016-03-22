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
    val getType_ = _import "gtk_window_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_window_new" : GtkWindowType.C.val_ -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getDefaultIconName_ = _import "gtk_window_get_default_icon_name" : unit -> Utf8.C.notnull Utf8.C.out_p;
    val setAutoStartupNotification_ = _import "gtk_window_set_auto_startup_notification" : FFI.Bool.C.val_ -> unit;
    val setDefaultIcon_ = _import "gtk_window_set_default_icon" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> unit;
    val setDefaultIconFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_window_set_default_icon_from_file" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setDefaultIconName_ = _import "mlton_gtk_window_set_default_icon_name" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> unit;
    val activateDefault_ = _import "gtk_window_activate_default" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val activateFocus_ = _import "gtk_window_activate_focus" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val activateKey_ = fn x1 & x2 => (_import "gtk_window_activate_key" : GtkWindowClass.C.notnull GtkWindowClass.C.p * GdkEventKeyRecord.C.notnull GdkEventKeyRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val addAccelGroup_ = fn x1 & x2 => (_import "gtk_window_add_accel_group" : GtkWindowClass.C.notnull GtkWindowClass.C.p * GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p -> unit;) (x1, x2)
    val addMnemonic_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_add_mnemonic" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * FFI.UInt32.C.val_
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
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
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * GdkWindowEdge.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
    val deiconify_ = _import "gtk_window_deiconify" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;
    val fullscreen_ = _import "gtk_window_fullscreen" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;
    val getAcceptFocus_ = _import "gtk_window_get_accept_focus" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getApplication_ = _import "gtk_window_get_application" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> GtkApplicationClass.C.notnull GtkApplicationClass.C.p;
    val getDecorated_ = _import "gtk_window_get_decorated" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getDefaultSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_get_default_size" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefaultWidget_ = _import "gtk_window_get_default_widget" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getDeletable_ = _import "gtk_window_get_deletable" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getDestroyWithParent_ = _import "gtk_window_get_destroy_with_parent" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getFocus_ = _import "gtk_window_get_focus" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getFocusOnMap_ = _import "gtk_window_get_focus_on_map" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getFocusVisible_ = _import "gtk_window_get_focus_visible" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getGravity_ = _import "gtk_window_get_gravity" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> GdkGravity.C.val_;
    val getGroup_ = _import "gtk_window_get_group" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> GtkWindowGroupClass.C.notnull GtkWindowGroupClass.C.p;
    val getHasResizeGrip_ = _import "gtk_window_get_has_resize_grip" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getIcon_ = _import "gtk_window_get_icon" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
    val getIconName_ = _import "gtk_window_get_icon_name" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getMnemonicModifier_ = _import "gtk_window_get_mnemonic_modifier" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> GdkModifierType.C.val_;
    val getMnemonicsVisible_ = _import "gtk_window_get_mnemonics_visible" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getModal_ = _import "gtk_window_get_modal" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getOpacity_ = _import "gtk_window_get_opacity" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Double.C.val_;
    val getPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_get_position" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getResizable_ = _import "gtk_window_get_resizable" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getResizeGripArea_ = fn x1 & x2 => (_import "gtk_window_get_resize_grip_area" : GtkWindowClass.C.notnull GtkWindowClass.C.p * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getRole_ = _import "gtk_window_get_role" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getScreen_ = _import "gtk_window_get_screen" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> GdkScreenClass.C.notnull GdkScreenClass.C.p;
    val getSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_get_size" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSkipPagerHint_ = _import "gtk_window_get_skip_pager_hint" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getSkipTaskbarHint_ = _import "gtk_window_get_skip_taskbar_hint" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getTitle_ = _import "gtk_window_get_title" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getTransientFor_ = _import "gtk_window_get_transient_for" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> GtkWindowClass.C.notnull GtkWindowClass.C.p;
    val getTypeHint_ = _import "gtk_window_get_type_hint" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> GdkWindowTypeHint.C.val_;
    val getUrgencyHint_ = _import "gtk_window_get_urgency_hint" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val getWindowType_ = _import "gtk_window_get_window_type" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> GtkWindowType.C.val_;
    val hasGroup_ = _import "gtk_window_has_group" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val hasToplevelFocus_ = _import "gtk_window_has_toplevel_focus" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val iconify_ = _import "gtk_window_iconify" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;
    val isActive_ = _import "gtk_window_is_active" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val maximize_ = _import "gtk_window_maximize" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;
    val mnemonicActivate_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_mnemonic_activate" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * FFI.UInt32.C.val_
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
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val present_ = _import "gtk_window_present" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;
    val presentWithTime_ = fn x1 & x2 => (_import "gtk_window_present_with_time" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val propagateKeyEvent_ = fn x1 & x2 => (_import "gtk_window_propagate_key_event" : GtkWindowClass.C.notnull GtkWindowClass.C.p * GdkEventKeyRecord.C.notnull GdkEventKeyRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val removeAccelGroup_ = fn x1 & x2 => (_import "gtk_window_remove_accel_group" : GtkWindowClass.C.notnull GtkWindowClass.C.p * GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p -> unit;) (x1, x2)
    val removeMnemonic_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_remove_mnemonic" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * FFI.UInt32.C.val_
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val reshowWithInitialSize_ = _import "gtk_window_reshow_with_initial_size" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;
    val resize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_resize" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val resizeGripIsVisible_ = _import "gtk_window_resize_grip_is_visible" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> FFI.Bool.C.val_;
    val resizeToGeometry_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_resize_to_geometry" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAcceptFocus_ = fn x1 & x2 => (_import "gtk_window_set_accept_focus" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setApplication_ = fn x1 & x2 => (_import "gtk_window_set_application" : GtkWindowClass.C.notnull GtkWindowClass.C.p * unit GtkApplicationClass.C.p -> unit;) (x1, x2)
    val setDecorated_ = fn x1 & x2 => (_import "gtk_window_set_decorated" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setDefault_ = fn x1 & x2 => (_import "gtk_window_set_default" : GtkWindowClass.C.notnull GtkWindowClass.C.p * unit GtkWidgetClass.C.p -> unit;) (x1, x2)
    val setDefaultGeometry_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_window_set_default_geometry" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDeletable_ = fn x1 & x2 => (_import "gtk_window_set_deletable" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setDestroyWithParent_ = fn x1 & x2 => (_import "gtk_window_set_destroy_with_parent" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setFocus_ = fn x1 & x2 => (_import "gtk_window_set_focus" : GtkWindowClass.C.notnull GtkWindowClass.C.p * unit GtkWidgetClass.C.p -> unit;) (x1, x2)
    val setFocusOnMap_ = fn x1 & x2 => (_import "gtk_window_set_focus_on_map" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setFocusVisible_ = fn x1 & x2 => (_import "gtk_window_set_focus_visible" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setGeometryHints_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_window_set_geometry_hints" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * unit GtkWidgetClass.C.p
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
    val setGravity_ = fn x1 & x2 => (_import "gtk_window_set_gravity" : GtkWindowClass.C.notnull GtkWindowClass.C.p * GdkGravity.C.val_ -> unit;) (x1, x2)
    val setHasResizeGrip_ = fn x1 & x2 => (_import "gtk_window_set_has_resize_grip" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setHasUserRefCount_ = fn x1 & x2 => (_import "gtk_window_set_has_user_ref_count" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "gtk_window_set_icon" : GtkWindowClass.C.notnull GtkWindowClass.C.p * unit GdkPixbufPixbufClass.C.p -> unit;) (x1, x2)
    val setIconFromFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_window_set_icon_from_file" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setKeepAbove_ = fn x1 & x2 => (_import "gtk_window_set_keep_above" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setKeepBelow_ = fn x1 & x2 => (_import "gtk_window_set_keep_below" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setMnemonicModifier_ = fn x1 & x2 => (_import "gtk_window_set_mnemonic_modifier" : GtkWindowClass.C.notnull GtkWindowClass.C.p * GdkModifierType.C.val_ -> unit;) (x1, x2)
    val setMnemonicsVisible_ = fn x1 & x2 => (_import "gtk_window_set_mnemonics_visible" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setModal_ = fn x1 & x2 => (_import "gtk_window_set_modal" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setOpacity_ = fn x1 & x2 => (_import "gtk_window_set_opacity" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setPosition_ = fn x1 & x2 => (_import "gtk_window_set_position" : GtkWindowClass.C.notnull GtkWindowClass.C.p * GtkWindowPosition.C.val_ -> unit;) (x1, x2)
    val setResizable_ = fn x1 & x2 => (_import "gtk_window_set_resizable" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setRole_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_window_set_role" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setScreen_ = fn x1 & x2 => (_import "gtk_window_set_screen" : GtkWindowClass.C.notnull GtkWindowClass.C.p * GdkScreenClass.C.notnull GdkScreenClass.C.p -> unit;) (x1, x2)
    val setSkipPagerHint_ = fn x1 & x2 => (_import "gtk_window_set_skip_pager_hint" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSkipTaskbarHint_ = fn x1 & x2 => (_import "gtk_window_set_skip_taskbar_hint" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setStartupId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_window_set_startup_id" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTransientFor_ = fn x1 & x2 => (_import "gtk_window_set_transient_for" : GtkWindowClass.C.notnull GtkWindowClass.C.p * unit GtkWindowClass.C.p -> unit;) (x1, x2)
    val setTypeHint_ = fn x1 & x2 => (_import "gtk_window_set_type_hint" : GtkWindowClass.C.notnull GtkWindowClass.C.p * GdkWindowTypeHint.C.val_ -> unit;) (x1, x2)
    val setUrgencyHint_ = fn x1 & x2 => (_import "gtk_window_set_urgency_hint" : GtkWindowClass.C.notnull GtkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setWmclass_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_window_set_wmclass" :
              GtkWindowClass.C.notnull GtkWindowClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val stick_ = _import "gtk_window_stick" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;
    val unfullscreen_ = _import "gtk_window_unfullscreen" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;
    val unmaximize_ = _import "gtk_window_unmaximize" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;
    val unstick_ = _import "gtk_window_unstick" : GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;
    type 'a class = 'a GtkWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a window_group_class = 'a GtkWindowGroupClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a application_class = 'a GtkApplicationClass.class
    type window_type_t = GtkWindowType.t
    type window_position_t = GtkWindowPosition.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new type' = (GtkWindowType.C.withVal ---> GtkWindowClass.C.fromPtr false) new_ type'
    fun getDefaultIconName () = (I ---> Utf8.C.fromPtr false) getDefaultIconName_ ()
    fun setAutoStartupNotification setting = (FFI.Bool.C.withVal ---> I) setAutoStartupNotification_ setting
    fun setDefaultIcon icon = (GdkPixbufPixbufClass.C.withPtr ---> I) setDefaultIcon_ icon
    fun setDefaultIconFromFile filename = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) setDefaultIconFromFile_ (filename & [])
    fun setDefaultIconName name = (Utf8.C.withPtr ---> I) setDefaultIconName_ name
    fun activateDefault self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) activateDefault_ self
    fun activateFocus self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) activateFocus_ self
    fun activateKey self event = (GtkWindowClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.C.fromVal) activateKey_ (self & event)
    fun addAccelGroup self accelGroup = (GtkWindowClass.C.withPtr &&&> GtkAccelGroupClass.C.withPtr ---> I) addAccelGroup_ (self & accelGroup)
    fun addMnemonic self keyval target =
      (
        GtkWindowClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GtkWidgetClass.C.withPtr
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
        GtkWindowClass.C.withPtr
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
        GtkWindowClass.C.withPtr
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
    fun deiconify self = (GtkWindowClass.C.withPtr ---> I) deiconify_ self
    fun fullscreen self = (GtkWindowClass.C.withPtr ---> I) fullscreen_ self
    fun getAcceptFocus self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getAcceptFocus_ self
    fun getApplication self = (GtkWindowClass.C.withPtr ---> GtkApplicationClass.C.fromPtr false) getApplication_ self
    fun getDecorated self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getDecorated_ self
    fun getDefaultSize self =
      let
        val width
         & height
         & () =
          (
            GtkWindowClass.C.withPtr
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
    fun getDefaultWidget self = (GtkWindowClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getDefaultWidget_ self
    fun getDeletable self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getDeletable_ self
    fun getDestroyWithParent self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getDestroyWithParent_ self
    fun getFocus self = (GtkWindowClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getFocus_ self
    fun getFocusOnMap self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusOnMap_ self
    fun getFocusVisible self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusVisible_ self
    fun getGravity self = (GtkWindowClass.C.withPtr ---> GdkGravity.C.fromVal) getGravity_ self
    fun getGroup self = (GtkWindowClass.C.withPtr ---> GtkWindowGroupClass.C.fromPtr false) getGroup_ self
    fun getHasResizeGrip self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasResizeGrip_ self
    fun getIcon self = (GtkWindowClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getIcon_ self
    fun getIconName self = (GtkWindowClass.C.withPtr ---> Utf8.C.fromPtr false) getIconName_ self
    fun getMnemonicModifier self = (GtkWindowClass.C.withPtr ---> GdkModifierType.C.fromVal) getMnemonicModifier_ self
    fun getMnemonicsVisible self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getMnemonicsVisible_ self
    fun getModal self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getModal_ self
    fun getOpacity self = (GtkWindowClass.C.withPtr ---> FFI.Double.C.fromVal) getOpacity_ self
    fun getPosition self =
      let
        val rootX
         & rootY
         & () =
          (
            GtkWindowClass.C.withPtr
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
    fun getResizable self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getResizable_ self
    fun getResizeGripArea self =
      let
        val rect & retVal = (GtkWindowClass.C.withPtr &&&> CairoRectangleIntRecord.C.withNewPtr ---> CairoRectangleIntRecord.C.fromPtr true && FFI.Bool.C.fromVal) getResizeGripArea_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun getRole self = (GtkWindowClass.C.withPtr ---> Utf8.C.fromPtr false) getRole_ self
    fun getScreen self = (GtkWindowClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GtkWindowClass.C.withPtr
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
    fun getSkipPagerHint self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getSkipPagerHint_ self
    fun getSkipTaskbarHint self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getSkipTaskbarHint_ self
    fun getTitle self = (GtkWindowClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getTransientFor self = (GtkWindowClass.C.withPtr ---> GtkWindowClass.C.fromPtr false) getTransientFor_ self
    fun getTypeHint self = (GtkWindowClass.C.withPtr ---> GdkWindowTypeHint.C.fromVal) getTypeHint_ self
    fun getUrgencyHint self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getUrgencyHint_ self
    fun getWindowType self = (GtkWindowClass.C.withPtr ---> GtkWindowType.C.fromVal) getWindowType_ self
    fun hasGroup self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) hasGroup_ self
    fun hasToplevelFocus self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) hasToplevelFocus_ self
    fun iconify self = (GtkWindowClass.C.withPtr ---> I) iconify_ self
    fun isActive self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) isActive_ self
    fun maximize self = (GtkWindowClass.C.withPtr ---> I) maximize_ self
    fun mnemonicActivate self keyval modifier =
      (
        GtkWindowClass.C.withPtr
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
        GtkWindowClass.C.withPtr
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
    fun parseGeometry self geometry = (GtkWindowClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) parseGeometry_ (self & geometry)
    fun present self = (GtkWindowClass.C.withPtr ---> I) present_ self
    fun presentWithTime self timestamp = (GtkWindowClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) presentWithTime_ (self & timestamp)
    fun propagateKeyEvent self event = (GtkWindowClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.C.fromVal) propagateKeyEvent_ (self & event)
    fun removeAccelGroup self accelGroup = (GtkWindowClass.C.withPtr &&&> GtkAccelGroupClass.C.withPtr ---> I) removeAccelGroup_ (self & accelGroup)
    fun removeMnemonic self keyval target =
      (
        GtkWindowClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GtkWidgetClass.C.withPtr
         ---> I
      )
        removeMnemonic_
        (
          self
           & keyval
           & target
        )
    fun reshowWithInitialSize self = (GtkWindowClass.C.withPtr ---> I) reshowWithInitialSize_ self
    fun resize self width height =
      (
        GtkWindowClass.C.withPtr
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
    fun resizeGripIsVisible self = (GtkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) resizeGripIsVisible_ self
    fun resizeToGeometry self width height =
      (
        GtkWindowClass.C.withPtr
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
    fun setAcceptFocus self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAcceptFocus_ (self & setting)
    fun setApplication self application = (GtkWindowClass.C.withPtr &&&> GtkApplicationClass.C.withOptPtr ---> I) setApplication_ (self & application)
    fun setDecorated self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDecorated_ (self & setting)
    fun setDefault self defaultWidget = (GtkWindowClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setDefault_ (self & defaultWidget)
    fun setDefaultGeometry self width height =
      (
        GtkWindowClass.C.withPtr
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
        GtkWindowClass.C.withPtr
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
    fun setDeletable self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDeletable_ (self & setting)
    fun setDestroyWithParent self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDestroyWithParent_ (self & setting)
    fun setFocus self focus = (GtkWindowClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setFocus_ (self & focus)
    fun setFocusOnMap self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusOnMap_ (self & setting)
    fun setFocusVisible self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusVisible_ (self & setting)
    fun setGeometryHints self geometryWidget geometry geomMask =
      (
        GtkWindowClass.C.withPtr
         &&&> GtkWidgetClass.C.withOptPtr
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
    fun setGravity self gravity = (GtkWindowClass.C.withPtr &&&> GdkGravity.C.withVal ---> I) setGravity_ (self & gravity)
    fun setHasResizeGrip self value = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasResizeGrip_ (self & value)
    fun setHasUserRefCount self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasUserRefCount_ (self & setting)
    fun setIcon self icon = (GtkWindowClass.C.withPtr &&&> GdkPixbufPixbufClass.C.withOptPtr ---> I) setIcon_ (self & icon)
    fun setIconFromFile self filename =
      (
        GtkWindowClass.C.withPtr
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
    fun setIconName self name = (GtkWindowClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepBelow_ (self & setting)
    fun setMnemonicModifier self modifier = (GtkWindowClass.C.withPtr &&&> GdkModifierType.C.withVal ---> I) setMnemonicModifier_ (self & modifier)
    fun setMnemonicsVisible self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setMnemonicsVisible_ (self & setting)
    fun setModal self modal = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setModal_ (self & modal)
    fun setOpacity self opacity = (GtkWindowClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setOpacity_ (self & opacity)
    fun setPosition self position = (GtkWindowClass.C.withPtr &&&> GtkWindowPosition.C.withVal ---> I) setPosition_ (self & position)
    fun setResizable self resizable = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setResizable_ (self & resizable)
    fun setRole self role = (GtkWindowClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setRole_ (self & role)
    fun setScreen self screen = (GtkWindowClass.C.withPtr &&&> GdkScreenClass.C.withPtr ---> I) setScreen_ (self & screen)
    fun setSkipPagerHint self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSkipPagerHint_ (self & setting)
    fun setSkipTaskbarHint self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSkipTaskbarHint_ (self & setting)
    fun setStartupId self startupId = (GtkWindowClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setStartupId_ (self & startupId)
    fun setTitle self title = (GtkWindowClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GtkWindowClass.C.withPtr &&&> GtkWindowClass.C.withOptPtr ---> I) setTransientFor_ (self & parent)
    fun setTypeHint self hint = (GtkWindowClass.C.withPtr &&&> GdkWindowTypeHint.C.withVal ---> I) setTypeHint_ (self & hint)
    fun setUrgencyHint self setting = (GtkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUrgencyHint_ (self & setting)
    fun setWmclass self wmclassName wmclassClass =
      (
        GtkWindowClass.C.withPtr
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
    fun stick self = (GtkWindowClass.C.withPtr ---> I) stick_ self
    fun unfullscreen self = (GtkWindowClass.C.withPtr ---> I) unfullscreen_ self
    fun unmaximize self = (GtkWindowClass.C.withPtr ---> I) unmaximize_ self
    fun unstick self = (GtkWindowClass.C.withPtr ---> I) unstick_ self
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
