signature GTK_ACTION =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a widget_class_t
    type 'a accel_group_class_t
    type 'a action_group_class_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> string option
       -> string option
       -> string option
       -> base class_t
    val activate : 'a class_t -> unit
    val blockActivate : 'a class_t -> unit
    val connectAccelerator : 'a class_t -> unit
    val createIcon :
      'a class_t
       -> LargeInt.int
       -> base widget_class_t
    val createMenu : 'a class_t -> base widget_class_t
    val createMenuItem : 'a class_t -> base widget_class_t
    val createToolItem : 'a class_t -> base widget_class_t
    val disconnectAccelerator : 'a class_t -> unit
    val getAccelClosure : 'a class_t -> GObject.ClosureRecord.t
    val getAccelPath : 'a class_t -> string
    val getAlwaysShowImage : 'a class_t -> bool
    val getGicon : 'a class_t -> base Gio.IconClass.t
    val getIconName : 'a class_t -> string
    val getIsImportant : 'a class_t -> bool
    val getLabel : 'a class_t -> string
    val getName : 'a class_t -> string
    val getSensitive : 'a class_t -> bool
    val getShortLabel : 'a class_t -> string
    val getStockId : 'a class_t -> string
    val getTooltip : 'a class_t -> string
    val getVisible : 'a class_t -> bool
    val getVisibleHorizontal : 'a class_t -> bool
    val getVisibleVertical : 'a class_t -> bool
    val isSensitive : 'a class_t -> bool
    val isVisible : 'a class_t -> bool
    val setAccelGroup :
      'a class_t
       -> 'b accel_group_class_t option
       -> unit
    val setAccelPath :
      'a class_t
       -> string
       -> unit
    val setAlwaysShowImage :
      'a class_t
       -> bool
       -> unit
    val setGicon :
      'a class_t
       -> 'b Gio.IconClass.t
       -> unit
    val setIconName :
      'a class_t
       -> string
       -> unit
    val setIsImportant :
      'a class_t
       -> bool
       -> unit
    val setLabel :
      'a class_t
       -> string
       -> unit
    val setSensitive :
      'a class_t
       -> bool
       -> unit
    val setShortLabel :
      'a class_t
       -> string
       -> unit
    val setStockId :
      'a class_t
       -> string
       -> unit
    val setTooltip :
      'a class_t
       -> string
       -> unit
    val setVisible :
      'a class_t
       -> bool
       -> unit
    val setVisibleHorizontal :
      'a class_t
       -> bool
       -> unit
    val setVisibleVertical :
      'a class_t
       -> bool
       -> unit
    val unblockActivate : 'a class_t -> unit
    val activateSig : (unit -> unit) -> 'a class_t Signal.signal
    val actionGroupProp : ('a class_t, base action_group_class_t option, 'b action_group_class_t option) Property.readwrite
    val alwaysShowImageProp : ('a class_t, bool, bool) Property.readwrite
    val giconProp : ('a class_t, base Gio.IconClass.t option, 'b Gio.IconClass.t option) Property.readwrite
    val hideIfEmptyProp : ('a class_t, bool, bool) Property.readwrite
    val iconNameProp : ('a class_t, string option, string option) Property.readwrite
    val isImportantProp : ('a class_t, bool, bool) Property.readwrite
    val labelProp : ('a class_t, string option, string option) Property.readwrite
    val nameProp : ('a class_t, string option, string option) Property.readwrite
    val sensitiveProp : ('a class_t, bool, bool) Property.readwrite
    val shortLabelProp : ('a class_t, string option, string option) Property.readwrite
    val stockIdProp : ('a class_t, string option, string option) Property.readwrite
    val tooltipProp : ('a class_t, string option, string option) Property.readwrite
    val visibleProp : ('a class_t, bool, bool) Property.readwrite
    val visibleHorizontalProp : ('a class_t, bool, bool) Property.readwrite
    val visibleOverflownProp : ('a class_t, bool, bool) Property.readwrite
    val visibleVerticalProp : ('a class_t, bool, bool) Property.readwrite
  end
