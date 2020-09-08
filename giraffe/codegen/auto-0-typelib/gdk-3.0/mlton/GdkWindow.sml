structure GdkWindow :>
  GDK_WINDOW
    where type 'a class = 'a GdkWindowClass.class
    where type window_attributes_type_t = GdkWindowAttributesType.t
    where type window_attr_t = GdkWindowAttrRecord.t
    where type window_edge_t = GdkWindowEdge.t
    where type 'a g_l_context_class = 'a GdkGLContextClass.class
    where type 'a drawing_context_class = 'a GdkDrawingContextClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type drag_protocol_t = GdkDragProtocol.t
    where type 'a frame_clock_class = 'a GdkFrameClockClass.class
    where type modifier_type_t = GdkModifierType.t
    where type 'a screen_class = 'a GdkScreenClass.class
    where type window_state_t = GdkWindowState.t
    where type 'a visual_class = 'a GdkVisualClass.class
    where type window_type_t = GdkWindowType.t
    where type rectangle_t = GdkRectangleRecord.t
    where type color_t = GdkColorRecord.t
    where type rgba_t = GdkRgbaRecord.t
    where type w_m_decoration_t = GdkWMDecoration.t
    where type 'a device_class = 'a GdkDeviceClass.class
    where type fullscreen_mode_t = GdkFullscreenMode.t
    where type w_m_function_t = GdkWMFunction.t
    where type window_hints_t = GdkWindowHints.t
    where type geometry_t = GdkGeometryRecord.t
    where type event_mask_t = GdkEventMask.t
    where type input_source_t = GdkInputSource.t
    where type window_type_hint_t = GdkWindowTypeHint.t
    where type 'a event_union = 'a GdkEvent.union
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
              GdkWindowClass.FFI.opt GdkWindowClass.FFI.p
               * GdkWindowAttrRecord.FFI.non_opt GdkWindowAttrRecord.FFI.p
               * GdkWindowAttributesType.FFI.val_
               -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val atPointer_ = fn x1 & x2 => (_import "gdk_window_at_pointer" : GInt32.FFI.ref_ * GInt32.FFI.ref_ -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;) (x1, x2)
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
              GdkGeometryRecord.FFI.non_opt GdkGeometryRecord.FFI.p
               * GdkWindowHints.FFI.val_
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
    val beep_ = _import "gdk_window_beep" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val beginDrawFrame_ = fn x1 & x2 => (_import "gdk_window_begin_draw_frame" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * CairoRegionRecord.FFI.non_opt CairoRegionRecord.FFI.p -> GdkDrawingContextClass.FFI.non_opt GdkDrawingContextClass.FFI.p;) (x1, x2)
    val beginMoveDrag_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_begin_move_drag" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
    val beginMoveDragForDevice_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gdk_window_begin_move_drag_for_device" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p
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
    val beginPaintRect_ = fn x1 & x2 => (_import "gdk_window_begin_paint_rect" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    val beginPaintRegion_ = fn x1 & x2 => (_import "gdk_window_begin_paint_region" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * CairoRegionRecord.FFI.non_opt CairoRegionRecord.FFI.p -> unit;) (x1, x2)
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
    val beginResizeDragForDevice_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gdk_window_begin_resize_drag_for_device" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkWindowEdge.FFI.val_
               * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p
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
              x6,
              x7
            )
    val configureFinished_ = _import "gdk_window_configure_finished" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val coordsFromParent_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_coords_from_parent" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
    val createGlContext_ = fn x1 & x2 => (_import "gdk_window_create_gl_context" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p;) (x1, x2)
    val createSimilarImageSurface_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_create_similar_image_surface" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> CairoSurfaceRecord.FFI.non_opt CairoSurfaceRecord.FFI.p;
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * CairoContent.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> CairoSurfaceRecord.FFI.non_opt CairoSurfaceRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val deiconify_ = _import "gdk_window_deiconify" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val destroy_ = _import "gdk_window_destroy" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val destroyNotify_ = _import "gdk_window_destroy_notify" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val enableSynchronizedConfigure_ = _import "gdk_window_enable_synchronized_configure" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val endDrawFrame_ = fn x1 & x2 => (_import "gdk_window_end_draw_frame" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkDrawingContextClass.FFI.non_opt GdkDrawingContextClass.FFI.p -> unit;) (x1, x2)
    val endPaint_ = _import "gdk_window_end_paint" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val ensureNative_ = _import "gdk_window_ensure_native" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val flush_ = _import "gdk_window_flush" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val focus_ = fn x1 & x2 => (_import "gdk_window_focus" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val freezeToplevelUpdatesLibgtkOnly_ = _import "gdk_window_freeze_toplevel_updates_libgtk_only" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val freezeUpdates_ = _import "gdk_window_freeze_updates" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val fullscreen_ = _import "gdk_window_fullscreen" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val fullscreenOnMonitor_ = fn x1 & x2 => (_import "gdk_window_fullscreen_on_monitor" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val geometryChanged_ = _import "gdk_window_geometry_changed" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val getAcceptFocus_ = _import "gdk_window_get_accept_focus" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val getBackgroundPattern_ = _import "gdk_window_get_background_pattern" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> CairoPatternRecord.FFI.opt CairoPatternRecord.FFI.p;
    val getClipRegion_ = _import "gdk_window_get_clip_region" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> CairoRegionRecord.FFI.non_opt CairoRegionRecord.FFI.p;
    val getComposited_ = _import "gdk_window_get_composited" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val getCursor_ = _import "gdk_window_get_cursor" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkCursorClass.FFI.opt GdkCursorClass.FFI.p;
    val getDecorations_ = fn x1 & x2 => (_import "gdk_window_get_decorations" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkWMDecoration.FFI.ref_ -> GBool.FFI.val_;) (x1, x2)
    val getDeviceCursor_ = fn x1 & x2 => (_import "gdk_window_get_device_cursor" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p -> GdkCursorClass.FFI.opt GdkCursorClass.FFI.p;) (x1, x2)
    val getDeviceEvents_ = fn x1 & x2 => (_import "gdk_window_get_device_events" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p -> GdkEventMask.FFI.val_;) (x1, x2)
    val getDevicePosition_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_get_device_position" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GdkModifierType.FFI.ref_
               -> GdkWindowClass.FFI.opt GdkWindowClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getDevicePositionDouble_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_get_device_position_double" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GdkModifierType.FFI.ref_
               -> GdkWindowClass.FFI.opt GdkWindowClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getDisplay_ = _import "gdk_window_get_display" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p;
    val getDragProtocol_ = fn x1 & x2 => (_import "gdk_window_get_drag_protocol" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * (GdkWindowClass.FFI.opt, GdkWindowClass.FFI.non_opt) GdkWindowClass.FFI.r -> GdkDragProtocol.FFI.val_;) (x1, x2)
    val getEffectiveParent_ = _import "gdk_window_get_effective_parent" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val getEffectiveToplevel_ = _import "gdk_window_get_effective_toplevel" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val getEventCompression_ = _import "gdk_window_get_event_compression" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val getEvents_ = _import "gdk_window_get_events" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkEventMask.FFI.val_;
    val getFocusOnMap_ = _import "gdk_window_get_focus_on_map" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val getFrameClock_ = _import "gdk_window_get_frame_clock" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkFrameClockClass.FFI.non_opt GdkFrameClockClass.FFI.p;
    val getFrameExtents_ = fn x1 & x2 => (_import "gdk_window_get_frame_extents" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    val getFullscreenMode_ = _import "gdk_window_get_fullscreen_mode" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkFullscreenMode.FFI.val_;
    val getGeometry_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_get_geometry" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
    val getGroup_ = _import "gdk_window_get_group" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val getHeight_ = _import "gdk_window_get_height" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GInt32.FFI.val_;
    val getModalHint_ = _import "gdk_window_get_modal_hint" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val getOrigin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_get_origin" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getParent_ = _import "gdk_window_get_parent" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val getPassThrough_ = _import "gdk_window_get_pass_through" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val getPointer_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_window_get_pointer" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GdkModifierType.FFI.ref_
               -> GdkWindowClass.FFI.opt GdkWindowClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_get_position" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getScaleFactor_ = _import "gdk_window_get_scale_factor" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GInt32.FFI.val_;
    val getScreen_ = _import "gdk_window_get_screen" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p;
    val getSourceEvents_ = fn x1 & x2 => (_import "gdk_window_get_source_events" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkInputSource.FFI.val_ -> GdkEventMask.FFI.val_;) (x1, x2)
    val getState_ = _import "gdk_window_get_state" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkWindowState.FFI.val_;
    val getSupportMultidevice_ = _import "gdk_window_get_support_multidevice" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val getToplevel_ = _import "gdk_window_get_toplevel" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val getTypeHint_ = _import "gdk_window_get_type_hint" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkWindowTypeHint.FFI.val_;
    val getUpdateArea_ = _import "gdk_window_get_update_area" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> CairoRegionRecord.FFI.non_opt CairoRegionRecord.FFI.p;
    val getVisibleRegion_ = _import "gdk_window_get_visible_region" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> CairoRegionRecord.FFI.non_opt CairoRegionRecord.FFI.p;
    val getVisual_ = _import "gdk_window_get_visual" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p;
    val getWidth_ = _import "gdk_window_get_width" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GInt32.FFI.val_;
    val getWindowType_ = _import "gdk_window_get_window_type" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkWindowType.FFI.val_;
    val hasNative_ = _import "gdk_window_has_native" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val hide_ = _import "gdk_window_hide" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val iconify_ = _import "gdk_window_iconify" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val inputShapeCombineRegion_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_window_input_shape_combine_region" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * CairoRegionRecord.FFI.non_opt CairoRegionRecord.FFI.p
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkRectangleRecord.FFI.opt GdkRectangleRecord.FFI.p
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * CairoRegionRecord.FFI.non_opt CairoRegionRecord.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val isDestroyed_ = _import "gdk_window_is_destroyed" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val isInputOnly_ = _import "gdk_window_is_input_only" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val isShaped_ = _import "gdk_window_is_shaped" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val isViewable_ = _import "gdk_window_is_viewable" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val isVisible_ = _import "gdk_window_is_visible" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GBool.FFI.val_;
    val lower_ = _import "gdk_window_lower" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val markPaintFromClip_ = fn x1 & x2 => (_import "gdk_window_mark_paint_from_clip" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;) (x1, x2)
    val maximize_ = _import "gdk_window_maximize" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val mergeChildInputShapes_ = _import "gdk_window_merge_child_input_shapes" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val mergeChildShapes_ = _import "gdk_window_merge_child_shapes" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val move_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_move" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * CairoRegionRecord.FFI.non_opt CairoRegionRecord.FFI.p
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
    val processUpdates_ = fn x1 & x2 => (_import "gdk_window_process_updates" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val raise_ = _import "gdk_window_raise" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val registerDnd_ = _import "gdk_window_register_dnd" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val reparent_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_window_reparent" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkWindowClass.FFI.opt GdkWindowClass.FFI.p
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAcceptFocus_ = fn x1 & x2 => (_import "gdk_window_set_accept_focus" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setBackground_ = fn x1 & x2 => (_import "gdk_window_set_background" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setBackgroundPattern_ = fn x1 & x2 => (_import "gdk_window_set_background_pattern" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * CairoPatternRecord.FFI.opt CairoPatternRecord.FFI.p -> unit;) (x1, x2)
    val setBackgroundRgba_ = fn x1 & x2 => (_import "gdk_window_set_background_rgba" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setChildInputShapes_ = _import "gdk_window_set_child_input_shapes" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val setChildShapes_ = _import "gdk_window_set_child_shapes" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val setComposited_ = fn x1 & x2 => (_import "gdk_window_set_composited" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setCursor_ = fn x1 & x2 => (_import "gdk_window_set_cursor" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkCursorClass.FFI.opt GdkCursorClass.FFI.p -> unit;) (x1, x2)
    val setDecorations_ = fn x1 & x2 => (_import "gdk_window_set_decorations" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkWMDecoration.FFI.val_ -> unit;) (x1, x2)
    val setDeviceCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_set_device_cursor" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p
               * GdkCursorClass.FFI.non_opt GdkCursorClass.FFI.p
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p
               * GdkEventMask.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setEventCompression_ = fn x1 & x2 => (_import "gdk_window_set_event_compression" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setEvents_ = fn x1 & x2 => (_import "gdk_window_set_events" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkEventMask.FFI.val_ -> unit;) (x1, x2)
    val setFocusOnMap_ = fn x1 & x2 => (_import "gdk_window_set_focus_on_map" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setFullscreenMode_ = fn x1 & x2 => (_import "gdk_window_set_fullscreen_mode" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkFullscreenMode.FFI.val_ -> unit;) (x1, x2)
    val setFunctions_ = fn x1 & x2 => (_import "gdk_window_set_functions" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkWMFunction.FFI.val_ -> unit;) (x1, x2)
    val setGeometryHints_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_set_geometry_hints" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkGeometryRecord.FFI.non_opt GdkGeometryRecord.FFI.p
               * GdkWindowHints.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setGroup_ = fn x1 & x2 => (_import "gdk_window_set_group" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkWindowClass.FFI.opt GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_window_set_icon_name" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setKeepAbove_ = fn x1 & x2 => (_import "gdk_window_set_keep_above" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setKeepBelow_ = fn x1 & x2 => (_import "gdk_window_set_keep_below" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setModalHint_ = fn x1 & x2 => (_import "gdk_window_set_modal_hint" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setOpacity_ = fn x1 & x2 => (_import "gdk_window_set_opacity" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setOpaqueRegion_ = fn x1 & x2 => (_import "gdk_window_set_opaque_region" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * CairoRegionRecord.FFI.opt CairoRegionRecord.FFI.p -> unit;) (x1, x2)
    val setOverrideRedirect_ = fn x1 & x2 => (_import "gdk_window_set_override_redirect" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPassThrough_ = fn x1 & x2 => (_import "gdk_window_set_pass_through" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRole_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_window_set_role" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setShadowWidth_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_window_set_shadow_width" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
    val setSkipPagerHint_ = fn x1 & x2 => (_import "gdk_window_set_skip_pager_hint" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSkipTaskbarHint_ = fn x1 & x2 => (_import "gdk_window_set_skip_taskbar_hint" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSourceEvents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_window_set_source_events" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
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
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStaticGravities_ = fn x1 & x2 => (_import "gdk_window_set_static_gravities" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val setSupportMultidevice_ = fn x1 & x2 => (_import "gdk_window_set_support_multidevice" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_window_set_title" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTransientFor_ = fn x1 & x2 => (_import "gdk_window_set_transient_for" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val setTypeHint_ = fn x1 & x2 => (_import "gdk_window_set_type_hint" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkWindowTypeHint.FFI.val_ -> unit;) (x1, x2)
    val setUrgencyHint_ = fn x1 & x2 => (_import "gdk_window_set_urgency_hint" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUserData_ = fn x1 & x2 => (_import "gdk_window_set_user_data" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GObjectObjectClass.FFI.opt GObjectObjectClass.FFI.p -> unit;) (x1, x2)
    val shapeCombineRegion_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_window_shape_combine_region" :
              GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * CairoRegionRecord.FFI.opt CairoRegionRecord.FFI.p
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
    val show_ = _import "gdk_window_show" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val showUnraised_ = _import "gdk_window_show_unraised" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val showWindowMenu_ = fn x1 & x2 => (_import "gdk_window_show_window_menu" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p * GdkEvent.FFI.non_opt GdkEvent.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val stick_ = _import "gdk_window_stick" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val thawToplevelUpdatesLibgtkOnly_ = _import "gdk_window_thaw_toplevel_updates_libgtk_only" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val thawUpdates_ = _import "gdk_window_thaw_updates" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val unfullscreen_ = _import "gdk_window_unfullscreen" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val unmaximize_ = _import "gdk_window_unmaximize" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val unstick_ = _import "gdk_window_unstick" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    val withdraw_ = _import "gdk_window_withdraw" : GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;
    type 'a class = 'a GdkWindowClass.class
    type window_attributes_type_t = GdkWindowAttributesType.t
    type window_attr_t = GdkWindowAttrRecord.t
    type window_edge_t = GdkWindowEdge.t
    type 'a g_l_context_class = 'a GdkGLContextClass.class
    type 'a drawing_context_class = 'a GdkDrawingContextClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type drag_protocol_t = GdkDragProtocol.t
    type 'a frame_clock_class = 'a GdkFrameClockClass.class
    type modifier_type_t = GdkModifierType.t
    type 'a screen_class = 'a GdkScreenClass.class
    type window_state_t = GdkWindowState.t
    type 'a visual_class = 'a GdkVisualClass.class
    type window_type_t = GdkWindowType.t
    type rectangle_t = GdkRectangleRecord.t
    type color_t = GdkColorRecord.t
    type rgba_t = GdkRgbaRecord.t
    type w_m_decoration_t = GdkWMDecoration.t
    type 'a device_class = 'a GdkDeviceClass.class
    type fullscreen_mode_t = GdkFullscreenMode.t
    type w_m_function_t = GdkWMFunction.t
    type window_hints_t = GdkWindowHints.t
    type geometry_t = GdkGeometryRecord.t
    type event_mask_t = GdkEventMask.t
    type input_source_t = GdkInputSource.t
    type window_type_hint_t = GdkWindowTypeHint.t
    type 'a event_union = 'a GdkEvent.union
    type 'a cursor_class = 'a GdkCursorClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        parent,
        attributes,
        attributesMask
      ) =
      (
        GdkWindowClass.FFI.withOptPtr false
         &&&> GdkWindowAttrRecord.FFI.withPtr false
         &&&> GdkWindowAttributesType.FFI.withVal
         ---> GdkWindowClass.FFI.fromPtr true
      )
        new_
        (
          parent
           & attributes
           & attributesMask
        )
    fun atPointer () =
      let
        val winX
         & winY
         & retVal =
          (
            GInt32.FFI.withRefVal &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkWindowClass.FFI.fromPtr false
          )
            atPointer_
            (GInt32.null & GInt32.null)
      in
        (
          retVal,
          winX,
          winY
        )
      end
    fun constrainSize
      (
        geometry,
        flags,
        width,
        height
      ) =
      let
        val newWidth
         & newHeight
         & () =
          (
            GdkGeometryRecord.FFI.withPtr false
             &&&> GdkWindowHints.FFI.withVal
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
    fun beep self = (GdkWindowClass.FFI.withPtr false ---> I) beep_ self
    fun beginDrawFrame self region = (GdkWindowClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withPtr false ---> GdkDrawingContextClass.FFI.fromPtr false) beginDrawFrame_ (self & region)
    fun beginMoveDrag
      self
      (
        button,
        rootX,
        rootY,
        timestamp
      ) =
      (
        GdkWindowClass.FFI.withPtr false
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
    fun beginMoveDragForDevice
      self
      (
        device,
        button,
        rootX,
        rootY,
        timestamp
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        beginMoveDragForDevice_
        (
          self
           & device
           & button
           & rootX
           & rootY
           & timestamp
        )
    fun beginPaintRect self rectangle = (GdkWindowClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withPtr false ---> I) beginPaintRect_ (self & rectangle)
    fun beginPaintRegion self region = (GdkWindowClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withPtr false ---> I) beginPaintRegion_ (self & region)
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
        GdkWindowClass.FFI.withPtr false
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
    fun beginResizeDragForDevice
      self
      (
        edge,
        device,
        button,
        rootX,
        rootY,
        timestamp
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkWindowEdge.FFI.withVal
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        beginResizeDragForDevice_
        (
          self
           & edge
           & device
           & button
           & rootX
           & rootY
           & timestamp
        )
    fun configureFinished self = (GdkWindowClass.FFI.withPtr false ---> I) configureFinished_ self
    fun coordsFromParent self (parentX, parentY) =
      let
        val x
         & y
         & () =
          (
            GdkWindowClass.FFI.withPtr false
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
    fun coordsToParent self (x, y) =
      let
        val parentX
         & parentY
         & () =
          (
            GdkWindowClass.FFI.withPtr false
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
    fun createGlContext self = (GdkWindowClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GdkGLContextClass.FFI.fromPtr true) createGlContext_ (self & [])
    fun createSimilarImageSurface
      self
      (
        format,
        width,
        height,
        scale
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> CairoSurfaceRecord.FFI.fromPtr true
      )
        createSimilarImageSurface_
        (
          self
           & format
           & width
           & height
           & scale
        )
    fun createSimilarSurface
      self
      (
        content,
        width,
        height
      ) =
      (
        GdkWindowClass.FFI.withPtr false
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
    fun deiconify self = (GdkWindowClass.FFI.withPtr false ---> I) deiconify_ self
    fun destroy self = (GdkWindowClass.FFI.withPtr false ---> I) destroy_ self
    fun destroyNotify self = (GdkWindowClass.FFI.withPtr false ---> I) destroyNotify_ self
    fun enableSynchronizedConfigure self = (GdkWindowClass.FFI.withPtr false ---> I) enableSynchronizedConfigure_ self
    fun endDrawFrame self context = (GdkWindowClass.FFI.withPtr false &&&> GdkDrawingContextClass.FFI.withPtr false ---> I) endDrawFrame_ (self & context)
    fun endPaint self = (GdkWindowClass.FFI.withPtr false ---> I) endPaint_ self
    fun ensureNative self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) ensureNative_ self
    fun flush self = (GdkWindowClass.FFI.withPtr false ---> I) flush_ self
    fun focus self timestamp = (GdkWindowClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) focus_ (self & timestamp)
    fun freezeToplevelUpdatesLibgtkOnly self = (GdkWindowClass.FFI.withPtr false ---> I) freezeToplevelUpdatesLibgtkOnly_ self
    fun freezeUpdates self = (GdkWindowClass.FFI.withPtr false ---> I) freezeUpdates_ self
    fun fullscreen self = (GdkWindowClass.FFI.withPtr false ---> I) fullscreen_ self
    fun fullscreenOnMonitor self monitor = (GdkWindowClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) fullscreenOnMonitor_ (self & monitor)
    fun geometryChanged self = (GdkWindowClass.FFI.withPtr false ---> I) geometryChanged_ self
    fun getAcceptFocus self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAcceptFocus_ self
    fun getBackgroundPattern self = (GdkWindowClass.FFI.withPtr false ---> CairoPatternRecord.FFI.fromOptPtr false) getBackgroundPattern_ self
    fun getClipRegion self = (GdkWindowClass.FFI.withPtr false ---> CairoRegionRecord.FFI.fromPtr true) getClipRegion_ self
    fun getComposited self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getComposited_ self
    fun getCursor self = (GdkWindowClass.FFI.withPtr false ---> GdkCursorClass.FFI.fromOptPtr false) getCursor_ self
    fun getDecorations self =
      let
        val decorations & retVal = (GdkWindowClass.FFI.withPtr false &&&> GdkWMDecoration.FFI.withRefVal ---> GdkWMDecoration.FFI.fromVal && GBool.FFI.fromVal) getDecorations_ (self & GdkWMDecoration.flags [])
      in
        if retVal then SOME decorations else NONE
      end
    fun getDeviceCursor self device = (GdkWindowClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GdkCursorClass.FFI.fromOptPtr false) getDeviceCursor_ (self & device)
    fun getDeviceEvents self device = (GdkWindowClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GdkEventMask.FFI.fromVal) getDeviceEvents_ (self & device)
    fun getDevicePosition self device =
      let
        val x
         & y
         & mask
         & retVal =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GdkDeviceClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && GdkWindowClass.FFI.fromOptPtr false
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
    fun getDevicePositionDouble self device =
      let
        val x
         & y
         & mask
         & retVal =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GdkDeviceClass.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && GdkWindowClass.FFI.fromOptPtr false
          )
            getDevicePositionDouble_
            (
              self
               & device
               & GDouble.null
               & GDouble.null
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
    fun getDisplay self = (GdkWindowClass.FFI.withPtr false ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getDragProtocol self =
      let
        val target & retVal = (GdkWindowClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withRefOptPtr true ---> GdkWindowClass.FFI.fromPtr true && GdkDragProtocol.FFI.fromVal) getDragProtocol_ (self & NONE)
      in
        (retVal, target)
      end
    fun getEffectiveParent self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getEffectiveParent_ self
    fun getEffectiveToplevel self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getEffectiveToplevel_ self
    fun getEventCompression self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getEventCompression_ self
    fun getEvents self = (GdkWindowClass.FFI.withPtr false ---> GdkEventMask.FFI.fromVal) getEvents_ self
    fun getFocusOnMap self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFocusOnMap_ self
    fun getFrameClock self = (GdkWindowClass.FFI.withPtr false ---> GdkFrameClockClass.FFI.fromPtr false) getFrameClock_ self
    fun getFrameExtents self =
      let
        val rect & () = (GdkWindowClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getFrameExtents_ (self & ())
      in
        rect
      end
    fun getFullscreenMode self = (GdkWindowClass.FFI.withPtr false ---> GdkFullscreenMode.FFI.fromVal) getFullscreenMode_ self
    fun getGeometry self =
      let
        val x
         & y
         & width
         & height
         & () =
          (
            GdkWindowClass.FFI.withPtr false
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
    fun getGroup self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getGroup_ self
    fun getHeight self = (GdkWindowClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getHeight_ self
    fun getModalHint self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getModalHint_ self
    fun getOrigin self =
      let
        val x
         & y
         & retVal =
          (
            GdkWindowClass.FFI.withPtr false
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
    fun getParent self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getParent_ self
    fun getPassThrough self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getPassThrough_ self
    fun getPointer self =
      let
        val x
         & y
         & mask
         & retVal =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && GdkWindowClass.FFI.fromOptPtr false
          )
            getPointer_
            (
              self
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
    fun getPosition self =
      let
        val x
         & y
         & () =
          (
            GdkWindowClass.FFI.withPtr false
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
    fun getRootCoords self (x, y) =
      let
        val rootX
         & rootY
         & () =
          (
            GdkWindowClass.FFI.withPtr false
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
            GdkWindowClass.FFI.withPtr false
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
    fun getScaleFactor self = (GdkWindowClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getScaleFactor_ self
    fun getScreen self = (GdkWindowClass.FFI.withPtr false ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun getSourceEvents self source = (GdkWindowClass.FFI.withPtr false &&&> GdkInputSource.FFI.withVal ---> GdkEventMask.FFI.fromVal) getSourceEvents_ (self & source)
    fun getState self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowState.FFI.fromVal) getState_ self
    fun getSupportMultidevice self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSupportMultidevice_ self
    fun getToplevel self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getToplevel_ self
    fun getTypeHint self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowTypeHint.FFI.fromVal) getTypeHint_ self
    fun getUpdateArea self = (GdkWindowClass.FFI.withPtr false ---> CairoRegionRecord.FFI.fromPtr true) getUpdateArea_ self
    fun getVisibleRegion self = (GdkWindowClass.FFI.withPtr false ---> CairoRegionRecord.FFI.fromPtr true) getVisibleRegion_ self
    fun getVisual self = (GdkWindowClass.FFI.withPtr false ---> GdkVisualClass.FFI.fromPtr false) getVisual_ self
    fun getWidth self = (GdkWindowClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getWidth_ self
    fun getWindowType self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowType.FFI.fromVal) getWindowType_ self
    fun hasNative self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasNative_ self
    fun hide self = (GdkWindowClass.FFI.withPtr false ---> I) hide_ self
    fun iconify self = (GdkWindowClass.FFI.withPtr false ---> I) iconify_ self
    fun inputShapeCombineRegion
      self
      (
        shapeRegion,
        offsetX,
        offsetY
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> CairoRegionRecord.FFI.withPtr false
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
    fun invalidateRect self (rect, invalidateChildren) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withOptPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        invalidateRect_
        (
          self
           & rect
           & invalidateChildren
        )
    fun invalidateRegion self (region, invalidateChildren) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> CairoRegionRecord.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        invalidateRegion_
        (
          self
           & region
           & invalidateChildren
        )
    fun isDestroyed self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) isDestroyed_ self
    fun isInputOnly self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) isInputOnly_ self
    fun isShaped self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) isShaped_ self
    fun isViewable self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) isViewable_ self
    fun isVisible self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) isVisible_ self
    fun lower self = (GdkWindowClass.FFI.withPtr false ---> I) lower_ self
    fun markPaintFromClip self cr = (GdkWindowClass.FFI.withPtr false &&&> CairoContextRecord.FFI.withPtr false ---> I) markPaintFromClip_ (self & cr)
    fun maximize self = (GdkWindowClass.FFI.withPtr false ---> I) maximize_ self
    fun mergeChildInputShapes self = (GdkWindowClass.FFI.withPtr false ---> I) mergeChildInputShapes_ self
    fun mergeChildShapes self = (GdkWindowClass.FFI.withPtr false ---> I) mergeChildShapes_ self
    fun move self (x, y) =
      (
        GdkWindowClass.FFI.withPtr false
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
    fun moveRegion
      self
      (
        region,
        dx,
        dy
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> CairoRegionRecord.FFI.withPtr false
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
    fun moveResize
      self
      (
        x,
        y,
        width,
        height
      ) =
      (
        GdkWindowClass.FFI.withPtr false
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
    fun processUpdates self updateChildren = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) processUpdates_ (self & updateChildren)
    fun raise' self = (GdkWindowClass.FFI.withPtr false ---> I) raise_ self
    fun registerDnd self = (GdkWindowClass.FFI.withPtr false ---> I) registerDnd_ self
    fun reparent
      self
      (
        newParent,
        x,
        y
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withPtr false
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
    fun resize self (width, height) =
      (
        GdkWindowClass.FFI.withPtr false
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
    fun restack self (sibling, above) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withOptPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        restack_
        (
          self
           & sibling
           & above
        )
    fun scroll self (dx, dy) =
      (
        GdkWindowClass.FFI.withPtr false
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
    fun setAcceptFocus self acceptFocus = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAcceptFocus_ (self & acceptFocus)
    fun setBackground self color = (GdkWindowClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I) setBackground_ (self & color)
    fun setBackgroundPattern self pattern = (GdkWindowClass.FFI.withPtr false &&&> CairoPatternRecord.FFI.withOptPtr false ---> I) setBackgroundPattern_ (self & pattern)
    fun setBackgroundRgba self rgba = (GdkWindowClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I) setBackgroundRgba_ (self & rgba)
    fun setChildInputShapes self = (GdkWindowClass.FFI.withPtr false ---> I) setChildInputShapes_ self
    fun setChildShapes self = (GdkWindowClass.FFI.withPtr false ---> I) setChildShapes_ self
    fun setComposited self composited = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setComposited_ (self & composited)
    fun setCursor self cursor = (GdkWindowClass.FFI.withPtr false &&&> GdkCursorClass.FFI.withOptPtr false ---> I) setCursor_ (self & cursor)
    fun setDecorations self decorations = (GdkWindowClass.FFI.withPtr false &&&> GdkWMDecoration.FFI.withVal ---> I) setDecorations_ (self & decorations)
    fun setDeviceCursor self (device, cursor) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GdkCursorClass.FFI.withPtr false
         ---> I
      )
        setDeviceCursor_
        (
          self
           & device
           & cursor
        )
    fun setDeviceEvents self (device, eventMask) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GdkEventMask.FFI.withVal
         ---> I
      )
        setDeviceEvents_
        (
          self
           & device
           & eventMask
        )
    fun setEventCompression self eventCompression = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setEventCompression_ (self & eventCompression)
    fun setEvents self eventMask = (GdkWindowClass.FFI.withPtr false &&&> GdkEventMask.FFI.withVal ---> I) setEvents_ (self & eventMask)
    fun setFocusOnMap self focusOnMap = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setFocusOnMap_ (self & focusOnMap)
    fun setFullscreenMode self mode = (GdkWindowClass.FFI.withPtr false &&&> GdkFullscreenMode.FFI.withVal ---> I) setFullscreenMode_ (self & mode)
    fun setFunctions self functions = (GdkWindowClass.FFI.withPtr false &&&> GdkWMFunction.FFI.withVal ---> I) setFunctions_ (self & functions)
    fun setGeometryHints self (geometry, geomMask) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkGeometryRecord.FFI.withPtr false
         &&&> GdkWindowHints.FFI.withVal
         ---> I
      )
        setGeometryHints_
        (
          self
           & geometry
           & geomMask
        )
    fun setGroup self leader = (GdkWindowClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withOptPtr false ---> I) setGroup_ (self & leader)
    fun setIconName self name = (GdkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setKeepBelow_ (self & setting)
    fun setModalHint self modal = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setModalHint_ (self & modal)
    fun setOpacity self opacity = (GdkWindowClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setOpacity_ (self & opacity)
    fun setOpaqueRegion self region = (GdkWindowClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withOptPtr false ---> I) setOpaqueRegion_ (self & region)
    fun setOverrideRedirect self overrideRedirect = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setOverrideRedirect_ (self & overrideRedirect)
    fun setPassThrough self passThrough = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setPassThrough_ (self & passThrough)
    fun setRole self role = (GdkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setRole_ (self & role)
    fun setShadowWidth
      self
      (
        left,
        right,
        top,
        bottom
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setShadowWidth_
        (
          self
           & left
           & right
           & top
           & bottom
        )
    fun setSkipPagerHint self skipsPager = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSkipPagerHint_ (self & skipsPager)
    fun setSkipTaskbarHint self skipsTaskbar = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSkipTaskbarHint_ (self & skipsTaskbar)
    fun setSourceEvents self (source, eventMask) =
      (
        GdkWindowClass.FFI.withPtr false
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
    fun setStartupId self startupId = (GdkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setStartupId_ (self & startupId)
    fun setStaticGravities self useStatic = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) setStaticGravities_ (self & useStatic)
    fun setSupportMultidevice self supportMultidevice = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSupportMultidevice_ (self & supportMultidevice)
    fun setTitle self title = (GdkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GdkWindowClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr false ---> I) setTransientFor_ (self & parent)
    fun setTypeHint self hint = (GdkWindowClass.FFI.withPtr false &&&> GdkWindowTypeHint.FFI.withVal ---> I) setTypeHint_ (self & hint)
    fun setUrgencyHint self urgent = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUrgencyHint_ (self & urgent)
    fun setUserData self userData = (GdkWindowClass.FFI.withPtr false &&&> GObjectObjectClass.FFI.withOptPtr false ---> I) setUserData_ (self & userData)
    fun shapeCombineRegion
      self
      (
        shapeRegion,
        offsetX,
        offsetY
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> CairoRegionRecord.FFI.withOptPtr false
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
    fun show self = (GdkWindowClass.FFI.withPtr false ---> I) show_ self
    fun showUnraised self = (GdkWindowClass.FFI.withPtr false ---> I) showUnraised_ self
    fun showWindowMenu self event = (GdkWindowClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> GBool.FFI.fromVal) showWindowMenu_ (self & event)
    fun stick self = (GdkWindowClass.FFI.withPtr false ---> I) stick_ self
    fun thawToplevelUpdatesLibgtkOnly self = (GdkWindowClass.FFI.withPtr false ---> I) thawToplevelUpdatesLibgtkOnly_ self
    fun thawUpdates self = (GdkWindowClass.FFI.withPtr false ---> I) thawUpdates_ self
    fun unfullscreen self = (GdkWindowClass.FFI.withPtr false ---> I) unfullscreen_ self
    fun unmaximize self = (GdkWindowClass.FFI.withPtr false ---> I) unmaximize_ self
    fun unstick self = (GdkWindowClass.FFI.withPtr false ---> I) unstick_ self
    fun withdraw self = (GdkWindowClass.FFI.withPtr false ---> I) withdraw_ self
    local
      open ClosureMarshal Signal
    in
      fun createSurfaceSig f = signal "create-surface" (get 0w1 int &&&> get 0w2 int ---> ret CairoSurfaceRecord.t) (fn width & height => f (width, height))
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
                  val (offscreenX, offscreenY) = f (embedderX, embedderY)
                in
                  offscreenX
                   & offscreenY
                   & ()
                end
          )
      fun pickEmbeddedChildSig f = signal "pick-embedded-child" (get 0w1 double &&&> get 0w2 double ---> ret GdkWindowClass.tOpt) (fn x & y => f (x, y))
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
                  val (embedderX, embedderY) = f (offscreenX, offscreenY)
                in
                  embedderX
                   & embedderY
                   & ()
                end
          )
    end
    local
      open ValueAccessor
    in
      val cursorProp =
        {
          name = "cursor",
          gtype = fn () => C.gtype GdkCursorClass.tOpt (),
          get = fn x => fn () => C.get GdkCursorClass.tOpt x,
          set = fn x => C.set GdkCursorClass.tOpt x,
          init = fn x => C.set GdkCursorClass.tOpt x
        }
    end
  end
