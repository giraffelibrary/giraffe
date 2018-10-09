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
    val accelPathProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val labelProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val rightJustifiedProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val submenuProp :
      {
        get : 'a class -> base menu_class option,
        set :
          'b menu_class option
           -> 'a class
           -> unit,
        new : 'b menu_class option -> 'a class Property.t
      }
    val useUnderlineProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
