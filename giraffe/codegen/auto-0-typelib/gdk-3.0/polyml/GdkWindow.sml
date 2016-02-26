structure GdkWindow :>
  GDK_WINDOW
    where type 'a class_t = 'a GdkWindowClass.t
    where type window_attr_record_t = GdkWindowAttrRecord.t
    where type window_edge_t = GdkWindowEdge.t
    where type modifier_type_t = GdkModifierType.t
    where type 'a display_class_t = 'a GdkDisplayClass.t
    where type drag_protocol_t = GdkDragProtocol.t
    where type 'a screen_class_t = 'a GdkScreenClass.t
    where type window_state_t = GdkWindowState.t
    where type 'a visual_class_t = 'a GdkVisualClass.t
    where type window_type_t = GdkWindowType.t
    where type color_record_t = GdkColorRecord.t
    where type rgba_record_t = GdkRgbaRecord.t
    where type w_m_decoration_t = GdkWMDecoration.t
    where type 'a device_class_t = 'a GdkDeviceClass.t
    where type w_m_function_t = GdkWMFunction.t
    where type window_hints_t = GdkWindowHints.t
    where type geometry_record_t = GdkGeometryRecord.t
    where type event_mask_t = GdkEventMask.t
    where type input_source_t = GdkInputSource.t
    where type window_type_hint_t = GdkWindowTypeHint.t
    where type 'a cursor_class_t = 'a GdkCursorClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_window_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgdk "gdk_window_new")
          (
            GObjectObjectClass.PolyML.cOptPtr
             &&> GdkWindowAttrRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val constrainSize_ =
        call (load_sym libgdk "gdk_window_constrain_size")
          (
            GdkGeometryRecord.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val processAllUpdates_ = call (load_sym libgdk "gdk_window_process_all_updates") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val setDebugUpdates_ = call (load_sym libgdk "gdk_window_set_debug_updates") (FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val beep_ = call (load_sym libgdk "gdk_window_beep") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val beginMoveDrag_ =
        call (load_sym libgdk "gdk_window_begin_move_drag")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val beginPaintRect_ = call (load_sym libgdk "gdk_window_begin_paint_rect") (GObjectObjectClass.PolyML.cPtr &&> CairoRectangleIntRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val beginPaintRegion_ = call (load_sym libgdk "gdk_window_begin_paint_region") (GObjectObjectClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val beginResizeDrag_ =
        call (load_sym libgdk "gdk_window_begin_resize_drag")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GdkWindowEdge.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val configureFinished_ = call (load_sym libgdk "gdk_window_configure_finished") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val coordsFromParent_ =
        call (load_sym libgdk "gdk_window_coords_from_parent")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val coordsToParent_ =
        call (load_sym libgdk "gdk_window_coords_to_parent")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val createSimilarSurface_ =
        call (load_sym libgdk "gdk_window_create_similar_surface")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> CairoContent.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> CairoSurfaceRecord.PolyML.cPtr
          )
      val deiconify_ = call (load_sym libgdk "gdk_window_deiconify") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val destroy_ = call (load_sym libgdk "gdk_window_destroy") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val destroyNotify_ = call (load_sym libgdk "gdk_window_destroy_notify") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val enableSynchronizedConfigure_ = call (load_sym libgdk "gdk_window_enable_synchronized_configure") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val endPaint_ = call (load_sym libgdk "gdk_window_end_paint") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val ensureNative_ = call (load_sym libgdk "gdk_window_ensure_native") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val flush_ = call (load_sym libgdk "gdk_window_flush") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val focus_ = call (load_sym libgdk "gdk_window_focus") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val freezeToplevelUpdatesLibgtkOnly_ = call (load_sym libgdk "gdk_window_freeze_toplevel_updates_libgtk_only") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val freezeUpdates_ = call (load_sym libgdk "gdk_window_freeze_updates") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val fullscreen_ = call (load_sym libgdk "gdk_window_fullscreen") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val geometryChanged_ = call (load_sym libgdk "gdk_window_geometry_changed") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getAcceptFocus_ = call (load_sym libgdk "gdk_window_get_accept_focus") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getBackgroundPattern_ = call (load_sym libgdk "gdk_window_get_background_pattern") (GObjectObjectClass.PolyML.cPtr --> CairoPatternRecord.PolyML.cPtr)
      val getClipRegion_ = call (load_sym libgdk "gdk_window_get_clip_region") (GObjectObjectClass.PolyML.cPtr --> CairoRegionRecord.PolyML.cPtr)
      val getComposited_ = call (load_sym libgdk "gdk_window_get_composited") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCursor_ = call (load_sym libgdk "gdk_window_get_cursor") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDecorations_ = call (load_sym libgdk "gdk_window_get_decorations") (GObjectObjectClass.PolyML.cPtr &&> GdkWMDecoration.PolyML.cRef --> FFI.Bool.PolyML.cVal)
      val getDeviceCursor_ = call (load_sym libgdk "gdk_window_get_device_cursor") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDeviceEvents_ = call (load_sym libgdk "gdk_window_get_device_events") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GdkEventMask.PolyML.cVal)
      val getDevicePosition_ =
        call (load_sym libgdk "gdk_window_get_device_position")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getDisplay_ = call (load_sym libgdk "gdk_window_get_display") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDragProtocol_ = call (load_sym libgdk "gdk_window_get_drag_protocol") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOutRef --> GdkDragProtocol.PolyML.cVal)
      val getEffectiveParent_ = call (load_sym libgdk "gdk_window_get_effective_parent") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getEffectiveToplevel_ = call (load_sym libgdk "gdk_window_get_effective_toplevel") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getEvents_ = call (load_sym libgdk "gdk_window_get_events") (GObjectObjectClass.PolyML.cPtr --> GdkEventMask.PolyML.cVal)
      val getFocusOnMap_ = call (load_sym libgdk "gdk_window_get_focus_on_map") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFrameExtents_ = call (load_sym libgdk "gdk_window_get_frame_extents") (GObjectObjectClass.PolyML.cPtr &&> CairoRectangleIntRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getGeometry_ =
        call (load_sym libgdk "gdk_window_get_geometry")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getGroup_ = call (load_sym libgdk "gdk_window_get_group") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getHeight_ = call (load_sym libgdk "gdk_window_get_height") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getModalHint_ = call (load_sym libgdk "gdk_window_get_modal_hint") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getOrigin_ =
        call (load_sym libgdk "gdk_window_get_origin")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.Int32.PolyML.cVal
          )
      val getParent_ = call (load_sym libgdk "gdk_window_get_parent") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getPosition_ =
        call (load_sym libgdk "gdk_window_get_position")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getRootCoords_ =
        call (load_sym libgdk "gdk_window_get_root_coords")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getRootOrigin_ =
        call (load_sym libgdk "gdk_window_get_root_origin")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getScreen_ = call (load_sym libgdk "gdk_window_get_screen") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSourceEvents_ = call (load_sym libgdk "gdk_window_get_source_events") (GObjectObjectClass.PolyML.cPtr &&> GdkInputSource.PolyML.cVal --> GdkEventMask.PolyML.cVal)
      val getState_ = call (load_sym libgdk "gdk_window_get_state") (GObjectObjectClass.PolyML.cPtr --> GdkWindowState.PolyML.cVal)
      val getSupportMultidevice_ = call (load_sym libgdk "gdk_window_get_support_multidevice") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getToplevel_ = call (load_sym libgdk "gdk_window_get_toplevel") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getTypeHint_ = call (load_sym libgdk "gdk_window_get_type_hint") (GObjectObjectClass.PolyML.cPtr --> GdkWindowTypeHint.PolyML.cVal)
      val getUpdateArea_ = call (load_sym libgdk "gdk_window_get_update_area") (GObjectObjectClass.PolyML.cPtr --> CairoRegionRecord.PolyML.cPtr)
      val getVisibleRegion_ = call (load_sym libgdk "gdk_window_get_visible_region") (GObjectObjectClass.PolyML.cPtr --> CairoRegionRecord.PolyML.cPtr)
      val getVisual_ = call (load_sym libgdk "gdk_window_get_visual") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getWidth_ = call (load_sym libgdk "gdk_window_get_width") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getWindowType_ = call (load_sym libgdk "gdk_window_get_window_type") (GObjectObjectClass.PolyML.cPtr --> GdkWindowType.PolyML.cVal)
      val hasNative_ = call (load_sym libgdk "gdk_window_has_native") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hide_ = call (load_sym libgdk "gdk_window_hide") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val iconify_ = call (load_sym libgdk "gdk_window_iconify") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val inputShapeCombineRegion_ =
        call (load_sym libgdk "gdk_window_input_shape_combine_region")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> CairoRegionRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val invalidateRect_ =
        call (load_sym libgdk "gdk_window_invalidate_rect")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> CairoRectangleIntRecord.PolyML.cOptPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val invalidateRegion_ =
        call (load_sym libgdk "gdk_window_invalidate_region")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> CairoRegionRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val isDestroyed_ = call (load_sym libgdk "gdk_window_is_destroyed") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isInputOnly_ = call (load_sym libgdk "gdk_window_is_input_only") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isShaped_ = call (load_sym libgdk "gdk_window_is_shaped") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isViewable_ = call (load_sym libgdk "gdk_window_is_viewable") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isVisible_ = call (load_sym libgdk "gdk_window_is_visible") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val lower_ = call (load_sym libgdk "gdk_window_lower") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val maximize_ = call (load_sym libgdk "gdk_window_maximize") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val mergeChildInputShapes_ = call (load_sym libgdk "gdk_window_merge_child_input_shapes") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val mergeChildShapes_ = call (load_sym libgdk "gdk_window_merge_child_shapes") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val move_ =
        call (load_sym libgdk "gdk_window_move")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val moveRegion_ =
        call (load_sym libgdk "gdk_window_move_region")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> CairoRegionRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val moveResize_ =
        call (load_sym libgdk "gdk_window_move_resize")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val processUpdates_ = call (load_sym libgdk "gdk_window_process_updates") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val raise_ = call (load_sym libgdk "gdk_window_raise") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val registerDnd_ = call (load_sym libgdk "gdk_window_register_dnd") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val reparent_ =
        call (load_sym libgdk "gdk_window_reparent")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val resize_ =
        call (load_sym libgdk "gdk_window_resize")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val restack_ =
        call (load_sym libgdk "gdk_window_restack")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val scroll_ =
        call (load_sym libgdk "gdk_window_scroll")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setAcceptFocus_ = call (load_sym libgdk "gdk_window_set_accept_focus") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBackground_ = call (load_sym libgdk "gdk_window_set_background") (GObjectObjectClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setBackgroundPattern_ = call (load_sym libgdk "gdk_window_set_background_pattern") (GObjectObjectClass.PolyML.cPtr &&> CairoPatternRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setBackgroundRgba_ = call (load_sym libgdk "gdk_window_set_background_rgba") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setChildInputShapes_ = call (load_sym libgdk "gdk_window_set_child_input_shapes") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setChildShapes_ = call (load_sym libgdk "gdk_window_set_child_shapes") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setComposited_ = call (load_sym libgdk "gdk_window_set_composited") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCursor_ = call (load_sym libgdk "gdk_window_set_cursor") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setDecorations_ = call (load_sym libgdk "gdk_window_set_decorations") (GObjectObjectClass.PolyML.cPtr &&> GdkWMDecoration.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDeviceCursor_ =
        call (load_sym libgdk "gdk_window_set_device_cursor")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val setDeviceEvents_ =
        call (load_sym libgdk "gdk_window_set_device_events")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GdkEventMask.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setEvents_ = call (load_sym libgdk "gdk_window_set_events") (GObjectObjectClass.PolyML.cPtr &&> GdkEventMask.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFocusOnMap_ = call (load_sym libgdk "gdk_window_set_focus_on_map") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFunctions_ = call (load_sym libgdk "gdk_window_set_functions") (GObjectObjectClass.PolyML.cPtr &&> GdkWMFunction.PolyML.cVal --> FFI.PolyML.cVoid)
      val setGeometryHints_ =
        call (load_sym libgdk "gdk_window_set_geometry_hints")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GdkGeometryRecord.PolyML.cPtr
             &&> GdkWindowHints.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setGroup_ = call (load_sym libgdk "gdk_window_set_group") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setIconName_ = call (load_sym libgdk "gdk_window_set_icon_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setKeepAbove_ = call (load_sym libgdk "gdk_window_set_keep_above") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setKeepBelow_ = call (load_sym libgdk "gdk_window_set_keep_below") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setModalHint_ = call (load_sym libgdk "gdk_window_set_modal_hint") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOpacity_ = call (load_sym libgdk "gdk_window_set_opacity") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOverrideRedirect_ = call (load_sym libgdk "gdk_window_set_override_redirect") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setRole_ = call (load_sym libgdk "gdk_window_set_role") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setSkipPagerHint_ = call (load_sym libgdk "gdk_window_set_skip_pager_hint") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSkipTaskbarHint_ = call (load_sym libgdk "gdk_window_set_skip_taskbar_hint") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSourceEvents_ =
        call (load_sym libgdk "gdk_window_set_source_events")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GdkInputSource.PolyML.cVal
             &&> GdkEventMask.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setStartupId_ = call (load_sym libgdk "gdk_window_set_startup_id") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setStaticGravities_ = call (load_sym libgdk "gdk_window_set_static_gravities") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val setSupportMultidevice_ = call (load_sym libgdk "gdk_window_set_support_multidevice") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTitle_ = call (load_sym libgdk "gdk_window_set_title") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setTransientFor_ = call (load_sym libgdk "gdk_window_set_transient_for") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setTypeHint_ = call (load_sym libgdk "gdk_window_set_type_hint") (GObjectObjectClass.PolyML.cPtr &&> GdkWindowTypeHint.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUrgencyHint_ = call (load_sym libgdk "gdk_window_set_urgency_hint") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUserData_ = call (load_sym libgdk "gdk_window_set_user_data") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val shapeCombineRegion_ =
        call (load_sym libgdk "gdk_window_shape_combine_region")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> CairoRegionRecord.PolyML.cOptPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val show_ = call (load_sym libgdk "gdk_window_show") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val showUnraised_ = call (load_sym libgdk "gdk_window_show_unraised") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val stick_ = call (load_sym libgdk "gdk_window_stick") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val thawToplevelUpdatesLibgtkOnly_ = call (load_sym libgdk "gdk_window_thaw_toplevel_updates_libgtk_only") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val thawUpdates_ = call (load_sym libgdk "gdk_window_thaw_updates") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unfullscreen_ = call (load_sym libgdk "gdk_window_unfullscreen") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unmaximize_ = call (load_sym libgdk "gdk_window_unmaximize") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unstick_ = call (load_sym libgdk "gdk_window_unstick") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val withdraw_ = call (load_sym libgdk "gdk_window_withdraw") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GdkWindowClass.t
    type window_attr_record_t = GdkWindowAttrRecord.t
    type window_edge_t = GdkWindowEdge.t
    type modifier_type_t = GdkModifierType.t
    type 'a display_class_t = 'a GdkDisplayClass.t
    type drag_protocol_t = GdkDragProtocol.t
    type 'a screen_class_t = 'a GdkScreenClass.t
    type window_state_t = GdkWindowState.t
    type 'a visual_class_t = 'a GdkVisualClass.t
    type window_type_t = GdkWindowType.t
    type color_record_t = GdkColorRecord.t
    type rgba_record_t = GdkRgbaRecord.t
    type w_m_decoration_t = GdkWMDecoration.t
    type 'a device_class_t = 'a GdkDeviceClass.t
    type w_m_function_t = GdkWMFunction.t
    type window_hints_t = GdkWindowHints.t
    type geometry_record_t = GdkGeometryRecord.t
    type event_mask_t = GdkEventMask.t
    type input_source_t = GdkInputSource.t
    type window_type_hint_t = GdkWindowTypeHint.t
    type 'a cursor_class_t = 'a GdkCursorClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new parent attributes attributesMask =
      (
        GObjectObjectClass.C.withOptPtr
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
    fun beep self = (GObjectObjectClass.C.withPtr ---> I) beep_ self
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
    fun beginPaintRect self rectangle = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withPtr ---> I) beginPaintRect_ (self & rectangle)
    fun beginPaintRegion self region = (GObjectObjectClass.C.withPtr &&&> CairoRegionRecord.C.withPtr ---> I) beginPaintRegion_ (self & region)
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
    fun configureFinished self = (GObjectObjectClass.C.withPtr ---> I) configureFinished_ self
    fun coordsFromParent self parentX parentY =
      let
        val x
         & y
         & () =
          (
            GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun deiconify self = (GObjectObjectClass.C.withPtr ---> I) deiconify_ self
    fun destroy self = (GObjectObjectClass.C.withPtr ---> I) destroy_ self
    fun destroyNotify self = (GObjectObjectClass.C.withPtr ---> I) destroyNotify_ self
    fun enableSynchronizedConfigure self = (GObjectObjectClass.C.withPtr ---> I) enableSynchronizedConfigure_ self
    fun endPaint self = (GObjectObjectClass.C.withPtr ---> I) endPaint_ self
    fun ensureNative self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) ensureNative_ self
    fun flush self = (GObjectObjectClass.C.withPtr ---> I) flush_ self
    fun focus self timestamp = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) focus_ (self & timestamp)
    fun freezeToplevelUpdatesLibgtkOnly self = (GObjectObjectClass.C.withPtr ---> I) freezeToplevelUpdatesLibgtkOnly_ self
    fun freezeUpdates self = (GObjectObjectClass.C.withPtr ---> I) freezeUpdates_ self
    fun fullscreen self = (GObjectObjectClass.C.withPtr ---> I) fullscreen_ self
    fun geometryChanged self = (GObjectObjectClass.C.withPtr ---> I) geometryChanged_ self
    fun getAcceptFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAcceptFocus_ self
    fun getBackgroundPattern self = (GObjectObjectClass.C.withPtr ---> CairoPatternRecord.C.fromPtr false) getBackgroundPattern_ self
    fun getClipRegion self = (GObjectObjectClass.C.withPtr ---> CairoRegionRecord.C.fromPtr true) getClipRegion_ self
    fun getComposited self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getComposited_ self
    fun getCursor self = (GObjectObjectClass.C.withPtr ---> GdkCursorClass.C.fromPtr false) getCursor_ self
    fun getDecorations self =
      let
        val decorations & retVal = (GObjectObjectClass.C.withPtr &&&> GdkWMDecoration.C.withRefVal ---> GdkWMDecoration.C.fromVal && FFI.Bool.C.fromVal) getDecorations_ (self & GdkWMDecoration.flags [])
      in
        if retVal then SOME decorations else NONE
      end
    fun getDeviceCursor self device = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GdkCursorClass.C.fromPtr false) getDeviceCursor_ (self & device)
    fun getDeviceEvents self device = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GdkEventMask.C.fromVal) getDeviceEvents_ (self & device)
    fun getDevicePosition self device =
      let
        val x
         & y
         & mask
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
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
    fun getDisplay self = (GObjectObjectClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getDragProtocol self =
      let
        val target & retVal = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withRefOptPtr ---> GdkWindowClass.C.fromPtr true && GdkDragProtocol.C.fromVal) getDragProtocol_ (self & NONE)
      in
        (retVal, target)
      end
    fun getEffectiveParent self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getEffectiveParent_ self
    fun getEffectiveToplevel self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getEffectiveToplevel_ self
    fun getEvents self = (GObjectObjectClass.C.withPtr ---> GdkEventMask.C.fromVal) getEvents_ self
    fun getFocusOnMap self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusOnMap_ self
    fun getFrameExtents self rect = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withPtr ---> I) getFrameExtents_ (self & rect)
    fun getGeometry self =
      let
        val x
         & y
         & width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
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
    fun getGroup self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getGroup_ self
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getHeight_ self
    fun getModalHint self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getModalHint_ self
    fun getOrigin self =
      let
        val x
         & y
         & retVal =
          (
            GObjectObjectClass.C.withPtr
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
    fun getParent self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getParent_ self
    fun getPosition self =
      let
        val x
         & y
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
        (x, y)
      end
    fun getRootCoords self x y =
      let
        val rootX
         & rootY
         & () =
          (
            GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
    fun getScreen self = (GObjectObjectClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getSourceEvents self source = (GObjectObjectClass.C.withPtr &&&> GdkInputSource.C.withVal ---> GdkEventMask.C.fromVal) getSourceEvents_ (self & source)
    fun getState self = (GObjectObjectClass.C.withPtr ---> GdkWindowState.C.fromVal) getState_ self
    fun getSupportMultidevice self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSupportMultidevice_ self
    fun getToplevel self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getToplevel_ self
    fun getTypeHint self = (GObjectObjectClass.C.withPtr ---> GdkWindowTypeHint.C.fromVal) getTypeHint_ self
    fun getUpdateArea self = (GObjectObjectClass.C.withPtr ---> CairoRegionRecord.C.fromPtr true) getUpdateArea_ self
    fun getVisibleRegion self = (GObjectObjectClass.C.withPtr ---> CairoRegionRecord.C.fromPtr true) getVisibleRegion_ self
    fun getVisual self = (GObjectObjectClass.C.withPtr ---> GdkVisualClass.C.fromPtr false) getVisual_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getWidth_ self
    fun getWindowType self = (GObjectObjectClass.C.withPtr ---> GdkWindowType.C.fromVal) getWindowType_ self
    fun hasNative self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasNative_ self
    fun hide self = (GObjectObjectClass.C.withPtr ---> I) hide_ self
    fun iconify self = (GObjectObjectClass.C.withPtr ---> I) iconify_ self
    fun inputShapeCombineRegion self shapeRegion offsetX offsetY =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun isDestroyed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isDestroyed_ self
    fun isInputOnly self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isInputOnly_ self
    fun isShaped self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isShaped_ self
    fun isViewable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isViewable_ self
    fun isVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isVisible_ self
    fun lower self = (GObjectObjectClass.C.withPtr ---> I) lower_ self
    fun maximize self = (GObjectObjectClass.C.withPtr ---> I) maximize_ self
    fun mergeChildInputShapes self = (GObjectObjectClass.C.withPtr ---> I) mergeChildInputShapes_ self
    fun mergeChildShapes self = (GObjectObjectClass.C.withPtr ---> I) mergeChildShapes_ self
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
    fun moveRegion self region dx dy =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun processUpdates self updateChildren = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) processUpdates_ (self & updateChildren)
    fun raise' self = (GObjectObjectClass.C.withPtr ---> I) raise_ self
    fun registerDnd self = (GObjectObjectClass.C.withPtr ---> I) registerDnd_ self
    fun reparent self newParent x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun restack self sibling above =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
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
    fun setAcceptFocus self acceptFocus = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAcceptFocus_ (self & acceptFocus)
    fun setBackground self color = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setBackground_ (self & color)
    fun setBackgroundPattern self pattern = (GObjectObjectClass.C.withPtr &&&> CairoPatternRecord.C.withOptPtr ---> I) setBackgroundPattern_ (self & pattern)
    fun setBackgroundRgba self rgba = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setBackgroundRgba_ (self & rgba)
    fun setChildInputShapes self = (GObjectObjectClass.C.withPtr ---> I) setChildInputShapes_ self
    fun setChildShapes self = (GObjectObjectClass.C.withPtr ---> I) setChildShapes_ self
    fun setComposited self composited = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setComposited_ (self & composited)
    fun setCursor self cursor = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setCursor_ (self & cursor)
    fun setDecorations self decorations = (GObjectObjectClass.C.withPtr &&&> GdkWMDecoration.C.withVal ---> I) setDecorations_ (self & decorations)
    fun setDeviceCursor self device cursor =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GdkEventMask.C.withVal
         ---> I
      )
        setDeviceEvents_
        (
          self
           & device
           & eventMask
        )
    fun setEvents self eventMask = (GObjectObjectClass.C.withPtr &&&> GdkEventMask.C.withVal ---> I) setEvents_ (self & eventMask)
    fun setFocusOnMap self focusOnMap = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusOnMap_ (self & focusOnMap)
    fun setFunctions self functions = (GObjectObjectClass.C.withPtr &&&> GdkWMFunction.C.withVal ---> I) setFunctions_ (self & functions)
    fun setGeometryHints self geometry geomMask =
      (
        GObjectObjectClass.C.withPtr
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
    fun setGroup self leader = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setGroup_ (self & leader)
    fun setIconName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepBelow_ (self & setting)
    fun setModalHint self modal = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setModalHint_ (self & modal)
    fun setOpacity self opacity = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setOpacity_ (self & opacity)
    fun setOverrideRedirect self overrideRedirect = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setOverrideRedirect_ (self & overrideRedirect)
    fun setRole self role = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setRole_ (self & role)
    fun setSkipPagerHint self skipsPager = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSkipPagerHint_ (self & skipsPager)
    fun setSkipTaskbarHint self skipsTaskbar = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSkipTaskbarHint_ (self & skipsTaskbar)
    fun setSourceEvents self source eventMask =
      (
        GObjectObjectClass.C.withPtr
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
    fun setStartupId self startupId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setStartupId_ (self & startupId)
    fun setStaticGravities self useStatic = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> FFI.Bool.C.fromVal) setStaticGravities_ (self & useStatic)
    fun setSupportMultidevice self supportMultidevice = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSupportMultidevice_ (self & supportMultidevice)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setTransientFor_ (self & parent)
    fun setTypeHint self hint = (GObjectObjectClass.C.withPtr &&&> GdkWindowTypeHint.C.withVal ---> I) setTypeHint_ (self & hint)
    fun setUrgencyHint self urgent = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUrgencyHint_ (self & urgent)
    fun setUserData self userData = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setUserData_ (self & userData)
    fun shapeCombineRegion self shapeRegion offsetX offsetY =
      (
        GObjectObjectClass.C.withPtr
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
    fun show self = (GObjectObjectClass.C.withPtr ---> I) show_ self
    fun showUnraised self = (GObjectObjectClass.C.withPtr ---> I) showUnraised_ self
    fun stick self = (GObjectObjectClass.C.withPtr ---> I) stick_ self
    fun thawToplevelUpdatesLibgtkOnly self = (GObjectObjectClass.C.withPtr ---> I) thawToplevelUpdatesLibgtkOnly_ self
    fun thawUpdates self = (GObjectObjectClass.C.withPtr ---> I) thawUpdates_ self
    fun unfullscreen self = (GObjectObjectClass.C.withPtr ---> I) unfullscreen_ self
    fun unmaximize self = (GObjectObjectClass.C.withPtr ---> I) unmaximize_ self
    fun unstick self = (GObjectObjectClass.C.withPtr ---> I) unstick_ self
    fun withdraw self = (GObjectObjectClass.C.withPtr ---> I) withdraw_ self
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
