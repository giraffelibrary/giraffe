signature GTK_ACTION =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type 'a accel_group_class
    type 'a action_group_class
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new :
      string
       * string option
       * string option
       * string option
       -> base class
    val activate : 'a class -> unit
    val blockActivate : 'a class -> unit
    val connectAccelerator : 'a class -> unit
    val createIcon :
      'a class
       -> LargeInt.int
       -> base widget_class
    val createMenu : 'a class -> base widget_class
    val createMenuItem : 'a class -> base widget_class
    val createToolItem : 'a class -> base widget_class
    val disconnectAccelerator : 'a class -> unit
    val getAccelClosure : 'a class -> GObject.ClosureRecord.t
    val getAccelPath : 'a class -> string
    val getAlwaysShowImage : 'a class -> bool
    val getGicon : 'a class -> base Gio.IconClass.class
    val getIconName : 'a class -> string
    val getIsImportant : 'a class -> bool
    val getLabel : 'a class -> string
    val getName : 'a class -> string
    val getSensitive : 'a class -> bool
    val getShortLabel : 'a class -> string
    val getStockId : 'a class -> string
    val getTooltip : 'a class -> string
    val getVisible : 'a class -> bool
    val getVisibleHorizontal : 'a class -> bool
    val getVisibleVertical : 'a class -> bool
    val isSensitive : 'a class -> bool
    val isVisible : 'a class -> bool
    val setAccelGroup :
      'a class
       -> 'b accel_group_class option
       -> unit
    val setAccelPath :
      'a class
       -> string
       -> unit
    val setAlwaysShowImage :
      'a class
       -> bool
       -> unit
    val setGicon :
      'a class
       -> 'b Gio.IconClass.class
       -> unit
    val setIconName :
      'a class
       -> string
       -> unit
    val setIsImportant :
      'a class
       -> bool
       -> unit
    val setLabel :
      'a class
       -> string
       -> unit
    val setSensitive :
      'a class
       -> bool
       -> unit
    val setShortLabel :
      'a class
       -> string
       -> unit
    val setStockId :
      'a class
       -> string
       -> unit
    val setTooltip :
      'a class
       -> string
       -> unit
    val setVisible :
      'a class
       -> bool
       -> unit
    val setVisibleHorizontal :
      'a class
       -> bool
       -> unit
    val setVisibleVertical :
      'a class
       -> bool
       -> unit
    val unblockActivate : 'a class -> unit
    val activateSig : (unit -> unit) -> 'a class Signal.t
    val actionGroupProp : ('a class, unit -> base action_group_class option, 'b action_group_class option -> unit, 'b action_group_class option -> unit) Property.t
    val alwaysShowImageProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val giconProp : ('a class, unit -> base Gio.IconClass.class option, 'b Gio.IconClass.class option -> unit, 'b Gio.IconClass.class option -> unit) Property.t
    val hideIfEmptyProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val iconNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val isImportantProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val labelProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val nameProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val sensitiveProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val shortLabelProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val stockIdProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val tooltipProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val visibleProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val visibleHorizontalProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val visibleOverflownProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val visibleVerticalProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
