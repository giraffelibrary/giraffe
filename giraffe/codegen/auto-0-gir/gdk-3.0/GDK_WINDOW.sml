signature GDK_WINDOW =
  sig
    type 'a class_t
    type 'a cursorclass_t
    type windowtypehint_t
    type inputsource_t
    type eventmask_t
    type geometryrecord_t
    type windowhints_t
    type wmfunction_t
    type 'a deviceclass_t
    type wmdecoration_t
    type rgbarecord_t
    type colorrecord_t
    type rectanglerecord_t
    type windowtype_t
    type 'a visualclass_t
    type windowstate_t
    type 'a screenclass_t
    type dragprotocol_t
    type 'a displayclass_t
    type modifiertype_t
    type windowedge_t
    type windowattrrecord_t
    val getType : unit -> GObject.Type.t
    val new :
      'a class_t option
       -> windowattrrecord_t
       -> LargeInt.int
       -> base class_t
    val constrainSize :
      geometryrecord_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val processAllUpdates : unit -> unit
    val setDebugUpdates : bool -> unit
    val beep : 'a class_t -> unit
    val beginMoveDrag :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val beginPaintRect :
      'a class_t
       -> rectanglerecord_t
       -> unit
    val beginPaintRegion :
      'a class_t
       -> Cairo.RegionRecord.t
       -> unit
    val beginResizeDrag :
      'a class_t
       -> windowedge_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val configureFinished : 'a class_t -> unit
    val coordsFromParent :
      'a class_t
       -> real
       -> real
       -> real * real
    val coordsToParent :
      'a class_t
       -> real
       -> real
       -> real * real
    val createSimilarSurface :
      'a class_t
       -> Cairo.Content.t
       -> LargeInt.int
       -> LargeInt.int
       -> Cairo.SurfaceRecord.t
    val deiconify : 'a class_t -> unit
    val destroy : 'a class_t -> unit
    val destroyNotify : 'a class_t -> unit
    val enableSynchronizedConfigure : 'a class_t -> unit
    val endPaint : 'a class_t -> unit
    val ensureNative : 'a class_t -> bool
    val flush : 'a class_t -> unit
    val focus :
      'a class_t
       -> LargeInt.int
       -> unit
    val freezeToplevelUpdatesLibgtkOnly : 'a class_t -> unit
    val freezeUpdates : 'a class_t -> unit
    val fullscreen : 'a class_t -> unit
    val geometryChanged : 'a class_t -> unit
    val getAcceptFocus : 'a class_t -> bool
    val getBackgroundPattern : 'a class_t -> Cairo.PatternRecord.t
    val getClipRegion : 'a class_t -> Cairo.RegionRecord.t
    val getComposited : 'a class_t -> bool
    val getCursor : 'a class_t -> base cursorclass_t
    val getDecorations : 'a class_t -> wmdecoration_t option
    val getDeviceCursor :
      'a class_t
       -> 'b deviceclass_t
       -> base cursorclass_t
    val getDeviceEvents :
      'a class_t
       -> 'b deviceclass_t
       -> eventmask_t
    val getDevicePosition :
      'a class_t
       -> 'b deviceclass_t
       -> base class_t
           * LargeInt.int
           * LargeInt.int
           * modifiertype_t
    val getDisplay : 'a class_t -> base displayclass_t
    val getDragProtocol : 'a class_t -> dragprotocol_t * base class_t
    val getEffectiveParent : 'a class_t -> base class_t
    val getEffectiveToplevel : 'a class_t -> base class_t
    val getEvents : 'a class_t -> eventmask_t
    val getFocusOnMap : 'a class_t -> bool
    val getFrameExtents :
      'a class_t
       -> rectanglerecord_t
       -> unit
    val getGeometry :
      'a class_t
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getGroup : 'a class_t -> base class_t
    val getHeight : 'a class_t -> LargeInt.int
    val getModalHint : 'a class_t -> bool
    val getOrigin :
      'a class_t
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getParent : 'a class_t -> base class_t
    val getPosition : 'a class_t -> LargeInt.int * LargeInt.int
    val getRootCoords :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getRootOrigin : 'a class_t -> LargeInt.int * LargeInt.int
    val getScreen : 'a class_t -> base screenclass_t
    val getSourceEvents :
      'a class_t
       -> inputsource_t
       -> eventmask_t
    val getState : 'a class_t -> windowstate_t
    val getSupportMultidevice : 'a class_t -> bool
    val getToplevel : 'a class_t -> base class_t
    val getTypeHint : 'a class_t -> windowtypehint_t
    val getUpdateArea : 'a class_t -> Cairo.RegionRecord.t
    val getVisibleRegion : 'a class_t -> Cairo.RegionRecord.t
    val getVisual : 'a class_t -> base visualclass_t
    val getWidth : 'a class_t -> LargeInt.int
    val getWindowType : 'a class_t -> windowtype_t
    val hasNative : 'a class_t -> bool
    val hide : 'a class_t -> unit
    val iconify : 'a class_t -> unit
    val inputShapeCombineRegion :
      'a class_t
       -> Cairo.RegionRecord.t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val invalidateRect :
      'a class_t
       -> rectanglerecord_t option
       -> bool
       -> unit
    val invalidateRegion :
      'a class_t
       -> Cairo.RegionRecord.t
       -> bool
       -> unit
    val isDestroyed : 'a class_t -> bool
    val isInputOnly : 'a class_t -> bool
    val isShaped : 'a class_t -> bool
    val isViewable : 'a class_t -> bool
    val isVisible : 'a class_t -> bool
    val lower : 'a class_t -> unit
    val maximize : 'a class_t -> unit
    val mergeChildInputShapes : 'a class_t -> unit
    val mergeChildShapes : 'a class_t -> unit
    val move :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val moveRegion :
      'a class_t
       -> Cairo.RegionRecord.t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val moveResize :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val processUpdates :
      'a class_t
       -> bool
       -> unit
    val raise' : 'a class_t -> unit
    val registerDnd : 'a class_t -> unit
    val reparent :
      'a class_t
       -> 'b class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val resize :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val restack :
      'a class_t
       -> 'b class_t option
       -> bool
       -> unit
    val scroll :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setAcceptFocus :
      'a class_t
       -> bool
       -> unit
    val setBackground :
      'a class_t
       -> colorrecord_t
       -> unit
    val setBackgroundPattern :
      'a class_t
       -> Cairo.PatternRecord.t option
       -> unit
    val setBackgroundRgba :
      'a class_t
       -> rgbarecord_t
       -> unit
    val setChildInputShapes : 'a class_t -> unit
    val setChildShapes : 'a class_t -> unit
    val setComposited :
      'a class_t
       -> bool
       -> unit
    val setCursor :
      'a class_t
       -> 'b cursorclass_t option
       -> unit
    val setDecorations :
      'a class_t
       -> wmdecoration_t
       -> unit
    val setDeviceCursor :
      'a class_t
       -> 'b deviceclass_t
       -> 'c cursorclass_t
       -> unit
    val setDeviceEvents :
      'a class_t
       -> 'b deviceclass_t
       -> eventmask_t
       -> unit
    val setEvents :
      'a class_t
       -> eventmask_t
       -> unit
    val setFocusOnMap :
      'a class_t
       -> bool
       -> unit
    val setFunctions :
      'a class_t
       -> wmfunction_t
       -> unit
    val setGeometryHints :
      'a class_t
       -> geometryrecord_t
       -> windowhints_t
       -> unit
    val setGroup :
      'a class_t
       -> 'b class_t option
       -> unit
    val setIconName :
      'a class_t
       -> string option
       -> unit
    val setKeepAbove :
      'a class_t
       -> bool
       -> unit
    val setKeepBelow :
      'a class_t
       -> bool
       -> unit
    val setModalHint :
      'a class_t
       -> bool
       -> unit
    val setOpacity :
      'a class_t
       -> real
       -> unit
    val setOverrideRedirect :
      'a class_t
       -> bool
       -> unit
    val setRole :
      'a class_t
       -> string
       -> unit
    val setSkipPagerHint :
      'a class_t
       -> bool
       -> unit
    val setSkipTaskbarHint :
      'a class_t
       -> bool
       -> unit
    val setSourceEvents :
      'a class_t
       -> inputsource_t
       -> eventmask_t
       -> unit
    val setStartupId :
      'a class_t
       -> string
       -> unit
    val setStaticGravities :
      'a class_t
       -> bool
       -> bool
    val setSupportMultidevice :
      'a class_t
       -> bool
       -> unit
    val setTitle :
      'a class_t
       -> string
       -> unit
    val setTransientFor :
      'a class_t
       -> 'b class_t
       -> unit
    val setTypeHint :
      'a class_t
       -> windowtypehint_t
       -> unit
    val setUrgencyHint :
      'a class_t
       -> bool
       -> unit
    val setUserData :
      'a class_t
       -> 'b GObject.ObjectClass.t option
       -> unit
    val shapeCombineRegion :
      'a class_t
       -> Cairo.RegionRecord.t option
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val show : 'a class_t -> unit
    val showUnraised : 'a class_t -> unit
    val stick : 'a class_t -> unit
    val thawToplevelUpdatesLibgtkOnly : 'a class_t -> unit
    val thawUpdates : 'a class_t -> unit
    val unfullscreen : 'a class_t -> unit
    val unmaximize : 'a class_t -> unit
    val unstick : 'a class_t -> unit
    val withdraw : 'a class_t -> unit
    val createSurfaceSig :
      (LargeInt.int
        -> LargeInt.int
        -> Cairo.SurfaceRecord.t)
       -> 'a class_t Signal.signal
    val fromEmbedderSig :
      (real
        -> real
        -> real * real)
       -> 'a class_t Signal.signal
    val pickEmbeddedChildSig :
      (real
        -> real
        -> 'a class_t)
       -> 'b class_t Signal.signal
    val toEmbedderSig :
      (real
        -> real
        -> real * real)
       -> 'a class_t Signal.signal
    val cursorProp : ('a class_t, base cursorclass_t option, 'b cursorclass_t option) Property.readwrite
  end
