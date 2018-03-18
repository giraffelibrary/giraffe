signature GTK_WINDOW =
  sig
    type 'a class
    type 'a buildable_class
    type 'a window_group_class
    type 'a accel_group_class
    type 'a application_class
    type 'a widget_class
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
    val setDefaultIconFromFile : string -> unit
    val setDefaultIconName : string -> unit
    val setInteractiveDebugging : bool -> unit
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
    val close : 'a class -> unit
    val deiconify : 'a class -> unit
    val fullscreen : 'a class -> unit
    val fullscreenOnMonitor :
      'a class
       -> 'b Gdk.ScreenClass.class * LargeInt.int
       -> unit
    val getAcceptFocus : 'a class -> bool
    val getApplication : 'a class -> base application_class option
    val getAttachedTo : 'a class -> base widget_class option
    val getDecorated : 'a class -> bool
    val getDefaultSize : 'a class -> LargeInt.int * LargeInt.int
    val getDefaultWidget : 'a class -> base widget_class option
    val getDeletable : 'a class -> bool
    val getDestroyWithParent : 'a class -> bool
    val getFocus : 'a class -> base widget_class option
    val getFocusOnMap : 'a class -> bool
    val getFocusVisible : 'a class -> bool
    val getGravity : 'a class -> Gdk.Gravity.t
    val getGroup : 'a class -> base window_group_class
    val getHasResizeGrip : 'a class -> bool
    val getHideTitlebarWhenMaximized : 'a class -> bool
    val getIcon : 'a class -> base GdkPixbuf.PixbufClass.class
    val getIconName : 'a class -> string option
    val getMnemonicModifier : 'a class -> Gdk.ModifierType.t
    val getMnemonicsVisible : 'a class -> bool
    val getModal : 'a class -> bool
    val getOpacity : 'a class -> real
    val getPosition : 'a class -> LargeInt.int * LargeInt.int
    val getResizable : 'a class -> bool
    val getResizeGripArea : 'a class -> Gdk.RectangleRecord.t option
    val getRole : 'a class -> string option
    val getScreen : 'a class -> base Gdk.ScreenClass.class
    val getSize : 'a class -> LargeInt.int * LargeInt.int
    val getSkipPagerHint : 'a class -> bool
    val getSkipTaskbarHint : 'a class -> bool
    val getTitle : 'a class -> string option
    val getTitlebar : 'a class -> base widget_class option
    val getTransientFor : 'a class -> base class option
    val getTypeHint : 'a class -> Gdk.WindowTypeHint.t
    val getUrgencyHint : 'a class -> bool
    val getWindowType : 'a class -> window_type_t
    val hasGroup : 'a class -> bool
    val hasToplevelFocus : 'a class -> bool
    val iconify : 'a class -> unit
    val isActive : 'a class -> bool
    val isMaximized : 'a class -> bool
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
    val setAttachedTo :
      'a class
       -> 'b widget_class option
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
    val setHideTitlebarWhenMaximized :
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
    val setTitlebar :
      'a class
       -> 'b widget_class option
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
    val activateDefaultSig : (unit -> unit) -> 'a class Signal.t
    val activateFocusSig : (unit -> unit) -> 'a class Signal.t
    val enableDebuggingSig : (bool -> bool) -> 'a class Signal.t
    val keysChangedSig : (unit -> unit) -> 'a class Signal.t
    val setFocusSig : (base widget_class -> unit) -> 'a class Signal.t
    val acceptFocusProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val applicationProp :
      {
        get : 'a class -> base application_class option,
        set :
          'b application_class option
           -> 'a class
           -> unit,
        new : 'b application_class option -> 'a class Property.t
      }
    val attachedToProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
    val decoratedProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val defaultHeightProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val defaultWidthProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val deletableProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val destroyWithParentProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val focusOnMapProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val focusVisibleProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val gravityProp :
      {
        get : 'a class -> Gdk.Gravity.t,
        set :
          Gdk.Gravity.t
           -> 'a class
           -> unit,
        new : Gdk.Gravity.t -> 'a class Property.t
      }
    val hasResizeGripProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val hasToplevelFocusProp : {get : 'a class -> bool}
    val hideTitlebarWhenMaximizedProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val iconProp :
      {
        get : 'a class -> base GdkPixbuf.PixbufClass.class option,
        set :
          'b GdkPixbuf.PixbufClass.class option
           -> 'a class
           -> unit,
        new : 'b GdkPixbuf.PixbufClass.class option -> 'a class Property.t
      }
    val iconNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val isActiveProp : {get : 'a class -> bool}
    val isMaximizedProp : {get : 'a class -> bool}
    val mnemonicsVisibleProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val modalProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val resizableProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val resizeGripVisibleProp : {get : 'a class -> bool}
    val roleProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val screenProp :
      {
        get : 'a class -> base Gdk.ScreenClass.class option,
        set :
          'b Gdk.ScreenClass.class option
           -> 'a class
           -> unit,
        new : 'b Gdk.ScreenClass.class option -> 'a class Property.t
      }
    val skipPagerHintProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val skipTaskbarHintProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val startupIdProp :
      {
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val titleProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val transientForProp :
      {
        get : 'a class -> base class option,
        set :
          'b class option
           -> 'a class
           -> unit,
        new : 'b class option -> 'a class Property.t
      }
    val typeProp :
      {
        get : 'a class -> window_type_t,
        new : window_type_t -> 'a class Property.t
      }
    val typeHintProp :
      {
        get : 'a class -> Gdk.WindowTypeHint.t,
        set :
          Gdk.WindowTypeHint.t
           -> 'a class
           -> unit,
        new : Gdk.WindowTypeHint.t -> 'a class Property.t
      }
    val urgencyHintProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val windowPositionProp :
      {
        get : 'a class -> window_position_t,
        set :
          window_position_t
           -> 'a class
           -> unit,
        new : window_position_t -> 'a class Property.t
      }
  end
