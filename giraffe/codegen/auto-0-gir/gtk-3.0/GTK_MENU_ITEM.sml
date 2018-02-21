signature GTK_MENU_ITEM =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type 'a widget_class
    type 'a menu_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithLabel : string -> base class
    val newWithMnemonic : string -> base class
    val activate : 'a class -> unit
    val deselect : 'a class -> unit
    val getAccelPath : 'a class -> string option
    val getLabel : 'a class -> string
    val getReserveIndicator : 'a class -> bool
    val getRightJustified : 'a class -> bool
    val getSubmenu : 'a class -> base widget_class option
    val getUseUnderline : 'a class -> bool
    val select : 'a class -> unit
    val setAccelPath :
      'a class
       -> string option
       -> unit
    val setLabel :
      'a class
       -> string
       -> unit
    val setReserveIndicator :
      'a class
       -> bool
       -> unit
    val setRightJustified :
      'a class
       -> bool
       -> unit
    val setSubmenu :
      'a class
       -> 'b menu_class option
       -> unit
    val setUseUnderline :
      'a class
       -> bool
       -> unit
    val toggleSizeAllocate :
      'a class
       -> LargeInt.int
       -> unit
    val toggleSizeRequest :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val activateSig : (unit -> unit) -> 'a class Signal.t
    val activateItemSig : (unit -> unit) -> 'a class Signal.t
    val deselectSig : (unit -> unit) -> 'a class Signal.t
    val selectSig : (unit -> unit) -> 'a class Signal.t
    val toggleSizeAllocateSig : (LargeInt.int -> unit) -> 'a class Signal.t
    val accelPathProp : ('a class, string option, string option) Property.readwrite
    val labelProp : ('a class, string option, string option) Property.readwrite
    val rightJustifiedProp : ('a class, bool, bool) Property.readwrite
    val submenuProp : ('a class, base menu_class option, 'b menu_class option) Property.readwrite
    val useUnderlineProp : ('a class, bool, bool) Property.readwrite
  end
