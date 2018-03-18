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
    val accelGroupProp :
      {
        get : 'a class -> base accel_group_class option,
        set :
          'b accel_group_class option
           -> 'a class
           -> unit,
        new : 'b accel_group_class option -> 'a class Property.t
      }
    val accelPathProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val activeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val anchorHintsProp :
      {
        get : 'a class -> Gdk.AnchorHints.t,
        set :
          Gdk.AnchorHints.t
           -> 'a class
           -> unit,
        new : Gdk.AnchorHints.t -> 'a class Property.t
      }
    val attachWidgetProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
    val menuTypeHintProp :
      {
        get : 'a class -> Gdk.WindowTypeHint.t,
        set :
          Gdk.WindowTypeHint.t
           -> 'a class
           -> unit,
        new : Gdk.WindowTypeHint.t -> 'a class Property.t
      }
    val monitorProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val rectAnchorDxProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val rectAnchorDyProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val reserveToggleSizeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val tearoffStateProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val tearoffTitleProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
