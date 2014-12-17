structure GdkWindow :>
  GDK_WINDOW
    where type 'a class_t = 'a GdkWindowClass.t
    where type windowattrrecord_t = GdkWindowAttrRecord.t
    where type windowedge_t = GdkWindowEdge.t
    where type modifiertype_t = GdkModifierType.t
    where type 'a displayclass_t = 'a GdkDisplayClass.t
    where type dragprotocol_t = GdkDragProtocol.t
    where type 'a screenclass_t = 'a GdkScreenClass.t
    where type windowstate_t = GdkWindowState.t
    where type 'a visualclass_t = 'a GdkVisualClass.t
    where type windowtype_t = GdkWindowType.t
    where type colorrecord_t = GdkColorRecord.t
    where type rgbarecord_t = GdkRgbaRecord.t
    where type wmdecoration_t = GdkWMDecoration.t
    where type 'a deviceclass_t = 'a GdkDeviceClass.t
    where type wmfunction_t = GdkWMFunction.t
    where type windowhints_t = GdkWindowHints.t
    where type geometryrecord_t = GdkGeometryRecord.t
    where type eventmask_t = GdkEventMask.t
    where type inputsource_t = GdkInputSource.t
    where type windowtypehint_t = GdkWindowTypeHint.t
    where type 'a cursorclass_t = 'a GdkCursorClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_window_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgdk "gdk_window_new")
          (
            GObjectObjectClass.PolyML.OPTPTR
             &&> GdkWindowAttrRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val constrainSize_ =
        call (load_sym libgdk "gdk_window_constrain_size")
          (
            GdkGeometryRecord.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val processAllUpdates_ = call (load_sym libgdk "gdk_window_process_all_updates") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val setDebugUpdates_ = call (load_sym libgdk "gdk_window_set_debug_updates") (FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val beep_ = call (load_sym libgdk "gdk_window_beep") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val beginMoveDrag_ =
        call (load_sym libgdk "gdk_window_begin_move_drag")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val beginPaintRect_ = call (load_sym libgdk "gdk_window_begin_paint_rect") (GObjectObjectClass.PolyML.PTR &&> CairoRectangleIntRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val beginPaintRegion_ = call (load_sym libgdk "gdk_window_begin_paint_region") (GObjectObjectClass.PolyML.PTR &&> CairoRegionRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val beginResizeDrag_ =
        call (load_sym libgdk "gdk_window_begin_resize_drag")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkWindowEdge.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val configureFinished_ = call (load_sym libgdk "gdk_window_configure_finished") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val coordsFromParent_ =
        call (load_sym libgdk "gdk_window_coords_from_parent")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.REF
             &&> FFI.Double.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val coordsToParent_ =
        call (load_sym libgdk "gdk_window_coords_to_parent")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.REF
             &&> FFI.Double.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val createSimilarSurface_ =
        call (load_sym libgdk "gdk_window_create_similar_surface")
          (
            GObjectObjectClass.PolyML.PTR
             &&> CairoContent.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> CairoSurfaceRecord.PolyML.PTR
          )
      val deiconify_ = call (load_sym libgdk "gdk_window_deiconify") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val destroy_ = call (load_sym libgdk "gdk_window_destroy") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val destroyNotify_ = call (load_sym libgdk "gdk_window_destroy_notify") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val enableSynchronizedConfigure_ = call (load_sym libgdk "gdk_window_enable_synchronized_configure") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val endPaint_ = call (load_sym libgdk "gdk_window_end_paint") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val ensureNative_ = call (load_sym libgdk "gdk_window_ensure_native") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val flush_ = call (load_sym libgdk "gdk_window_flush") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val focus_ = call (load_sym libgdk "gdk_window_focus") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val freezeToplevelUpdatesLibgtkOnly_ = call (load_sym libgdk "gdk_window_freeze_toplevel_updates_libgtk_only") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val freezeUpdates_ = call (load_sym libgdk "gdk_window_freeze_updates") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val fullscreen_ = call (load_sym libgdk "gdk_window_fullscreen") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val geometryChanged_ = call (load_sym libgdk "gdk_window_geometry_changed") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getAcceptFocus_ = call (load_sym libgdk "gdk_window_get_accept_focus") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getBackgroundPattern_ = call (load_sym libgdk "gdk_window_get_background_pattern") (GObjectObjectClass.PolyML.PTR --> CairoPatternRecord.PolyML.PTR)
      val getClipRegion_ = call (load_sym libgdk "gdk_window_get_clip_region") (GObjectObjectClass.PolyML.PTR --> CairoRegionRecord.PolyML.PTR)
      val getComposited_ = call (load_sym libgdk "gdk_window_get_composited") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getCursor_ = call (load_sym libgdk "gdk_window_get_cursor") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDecorations_ = call (load_sym libgdk "gdk_window_get_decorations") (GObjectObjectClass.PolyML.PTR &&> GdkWMDecoration.PolyML.REF --> FFI.Bool.PolyML.VAL)
      val getDeviceCursor_ = call (load_sym libgdk "gdk_window_get_device_cursor") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDeviceEvents_ = call (load_sym libgdk "gdk_window_get_device_events") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GdkEventMask.PolyML.VAL)
      val getDevicePosition_ =
        call (load_sym libgdk "gdk_window_get_device_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             &&> GdkModifierType.PolyML.REF
             --> GObjectObjectClass.PolyML.PTR
          )
      val getDisplay_ = call (load_sym libgdk "gdk_window_get_display") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDragProtocol_ = call (load_sym libgdk "gdk_window_get_drag_protocol") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OUTREF --> GdkDragProtocol.PolyML.VAL)
      val getEffectiveParent_ = call (load_sym libgdk "gdk_window_get_effective_parent") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getEffectiveToplevel_ = call (load_sym libgdk "gdk_window_get_effective_toplevel") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getEvents_ = call (load_sym libgdk "gdk_window_get_events") (GObjectObjectClass.PolyML.PTR --> GdkEventMask.PolyML.VAL)
      val getFocusOnMap_ = call (load_sym libgdk "gdk_window_get_focus_on_map") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getFrameExtents_ = call (load_sym libgdk "gdk_window_get_frame_extents") (GObjectObjectClass.PolyML.PTR &&> CairoRectangleIntRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getGeometry_ =
        call (load_sym libgdk "gdk_window_get_geometry")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getGroup_ = call (load_sym libgdk "gdk_window_get_group") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getHeight_ = call (load_sym libgdk "gdk_window_get_height") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getModalHint_ = call (load_sym libgdk "gdk_window_get_modal_hint") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getOrigin_ =
        call (load_sym libgdk "gdk_window_get_origin")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.Int32.PolyML.VAL
          )
      val getParent_ = call (load_sym libgdk "gdk_window_get_parent") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getPosition_ =
        call (load_sym libgdk "gdk_window_get_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getRootCoords_ =
        call (load_sym libgdk "gdk_window_get_root_coords")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getRootOrigin_ =
        call (load_sym libgdk "gdk_window_get_root_origin")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getScreen_ = call (load_sym libgdk "gdk_window_get_screen") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getSourceEvents_ = call (load_sym libgdk "gdk_window_get_source_events") (GObjectObjectClass.PolyML.PTR &&> GdkInputSource.PolyML.VAL --> GdkEventMask.PolyML.VAL)
      val getState_ = call (load_sym libgdk "gdk_window_get_state") (GObjectObjectClass.PolyML.PTR --> GdkWindowState.PolyML.VAL)
      val getSupportMultidevice_ = call (load_sym libgdk "gdk_window_get_support_multidevice") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getToplevel_ = call (load_sym libgdk "gdk_window_get_toplevel") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getTypeHint_ = call (load_sym libgdk "gdk_window_get_type_hint") (GObjectObjectClass.PolyML.PTR --> GdkWindowTypeHint.PolyML.VAL)
      val getUpdateArea_ = call (load_sym libgdk "gdk_window_get_update_area") (GObjectObjectClass.PolyML.PTR --> CairoRegionRecord.PolyML.PTR)
      val getVisibleRegion_ = call (load_sym libgdk "gdk_window_get_visible_region") (GObjectObjectClass.PolyML.PTR --> CairoRegionRecord.PolyML.PTR)
      val getVisual_ = call (load_sym libgdk "gdk_window_get_visual") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getWidth_ = call (load_sym libgdk "gdk_window_get_width") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getWindowType_ = call (load_sym libgdk "gdk_window_get_window_type") (GObjectObjectClass.PolyML.PTR --> GdkWindowType.PolyML.VAL)
      val hasNative_ = call (load_sym libgdk "gdk_window_has_native") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val hide_ = call (load_sym libgdk "gdk_window_hide") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val iconify_ = call (load_sym libgdk "gdk_window_iconify") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val inputShapeCombineRegion_ =
        call (load_sym libgdk "gdk_window_input_shape_combine_region")
          (
            GObjectObjectClass.PolyML.PTR
             &&> CairoRegionRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val invalidateRect_ =
        call (load_sym libgdk "gdk_window_invalidate_rect")
          (
            GObjectObjectClass.PolyML.PTR
             &&> CairoRectangleIntRecord.PolyML.OPTPTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val invalidateRegion_ =
        call (load_sym libgdk "gdk_window_invalidate_region")
          (
            GObjectObjectClass.PolyML.PTR
             &&> CairoRegionRecord.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val isDestroyed_ = call (load_sym libgdk "gdk_window_is_destroyed") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isInputOnly_ = call (load_sym libgdk "gdk_window_is_input_only") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isShaped_ = call (load_sym libgdk "gdk_window_is_shaped") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isViewable_ = call (load_sym libgdk "gdk_window_is_viewable") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isVisible_ = call (load_sym libgdk "gdk_window_is_visible") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val lower_ = call (load_sym libgdk "gdk_window_lower") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val maximize_ = call (load_sym libgdk "gdk_window_maximize") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val mergeChildInputShapes_ = call (load_sym libgdk "gdk_window_merge_child_input_shapes") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val mergeChildShapes_ = call (load_sym libgdk "gdk_window_merge_child_shapes") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val move_ =
        call (load_sym libgdk "gdk_window_move")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val moveRegion_ =
        call (load_sym libgdk "gdk_window_move_region")
          (
            GObjectObjectClass.PolyML.PTR
             &&> CairoRegionRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val moveResize_ =
        call (load_sym libgdk "gdk_window_move_resize")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val processUpdates_ = call (load_sym libgdk "gdk_window_process_updates") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val raise_ = call (load_sym libgdk "gdk_window_raise") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val registerDnd_ = call (load_sym libgdk "gdk_window_register_dnd") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val reparent_ =
        call (load_sym libgdk "gdk_window_reparent")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val resize_ =
        call (load_sym libgdk "gdk_window_resize")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val restack_ =
        call (load_sym libgdk "gdk_window_restack")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val scroll_ =
        call (load_sym libgdk "gdk_window_scroll")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setAcceptFocus_ = call (load_sym libgdk "gdk_window_set_accept_focus") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setBackground_ = call (load_sym libgdk "gdk_window_set_background") (GObjectObjectClass.PolyML.PTR &&> GdkColorRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setBackgroundPattern_ = call (load_sym libgdk "gdk_window_set_background_pattern") (GObjectObjectClass.PolyML.PTR &&> CairoPatternRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setBackgroundRgba_ = call (load_sym libgdk "gdk_window_set_background_rgba") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setChildInputShapes_ = call (load_sym libgdk "gdk_window_set_child_input_shapes") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setChildShapes_ = call (load_sym libgdk "gdk_window_set_child_shapes") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setComposited_ = call (load_sym libgdk "gdk_window_set_composited") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setCursor_ = call (load_sym libgdk "gdk_window_set_cursor") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setDecorations_ = call (load_sym libgdk "gdk_window_set_decorations") (GObjectObjectClass.PolyML.PTR &&> GdkWMDecoration.PolyML.VAL --> FFI.PolyML.VOID)
      val setDeviceCursor_ =
        call (load_sym libgdk "gdk_window_set_device_cursor")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val setDeviceEvents_ =
        call (load_sym libgdk "gdk_window_set_device_events")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GdkEventMask.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setEvents_ = call (load_sym libgdk "gdk_window_set_events") (GObjectObjectClass.PolyML.PTR &&> GdkEventMask.PolyML.VAL --> FFI.PolyML.VOID)
      val setFocusOnMap_ = call (load_sym libgdk "gdk_window_set_focus_on_map") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setFunctions_ = call (load_sym libgdk "gdk_window_set_functions") (GObjectObjectClass.PolyML.PTR &&> GdkWMFunction.PolyML.VAL --> FFI.PolyML.VOID)
      val setGeometryHints_ =
        call (load_sym libgdk "gdk_window_set_geometry_hints")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkGeometryRecord.PolyML.PTR
             &&> GdkWindowHints.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setGroup_ = call (load_sym libgdk "gdk_window_set_group") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setIconName_ = call (load_sym libgdk "gdk_window_set_icon_name") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setKeepAbove_ = call (load_sym libgdk "gdk_window_set_keep_above") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setKeepBelow_ = call (load_sym libgdk "gdk_window_set_keep_below") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setModalHint_ = call (load_sym libgdk "gdk_window_set_modal_hint") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setOpacity_ = call (load_sym libgdk "gdk_window_set_opacity") (GObjectObjectClass.PolyML.PTR &&> FFI.Double.PolyML.VAL --> FFI.PolyML.VOID)
      val setOverrideRedirect_ = call (load_sym libgdk "gdk_window_set_override_redirect") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setRole_ = call (load_sym libgdk "gdk_window_set_role") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setSkipPagerHint_ = call (load_sym libgdk "gdk_window_set_skip_pager_hint") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setSkipTaskbarHint_ = call (load_sym libgdk "gdk_window_set_skip_taskbar_hint") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setSourceEvents_ =
        call (load_sym libgdk "gdk_window_set_source_events")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkInputSource.PolyML.VAL
             &&> GdkEventMask.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setStartupId_ = call (load_sym libgdk "gdk_window_set_startup_id") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setStaticGravities_ = call (load_sym libgdk "gdk_window_set_static_gravities") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val setSupportMultidevice_ = call (load_sym libgdk "gdk_window_set_support_multidevice") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setTitle_ = call (load_sym libgdk "gdk_window_set_title") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setTransientFor_ = call (load_sym libgdk "gdk_window_set_transient_for") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setTypeHint_ = call (load_sym libgdk "gdk_window_set_type_hint") (GObjectObjectClass.PolyML.PTR &&> GdkWindowTypeHint.PolyML.VAL --> FFI.PolyML.VOID)
      val setUrgencyHint_ = call (load_sym libgdk "gdk_window_set_urgency_hint") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setUserData_ = call (load_sym libgdk "gdk_window_set_user_data") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val shapeCombineRegion_ =
        call (load_sym libgdk "gdk_window_shape_combine_region")
          (
            GObjectObjectClass.PolyML.PTR
             &&> CairoRegionRecord.PolyML.OPTPTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val show_ = call (load_sym libgdk "gdk_window_show") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val showUnraised_ = call (load_sym libgdk "gdk_window_show_unraised") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val stick_ = call (load_sym libgdk "gdk_window_stick") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val thawToplevelUpdatesLibgtkOnly_ = call (load_sym libgdk "gdk_window_thaw_toplevel_updates_libgtk_only") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val thawUpdates_ = call (load_sym libgdk "gdk_window_thaw_updates") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unfullscreen_ = call (load_sym libgdk "gdk_window_unfullscreen") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unmaximize_ = call (load_sym libgdk "gdk_window_unmaximize") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unstick_ = call (load_sym libgdk "gdk_window_unstick") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val withdraw_ = call (load_sym libgdk "gdk_window_withdraw") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GdkWindowClass.t
    type windowattrrecord_t = GdkWindowAttrRecord.t
    type windowedge_t = GdkWindowEdge.t
    type modifiertype_t = GdkModifierType.t
    type 'a displayclass_t = 'a GdkDisplayClass.t
    type dragprotocol_t = GdkDragProtocol.t
    type 'a screenclass_t = 'a GdkScreenClass.t
    type windowstate_t = GdkWindowState.t
    type 'a visualclass_t = 'a GdkVisualClass.t
    type windowtype_t = GdkWindowType.t
    type colorrecord_t = GdkColorRecord.t
    type rgbarecord_t = GdkRgbaRecord.t
    type wmdecoration_t = GdkWMDecoration.t
    type 'a deviceclass_t = 'a GdkDeviceClass.t
    type wmfunction_t = GdkWMFunction.t
    type windowhints_t = GdkWindowHints.t
    type geometryrecord_t = GdkGeometryRecord.t
    type eventmask_t = GdkEventMask.t
    type inputsource_t = GdkInputSource.t
    type windowtypehint_t = GdkWindowTypeHint.t
    type 'a cursorclass_t = 'a GdkCursorClass.t
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
    fun setIconName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepBelow_ (self & setting)
    fun setModalHint self modal = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setModalHint_ (self & modal)
    fun setOpacity self opacity = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setOpacity_ (self & opacity)
    fun setOverrideRedirect self overrideRedirect = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setOverrideRedirect_ (self & overrideRedirect)
    fun setRole self role = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setRole_ (self & role)
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
    fun setStartupId self startupId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setStartupId_ (self & startupId)
    fun setStaticGravities self useStatic = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> FFI.Bool.C.fromVal) setStaticGravities_ (self & useStatic)
    fun setSupportMultidevice self supportMultidevice = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSupportMultidevice_ (self & supportMultidevice)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setTitle_ (self & title)
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
