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
    val attach :
      'a class
       -> 'b widget_class
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
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
    val popdown : 'a class -> unit
    val reorderChild :
      'a class
       -> 'b widget_class
       -> LargeInt.int
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
    val moveScrollSig : (scroll_type_t -> unit) -> 'a class Signal.signal
    val accelGroupProp : ('a class, base accel_group_class option, 'b accel_group_class option) Property.readwrite
    val accelPathProp : ('a class, string option, string option) Property.readwrite
    val activeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val attachWidgetProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
    val monitorProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val reserveToggleSizeProp : ('a class, bool, bool) Property.readwrite
    val tearoffStateProp : ('a class, bool, bool) Property.readwrite
    val tearoffTitleProp : ('a class, string option, string option) Property.readwrite
  end
