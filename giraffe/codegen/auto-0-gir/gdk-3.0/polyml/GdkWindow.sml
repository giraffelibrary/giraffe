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
    where type rectangle_t = GdkRectangleRecord.t
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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_window_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgdk "gdk_window_new")
          (
            GdkWindowClass.PolyML.cOptPtr
             &&> GdkWindowAttrRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             --> GdkWindowClass.PolyML.cPtr
          )
      val constrainSize_ =
        call (load_sym libgdk "gdk_window_constrain_size")
          (
            GdkGeometryRecord.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val processAllUpdates_ = call (load_sym libgdk "gdk_window_process_all_updates") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val setDebugUpdates_ = call (load_sym libgdk "gdk_window_set_debug_updates") (FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val beep_ = call (load_sym libgdk "gdk_window_beep") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val beginMoveDrag_ =
        call (load_sym libgdk "gdk_window_begin_move_drag")
          (
            GdkWindowClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val beginPaintRect_ = call (load_sym libgdk "gdk_window_begin_paint_rect") (GdkWindowClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val beginPaintRegion_ = call (load_sym libgdk "gdk_window_begin_paint_region") (GdkWindowClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val beginResizeDrag_ =
        call (load_sym libgdk "gdk_window_begin_resize_drag")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkWindowEdge.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val configureFinished_ = call (load_sym libgdk "gdk_window_configure_finished") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val coordsFromParent_ =
        call (load_sym libgdk "gdk_window_coords_from_parent")
          (
            GdkWindowClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val coordsToParent_ =
        call (load_sym libgdk "gdk_window_coords_to_parent")
          (
            GdkWindowClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val createSimilarSurface_ =
        call (load_sym libgdk "gdk_window_create_similar_surface")
          (
            GdkWindowClass.PolyML.cPtr
             &&> CairoContent.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> CairoSurfaceRecord.PolyML.cPtr
          )
      val deiconify_ = call (load_sym libgdk "gdk_window_deiconify") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val destroy_ = call (load_sym libgdk "gdk_window_destroy") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val destroyNotify_ = call (load_sym libgdk "gdk_window_destroy_notify") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val enableSynchronizedConfigure_ = call (load_sym libgdk "gdk_window_enable_synchronized_configure") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val endPaint_ = call (load_sym libgdk "gdk_window_end_paint") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val ensureNative_ = call (load_sym libgdk "gdk_window_ensure_native") (GdkWindowClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val flush_ = call (load_sym libgdk "gdk_window_flush") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val focus_ = call (load_sym libgdk "gdk_window_focus") (GdkWindowClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val freezeToplevelUpdatesLibgtkOnly_ = call (load_sym libgdk "gdk_window_freeze_toplevel_updates_libgtk_only") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val freezeUpdates_ = call (load_sym libgdk "gdk_window_freeze_updates") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val fullscreen_ = call (load_sym libgdk "gdk_window_fullscreen") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val geometryChanged_ = call (load_sym libgdk "gdk_window_geometry_changed") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getAcceptFocus_ = call (load_sym libgdk "gdk_window_get_accept_focus") (GdkWindowClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getBackgroundPattern_ = call (load_sym libgdk "gdk_window_get_background_pattern") (GdkWindowClass.PolyML.cPtr --> CairoPatternRecord.PolyML.cPtr)
      val getClipRegion_ = call (load_sym libgdk "gdk_window_get_clip_region") (GdkWindowClass.PolyML.cPtr --> CairoRegionRecord.PolyML.cPtr)
      val getComposited_ = call (load_sym libgdk "gdk_window_get_composited") (GdkWindowClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCursor_ = call (load_sym libgdk "gdk_window_get_cursor") (GdkWindowClass.PolyML.cPtr --> GdkCursorClass.PolyML.cPtr)
      val getDecorations_ = call (load_sym libgdk "gdk_window_get_decorations") (GdkWindowClass.PolyML.cPtr &&> GdkWMDecoration.PolyML.cRef --> FFI.Bool.PolyML.cVal)
      val getDeviceCursor_ = call (load_sym libgdk "gdk_window_get_device_cursor") (GdkWindowClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> GdkCursorClass.PolyML.cPtr)
      val getDeviceEvents_ = call (load_sym libgdk "gdk_window_get_device_events") (GdkWindowClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> GdkEventMask.PolyML.cVal)
      val getDevicePosition_ =
        call (load_sym libgdk "gdk_window_get_device_position")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> GdkWindowClass.PolyML.cPtr
          )
      val getDisplay_ = call (load_sym libgdk "gdk_window_get_display") (GdkWindowClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getDragProtocol_ = call (load_sym libgdk "gdk_window_get_drag_protocol") (GdkWindowClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cOutRef --> GdkDragProtocol.PolyML.cVal)
      val getEffectiveParent_ = call (load_sym libgdk "gdk_window_get_effective_parent") (GdkWindowClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getEffectiveToplevel_ = call (load_sym libgdk "gdk_window_get_effective_toplevel") (GdkWindowClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getEvents_ = call (load_sym libgdk "gdk_window_get_events") (GdkWindowClass.PolyML.cPtr --> GdkEventMask.PolyML.cVal)
      val getFocusOnMap_ = call (load_sym libgdk "gdk_window_get_focus_on_map") (GdkWindowClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFrameExtents_ = call (load_sym libgdk "gdk_window_get_frame_extents") (GdkWindowClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getGeometry_ =
        call (load_sym libgdk "gdk_window_get_geometry")
          (
            GdkWindowClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getGroup_ = call (load_sym libgdk "gdk_window_get_group") (GdkWindowClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getHeight_ = call (load_sym libgdk "gdk_window_get_height") (GdkWindowClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getModalHint_ = call (load_sym libgdk "gdk_window_get_modal_hint") (GdkWindowClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getOrigin_ =
        call (load_sym libgdk "gdk_window_get_origin")
          (
            GdkWindowClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.Int.PolyML.cVal
          )
      val getParent_ = call (load_sym libgdk "gdk_window_get_parent") (GdkWindowClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getPosition_ =
        call (load_sym libgdk "gdk_window_get_position")
          (
            GdkWindowClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getRootCoords_ =
        call (load_sym libgdk "gdk_window_get_root_coords")
          (
            GdkWindowClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getRootOrigin_ =
        call (load_sym libgdk "gdk_window_get_root_origin")
          (
            GdkWindowClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getScreen_ = call (load_sym libgdk "gdk_window_get_screen") (GdkWindowClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getSourceEvents_ = call (load_sym libgdk "gdk_window_get_source_events") (GdkWindowClass.PolyML.cPtr &&> GdkInputSource.PolyML.cVal --> GdkEventMask.PolyML.cVal)
      val getState_ = call (load_sym libgdk "gdk_window_get_state") (GdkWindowClass.PolyML.cPtr --> GdkWindowState.PolyML.cVal)
      val getSupportMultidevice_ = call (load_sym libgdk "gdk_window_get_support_multidevice") (GdkWindowClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getToplevel_ = call (load_sym libgdk "gdk_window_get_toplevel") (GdkWindowClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getTypeHint_ = call (load_sym libgdk "gdk_window_get_type_hint") (GdkWindowClass.PolyML.cPtr --> GdkWindowTypeHint.PolyML.cVal)
      val getUpdateArea_ = call (load_sym libgdk "gdk_window_get_update_area") (GdkWindowClass.PolyML.cPtr --> CairoRegionRecord.PolyML.cPtr)
      val getVisibleRegion_ = call (load_sym libgdk "gdk_window_get_visible_region") (GdkWindowClass.PolyML.cPtr --> CairoRegionRecord.PolyML.cPtr)
      val getVisual_ = call (load_sym libgdk "gdk_window_get_visual") (GdkWindowClass.PolyML.cPtr --> GdkVisualClass.PolyML.cPtr)
      val getWidth_ = call (load_sym libgdk "gdk_window_get_width") (GdkWindowClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getWindowType_ = call (load_sym libgdk "gdk_window_get_window_type") (GdkWindowClass.PolyML.cPtr --> GdkWindowType.PolyML.cVal)
      val hasNative_ = call (load_sym libgdk "gdk_window_has_native") (GdkWindowClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hide_ = call (load_sym libgdk "gdk_window_hide") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val iconify_ = call (load_sym libgdk "gdk_window_iconify") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val inputShapeCombineRegion_ =
        call (load_sym libgdk "gdk_window_input_shape_combine_region")
          (
            GdkWindowClass.PolyML.cPtr
             &&> CairoRegionRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val invalidateRect_ =
        call (load_sym libgdk "gdk_window_invalidate_rect")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cOptPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val invalidateRegion_ =
        call (load_sym libgdk "gdk_window_invalidate_region")
          (
            GdkWindowClass.PolyML.cPtr
             &&> CairoRegionRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val isDestroyed_ = call (load_sym libgdk "gdk_window_is_destroyed") (GdkWindowClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isInputOnly_ = call (load_sym libgdk "gdk_window_is_input_only") (GdkWindowClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isShaped_ = call (load_sym libgdk "gdk_window_is_shaped") (GdkWindowClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isViewable_ = call (load_sym libgdk "gdk_window_is_viewable") (GdkWindowClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isVisible_ = call (load_sym libgdk "gdk_window_is_visible") (GdkWindowClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val lower_ = call (load_sym libgdk "gdk_window_lower") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val maximize_ = call (load_sym libgdk "gdk_window_maximize") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val mergeChildInputShapes_ = call (load_sym libgdk "gdk_window_merge_child_input_shapes") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val mergeChildShapes_ = call (load_sym libgdk "gdk_window_merge_child_shapes") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val move_ =
        call (load_sym libgdk "gdk_window_move")
          (
            GdkWindowClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val moveRegion_ =
        call (load_sym libgdk "gdk_window_move_region")
          (
            GdkWindowClass.PolyML.cPtr
             &&> CairoRegionRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val moveResize_ =
        call (load_sym libgdk "gdk_window_move_resize")
          (
            GdkWindowClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val processUpdates_ = call (load_sym libgdk "gdk_window_process_updates") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val raise_ = call (load_sym libgdk "gdk_window_raise") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val registerDnd_ = call (load_sym libgdk "gdk_window_register_dnd") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val reparent_ =
        call (load_sym libgdk "gdk_window_reparent")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val resize_ =
        call (load_sym libgdk "gdk_window_resize")
          (
            GdkWindowClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val restack_ =
        call (load_sym libgdk "gdk_window_restack")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cOptPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val scroll_ =
        call (load_sym libgdk "gdk_window_scroll")
          (
            GdkWindowClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setAcceptFocus_ = call (load_sym libgdk "gdk_window_set_accept_focus") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBackground_ = call (load_sym libgdk "gdk_window_set_background") (GdkWindowClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setBackgroundPattern_ = call (load_sym libgdk "gdk_window_set_background_pattern") (GdkWindowClass.PolyML.cPtr &&> CairoPatternRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setBackgroundRgba_ = call (load_sym libgdk "gdk_window_set_background_rgba") (GdkWindowClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setChildInputShapes_ = call (load_sym libgdk "gdk_window_set_child_input_shapes") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setChildShapes_ = call (load_sym libgdk "gdk_window_set_child_shapes") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setComposited_ = call (load_sym libgdk "gdk_window_set_composited") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCursor_ = call (load_sym libgdk "gdk_window_set_cursor") (GdkWindowClass.PolyML.cPtr &&> GdkCursorClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setDecorations_ = call (load_sym libgdk "gdk_window_set_decorations") (GdkWindowClass.PolyML.cPtr &&> GdkWMDecoration.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDeviceCursor_ =
        call (load_sym libgdk "gdk_window_set_device_cursor")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GdkCursorClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val setDeviceEvents_ =
        call (load_sym libgdk "gdk_window_set_device_events")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GdkEventMask.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setEvents_ = call (load_sym libgdk "gdk_window_set_events") (GdkWindowClass.PolyML.cPtr &&> GdkEventMask.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFocusOnMap_ = call (load_sym libgdk "gdk_window_set_focus_on_map") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFunctions_ = call (load_sym libgdk "gdk_window_set_functions") (GdkWindowClass.PolyML.cPtr &&> GdkWMFunction.PolyML.cVal --> FFI.PolyML.cVoid)
      val setGeometryHints_ =
        call (load_sym libgdk "gdk_window_set_geometry_hints")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkGeometryRecord.PolyML.cPtr
             &&> GdkWindowHints.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setGroup_ = call (load_sym libgdk "gdk_window_set_group") (GdkWindowClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setIconName_ = call (load_sym libgdk "gdk_window_set_icon_name") (GdkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setKeepAbove_ = call (load_sym libgdk "gdk_window_set_keep_above") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setKeepBelow_ = call (load_sym libgdk "gdk_window_set_keep_below") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setModalHint_ = call (load_sym libgdk "gdk_window_set_modal_hint") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOpacity_ = call (load_sym libgdk "gdk_window_set_opacity") (GdkWindowClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOverrideRedirect_ = call (load_sym libgdk "gdk_window_set_override_redirect") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setRole_ = call (load_sym libgdk "gdk_window_set_role") (GdkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setSkipPagerHint_ = call (load_sym libgdk "gdk_window_set_skip_pager_hint") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSkipTaskbarHint_ = call (load_sym libgdk "gdk_window_set_skip_taskbar_hint") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSourceEvents_ =
        call (load_sym libgdk "gdk_window_set_source_events")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkInputSource.PolyML.cVal
             &&> GdkEventMask.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setStartupId_ = call (load_sym libgdk "gdk_window_set_startup_id") (GdkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setStaticGravities_ = call (load_sym libgdk "gdk_window_set_static_gravities") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val setSupportMultidevice_ = call (load_sym libgdk "gdk_window_set_support_multidevice") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTitle_ = call (load_sym libgdk "gdk_window_set_title") (GdkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setTransientFor_ = call (load_sym libgdk "gdk_window_set_transient_for") (GdkWindowClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setTypeHint_ = call (load_sym libgdk "gdk_window_set_type_hint") (GdkWindowClass.PolyML.cPtr &&> GdkWindowTypeHint.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUrgencyHint_ = call (load_sym libgdk "gdk_window_set_urgency_hint") (GdkWindowClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUserData_ = call (load_sym libgdk "gdk_window_set_user_data") (GdkWindowClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val shapeCombineRegion_ =
        call (load_sym libgdk "gdk_window_shape_combine_region")
          (
            GdkWindowClass.PolyML.cPtr
             &&> CairoRegionRecord.PolyML.cOptPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val show_ = call (load_sym libgdk "gdk_window_show") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val showUnraised_ = call (load_sym libgdk "gdk_window_show_unraised") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val stick_ = call (load_sym libgdk "gdk_window_stick") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val thawToplevelUpdatesLibgtkOnly_ = call (load_sym libgdk "gdk_window_thaw_toplevel_updates_libgtk_only") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val thawUpdates_ = call (load_sym libgdk "gdk_window_thaw_updates") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unfullscreen_ = call (load_sym libgdk "gdk_window_unfullscreen") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unmaximize_ = call (load_sym libgdk "gdk_window_unmaximize") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unstick_ = call (load_sym libgdk "gdk_window_unstick") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val withdraw_ = call (load_sym libgdk "gdk_window_withdraw") (GdkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
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
    type rectangle_t = GdkRectangleRecord.t
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
         &&&> FFI.Int.C.withVal
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
             &&&> FFI.UInt.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            constrainSize_
            (
              geometry
               & flags
               & width
               & height
               & FFI.Int.null
               & FFI.Int.null
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
    fun beginPaintRect self rectangle = (GdkWindowClass.C.withPtr &&&> GdkRectangleRecord.C.withPtr ---> I) beginPaintRect_ (self & rectangle)
    fun beginPaintRegion self region = (GdkWindowClass.C.withPtr &&&> CairoRegionRecord.C.withPtr ---> I) beginPaintRegion_ (self & region)
    fun beginResizeDrag self edge button rootX rootY timestamp =
      (
        GdkWindowClass.C.withPtr
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             &&&> GdkModifierType.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && GdkModifierType.C.fromVal
                   && GdkWindowClass.C.fromPtr false
          )
            getDevicePosition_
            (
              self
               & device
               & FFI.Int.null
               & FFI.Int.null
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
    fun getFrameExtents self rect = (GdkWindowClass.C.withPtr &&&> GdkRectangleRecord.C.withPtr ---> I) getFrameExtents_ (self & rect)
    fun getGeometry self =
      let
        val x
         & y
         & width
         & height
         & () =
          (
            GdkWindowClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getGeometry_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
               & FFI.Int.null
               & FFI.Int.null
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
    fun getHeight self = (GdkWindowClass.C.withPtr ---> FFI.Int.C.fromVal) getHeight_ self
    fun getModalHint self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) getModalHint_ self
    fun getOrigin self =
      let
        val x
         & y
         & retVal =
          (
            GdkWindowClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
          )
            getOrigin_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
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
        (x, y)
      end
    fun getRootCoords self x y =
      let
        val rootX
         & rootY
         & () =
          (
            GdkWindowClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getRootCoords_
            (
              self
               & x
               & y
               & FFI.Int.null
               & FFI.Int.null
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
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getRootOrigin_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
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
    fun getWidth self = (GdkWindowClass.C.withPtr ---> FFI.Int.C.fromVal) getWidth_ self
    fun getWindowType self = (GdkWindowClass.C.withPtr ---> GdkWindowType.C.fromVal) getWindowType_ self
    fun hasNative self = (GdkWindowClass.C.withPtr ---> FFI.Bool.C.fromVal) hasNative_ self
    fun hide self = (GdkWindowClass.C.withPtr ---> I) hide_ self
    fun iconify self = (GdkWindowClass.C.withPtr ---> I) iconify_ self
    fun inputShapeCombineRegion self shapeRegion offsetX offsetY =
      (
        GdkWindowClass.C.withPtr
         &&&> CairoRegionRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> GdkRectangleRecord.C.withOptPtr
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
    fun moveRegion self region dx dy =
      (
        GdkWindowClass.C.withPtr
         &&&> CairoRegionRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
