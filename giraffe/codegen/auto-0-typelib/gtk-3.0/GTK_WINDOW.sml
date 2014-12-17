signature GTK_WINDOW =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a windowgroupclass_t
    type 'a accelgroupclass_t
    type 'a widgetclass_t
    type 'a applicationclass_t
    type windowtype_t
    type windowposition_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : windowtype_t -> base class_t
    val getDefaultIconName : unit -> string
    val setAutoStartupNotification : bool -> unit
    val setDefaultIcon : 'a GdkPixbuf.PixbufClass.t -> unit
    val setDefaultIconFromFile : string -> bool
    val setDefaultIconName : string -> unit
    val activateDefault : 'a class_t -> bool
    val activateFocus : 'a class_t -> bool
    val activateKey :
      'a class_t
       -> Gdk.EventKeyRecord.t
       -> bool
    val addAccelGroup :
      'a class_t
       -> 'b accelgroupclass_t
       -> unit
    val addMnemonic :
      'a class_t
       -> LargeInt.int
       -> 'b widgetclass_t
       -> unit
    val beginMoveDrag :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val beginResizeDrag :
      'a class_t
       -> Gdk.WindowEdge.t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val deiconify : 'a class_t -> unit
    val fullscreen : 'a class_t -> unit
    val getAcceptFocus : 'a class_t -> bool
    val getApplication : 'a class_t -> base applicationclass_t
    val getDecorated : 'a class_t -> bool
    val getDefaultSize : 'a class_t -> LargeInt.int * LargeInt.int
    val getDefaultWidget : 'a class_t -> base widgetclass_t
    val getDeletable : 'a class_t -> bool
    val getDestroyWithParent : 'a class_t -> bool
    val getFocus : 'a class_t -> base widgetclass_t
    val getFocusOnMap : 'a class_t -> bool
    val getFocusVisible : 'a class_t -> bool
    val getGravity : 'a class_t -> Gdk.Gravity.t
    val getGroup : 'a class_t -> base windowgroupclass_t
    val getHasResizeGrip : 'a class_t -> bool
    val getIcon : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val getIconName : 'a class_t -> string
    val getMnemonicModifier : 'a class_t -> Gdk.ModifierType.t
    val getMnemonicsVisible : 'a class_t -> bool
    val getModal : 'a class_t -> bool
    val getOpacity : 'a class_t -> real
    val getPosition : 'a class_t -> LargeInt.int * LargeInt.int
    val getResizable : 'a class_t -> bool
    val getResizeGripArea : 'a class_t -> Cairo.RectangleIntRecord.t option
    val getRole : 'a class_t -> string
    val getScreen : 'a class_t -> base Gdk.ScreenClass.t
    val getSize : 'a class_t -> LargeInt.int * LargeInt.int
    val getSkipPagerHint : 'a class_t -> bool
    val getSkipTaskbarHint : 'a class_t -> bool
    val getTitle : 'a class_t -> string
    val getTransientFor : 'a class_t -> base class_t
    val getTypeHint : 'a class_t -> Gdk.WindowTypeHint.t
    val getUrgencyHint : 'a class_t -> bool
    val getWindowType : 'a class_t -> windowtype_t
    val hasGroup : 'a class_t -> bool
    val hasToplevelFocus : 'a class_t -> bool
    val iconify : 'a class_t -> unit
    val isActive : 'a class_t -> bool
    val maximize : 'a class_t -> unit
    val mnemonicActivate :
      'a class_t
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> bool
    val move :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val parseGeometry :
      'a class_t
       -> string
       -> bool
    val present : 'a class_t -> unit
    val presentWithTime :
      'a class_t
       -> LargeInt.int
       -> unit
    val propagateKeyEvent :
      'a class_t
       -> Gdk.EventKeyRecord.t
       -> bool
    val removeAccelGroup :
      'a class_t
       -> 'b accelgroupclass_t
       -> unit
    val removeMnemonic :
      'a class_t
       -> LargeInt.int
       -> 'b widgetclass_t
       -> unit
    val reshowWithInitialSize : 'a class_t -> unit
    val resize :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val resizeGripIsVisible : 'a class_t -> bool
    val resizeToGeometry :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setAcceptFocus :
      'a class_t
       -> bool
       -> unit
    val setApplication :
      'a class_t
       -> 'b applicationclass_t option
       -> unit
    val setDecorated :
      'a class_t
       -> bool
       -> unit
    val setDefault :
      'a class_t
       -> 'b widgetclass_t option
       -> unit
    val setDefaultGeometry :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setDefaultSize :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setDeletable :
      'a class_t
       -> bool
       -> unit
    val setDestroyWithParent :
      'a class_t
       -> bool
       -> unit
    val setFocus :
      'a class_t
       -> 'b widgetclass_t option
       -> unit
    val setFocusOnMap :
      'a class_t
       -> bool
       -> unit
    val setFocusVisible :
      'a class_t
       -> bool
       -> unit
    val setGeometryHints :
      'a class_t
       -> 'b widgetclass_t option
       -> Gdk.GeometryRecord.t option
       -> Gdk.WindowHints.t
       -> unit
    val setGravity :
      'a class_t
       -> Gdk.Gravity.t
       -> unit
    val setHasResizeGrip :
      'a class_t
       -> bool
       -> unit
    val setHasUserRefCount :
      'a class_t
       -> bool
       -> unit
    val setIcon :
      'a class_t
       -> 'b GdkPixbuf.PixbufClass.t option
       -> unit
    val setIconFromFile :
      'a class_t
       -> string
       -> bool
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
    val setMnemonicModifier :
      'a class_t
       -> Gdk.ModifierType.t
       -> unit
    val setMnemonicsVisible :
      'a class_t
       -> bool
       -> unit
    val setModal :
      'a class_t
       -> bool
       -> unit
    val setOpacity :
      'a class_t
       -> real
       -> unit
    val setPosition :
      'a class_t
       -> windowposition_t
       -> unit
    val setResizable :
      'a class_t
       -> bool
       -> unit
    val setRole :
      'a class_t
       -> string
       -> unit
    val setScreen :
      'a class_t
       -> 'b Gdk.ScreenClass.t
       -> unit
    val setSkipPagerHint :
      'a class_t
       -> bool
       -> unit
    val setSkipTaskbarHint :
      'a class_t
       -> bool
       -> unit
    val setStartupId :
      'a class_t
       -> string
       -> unit
    val setTitle :
      'a class_t
       -> string
       -> unit
    val setTransientFor :
      'a class_t
       -> 'b class_t option
       -> unit
    val setTypeHint :
      'a class_t
       -> Gdk.WindowTypeHint.t
       -> unit
    val setUrgencyHint :
      'a class_t
       -> bool
       -> unit
    val setWmclass :
      'a class_t
       -> string
       -> string
       -> unit
    val stick : 'a class_t -> unit
    val unfullscreen : 'a class_t -> unit
    val unmaximize : 'a class_t -> unit
    val unstick : 'a class_t -> unit
    val activateDefaultSig : (unit -> unit) -> 'a class_t Signal.signal
    val activateFocusSig : (unit -> unit) -> 'a class_t Signal.signal
    val keysChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val setFocusSig : (base widgetclass_t -> unit) -> 'a class_t Signal.signal
    val acceptFocusProp : ('a class_t, bool, bool) Property.readwrite
    val applicationProp : ('a class_t, base applicationclass_t option, 'b applicationclass_t option) Property.readwrite
    val decoratedProp : ('a class_t, bool, bool) Property.readwrite
    val defaultHeightProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val defaultWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val deletableProp : ('a class_t, bool, bool) Property.readwrite
    val destroyWithParentProp : ('a class_t, bool, bool) Property.readwrite
    val focusOnMapProp : ('a class_t, bool, bool) Property.readwrite
    val focusVisibleProp : ('a class_t, bool, bool) Property.readwrite
    val gravityProp : ('a class_t, Gdk.Gravity.t, Gdk.Gravity.t) Property.readwrite
    val hasResizeGripProp : ('a class_t, bool, bool) Property.readwrite
    val hasToplevelFocusProp : ('a class_t, bool) Property.readonly
    val iconProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val iconNameProp : ('a class_t, string option, string option) Property.readwrite
    val isActiveProp : ('a class_t, bool) Property.readonly
    val mnemonicsVisibleProp : ('a class_t, bool, bool) Property.readwrite
    val modalProp : ('a class_t, bool, bool) Property.readwrite
    val opacityProp : ('a class_t, real, real) Property.readwrite
    val resizableProp : ('a class_t, bool, bool) Property.readwrite
    val resizeGripVisibleProp : ('a class_t, bool) Property.readonly
    val roleProp : ('a class_t, string option, string option) Property.readwrite
    val screenProp : ('a class_t, base Gdk.ScreenClass.t option, 'b Gdk.ScreenClass.t option) Property.readwrite
    val skipPagerHintProp : ('a class_t, bool, bool) Property.readwrite
    val skipTaskbarHintProp : ('a class_t, bool, bool) Property.readwrite
    val startupIdProp : ('a class_t, string option) Property.writeonly
    val titleProp : ('a class_t, string option, string option) Property.readwrite
    val transientForProp : ('a class_t, base class_t option, 'b class_t option) Property.readwrite
    val typeProp : ('a class_t, windowtype_t, windowtype_t) Property.readwrite
    val typeHintProp : ('a class_t, Gdk.WindowTypeHint.t, Gdk.WindowTypeHint.t) Property.readwrite
    val urgencyHintProp : ('a class_t, bool, bool) Property.readwrite
    val windowPositionProp : ('a class_t, windowposition_t, windowposition_t) Property.readwrite
  end
