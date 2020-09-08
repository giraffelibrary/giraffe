signature GDK_WINDOW =
  sig
    type 'a class
    type window_attributes_type_t
    type window_attr_t
    type window_edge_t
    type 'a g_l_context_class
    type 'a drawing_context_class
    type 'a display_class
    type drag_protocol_t
    type 'a frame_clock_class
    type modifier_type_t
    type 'a screen_class
    type window_state_t
    type 'a visual_class
    type window_type_t
    type rectangle_t
    type color_t
    type rgba_t
    type w_m_decoration_t
    type 'a device_class
    type fullscreen_mode_t
    type w_m_function_t
    type window_hints_t
    type geometry_t
    type event_mask_t
    type input_source_t
    type window_type_hint_t
    type 'a event_union
    type 'a cursor_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new :
      'a class option
       * window_attr_t
       * window_attributes_type_t
       -> base class
    val atPointer :
      unit
       -> base class
           * LargeInt.int
           * LargeInt.int
    val constrainSize :
      geometry_t
       * window_hints_t
       * LargeInt.int
       * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val processAllUpdates : unit -> unit
    val setDebugUpdates : bool -> unit
    val beep : 'a class -> unit
    val beginDrawFrame :
      'a class
       -> Cairo.RegionRecord.t
       -> base drawing_context_class
    val beginMoveDrag :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val beginMoveDragForDevice :
      'a class
       -> 'b device_class
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val beginPaintRect :
      'a class
       -> rectangle_t
       -> unit
    val beginPaintRegion :
      'a class
       -> Cairo.RegionRecord.t
       -> unit
    val beginResizeDrag :
      'a class
       -> window_edge_t
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val beginResizeDragForDevice :
      'a class
       -> window_edge_t
           * 'b device_class
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val configureFinished : 'a class -> unit
    val coordsFromParent :
      'a class
       -> real * real
       -> real * real
    val coordsToParent :
      'a class
       -> real * real
       -> real * real
    val createGlContext : 'a class -> base g_l_context_class
    val createSimilarImageSurface :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> Cairo.SurfaceRecord.t
    val createSimilarSurface :
      'a class
       -> Cairo.Content.t
           * LargeInt.int
           * LargeInt.int
       -> Cairo.SurfaceRecord.t
    val deiconify : 'a class -> unit
    val destroy : 'a class -> unit
    val destroyNotify : 'a class -> unit
    val enableSynchronizedConfigure : 'a class -> unit
    val endDrawFrame :
      'a class
       -> 'b drawing_context_class
       -> unit
    val endPaint : 'a class -> unit
    val ensureNative : 'a class -> bool
    val flush : 'a class -> unit
    val focus :
      'a class
       -> LargeInt.int
       -> unit
    val freezeToplevelUpdatesLibgtkOnly : 'a class -> unit
    val freezeUpdates : 'a class -> unit
    val fullscreen : 'a class -> unit
    val fullscreenOnMonitor :
      'a class
       -> LargeInt.int
       -> unit
    val geometryChanged : 'a class -> unit
    val getAcceptFocus : 'a class -> bool
    val getBackgroundPattern : 'a class -> Cairo.PatternRecord.t option
    val getClipRegion : 'a class -> Cairo.RegionRecord.t
    val getComposited : 'a class -> bool
    val getCursor : 'a class -> base cursor_class option
    val getDecorations : 'a class -> w_m_decoration_t option
    val getDeviceCursor :
      'a class
       -> 'b device_class
       -> base cursor_class option
    val getDeviceEvents :
      'a class
       -> 'b device_class
       -> event_mask_t
    val getDevicePosition :
      'a class
       -> 'b device_class
       -> base class option
           * LargeInt.int
           * LargeInt.int
           * modifier_type_t
    val getDevicePositionDouble :
      'a class
       -> 'b device_class
       -> base class option
           * real
           * real
           * modifier_type_t
    val getDisplay : 'a class -> base display_class
    val getDragProtocol : 'a class -> drag_protocol_t * base class
    val getEffectiveParent : 'a class -> base class
    val getEffectiveToplevel : 'a class -> base class
    val getEventCompression : 'a class -> bool
    val getEvents : 'a class -> event_mask_t
    val getFocusOnMap : 'a class -> bool
    val getFrameClock : 'a class -> base frame_clock_class
    val getFrameExtents : 'a class -> rectangle_t
    val getFullscreenMode : 'a class -> fullscreen_mode_t
    val getGeometry :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getGroup : 'a class -> base class
    val getHeight : 'a class -> LargeInt.int
    val getModalHint : 'a class -> bool
    val getOrigin :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getParent : 'a class -> base class
    val getPassThrough : 'a class -> bool
    val getPointer :
      'a class
       -> base class option
           * LargeInt.int
           * LargeInt.int
           * modifier_type_t
    val getPosition : 'a class -> LargeInt.int * LargeInt.int
    val getRootCoords :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getRootOrigin : 'a class -> LargeInt.int * LargeInt.int
    val getScaleFactor : 'a class -> LargeInt.int
    val getScreen : 'a class -> base screen_class
    val getSourceEvents :
      'a class
       -> input_source_t
       -> event_mask_t
    val getState : 'a class -> window_state_t
    val getSupportMultidevice : 'a class -> bool
    val getToplevel : 'a class -> base class
    val getTypeHint : 'a class -> window_type_hint_t
    val getUpdateArea : 'a class -> Cairo.RegionRecord.t
    val getVisibleRegion : 'a class -> Cairo.RegionRecord.t
    val getVisual : 'a class -> base visual_class
    val getWidth : 'a class -> LargeInt.int
    val getWindowType : 'a class -> window_type_t
    val hasNative : 'a class -> bool
    val hide : 'a class -> unit
    val iconify : 'a class -> unit
    val inputShapeCombineRegion :
      'a class
       -> Cairo.RegionRecord.t
           * LargeInt.int
           * LargeInt.int
       -> unit
    val invalidateRect :
      'a class
       -> rectangle_t option * bool
       -> unit
    val invalidateRegion :
      'a class
       -> Cairo.RegionRecord.t * bool
       -> unit
    val isDestroyed : 'a class -> bool
    val isInputOnly : 'a class -> bool
    val isShaped : 'a class -> bool
    val isViewable : 'a class -> bool
    val isVisible : 'a class -> bool
    val lower : 'a class -> unit
    val markPaintFromClip :
      'a class
       -> Cairo.ContextRecord.t
       -> unit
    val maximize : 'a class -> unit
    val mergeChildInputShapes : 'a class -> unit
    val mergeChildShapes : 'a class -> unit
    val move :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val moveRegion :
      'a class
       -> Cairo.RegionRecord.t
           * LargeInt.int
           * LargeInt.int
       -> unit
    val moveResize :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val processUpdates :
      'a class
       -> bool
       -> unit
    val raise' : 'a class -> unit
    val registerDnd : 'a class -> unit
    val reparent :
      'a class
       -> 'b class
           * LargeInt.int
           * LargeInt.int
       -> unit
    val resize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val restack :
      'a class
       -> 'b class option * bool
       -> unit
    val scroll :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setAcceptFocus :
      'a class
       -> bool
       -> unit
    val setBackground :
      'a class
       -> color_t
       -> unit
    val setBackgroundPattern :
      'a class
       -> Cairo.PatternRecord.t option
       -> unit
    val setBackgroundRgba :
      'a class
       -> rgba_t
       -> unit
    val setChildInputShapes : 'a class -> unit
    val setChildShapes : 'a class -> unit
    val setComposited :
      'a class
       -> bool
       -> unit
    val setCursor :
      'a class
       -> 'b cursor_class option
       -> unit
    val setDecorations :
      'a class
       -> w_m_decoration_t
       -> unit
    val setDeviceCursor :
      'a class
       -> 'b device_class * 'c cursor_class
       -> unit
    val setDeviceEvents :
      'a class
       -> 'b device_class * event_mask_t
       -> unit
    val setEventCompression :
      'a class
       -> bool
       -> unit
    val setEvents :
      'a class
       -> event_mask_t
       -> unit
    val setFocusOnMap :
      'a class
       -> bool
       -> unit
    val setFullscreenMode :
      'a class
       -> fullscreen_mode_t
       -> unit
    val setFunctions :
      'a class
       -> w_m_function_t
       -> unit
    val setGeometryHints :
      'a class
       -> geometry_t * window_hints_t
       -> unit
    val setGroup :
      'a class
       -> 'b class option
       -> unit
    val setIconName :
      'a class
       -> string option
       -> unit
    val setKeepAbove :
      'a class
       -> bool
       -> unit
    val setKeepBelow :
      'a class
       -> bool
       -> unit
    val setModalHint :
      'a class
       -> bool
       -> unit
    val setOpacity :
      'a class
       -> real
       -> unit
    val setOpaqueRegion :
      'a class
       -> Cairo.RegionRecord.t option
       -> unit
    val setOverrideRedirect :
      'a class
       -> bool
       -> unit
    val setPassThrough :
      'a class
       -> bool
       -> unit
    val setRole :
      'a class
       -> string
       -> unit
    val setShadowWidth :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val setSkipPagerHint :
      'a class
       -> bool
       -> unit
    val setSkipTaskbarHint :
      'a class
       -> bool
       -> unit
    val setSourceEvents :
      'a class
       -> input_source_t * event_mask_t
       -> unit
    val setStartupId :
      'a class
       -> string
       -> unit
    val setStaticGravities :
      'a class
       -> bool
       -> bool
    val setSupportMultidevice :
      'a class
       -> bool
       -> unit
    val setTitle :
      'a class
       -> string
       -> unit
    val setTransientFor :
      'a class
       -> 'b class
       -> unit
    val setTypeHint :
      'a class
       -> window_type_hint_t
       -> unit
    val setUrgencyHint :
      'a class
       -> bool
       -> unit
    val setUserData :
      'a class
       -> 'b GObject.ObjectClass.class option
       -> unit
    val shapeCombineRegion :
      'a class
       -> Cairo.RegionRecord.t option
           * LargeInt.int
           * LargeInt.int
       -> unit
    val show : 'a class -> unit
    val showUnraised : 'a class -> unit
    val showWindowMenu :
      'a class
       -> 'b event_union
       -> bool
    val stick : 'a class -> unit
    val thawToplevelUpdatesLibgtkOnly : 'a class -> unit
    val thawUpdates : 'a class -> unit
    val unfullscreen : 'a class -> unit
    val unmaximize : 'a class -> unit
    val unstick : 'a class -> unit
    val withdraw : 'a class -> unit
    val createSurfaceSig : (LargeInt.int * LargeInt.int -> Cairo.SurfaceRecord.t) -> 'a class Signal.t
    val fromEmbedderSig : (real * real -> real * real) -> 'a class Signal.t
    val pickEmbeddedChildSig : (real * real -> 'a class option) -> 'b class Signal.t
    val toEmbedderSig : (real * real -> real * real) -> 'a class Signal.t
    val cursorProp : ('a class, unit -> base cursor_class option, 'b cursor_class option -> unit, 'b cursor_class option -> unit) Property.t
  end
