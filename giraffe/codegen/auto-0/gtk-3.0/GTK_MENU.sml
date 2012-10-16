signature GTK_MENU =
  sig
    type 'a class_t
    type 'a widgetclass_t
    type 'a accelgroupclass_t
    type scrolltype_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val attach :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val detach : 'a class_t -> unit
    val getAccelGroup : 'a class_t -> base accelgroupclass_t
    val getAccelPath : 'a class_t -> string
    val getActive : 'a class_t -> base widgetclass_t
    val getAttachWidget : 'a class_t -> base widgetclass_t
    val getMonitor : 'a class_t -> LargeInt.int
    val getReserveToggleSize : 'a class_t -> bool
    val getTearoffState : 'a class_t -> bool
    val getTitle : 'a class_t -> string
    val popdown : 'a class_t -> unit
    val reorderChild :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> unit
    val reposition : 'a class_t -> unit
    val setAccelGroup :
      'a class_t
       -> 'b accelgroupclass_t option
       -> unit
    val setAccelPath :
      'a class_t
       -> string option
       -> unit
    val setActive :
      'a class_t
       -> LargeInt.int
       -> unit
    val setMonitor :
      'a class_t
       -> LargeInt.int
       -> unit
    val setReserveToggleSize :
      'a class_t
       -> bool
       -> unit
    val setScreen :
      'a class_t
       -> 'b Gdk.ScreenClass.t option
       -> unit
    val setTearoffState :
      'a class_t
       -> bool
       -> unit
    val setTitle :
      'a class_t
       -> string
       -> unit
    val moveScrollSig : (scrolltype_t -> unit) -> 'a class_t Signal.signal
    val accelGroupProp : ('a class_t, base accelgroupclass_t option, 'b accelgroupclass_t option) Property.readwrite
    val accelPathProp : ('a class_t, string option, string option) Property.readwrite
    val activeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val attachWidgetProp : ('a class_t, base widgetclass_t option, 'b widgetclass_t option) Property.readwrite
    val monitorProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val reserveToggleSizeProp : ('a class_t, bool, bool) Property.readwrite
    val tearoffStateProp : ('a class_t, bool, bool) Property.readwrite
    val tearoffTitleProp : ('a class_t, string option, string option) Property.readwrite
  end
