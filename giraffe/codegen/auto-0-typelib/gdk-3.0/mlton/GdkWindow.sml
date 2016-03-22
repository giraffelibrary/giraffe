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
    val getType_ = _import "gdk_window_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_new" :
              unit GdkWindowClass.C.p
               * GdkWindowAttrRecord.C.notnull GdkWindowAttrRecord.C.p
               * FFI.Int32.C.val_
               -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
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
              GdkGeometryRecord.C.notnull GdkGeometryRecord.C.p
               * FFI.UInt32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
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
    val setDebugUpdates_ = _import "gdk_window_set_debug_updates" : FFI.Bool.C.val_ -> unit;
    val beep_ = _import "gdk_window_beep" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val beginMoveDrag_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_begin_move_drag" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
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
    val beginPaintRect_ = fn x1 & x2 => (_import "gdk_window_begin_paint_rect" : GdkWindowClass.C.notnull GdkWindowClass.C.p * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p -> unit;) (x1, x2)
    val beginPaintRegion_ = fn x1 & x2 => (_import "gdk_window_begin_paint_region" : GdkWindowClass.C.notnull GdkWindowClass.C.p * CairoRegionRecord.C.notnull CairoRegionRecord.C.p -> unit;) (x1, x2)
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
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
    val configureFinished_ = _import "gdk_window_configure_finished" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val coordsFromParent_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_coords_from_parent" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * CairoContent.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> CairoSurfaceRecord.C.notnull CairoSurfaceRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val deiconify_ = _import "gdk_window_deiconify" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val destroy_ = _import "gdk_window_destroy" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val destroyNotify_ = _import "gdk_window_destroy_notify" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val enableSynchronizedConfigure_ = _import "gdk_window_enable_synchronized_configure" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val endPaint_ = _import "gdk_window_end_paint" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val ensureNative_ = _import "gdk_window_ensure_native" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Bool.C.val_;
    val flush_ = _import "gdk_window_flush" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val focus_ = fn x1 & x2 => (_import "gdk_window_focus" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val freezeToplevelUpdatesLibgtkOnly_ = _import "gdk_window_freeze_toplevel_updates_libgtk_only" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val freezeUpdates_ = _import "gdk_window_freeze_updates" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val fullscreen_ = _import "gdk_window_fullscreen" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val geometryChanged_ = _import "gdk_window_geometry_changed" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val getAcceptFocus_ = _import "gdk_window_get_accept_focus" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Bool.C.val_;
    val getBackgroundPattern_ = _import "gdk_window_get_background_pattern" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> CairoPatternRecord.C.notnull CairoPatternRecord.C.p;
    val getClipRegion_ = _import "gdk_window_get_clip_region" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> CairoRegionRecord.C.notnull CairoRegionRecord.C.p;
    val getComposited_ = _import "gdk_window_get_composited" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Bool.C.val_;
    val getCursor_ = _import "gdk_window_get_cursor" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkCursorClass.C.notnull GdkCursorClass.C.p;
    val getDecorations_ = fn x1 & x2 => (_import "gdk_window_get_decorations" : GdkWindowClass.C.notnull GdkWindowClass.C.p * GdkWMDecoration.C.ref_ -> FFI.Bool.C.val_;) (x1, x2)
    val getDeviceCursor_ = fn x1 & x2 => (_import "gdk_window_get_device_cursor" : GdkWindowClass.C.notnull GdkWindowClass.C.p * GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> GdkCursorClass.C.notnull GdkCursorClass.C.p;) (x1, x2)
    val getDeviceEvents_ = fn x1 & x2 => (_import "gdk_window_get_device_events" : GdkWindowClass.C.notnull GdkWindowClass.C.p * GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> GdkEventMask.C.val_;) (x1, x2)
    val getDevicePosition_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_get_device_position" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               * GdkModifierType.C.ref_
               -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getDisplay_ = _import "gdk_window_get_display" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkDisplayClass.C.notnull GdkDisplayClass.C.p;
    val getDragProtocol_ = fn x1 & x2 => (_import "gdk_window_get_drag_protocol" : GdkWindowClass.C.notnull GdkWindowClass.C.p * (unit, GdkWindowClass.C.notnull) GdkWindowClass.C.r -> GdkDragProtocol.C.val_;) (x1, x2)
    val getEffectiveParent_ = _import "gdk_window_get_effective_parent" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getEffectiveToplevel_ = _import "gdk_window_get_effective_toplevel" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getEvents_ = _import "gdk_window_get_events" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkEventMask.C.val_;
    val getFocusOnMap_ = _import "gdk_window_get_focus_on_map" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Bool.C.val_;
    val getFrameExtents_ = fn x1 & x2 => (_import "gdk_window_get_frame_extents" : GdkWindowClass.C.notnull GdkWindowClass.C.p * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p -> unit;) (x1, x2)
    val getGeometry_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_get_geometry" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getGroup_ = _import "gdk_window_get_group" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getHeight_ = _import "gdk_window_get_height" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Int32.C.val_;
    val getModalHint_ = _import "gdk_window_get_modal_hint" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Bool.C.val_;
    val getOrigin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_get_origin" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> FFI.Int32.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getParent_ = _import "gdk_window_get_parent" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_get_position" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getScreen_ = _import "gdk_window_get_screen" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkScreenClass.C.notnull GdkScreenClass.C.p;
    val getSourceEvents_ = fn x1 & x2 => (_import "gdk_window_get_source_events" : GdkWindowClass.C.notnull GdkWindowClass.C.p * GdkInputSource.C.val_ -> GdkEventMask.C.val_;) (x1, x2)
    val getState_ = _import "gdk_window_get_state" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkWindowState.C.val_;
    val getSupportMultidevice_ = _import "gdk_window_get_support_multidevice" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Bool.C.val_;
    val getToplevel_ = _import "gdk_window_get_toplevel" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getTypeHint_ = _import "gdk_window_get_type_hint" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkWindowTypeHint.C.val_;
    val getUpdateArea_ = _import "gdk_window_get_update_area" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> CairoRegionRecord.C.notnull CairoRegionRecord.C.p;
    val getVisibleRegion_ = _import "gdk_window_get_visible_region" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> CairoRegionRecord.C.notnull CairoRegionRecord.C.p;
    val getVisual_ = _import "gdk_window_get_visual" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkVisualClass.C.notnull GdkVisualClass.C.p;
    val getWidth_ = _import "gdk_window_get_width" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Int32.C.val_;
    val getWindowType_ = _import "gdk_window_get_window_type" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> GdkWindowType.C.val_;
    val hasNative_ = _import "gdk_window_has_native" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Bool.C.val_;
    val hide_ = _import "gdk_window_hide" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val iconify_ = _import "gdk_window_iconify" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val inputShapeCombineRegion_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_window_input_shape_combine_region" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * CairoRegionRecord.C.notnull CairoRegionRecord.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * unit CairoRectangleIntRecord.C.p
               * FFI.Bool.C.val_
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * CairoRegionRecord.C.notnull CairoRegionRecord.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val isDestroyed_ = _import "gdk_window_is_destroyed" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Bool.C.val_;
    val isInputOnly_ = _import "gdk_window_is_input_only" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Bool.C.val_;
    val isShaped_ = _import "gdk_window_is_shaped" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Bool.C.val_;
    val isViewable_ = _import "gdk_window_is_viewable" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Bool.C.val_;
    val isVisible_ = _import "gdk_window_is_visible" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> FFI.Bool.C.val_;
    val lower_ = _import "gdk_window_lower" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val maximize_ = _import "gdk_window_maximize" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val mergeChildInputShapes_ = _import "gdk_window_merge_child_input_shapes" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val mergeChildShapes_ = _import "gdk_window_merge_child_shapes" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val move_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_move" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * CairoRegionRecord.C.notnull CairoRegionRecord.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val processUpdates_ = fn x1 & x2 => (_import "gdk_window_process_updates" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val raise_ = _import "gdk_window_raise" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val registerDnd_ = _import "gdk_window_register_dnd" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val reparent_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_window_reparent" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * unit GdkWindowClass.C.p
               * FFI.Bool.C.val_
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAcceptFocus_ = fn x1 & x2 => (_import "gdk_window_set_accept_focus" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setBackground_ = fn x1 & x2 => (_import "gdk_window_set_background" : GdkWindowClass.C.notnull GdkWindowClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setBackgroundPattern_ = fn x1 & x2 => (_import "gdk_window_set_background_pattern" : GdkWindowClass.C.notnull GdkWindowClass.C.p * unit CairoPatternRecord.C.p -> unit;) (x1, x2)
    val setBackgroundRgba_ = fn x1 & x2 => (_import "gdk_window_set_background_rgba" : GdkWindowClass.C.notnull GdkWindowClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setChildInputShapes_ = _import "gdk_window_set_child_input_shapes" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val setChildShapes_ = _import "gdk_window_set_child_shapes" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val setComposited_ = fn x1 & x2 => (_import "gdk_window_set_composited" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setCursor_ = fn x1 & x2 => (_import "gdk_window_set_cursor" : GdkWindowClass.C.notnull GdkWindowClass.C.p * unit GdkCursorClass.C.p -> unit;) (x1, x2)
    val setDecorations_ = fn x1 & x2 => (_import "gdk_window_set_decorations" : GdkWindowClass.C.notnull GdkWindowClass.C.p * GdkWMDecoration.C.val_ -> unit;) (x1, x2)
    val setDeviceCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_set_device_cursor" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * GdkCursorClass.C.notnull GdkCursorClass.C.p
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * GdkEventMask.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setEvents_ = fn x1 & x2 => (_import "gdk_window_set_events" : GdkWindowClass.C.notnull GdkWindowClass.C.p * GdkEventMask.C.val_ -> unit;) (x1, x2)
    val setFocusOnMap_ = fn x1 & x2 => (_import "gdk_window_set_focus_on_map" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setFunctions_ = fn x1 & x2 => (_import "gdk_window_set_functions" : GdkWindowClass.C.notnull GdkWindowClass.C.p * GdkWMFunction.C.val_ -> unit;) (x1, x2)
    val setGeometryHints_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_set_geometry_hints" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * GdkGeometryRecord.C.notnull GdkGeometryRecord.C.p
               * GdkWindowHints.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setGroup_ = fn x1 & x2 => (_import "gdk_window_set_group" : GdkWindowClass.C.notnull GdkWindowClass.C.p * unit GdkWindowClass.C.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_window_set_icon_name" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setKeepAbove_ = fn x1 & x2 => (_import "gdk_window_set_keep_above" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setKeepBelow_ = fn x1 & x2 => (_import "gdk_window_set_keep_below" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setModalHint_ = fn x1 & x2 => (_import "gdk_window_set_modal_hint" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setOpacity_ = fn x1 & x2 => (_import "gdk_window_set_opacity" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setOverrideRedirect_ = fn x1 & x2 => (_import "gdk_window_set_override_redirect" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setRole_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_window_set_role" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSkipPagerHint_ = fn x1 & x2 => (_import "gdk_window_set_skip_pager_hint" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSkipTaskbarHint_ = fn x1 & x2 => (_import "gdk_window_set_skip_taskbar_hint" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSourceEvents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_set_source_events" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * GdkInputSource.C.val_
               * GdkEventMask.C.val_
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
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStaticGravities_ = fn x1 & x2 => (_import "gdk_window_set_static_gravities" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val setSupportMultidevice_ = fn x1 & x2 => (_import "gdk_window_set_support_multidevice" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_window_set_title" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTransientFor_ = fn x1 & x2 => (_import "gdk_window_set_transient_for" : GdkWindowClass.C.notnull GdkWindowClass.C.p * GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;) (x1, x2)
    val setTypeHint_ = fn x1 & x2 => (_import "gdk_window_set_type_hint" : GdkWindowClass.C.notnull GdkWindowClass.C.p * GdkWindowTypeHint.C.val_ -> unit;) (x1, x2)
    val setUrgencyHint_ = fn x1 & x2 => (_import "gdk_window_set_urgency_hint" : GdkWindowClass.C.notnull GdkWindowClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUserData_ = fn x1 & x2 => (_import "gdk_window_set_user_data" : GdkWindowClass.C.notnull GdkWindowClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val shapeCombineRegion_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_window_shape_combine_region" :
              GdkWindowClass.C.notnull GdkWindowClass.C.p
               * unit CairoRegionRecord.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val show_ = _import "gdk_window_show" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val showUnraised_ = _import "gdk_window_show_unraised" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val stick_ = _import "gdk_window_stick" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val thawToplevelUpdatesLibgtkOnly_ = _import "gdk_window_thaw_toplevel_updates_libgtk_only" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val thawUpdates_ = _import "gdk_window_thaw_updates" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val unfullscreen_ = _import "gdk_window_unfullscreen" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val unmaximize_ = _import "gdk_window_unmaximize" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val unstick_ = _import "gdk_window_unstick" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
    val withdraw_ = _import "gdk_window_withdraw" : GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;
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
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new parent attributes attributesMask =
      (
        GdkWindowClass.C.withOptPtr
         &&&> GdkWindowAttrRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> GdkWindowClass.C.fromPtr true
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
            GdkGeometryRecord.C.withPtr
             &&&> FFI.UInt32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            constrainSize_
            (
              geometry
               & flags
               & width
               & height
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (newWidth, newHeight)
      end
    fun processAllUpdates () = (I ---> I) processAllUpdates_ ()
    fun setDebugUpdates setting = (FFI.Bool.C.withVal ---> I) setDebugUpdates_ setting
    fun beep self = (GdkWindowClass.C.withPtr ---> I) beep_ self
    fun beginMoveDrag self button rootX rootY timestamp =
      (
        GdkWindowClass.C.withPtr
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
    fun beginPaintRect self rectangle = (GdkWindowClass.C.withPtr &&&> CairoRectangleIntRecord.C.withPtr ---> I) beginPaintRect_ (self & rectangle)
    fun beginPaintRegion self region = (GdkWindowClass.C.withPtr &&&> CairoRegionRecord.C.withPtr ---> I) beginPaintRegion_ (self & region)
    fun beginResizeDrag self edge button rootX rootY timestamp =
      (
        GdkWindowClass.C.withPtr
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
    fun configureFinished self = (GdkWindowClass.C.withPtr ---> I) configureFinished_ self
    fun coordsFromParent self parentX parentY =
      let
        val x
         & y
         & () =
          (
            GdkWindowClass.C.withPtr
             &&&> FFI.Double.C.withVal
             &&&> FFI.Double.C.withVal
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             ---> FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && I
          )
            coordsFromParent_
            (
              self
               & parentX
               & parentY
               & FFI.Double.null
               & FFI.Double.null
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
            GdkWindowClass.C.withPtr
             &&&> FFI.Double.C.withVal
             &&&> FFI.Double.C.withVal
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             ---> FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && I
          )
            coordsToParent_
            (
              self
               & x
               & y
               & FFI.Double.null
               & FFI.Double.null
            )
      in
        (parentX, parentY)
      end
    fun createSimilarSurface self content width height =
      (
        GdkWindowClass.C.withPtr
         &&&> CairoContent.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> CairoSurfaceRecord.C.fromPtr true
      )
        createSimilarSurface_
        (
          self
           & content
           & width
           & height
        )
    fun deiconify self = (GdkWindowClass.C.withPtr ---> I) deiconify_ self
    fun destroy self = (GdkWindowClass.C.withPtr ---> I) destroy_ self
    fun destroyNotify self = (GdkWindowClass.C.withPtr ---> I) destroyNotify_ self
    fun enableSynchronizedConfigure self = (GdkWindowClass.C.withPtr ---> I) enableSynchronizedConfigure_ self
    fun endPaint self = (GdkWindowClass.C.withPtr ---> I) endPaint_ self
    fun ensureNative self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) ensureNative_ self
    fun flush self = (GdkWindowClass.C.withPtr ---> I) flush_ self
    fun focus self timestamp = (GdkWindowClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) focus_ (self & timestamp)
    fun freezeToplevelUpdatesLibgtkOnly self = (GdkWindowClass.C.withPtr ---> I) freezeToplevelUpdatesLibgtkOnly_ self
    fun freezeUpdates self = (GdkWindowClass.C.withPtr ---> I) freezeUpdates_ self
    fun fullscreen self = (GdkWindowClass.C.withPtr ---> I) fullscreen_ self
    fun geometryChanged self = (GdkWindowClass.C.withPtr ---> I) geometryChanged_ self
    fun getAcceptFocus self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getAcceptFocus_ self
    fun getBackgroundPattern self = (GdkWindowClass.C.withPtr ---> CairoPatternRecord.C.fromPtr false) getBackgroundPattern_ self
    fun getClipRegion self = (GdkWindowClass.C.withPtr ---> CairoRegionRecord.C.fromPtr true) getClipRegion_ self
    fun getComposited self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getComposited_ self
    fun getCursor self = (GdkWindowClass.C.withPtr ---> GdkCursorClass.C.fromPtr false) getCursor_ self
    fun getDecorations self =
      let
        val decorations & retVal = (GdkWindowClass.C.withPtr &&&> GdkWMDecoration.C.withRefVal ---> GdkWMDecoration.C.fromVal && FFI.Bool.C.fromVal) getDecorations_ (self & GdkWMDecoration.flags [])
      in
        if retVal then SOME decorations else NONE
      end
    fun getDeviceCursor self device = (GdkWindowClass.C.withPtr &&&> GdkDeviceClass.C.withPtr ---> GdkCursorClass.C.fromPtr false) getDeviceCursor_ (self & device)
    fun getDeviceEvents self device = (GdkWindowClass.C.withPtr &&&> GdkDeviceClass.C.withPtr ---> GdkEventMask.C.fromVal) getDeviceEvents_ (self & device)
    fun getDevicePosition self device =
      let
        val x
         & y
         & mask
         & retVal =
          (
            GdkWindowClass.C.withPtr
             &&&> GdkDeviceClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> GdkModifierType.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && GdkModifierType.C.fromVal
                   && GdkWindowClass.C.fromPtr false
          )
            getDevicePosition_
            (
              self
               & device
               & FFI.Int32.null
               & FFI.Int32.null
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
    fun getDisplay self = (GdkWindowClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getDragProtocol self =
      let
        val target & retVal = (GdkWindowClass.C.withPtr &&&> GdkWindowClass.C.withRefOptPtr ---> GdkWindowClass.C.fromPtr true && GdkDragProtocol.C.fromVal) getDragProtocol_ (self & NONE)
      in
        (retVal, target)
      end
    fun getEffectiveParent self = (GdkWindowClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getEffectiveParent_ self
    fun getEffectiveToplevel self = (GdkWindowClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getEffectiveToplevel_ self
    fun getEvents self = (GdkWindowClass.C.withPtr ---> GdkEventMask.C.fromVal) getEvents_ self
    fun getFocusOnMap self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusOnMap_ self
    fun getFrameExtents self rect = (GdkWindowClass.C.withPtr &&&> CairoRectangleIntRecord.C.withPtr ---> I) getFrameExtents_ (self & rect)
    fun getGeometry self =
      let
        val x
         & y
         & width
         & height
         & () =
          (
            GdkWindowClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getGeometry_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (
          x,
          y,
          width,
          height
        )
      end
    fun getGroup self = (GdkWindowClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getGroup_ self
    fun getHeight self = (GdkWindowClass.C.withPtr ---> FFI.Int32.C.fromVal) getHeight_ self
    fun getModalHint self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getModalHint_ self
    fun getOrigin self =
      let
        val x
         & y
         & retVal =
          (
            GdkWindowClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
          )
            getOrigin_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (
          retVal,
          x,
          y
        )
      end
    fun getParent self = (GdkWindowClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getParent_ self
    fun getPosition self =
      let
        val x
         & y
         & () =
          (
            GdkWindowClass.C.withPtr
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
        (x, y)
      end
    fun getRootCoords self x y =
      let
        val rootX
         & rootY
         & () =
          (
            GdkWindowClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getRootCoords_
            (
              self
               & x
               & y
               & FFI.Int32.null
               & FFI.Int32.null
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
            GdkWindowClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getRootOrigin_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (x, y)
      end
    fun getScreen self = (GdkWindowClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getSourceEvents self source = (GdkWindowClass.C.withPtr &&&> GdkInputSource.C.withVal ---> GdkEventMask.C.fromVal) getSourceEvents_ (self & source)
    fun getState self = (GdkWindowClass.C.withPtr ---> GdkWindowState.C.fromVal) getState_ self
    fun getSupportMultidevice self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getSupportMultidevice_ self
    fun getToplevel self = (GdkWindowClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getToplevel_ self
    fun getTypeHint self = (GdkWindowClass.C.withPtr ---> GdkWindowTypeHint.C.fromVal) getTypeHint_ self
    fun getUpdateArea self = (GdkWindowClass.C.withPtr ---> CairoRegionRecord.C.fromPtr true) getUpdateArea_ self
    fun getVisibleRegion self = (GdkWindowClass.C.withPtr ---> CairoRegionRecord.C.fromPtr true) getVisibleRegion_ self
    fun getVisual self = (GdkWindowClass.C.withPtr ---> GdkVisualClass.C.fromPtr false) getVisual_ self
    fun getWidth self = (GdkWindowClass.C.withPtr ---> FFI.Int32.C.fromVal) getWidth_ self
    fun getWindowType self = (GdkWindowClass.C.withPtr ---> GdkWindowType.C.fromVal) getWindowType_ self
    fun hasNative self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) hasNative_ self
    fun hide self = (GdkWindowClass.C.withPtr ---> I) hide_ self
    fun iconify self = (GdkWindowClass.C.withPtr ---> I) iconify_ self
    fun inputShapeCombineRegion self shapeRegion offsetX offsetY =
      (
        GdkWindowClass.C.withPtr
         &&&> CairoRegionRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
        GdkWindowClass.C.withPtr
         &&&> CairoRectangleIntRecord.C.withOptPtr
         &&&> FFI.Bool.C.withVal
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
        GdkWindowClass.C.withPtr
         &&&> CairoRegionRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        invalidateRegion_
        (
          self
           & region
           & invalidateChildren
        )
    fun isDestroyed self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) isDestroyed_ self
    fun isInputOnly self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) isInputOnly_ self
    fun isShaped self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) isShaped_ self
    fun isViewable self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) isViewable_ self
    fun isVisible self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) isVisible_ self
    fun lower self = (GdkWindowClass.C.withPtr ---> I) lower_ self
    fun maximize self = (GdkWindowClass.C.withPtr ---> I) maximize_ self
    fun mergeChildInputShapes self = (GdkWindowClass.C.withPtr ---> I) mergeChildInputShapes_ self
    fun mergeChildShapes self = (GdkWindowClass.C.withPtr ---> I) mergeChildShapes_ self
    fun move self x y =
      (
        GdkWindowClass.C.withPtr
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
    fun moveRegion self region dx dy =
      (
        GdkWindowClass.C.withPtr
         &&&> CairoRegionRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
        GdkWindowClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
    fun processUpdates self updateChildren = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) processUpdates_ (self & updateChildren)
    fun raise' self = (GdkWindowClass.C.withPtr ---> I) raise_ self
    fun registerDnd self = (GdkWindowClass.C.withPtr ---> I) registerDnd_ self
    fun reparent self newParent x y =
      (
        GdkWindowClass.C.withPtr
         &&&> GdkWindowClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
        GdkWindowClass.C.withPtr
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
    fun restack self sibling above =
      (
        GdkWindowClass.C.withPtr
         &&&> GdkWindowClass.C.withOptPtr
         &&&> FFI.Bool.C.withVal
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
        GdkWindowClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        scroll_
        (
          self
           & dx
           & dy
        )
    fun setAcceptFocus self acceptFocus = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAcceptFocus_ (self & acceptFocus)
    fun setBackground self color = (GdkWindowClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setBackground_ (self & color)
    fun setBackgroundPattern self pattern = (GdkWindowClass.C.withPtr &&&> CairoPatternRecord.C.withOptPtr ---> I) setBackgroundPattern_ (self & pattern)
    fun setBackgroundRgba self rgba = (GdkWindowClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setBackgroundRgba_ (self & rgba)
    fun setChildInputShapes self = (GdkWindowClass.C.withPtr ---> I) setChildInputShapes_ self
    fun setChildShapes self = (GdkWindowClass.C.withPtr ---> I) setChildShapes_ self
    fun setComposited self composited = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setComposited_ (self & composited)
    fun setCursor self cursor = (GdkWindowClass.C.withPtr &&&> GdkCursorClass.C.withOptPtr ---> I) setCursor_ (self & cursor)
    fun setDecorations self decorations = (GdkWindowClass.C.withPtr &&&> GdkWMDecoration.C.withVal ---> I) setDecorations_ (self & decorations)
    fun setDeviceCursor self device cursor =
      (
        GdkWindowClass.C.withPtr
         &&&> GdkDeviceClass.C.withPtr
         &&&> GdkCursorClass.C.withPtr
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
        GdkWindowClass.C.withPtr
         &&&> GdkDeviceClass.C.withPtr
         &&&> GdkEventMask.C.withVal
         ---> I
      )
        setDeviceEvents_
        (
          self
           & device
           & eventMask
        )
    fun setEvents self eventMask = (GdkWindowClass.C.withPtr &&&> GdkEventMask.C.withVal ---> I) setEvents_ (self & eventMask)
    fun setFocusOnMap self focusOnMap = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusOnMap_ (self & focusOnMap)
    fun setFunctions self functions = (GdkWindowClass.C.withPtr &&&> GdkWMFunction.C.withVal ---> I) setFunctions_ (self & functions)
    fun setGeometryHints self geometry geomMask =
      (
        GdkWindowClass.C.withPtr
         &&&> GdkGeometryRecord.C.withPtr
         &&&> GdkWindowHints.C.withVal
         ---> I
      )
        setGeometryHints_
        (
          self
           & geometry
           & geomMask
        )
    fun setGroup self leader = (GdkWindowClass.C.withPtr &&&> GdkWindowClass.C.withOptPtr ---> I) setGroup_ (self & leader)
    fun setIconName self name = (GdkWindowClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepBelow_ (self & setting)
    fun setModalHint self modal = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setModalHint_ (self & modal)
    fun setOpacity self opacity = (GdkWindowClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setOpacity_ (self & opacity)
    fun setOverrideRedirect self overrideRedirect = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setOverrideRedirect_ (self & overrideRedirect)
    fun setRole self role = (GdkWindowClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setRole_ (self & role)
    fun setSkipPagerHint self skipsPager = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSkipPagerHint_ (self & skipsPager)
    fun setSkipTaskbarHint self skipsTaskbar = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSkipTaskbarHint_ (self & skipsTaskbar)
    fun setSourceEvents self source eventMask =
      (
        GdkWindowClass.C.withPtr
         &&&> GdkInputSource.C.withVal
         &&&> GdkEventMask.C.withVal
         ---> I
      )
        setSourceEvents_
        (
          self
           & source
           & eventMask
        )
    fun setStartupId self startupId = (GdkWindowClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setStartupId_ (self & startupId)
    fun setStaticGravities self useStatic = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> FFI.Bool.C.fromVal) setStaticGravities_ (self & useStatic)
    fun setSupportMultidevice self supportMultidevice = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSupportMultidevice_ (self & supportMultidevice)
    fun setTitle self title = (GdkWindowClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GdkWindowClass.C.withPtr &&&> GdkWindowClass.C.withPtr ---> I) setTransientFor_ (self & parent)
    fun setTypeHint self hint = (GdkWindowClass.C.withPtr &&&> GdkWindowTypeHint.C.withVal ---> I) setTypeHint_ (self & hint)
    fun setUrgencyHint self urgent = (GdkWindowClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUrgencyHint_ (self & urgent)
    fun setUserData self userData = (GdkWindowClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setUserData_ (self & userData)
    fun shapeCombineRegion self shapeRegion offsetX offsetY =
      (
        GdkWindowClass.C.withPtr
         &&&> CairoRegionRecord.C.withOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        shapeCombineRegion_
        (
          self
           & shapeRegion
           & offsetX
           & offsetY
        )
    fun show self = (GdkWindowClass.C.withPtr ---> I) show_ self
    fun showUnraised self = (GdkWindowClass.C.withPtr ---> I) showUnraised_ self
    fun stick self = (GdkWindowClass.C.withPtr ---> I) stick_ self
    fun thawToplevelUpdatesLibgtkOnly self = (GdkWindowClass.C.withPtr ---> I) thawToplevelUpdatesLibgtkOnly_ self
    fun thawUpdates self = (GdkWindowClass.C.withPtr ---> I) thawUpdates_ self
    fun unfullscreen self = (GdkWindowClass.C.withPtr ---> I) unfullscreen_ self
    fun unmaximize self = (GdkWindowClass.C.withPtr ---> I) unmaximize_ self
    fun unstick self = (GdkWindowClass.C.withPtr ---> I) unstick_ self
    fun withdraw self = (GdkWindowClass.C.withPtr ---> I) withdraw_ self
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
