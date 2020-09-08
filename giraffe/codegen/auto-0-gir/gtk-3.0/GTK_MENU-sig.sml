signature GTK_MENU =
  sig
    type 'a class
    type 'a buildable_class
    type scroll_type_t
    type 'a accel_group_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromModel : 'a Gio.MenuModelClass.class -> base class
    val attach :
      'a class
       -> 'b widget_class
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val detach : 'a class -> unit
    val getAccelGroup : 'a class -> base accel_group_class
    val getAccelPath : 'a class -> string
    val getActive : 'a class -> base widget_class
    val getAttachWidget : 'a class -> base widget_class
    val getMonitor : 'a class -> LargeInt.int
    val getReserveToggleSize : 'a class -> bool
    val getTearoffState : 'a class -> bool
    val getTitle : 'a class -> string
    val placeOnMonitor :
      'a class
       -> 'b Gdk.MonitorClass.class
       -> unit
    val popdown : 'a class -> unit
    val popupAtPointer :
      'a class
       -> 'b Gdk.Event.union option
       -> unit
    val popupAtRect :
      'a class
       -> 'b Gdk.WindowClass.class
           * Gdk.RectangleRecord.t
           * Gdk.Gravity.t
           * Gdk.Gravity.t
           * 'c Gdk.Event.union option
       -> unit
    val popupAtWidget :
      'a class
       -> 'b widget_class
           * Gdk.Gravity.t
           * Gdk.Gravity.t
           * 'c Gdk.Event.union option
       -> unit
    val reorderChild :
      'a class
       -> 'b widget_class * LargeInt.int
       -> unit
    val reposition : 'a class -> unit
    val setAccelGroup :
      'a class
       -> 'b accel_group_class option
       -> unit
    val setAccelPath :
      'a class
       -> string option
       -> unit
    val setActive :
      'a class
       -> LargeInt.int
       -> unit
    val setMonitor :
      'a class
       -> LargeInt.int
       -> unit
    val setReserveToggleSize :
      'a class
       -> bool
       -> unit
    val setScreen :
      'a class
       -> 'b Gdk.ScreenClass.class option
       -> unit
    val setTearoffState :
      'a class
       -> bool
       -> unit
    val setTitle :
      'a class
       -> string
       -> unit
    val moveScrollSig : (scroll_type_t -> unit) -> 'a class Signal.t
    val accelGroupProp : ('a class, unit -> base accel_group_class option, 'b accel_group_class option -> unit, 'b accel_group_class option -> unit) Property.t
    val accelPathProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val activeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val anchorHintsProp : ('a class, unit -> Gdk.AnchorHints.t, Gdk.AnchorHints.t -> unit, Gdk.AnchorHints.t -> unit) Property.t
    val attachWidgetProp : ('a class, unit -> base widget_class option, 'b widget_class option -> unit, 'b widget_class option -> unit) Property.t
    val menuTypeHintProp : ('a class, unit -> Gdk.WindowTypeHint.t, Gdk.WindowTypeHint.t -> unit, Gdk.WindowTypeHint.t -> unit) Property.t
    val monitorProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val rectAnchorDxProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val rectAnchorDyProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val reserveToggleSizeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val tearoffStateProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val tearoffTitleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
