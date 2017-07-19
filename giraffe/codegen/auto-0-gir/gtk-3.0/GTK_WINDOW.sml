signature GTK_WINDOW =
  sig
    type 'a class
    type 'a buildable_class
    type 'a window_group_class
    type 'a accel_group_class
    type 'a widget_class
    type 'a application_class
    type window_type_t
    type window_position_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : window_type_t -> base class
    val getDefaultIconName : unit -> string
    val setAutoStartupNotification : bool -> unit
    val setDefaultIcon : 'a GdkPixbuf.PixbufClass.class -> unit
    val setDefaultIconFromFile : string -> bool
    val setDefaultIconName : string -> unit
    val activateDefault : 'a class -> bool
    val activateFocus : 'a class -> bool
    val activateKey :
      'a class
       -> Gdk.EventKeyRecord.t
       -> bool
    val addAccelGroup :
      'a class
       -> 'b accel_group_class
       -> unit
    val addMnemonic :
      'a class
       -> LargeInt.int * 'b widget_class
       -> unit
    val beginMoveDrag :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val beginResizeDrag :
      'a class
       -> Gdk.WindowEdge.t
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val deiconify : 'a class -> unit
    val fullscreen : 'a class -> unit
    val getAcceptFocus : 'a class -> bool
    val getApplication : 'a class -> base application_class
    val getDecorated : 'a class -> bool
    val getDefaultSize : 'a class -> LargeInt.int * LargeInt.int
    val getDefaultWidget : 'a class -> base widget_class
    val getDeletable : 'a class -> bool
    val getDestroyWithParent : 'a class -> bool
    val getFocus : 'a class -> base widget_class
    val getFocusOnMap : 'a class -> bool
    val getFocusVisible : 'a class -> bool
    val getGravity : 'a class -> Gdk.Gravity.t
    val getGroup : 'a class -> base window_group_class
    val getHasResizeGrip : 'a class -> bool
    val getIcon : 'a class -> base GdkPixbuf.PixbufClass.class
    val getIconName : 'a class -> string
    val getMnemonicModifier : 'a class -> Gdk.ModifierType.t
    val getMnemonicsVisible : 'a class -> bool
    val getModal : 'a class -> bool
    val getOpacity : 'a class -> real
    val getPosition : 'a class -> LargeInt.int * LargeInt.int
    val getResizable : 'a class -> bool
    val getResizeGripArea : 'a class -> Gdk.RectangleRecord.t option
    val getRole : 'a class -> string
    val getScreen : 'a class -> base Gdk.ScreenClass.class
    val getSize : 'a class -> LargeInt.int * LargeInt.int
    val getSkipPagerHint : 'a class -> bool
    val getSkipTaskbarHint : 'a class -> bool
    val getTitle : 'a class -> string
    val getTransientFor : 'a class -> base class
    val getTypeHint : 'a class -> Gdk.WindowTypeHint.t
    val getUrgencyHint : 'a class -> bool
    val getWindowType : 'a class -> window_type_t
    val hasGroup : 'a class -> bool
    val hasToplevelFocus : 'a class -> bool
    val iconify : 'a class -> unit
    val isActive : 'a class -> bool
    val maximize : 'a class -> unit
    val mnemonicActivate :
      'a class
       -> LargeInt.int * Gdk.ModifierType.t
       -> bool
    val move :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val parseGeometry :
      'a class
       -> string
       -> bool
    val present : 'a class -> unit
    val presentWithTime :
      'a class
       -> LargeInt.int
       -> unit
    val propagateKeyEvent :
      'a class
       -> Gdk.EventKeyRecord.t
       -> bool
    val removeAccelGroup :
      'a class
       -> 'b accel_group_class
       -> unit
    val removeMnemonic :
      'a class
       -> LargeInt.int * 'b widget_class
       -> unit
    val reshowWithInitialSize : 'a class -> unit
    val resize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val resizeGripIsVisible : 'a class -> bool
    val resizeToGeometry :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setAcceptFocus :
      'a class
       -> bool
       -> unit
    val setApplication :
      'a class
       -> 'b application_class option
       -> unit
    val setDecorated :
      'a class
       -> bool
       -> unit
    val setDefault :
      'a class
       -> 'b widget_class option
       -> unit
    val setDefaultGeometry :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setDefaultSize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setDeletable :
      'a class
       -> bool
       -> unit
    val setDestroyWithParent :
      'a class
       -> bool
       -> unit
    val setFocus :
      'a class
       -> 'b widget_class option
       -> unit
    val setFocusOnMap :
      'a class
       -> bool
       -> unit
    val setFocusVisible :
      'a class
       -> bool
       -> unit
    val setGeometryHints :
      'a class
       -> 'b widget_class option
           * Gdk.GeometryRecord.t option
           * Gdk.WindowHints.t
       -> unit
    val setGravity :
      'a class
       -> Gdk.Gravity.t
       -> unit
    val setHasResizeGrip :
      'a class
       -> bool
       -> unit
    val setHasUserRefCount :
      'a class
       -> bool
       -> unit
    val setIcon :
      'a class
       -> 'b GdkPixbuf.PixbufClass.class option
       -> unit
    val setIconFromFile :
      'a class
       -> string
       -> bool
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
    val setMnemonicModifier :
      'a class
       -> Gdk.ModifierType.t
       -> unit
    val setMnemonicsVisible :
      'a class
       -> bool
       -> unit
    val setModal :
      'a class
       -> bool
       -> unit
    val setOpacity :
      'a class
       -> real
       -> unit
    val setPosition :
      'a class
       -> window_position_t
       -> unit
    val setResizable :
      'a class
       -> bool
       -> unit
    val setRole :
      'a class
       -> string
       -> unit
    val setScreen :
      'a class
       -> 'b Gdk.ScreenClass.class
       -> unit
    val setSkipPagerHint :
      'a class
       -> bool
       -> unit
    val setSkipTaskbarHint :
      'a class
       -> bool
       -> unit
    val setStartupId :
      'a class
       -> string
       -> unit
    val setTitle :
      'a class
       -> string
       -> unit
    val setTransientFor :
      'a class
       -> 'b class option
       -> unit
    val setTypeHint :
      'a class
       -> Gdk.WindowTypeHint.t
       -> unit
    val setUrgencyHint :
      'a class
       -> bool
       -> unit
    val setWmclass :
      'a class
       -> string * string
       -> unit
    val stick : 'a class -> unit
    val unfullscreen : 'a class -> unit
    val unmaximize : 'a class -> unit
    val unstick : 'a class -> unit
    val activateDefaultSig : (unit -> unit) -> 'a class Signal.signal
    val activateFocusSig : (unit -> unit) -> 'a class Signal.signal
    val keysChangedSig : (unit -> unit) -> 'a class Signal.signal
    val setFocusSig : (base widget_class -> unit) -> 'a class Signal.signal
    val acceptFocusProp : ('a class, bool, bool) Property.readwrite
    val applicationProp : ('a class, base application_class option, 'b application_class option) Property.readwrite
    val decoratedProp : ('a class, bool, bool) Property.readwrite
    val defaultHeightProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val defaultWidthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val deletableProp : ('a class, bool, bool) Property.readwrite
    val destroyWithParentProp : ('a class, bool, bool) Property.readwrite
    val focusOnMapProp : ('a class, bool, bool) Property.readwrite
    val focusVisibleProp : ('a class, bool, bool) Property.readwrite
    val gravityProp : ('a class, Gdk.Gravity.t, Gdk.Gravity.t) Property.readwrite
    val hasResizeGripProp : ('a class, bool, bool) Property.readwrite
    val hasToplevelFocusProp : ('a class, bool) Property.readonly
    val iconProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val iconNameProp : ('a class, string option, string option) Property.readwrite
    val isActiveProp : ('a class, bool) Property.readonly
    val mnemonicsVisibleProp : ('a class, bool, bool) Property.readwrite
    val modalProp : ('a class, bool, bool) Property.readwrite
    val opacityProp : ('a class, real, real) Property.readwrite
    val resizableProp : ('a class, bool, bool) Property.readwrite
    val resizeGripVisibleProp : ('a class, bool) Property.readonly
    val roleProp : ('a class, string option, string option) Property.readwrite
    val screenProp : ('a class, base Gdk.ScreenClass.class option, 'b Gdk.ScreenClass.class option) Property.readwrite
    val skipPagerHintProp : ('a class, bool, bool) Property.readwrite
    val skipTaskbarHintProp : ('a class, bool, bool) Property.readwrite
    val startupIdProp : ('a class, string option) Property.writeonly
    val titleProp : ('a class, string option, string option) Property.readwrite
    val transientForProp : ('a class, base class option, 'b class option) Property.readwrite
    val typeProp : ('a class, window_type_t, window_type_t) Property.readwrite
    val typeHintProp : ('a class, Gdk.WindowTypeHint.t, Gdk.WindowTypeHint.t) Property.readwrite
    val urgencyHintProp : ('a class, bool, bool) Property.readwrite
    val windowPositionProp : ('a class, window_position_t, window_position_t) Property.readwrite
  end
