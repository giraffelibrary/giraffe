signature GTK_SCALE_BUTTON =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type 'a orientable_class
    type 'a button_class
    type 'a widget_class
    type 'a adjustment_class
    type icon_size_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new :
      LargeInt.int
       * real
       * real
       * real
       * string list option
       -> base class
    val getAdjustment : 'a class -> base adjustment_class
    val getMinusButton : 'a class -> base button_class
    val getPlusButton : 'a class -> base button_class
    val getPopup : 'a class -> base widget_class
    val getValue : 'a class -> real
    val setAdjustment :
      'a class
       -> 'b adjustment_class
       -> unit
    val setIcons :
      'a class
       -> string list
       -> unit
    val setValue :
      'a class
       -> real
       -> unit
    val popdownSig : (unit -> unit) -> 'a class Signal.t
    val popupSig : (unit -> unit) -> 'a class Signal.t
    val valueChangedSig : (real -> unit) -> 'a class Signal.t
    val adjustmentProp :
      {
        get : 'a class -> base adjustment_class option,
        set :
          'b adjustment_class option
           -> 'a class
           -> unit,
        new : 'b adjustment_class option -> 'a class Property.t
      }
    val sizeProp :
      {
        get : 'a class -> icon_size_t,
        set :
          icon_size_t
           -> 'a class
           -> unit,
        new : icon_size_t -> 'a class Property.t
      }
    val valueProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
  end
