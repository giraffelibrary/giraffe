structure GdkWindow :>
  GDK_WINDOW
    where type 'a class = 'a GdkWindowClass.class
    where type window_attr_t = GdkWindowAttrRecord.t
    where type window_edge_t = GdkWindowEdge.t
    where type modifier_type_t = GdkModifierType.t
    where type 'a display_class = 'a GdkDisplayClass.class
    where type drag_protocol_t = GdkDragProtocol.t
    where type 'a screen_class = 'a GdkScreenClass.class
    where type window_state_t = GdkWindowState.t
    where type 'a visual_class = 'a GdkVisualClass.class
    where type window_type_t = GdkWindowType.t
    where type color_t = GdkColorRecord.t
    where type rgba_t = GdkRgbaRecord.t
    where type w_m_decoration_t = GdkWMDecoration.t
    where type 'a device_class = 'a GdkDeviceClass.class
    where type w_m_function_t = GdkWMFunction.t
    where type window_hints_t = GdkWindowHints.t
    where type geometry_t = GdkGeometryRecord.t
    where type event_mask_t = GdkEventMask.t
    where type input_source_t = GdkInputSource.t
    where type window_type_hint_t = GdkWindowTypeHint.t
    where type 'a cursor_class = 'a GdkCursorClass.class =
  struct
    val getType_ = _import "gdk_window_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_new" :
              unit GdkWindowClass.FFI.p
               * GdkWindowAttrRecord.FFI.notnull GdkWindowAttrRecord.FFI.p
               * GInt32.FFI.val_
               -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val constrainSize_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gdk_window_constrain_size" :
              GdkGeometryRecord.FFI.notnull GdkGeometryRecord.FFI.p
               * GUInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
    val processAllUpdates_ = _import "gdk_window_process_all_updates" : unit -> unit;
    val setDebugUpdates_ = _import "gdk_window_set_debug_updates" : GBool.FFI.val_ -> unit;
    val beep_ = _import "gdk_window_beep" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val beginMoveDrag_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_begin_move_drag" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
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
    val beginPaintRect_ = fn x1 & x2 => (_import "gdk_window_begin_paint_rect" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * CairoRectangleIntRecord.FFI.notnull CairoRectangleIntRecord.FFI.p -> unit;) (x1, x2)
    val beginPaintRegion_ = fn x1 & x2 => (_import "gdk_window_begin_paint_region" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * CairoRegionRecord.FFI.notnull CairoRegionRecord.FFI.p -> unit;) (x1, x2)
    val beginResizeDrag_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gdk_window_begin_resize_drag" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
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
    val configureFinished_ = _import "gdk_window_configure_finished" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val coordsFromParent_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_coords_from_parent" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val coordsToParent_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_coords_to_parent" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val createSimilarSurface_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_window_create_similar_surface" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * CairoContent.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> CairoSurfaceRecord.FFI.notnull CairoSurfaceRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val deiconify_ = _import "gdk_window_deiconify" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val destroy_ = _import "gdk_window_destroy" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val destroyNotify_ = _import "gdk_window_destroy_notify" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val enableSynchronizedConfigure_ = _import "gdk_window_enable_synchronized_configure" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val endPaint_ = _import "gdk_window_end_paint" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val ensureNative_ = _import "gdk_window_ensure_native" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val flush_ = _import "gdk_window_flush" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val focus_ = fn x1 & x2 => (_import "gdk_window_focus" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val freezeToplevelUpdatesLibgtkOnly_ = _import "gdk_window_freeze_toplevel_updates_libgtk_only" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val freezeUpdates_ = _import "gdk_window_freeze_updates" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val fullscreen_ = _import "gdk_window_fullscreen" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val geometryChanged_ = _import "gdk_window_geometry_changed" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val getAcceptFocus_ = _import "gdk_window_get_accept_focus" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val getBackgroundPattern_ = _import "gdk_window_get_background_pattern" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> CairoPatternRecord.FFI.notnull CairoPatternRecord.FFI.p;
    val getClipRegion_ = _import "gdk_window_get_clip_region" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> CairoRegionRecord.FFI.notnull CairoRegionRecord.FFI.p;
    val getComposited_ = _import "gdk_window_get_composited" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val getCursor_ = _import "gdk_window_get_cursor" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkCursorClass.FFI.notnull GdkCursorClass.FFI.p;
    val getDecorations_ = fn x1 & x2 => (_import "gdk_window_get_decorations" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GdkWMDecoration.FFI.ref_ -> GBool.FFI.val_;) (x1, x2)
    val getDeviceCursor_ = fn x1 & x2 => (_import "gdk_window_get_device_cursor" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> GdkCursorClass.FFI.notnull GdkCursorClass.FFI.p;) (x1, x2)
    val getDeviceEvents_ = fn x1 & x2 => (_import "gdk_window_get_device_events" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> GdkEventMask.FFI.val_;) (x1, x2)
    val getDevicePosition_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_get_device_position" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GdkModifierType.FFI.ref_
               -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getDisplay_ = _import "gdk_window_get_display" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p;
    val getDragProtocol_ = fn x1 & x2 => (_import "gdk_window_get_drag_protocol" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * (unit, GdkWindowClass.FFI.notnull) GdkWindowClass.FFI.r -> GdkDragProtocol.FFI.val_;) (x1, x2)
    val getEffectiveParent_ = _import "gdk_window_get_effective_parent" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val getEffectiveToplevel_ = _import "gdk_window_get_effective_toplevel" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val getEvents_ = _import "gdk_window_get_events" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkEventMask.FFI.val_;
    val getFocusOnMap_ = _import "gdk_window_get_focus_on_map" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val getFrameExtents_ = fn x1 & x2 => (_import "gdk_window_get_frame_extents" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * CairoRectangleIntRecord.FFI.notnull CairoRectangleIntRecord.FFI.p -> unit;) (x1, x2)
    val getGeometry_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_get_geometry" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getGroup_ = _import "gdk_window_get_group" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val getHeight_ = _import "gdk_window_get_height" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GInt32.FFI.val_;
    val getModalHint_ = _import "gdk_window_get_modal_hint" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val getOrigin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_get_origin" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getParent_ = _import "gdk_window_get_parent" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val getPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_get_position" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getRootCoords_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_get_root_coords" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getRootOrigin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_get_root_origin" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getScreen_ = _import "gdk_window_get_screen" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p;
    val getSourceEvents_ = fn x1 & x2 => (_import "gdk_window_get_source_events" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GdkInputSource.FFI.val_ -> GdkEventMask.FFI.val_;) (x1, x2)
    val getState_ = _import "gdk_window_get_state" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkWindowState.FFI.val_;
    val getSupportMultidevice_ = _import "gdk_window_get_support_multidevice" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val getToplevel_ = _import "gdk_window_get_toplevel" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val getTypeHint_ = _import "gdk_window_get_type_hint" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkWindowTypeHint.FFI.val_;
    val getUpdateArea_ = _import "gdk_window_get_update_area" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> CairoRegionRecord.FFI.notnull CairoRegionRecord.FFI.p;
    val getVisibleRegion_ = _import "gdk_window_get_visible_region" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> CairoRegionRecord.FFI.notnull CairoRegionRecord.FFI.p;
    val getVisual_ = _import "gdk_window_get_visual" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkVisualClass.FFI.notnull GdkVisualClass.FFI.p;
    val getWidth_ = _import "gdk_window_get_width" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GInt32.FFI.val_;
    val getWindowType_ = _import "gdk_window_get_window_type" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkWindowType.FFI.val_;
    val hasNative_ = _import "gdk_window_has_native" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val hide_ = _import "gdk_window_hide" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val iconify_ = _import "gdk_window_iconify" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val inputShapeCombineRegion_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_window_input_shape_combine_region" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * CairoRegionRecord.FFI.notnull CairoRegionRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val invalidateRect_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_invalidate_rect" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * unit CairoRectangleIntRecord.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val invalidateRegion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_invalidate_region" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * CairoRegionRecord.FFI.notnull CairoRegionRecord.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val isDestroyed_ = _import "gdk_window_is_destroyed" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val isInputOnly_ = _import "gdk_window_is_input_only" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val isShaped_ = _import "gdk_window_is_shaped" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val isViewable_ = _import "gdk_window_is_viewable" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val isVisible_ = _import "gdk_window_is_visible" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val lower_ = _import "gdk_window_lower" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val maximize_ = _import "gdk_window_maximize" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val mergeChildInputShapes_ = _import "gdk_window_merge_child_input_shapes" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val mergeChildShapes_ = _import "gdk_window_merge_child_shapes" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val move_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_move" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val moveRegion_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_window_move_region" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * CairoRegionRecord.FFI.notnull CairoRegionRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val moveResize_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_move_resize" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val processUpdates_ = fn x1 & x2 => (_import "gdk_window_process_updates" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val raise_ = _import "gdk_window_raise" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val registerDnd_ = _import "gdk_window_register_dnd" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val reparent_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_window_reparent" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val resize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_resize" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val restack_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_restack" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * unit GdkWindowClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val scroll_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_scroll" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAcceptFocus_ = fn x1 & x2 => (_import "gdk_window_set_accept_focus" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setBackground_ = fn x1 & x2 => (_import "gdk_window_set_background" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GdkColorRecord.FFI.notnull GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setBackgroundPattern_ = fn x1 & x2 => (_import "gdk_window_set_background_pattern" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * unit CairoPatternRecord.FFI.p -> unit;) (x1, x2)
    val setBackgroundRgba_ = fn x1 & x2 => (_import "gdk_window_set_background_rgba" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setChildInputShapes_ = _import "gdk_window_set_child_input_shapes" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val setChildShapes_ = _import "gdk_window_set_child_shapes" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val setComposited_ = fn x1 & x2 => (_import "gdk_window_set_composited" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setCursor_ = fn x1 & x2 => (_import "gdk_window_set_cursor" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * unit GdkCursorClass.FFI.p -> unit;) (x1, x2)
    val setDecorations_ = fn x1 & x2 => (_import "gdk_window_set_decorations" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GdkWMDecoration.FFI.val_ -> unit;) (x1, x2)
    val setDeviceCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_set_device_cursor" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p
               * GdkCursorClass.FFI.notnull GdkCursorClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDeviceEvents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_set_device_events" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p
               * GdkEventMask.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setEvents_ = fn x1 & x2 => (_import "gdk_window_set_events" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GdkEventMask.FFI.val_ -> unit;) (x1, x2)
    val setFocusOnMap_ = fn x1 & x2 => (_import "gdk_window_set_focus_on_map" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setFunctions_ = fn x1 & x2 => (_import "gdk_window_set_functions" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GdkWMFunction.FFI.val_ -> unit;) (x1, x2)
    val setGeometryHints_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_set_geometry_hints" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GdkGeometryRecord.FFI.notnull GdkGeometryRecord.FFI.p
               * GdkWindowHints.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setGroup_ = fn x1 & x2 => (_import "gdk_window_set_group" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * unit GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_window_set_icon_name" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setKeepAbove_ = fn x1 & x2 => (_import "gdk_window_set_keep_above" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setKeepBelow_ = fn x1 & x2 => (_import "gdk_window_set_keep_below" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setModalHint_ = fn x1 & x2 => (_import "gdk_window_set_modal_hint" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setOpacity_ = fn x1 & x2 => (_import "gdk_window_set_opacity" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setOverrideRedirect_ = fn x1 & x2 => (_import "gdk_window_set_override_redirect" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRole_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_window_set_role" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSkipPagerHint_ = fn x1 & x2 => (_import "gdk_window_set_skip_pager_hint" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSkipTaskbarHint_ = fn x1 & x2 => (_import "gdk_window_set_skip_taskbar_hint" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSourceEvents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_set_source_events" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GdkInputSource.FFI.val_
               * GdkEventMask.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStartupId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_window_set_startup_id" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStaticGravities_ = fn x1 & x2 => (_import "gdk_window_set_static_gravities" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val setSupportMultidevice_ = fn x1 & x2 => (_import "gdk_window_set_support_multidevice" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_window_set_title" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTransientFor_ = fn x1 & x2 => (_import "gdk_window_set_transient_for" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val setTypeHint_ = fn x1 & x2 => (_import "gdk_window_set_type_hint" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GdkWindowTypeHint.FFI.val_ -> unit;) (x1, x2)
    val setUrgencyHint_ = fn x1 & x2 => (_import "gdk_window_set_urgency_hint" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUserData_ = fn x1 & x2 => (_import "gdk_window_set_user_data" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p * unit GObjectObjectClass.FFI.p -> unit;) (x1, x2)
    val shapeCombineRegion_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_window_shape_combine_region" :
              GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * unit CairoRegionRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val show_ = _import "gdk_window_show" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val showUnraised_ = _import "gdk_window_show_unraised" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val stick_ = _import "gdk_window_stick" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val thawToplevelUpdatesLibgtkOnly_ = _import "gdk_window_thaw_toplevel_updates_libgtk_only" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val thawUpdates_ = _import "gdk_window_thaw_updates" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val unfullscreen_ = _import "gdk_window_unfullscreen" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val unmaximize_ = _import "gdk_window_unmaximize" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val unstick_ = _import "gdk_window_unstick" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    val withdraw_ = _import "gdk_window_withdraw" : GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> unit;
    type 'a class = 'a GdkWindowClass.class
    type window_attr_t = GdkWindowAttrRecord.t
    type window_edge_t = GdkWindowEdge.t
    type modifier_type_t = GdkModifierType.t
    type 'a display_class = 'a GdkDisplayClass.class
    type drag_protocol_t = GdkDragProtocol.t
    type 'a screen_class = 'a GdkScreenClass.class
    type window_state_t = GdkWindowState.t
    type 'a visual_class = 'a GdkVisualClass.class
    type window_type_t = GdkWindowType.t
    type color_t = GdkColorRecord.t
    type rgba_t = GdkRgbaRecord.t
    type w_m_decoration_t = GdkWMDecoration.t
    type 'a device_class = 'a GdkDeviceClass.class
    type w_m_function_t = GdkWMFunction.t
    type window_hints_t = GdkWindowHints.t
    type geometry_t = GdkGeometryRecord.t
    type event_mask_t = GdkEventMask.t
    type input_source_t = GdkInputSource.t
    type window_type_hint_t = GdkWindowTypeHint.t
    type 'a cursor_class = 'a GdkCursorClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new parent attributes attributesMask =
      (
        GdkWindowClass.FFI.withOptPtr
         &&&> GdkWindowAttrRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> GdkWindowClass.FFI.fromPtr true
      )
        new_
        (
          parent
           & attributes
           & attributesMask
        )
    fun constrainSize geometry flags width height =
      let
        val newWidth
         & newHeight
         & () =
          (
            GdkGeometryRecord.FFI.withPtr
             &&&> GUInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            constrainSize_
            (
              geometry
               & flags
               & width
               & height
               & GInt32.null
               & GInt32.null
            )
      in
        (newWidth, newHeight)
      end
    fun processAllUpdates () = (I ---> I) processAllUpdates_ ()
    fun setDebugUpdates setting = (GBool.FFI.withVal ---> I) setDebugUpdates_ setting
    fun beep self = (GdkWindowClass.FFI.withPtr ---> I) beep_ self
    fun beginMoveDrag self button rootX rootY timestamp =
      (
        GdkWindowClass.FFI.withPtr
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
    fun beginPaintRect self rectangle = (GdkWindowClass.FFI.withPtr &&&> CairoRectangleIntRecord.FFI.withPtr ---> I) beginPaintRect_ (self & rectangle)
    fun beginPaintRegion self region = (GdkWindowClass.FFI.withPtr &&&> CairoRegionRecord.FFI.withPtr ---> I) beginPaintRegion_ (self & region)
    fun beginResizeDrag self edge button rootX rootY timestamp =
      (
        GdkWindowClass.FFI.withPtr
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
    fun configureFinished self = (GdkWindowClass.FFI.withPtr ---> I) configureFinished_ self
    fun coordsFromParent self parentX parentY =
      let
        val x
         & y
         & () =
          (
            GdkWindowClass.FFI.withPtr
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            coordsFromParent_
            (
              self
               & parentX
               & parentY
               & GDouble.null
               & GDouble.null
            )
      in
        (x, y)
      end
    fun coordsToParent self x y =
      let
        val parentX
         & parentY
         & () =
          (
            GdkWindowClass.FFI.withPtr
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            coordsToParent_
            (
              self
               & x
               & y
               & GDouble.null
               & GDouble.null
            )
      in
        (parentX, parentY)
      end
    fun createSimilarSurface self content width height =
      (
        GdkWindowClass.FFI.withPtr
         &&&> CairoContent.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> CairoSurfaceRecord.FFI.fromPtr true
      )
        createSimilarSurface_
        (
          self
           & content
           & width
           & height
        )
    fun deiconify self = (GdkWindowClass.FFI.withPtr ---> I) deiconify_ self
    fun destroy self = (GdkWindowClass.FFI.withPtr ---> I) destroy_ self
    fun destroyNotify self = (GdkWindowClass.FFI.withPtr ---> I) destroyNotify_ self
    fun enableSynchronizedConfigure self = (GdkWindowClass.FFI.withPtr ---> I) enableSynchronizedConfigure_ self
    fun endPaint self = (GdkWindowClass.FFI.withPtr ---> I) endPaint_ self
    fun ensureNative self = (GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) ensureNative_ self
    fun flush self = (GdkWindowClass.FFI.withPtr ---> I) flush_ self
    fun focus self timestamp = (GdkWindowClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) focus_ (self & timestamp)
    fun freezeToplevelUpdatesLibgtkOnly self = (GdkWindowClass.FFI.withPtr ---> I) freezeToplevelUpdatesLibgtkOnly_ self
    fun freezeUpdates self = (GdkWindowClass.FFI.withPtr ---> I) freezeUpdates_ self
    fun fullscreen self = (GdkWindowClass.FFI.withPtr ---> I) fullscreen_ self
    fun geometryChanged self = (GdkWindowClass.FFI.withPtr ---> I) geometryChanged_ self
    fun getAcceptFocus self = (GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getAcceptFocus_ self
    fun getBackgroundPattern self = (GdkWindowClass.FFI.withPtr ---> CairoPatternRecord.FFI.fromPtr false) getBackgroundPattern_ self
    fun getClipRegion self = (GdkWindowClass.FFI.withPtr ---> CairoRegionRecord.FFI.fromPtr true) getClipRegion_ self
    fun getComposited self = (GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getComposited_ self
    fun getCursor self = (GdkWindowClass.FFI.withPtr ---> GdkCursorClass.FFI.fromPtr false) getCursor_ self
    fun getDecorations self =
      let
        val decorations & retVal = (GdkWindowClass.FFI.withPtr &&&> GdkWMDecoration.FFI.withRefVal ---> GdkWMDecoration.FFI.fromVal && GBool.FFI.fromVal) getDecorations_ (self & GdkWMDecoration.flags [])
      in
        if retVal then SOME decorations else NONE
      end
    fun getDeviceCursor self device = (GdkWindowClass.FFI.withPtr &&&> GdkDeviceClass.FFI.withPtr ---> GdkCursorClass.FFI.fromPtr false) getDeviceCursor_ (self & device)
    fun getDeviceEvents self device = (GdkWindowClass.FFI.withPtr &&&> GdkDeviceClass.FFI.withPtr ---> GdkEventMask.FFI.fromVal) getDeviceEvents_ (self & device)
    fun getDevicePosition self device =
      let
        val x
         & y
         & mask
         & retVal =
          (
            GdkWindowClass.FFI.withPtr
             &&&> GdkDeviceClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && GdkWindowClass.FFI.fromPtr false
          )
            getDevicePosition_
            (
              self
               & device
               & GInt32.null
               & GInt32.null
               & GdkModifierType.flags []
            )
      in
        (
          retVal,
          x,
          y,
          mask
        )
      end
    fun getDisplay self = (GdkWindowClass.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getDragProtocol self =
      let
        val target & retVal = (GdkWindowClass.FFI.withPtr &&&> GdkWindowClass.FFI.withRefOptPtr ---> GdkWindowClass.FFI.fromPtr true && GdkDragProtocol.FFI.fromVal) getDragProtocol_ (self & NONE)
      in
        (retVal, target)
      end
    fun getEffectiveParent self = (GdkWindowClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getEffectiveParent_ self
    fun getEffectiveToplevel self = (GdkWindowClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getEffectiveToplevel_ self
    fun getEvents self = (GdkWindowClass.FFI.withPtr ---> GdkEventMask.FFI.fromVal) getEvents_ self
    fun getFocusOnMap self = (GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getFocusOnMap_ self
    fun getFrameExtents self rect = (GdkWindowClass.FFI.withPtr &&&> CairoRectangleIntRecord.FFI.withPtr ---> I) getFrameExtents_ (self & rect)
    fun getGeometry self =
      let
        val x
         & y
         & width
         & height
         & () =
          (
            GdkWindowClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getGeometry_
            (
              self
               & GInt32.null
               & GInt32.null
               & GInt32.null
               & GInt32.null
            )
      in
        (
          x,
          y,
          width,
          height
        )
      end
    fun getGroup self = (GdkWindowClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getGroup_ self
    fun getHeight self = (GdkWindowClass.FFI.withPtr ---> GInt32.FFI.fromVal) getHeight_ self
    fun getModalHint self = (GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getModalHint_ self
    fun getOrigin self =
      let
        val x
         & y
         & retVal =
          (
            GdkWindowClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
          )
            getOrigin_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (
          retVal,
          x,
          y
        )
      end
    fun getParent self = (GdkWindowClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getParent_ self
    fun getPosition self =
      let
        val x
         & y
         & () =
          (
            GdkWindowClass.FFI.withPtr
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
        (x, y)
      end
    fun getRootCoords self x y =
      let
        val rootX
         & rootY
         & () =
          (
            GdkWindowClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getRootCoords_
            (
              self
               & x
               & y
               & GInt32.null
               & GInt32.null
            )
      in
        (rootX, rootY)
      end
    fun getRootOrigin self =
      let
        val x
         & y
         & () =
          (
            GdkWindowClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getRootOrigin_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (x, y)
      end
    fun getScreen self = (GdkWindowClass.FFI.withPtr ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun getSourceEvents self source = (GdkWindowClass.FFI.withPtr &&&> GdkInputSource.FFI.withVal ---> GdkEventMask.FFI.fromVal) getSourceEvents_ (self & source)
    fun getState self = (GdkWindowClass.FFI.withPtr ---> GdkWindowState.FFI.fromVal) getState_ self
    fun getSupportMultidevice self = (GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getSupportMultidevice_ self
    fun getToplevel self = (GdkWindowClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getToplevel_ self
    fun getTypeHint self = (GdkWindowClass.FFI.withPtr ---> GdkWindowTypeHint.FFI.fromVal) getTypeHint_ self
    fun getUpdateArea self = (GdkWindowClass.FFI.withPtr ---> CairoRegionRecord.FFI.fromPtr true) getUpdateArea_ self
    fun getVisibleRegion self = (GdkWindowClass.FFI.withPtr ---> CairoRegionRecord.FFI.fromPtr true) getVisibleRegion_ self
    fun getVisual self = (GdkWindowClass.FFI.withPtr ---> GdkVisualClass.FFI.fromPtr false) getVisual_ self
    fun getWidth self = (GdkWindowClass.FFI.withPtr ---> GInt32.FFI.fromVal) getWidth_ self
    fun getWindowType self = (GdkWindowClass.FFI.withPtr ---> GdkWindowType.FFI.fromVal) getWindowType_ self
    fun hasNative self = (GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) hasNative_ self
    fun hide self = (GdkWindowClass.FFI.withPtr ---> I) hide_ self
    fun iconify self = (GdkWindowClass.FFI.withPtr ---> I) iconify_ self
    fun inputShapeCombineRegion self shapeRegion offsetX offsetY =
      (
        GdkWindowClass.FFI.withPtr
         &&&> CairoRegionRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        inputShapeCombineRegion_
        (
          self
           & shapeRegion
           & offsetX
           & offsetY
        )
    fun invalidateRect self rect invalidateChildren =
      (
        GdkWindowClass.FFI.withPtr
         &&&> CairoRectangleIntRecord.FFI.withOptPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        invalidateRect_
        (
          self
           & rect
           & invalidateChildren
        )
    fun invalidateRegion self region invalidateChildren =
      (
        GdkWindowClass.FFI.withPtr
         &&&> CairoRegionRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        invalidateRegion_
        (
          self
           & region
           & invalidateChildren
        )
    fun isDestroyed self = (GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) isDestroyed_ self
    fun isInputOnly self = (GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) isInputOnly_ self
    fun isShaped self = (GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) isShaped_ self
    fun isViewable self = (GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) isViewable_ self
    fun isVisible self = (GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) isVisible_ self
    fun lower self = (GdkWindowClass.FFI.withPtr ---> I) lower_ self
    fun maximize self = (GdkWindowClass.FFI.withPtr ---> I) maximize_ self
    fun mergeChildInputShapes self = (GdkWindowClass.FFI.withPtr ---> I) mergeChildInputShapes_ self
    fun mergeChildShapes self = (GdkWindowClass.FFI.withPtr ---> I) mergeChildShapes_ self
    fun move self x y =
      (
        GdkWindowClass.FFI.withPtr
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
    fun moveRegion self region dx dy =
      (
        GdkWindowClass.FFI.withPtr
         &&&> CairoRegionRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        moveRegion_
        (
          self
           & region
           & dx
           & dy
        )
    fun moveResize self x y width height =
      (
        GdkWindowClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        moveResize_
        (
          self
           & x
           & y
           & width
           & height
        )
    fun processUpdates self updateChildren = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) processUpdates_ (self & updateChildren)
    fun raise' self = (GdkWindowClass.FFI.withPtr ---> I) raise_ self
    fun registerDnd self = (GdkWindowClass.FFI.withPtr ---> I) registerDnd_ self
    fun reparent self newParent x y =
      (
        GdkWindowClass.FFI.withPtr
         &&&> GdkWindowClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        reparent_
        (
          self
           & newParent
           & x
           & y
        )
    fun resize self width height =
      (
        GdkWindowClass.FFI.withPtr
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
    fun restack self sibling above =
      (
        GdkWindowClass.FFI.withPtr
         &&&> GdkWindowClass.FFI.withOptPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        restack_
        (
          self
           & sibling
           & above
        )
    fun scroll self dx dy =
      (
        GdkWindowClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        scroll_
        (
          self
           & dx
           & dy
        )
    fun setAcceptFocus self acceptFocus = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAcceptFocus_ (self & acceptFocus)
    fun setBackground self color = (GdkWindowClass.FFI.withPtr &&&> GdkColorRecord.FFI.withPtr ---> I) setBackground_ (self & color)
    fun setBackgroundPattern self pattern = (GdkWindowClass.FFI.withPtr &&&> CairoPatternRecord.FFI.withOptPtr ---> I) setBackgroundPattern_ (self & pattern)
    fun setBackgroundRgba self rgba = (GdkWindowClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withPtr ---> I) setBackgroundRgba_ (self & rgba)
    fun setChildInputShapes self = (GdkWindowClass.FFI.withPtr ---> I) setChildInputShapes_ self
    fun setChildShapes self = (GdkWindowClass.FFI.withPtr ---> I) setChildShapes_ self
    fun setComposited self composited = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setComposited_ (self & composited)
    fun setCursor self cursor = (GdkWindowClass.FFI.withPtr &&&> GdkCursorClass.FFI.withOptPtr ---> I) setCursor_ (self & cursor)
    fun setDecorations self decorations = (GdkWindowClass.FFI.withPtr &&&> GdkWMDecoration.FFI.withVal ---> I) setDecorations_ (self & decorations)
    fun setDeviceCursor self device cursor =
      (
        GdkWindowClass.FFI.withPtr
         &&&> GdkDeviceClass.FFI.withPtr
         &&&> GdkCursorClass.FFI.withPtr
         ---> I
      )
        setDeviceCursor_
        (
          self
           & device
           & cursor
        )
    fun setDeviceEvents self device eventMask =
      (
        GdkWindowClass.FFI.withPtr
         &&&> GdkDeviceClass.FFI.withPtr
         &&&> GdkEventMask.FFI.withVal
         ---> I
      )
        setDeviceEvents_
        (
          self
           & device
           & eventMask
        )
    fun setEvents self eventMask = (GdkWindowClass.FFI.withPtr &&&> GdkEventMask.FFI.withVal ---> I) setEvents_ (self & eventMask)
    fun setFocusOnMap self focusOnMap = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFocusOnMap_ (self & focusOnMap)
    fun setFunctions self functions = (GdkWindowClass.FFI.withPtr &&&> GdkWMFunction.FFI.withVal ---> I) setFunctions_ (self & functions)
    fun setGeometryHints self geometry geomMask =
      (
        GdkWindowClass.FFI.withPtr
         &&&> GdkGeometryRecord.FFI.withPtr
         &&&> GdkWindowHints.FFI.withVal
         ---> I
      )
        setGeometryHints_
        (
          self
           & geometry
           & geomMask
        )
    fun setGroup self leader = (GdkWindowClass.FFI.withPtr &&&> GdkWindowClass.FFI.withOptPtr ---> I) setGroup_ (self & leader)
    fun setIconName self name = (GdkWindowClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setKeepBelow_ (self & setting)
    fun setModalHint self modal = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setModalHint_ (self & modal)
    fun setOpacity self opacity = (GdkWindowClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setOpacity_ (self & opacity)
    fun setOverrideRedirect self overrideRedirect = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setOverrideRedirect_ (self & overrideRedirect)
    fun setRole self role = (GdkWindowClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setRole_ (self & role)
    fun setSkipPagerHint self skipsPager = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSkipPagerHint_ (self & skipsPager)
    fun setSkipTaskbarHint self skipsTaskbar = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSkipTaskbarHint_ (self & skipsTaskbar)
    fun setSourceEvents self source eventMask =
      (
        GdkWindowClass.FFI.withPtr
         &&&> GdkInputSource.FFI.withVal
         &&&> GdkEventMask.FFI.withVal
         ---> I
      )
        setSourceEvents_
        (
          self
           & source
           & eventMask
        )
    fun setStartupId self startupId = (GdkWindowClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setStartupId_ (self & startupId)
    fun setStaticGravities self useStatic = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) setStaticGravities_ (self & useStatic)
    fun setSupportMultidevice self supportMultidevice = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSupportMultidevice_ (self & supportMultidevice)
    fun setTitle self title = (GdkWindowClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GdkWindowClass.FFI.withPtr &&&> GdkWindowClass.FFI.withPtr ---> I) setTransientFor_ (self & parent)
    fun setTypeHint self hint = (GdkWindowClass.FFI.withPtr &&&> GdkWindowTypeHint.FFI.withVal ---> I) setTypeHint_ (self & hint)
    fun setUrgencyHint self urgent = (GdkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUrgencyHint_ (self & urgent)
    fun setUserData self userData = (GdkWindowClass.FFI.withPtr &&&> GObjectObjectClass.FFI.withOptPtr ---> I) setUserData_ (self & userData)
    fun shapeCombineRegion self shapeRegion offsetX offsetY =
      (
        GdkWindowClass.FFI.withPtr
         &&&> CairoRegionRecord.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        shapeCombineRegion_
        (
          self
           & shapeRegion
           & offsetX
           & offsetY
        )
    fun show self = (GdkWindowClass.FFI.withPtr ---> I) show_ self
    fun showUnraised self = (GdkWindowClass.FFI.withPtr ---> I) showUnraised_ self
    fun stick self = (GdkWindowClass.FFI.withPtr ---> I) stick_ self
    fun thawToplevelUpdatesLibgtkOnly self = (GdkWindowClass.FFI.withPtr ---> I) thawToplevelUpdatesLibgtkOnly_ self
    fun thawUpdates self = (GdkWindowClass.FFI.withPtr ---> I) thawUpdates_ self
    fun unfullscreen self = (GdkWindowClass.FFI.withPtr ---> I) unfullscreen_ self
    fun unmaximize self = (GdkWindowClass.FFI.withPtr ---> I) unmaximize_ self
    fun unstick self = (GdkWindowClass.FFI.withPtr ---> I) unstick_ self
    fun withdraw self = (GdkWindowClass.FFI.withPtr ---> I) withdraw_ self
    local
      open ClosureMarshal Signal
    in
      fun createSurfaceSig f = signal "create-surface" (get 0w1 int &&&> get 0w2 int ---> ret CairoSurfaceRecord.t) (fn width & height => f width height)
      fun fromEmbedderSig f =
        signal "from-embedder"
          (
            get 0w1 double &&&> get 0w2 double
             ---> set 0w3 double
                   && set 0w4 double
                   && ret_void
          )
          (
            fn
              embedderX & embedderY =>
                let
                  val (offscreenX, offscreenY) = f embedderX embedderY
                in
                  offscreenX
                   & offscreenY
                   & ()
                end
          )
      fun pickEmbeddedChildSig f = signal "pick-embedded-child" (get 0w1 double &&&> get 0w2 double ---> ret GdkWindowClass.t) (fn x & y => f x y)
      fun toEmbedderSig f =
        signal "to-embedder"
          (
            get 0w1 double &&&> get 0w2 double
             ---> set 0w3 double
                   && set 0w4 double
                   && ret_void
          )
          (
            fn
              offscreenX & offscreenY =>
                let
                  val (embedderX, embedderY) = f offscreenX offscreenY
                in
                  embedderX
                   & embedderY
                   & ()
                end
          )
    end
    local
      open Property
    in
      val cursorProp =
        {
          get = fn x => get "cursor" GdkCursorClass.tOpt x,
          set = fn x => set "cursor" GdkCursorClass.tOpt x
        }
    end
  end
