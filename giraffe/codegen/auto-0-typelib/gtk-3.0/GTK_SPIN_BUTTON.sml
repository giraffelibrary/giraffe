signature GTK_SPIN_BUTTON =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_editable_class
    type 'a editable_class
    type 'a orientable_class
    type spin_type_t
    type scroll_type_t
    type 'a adjustment_class
    type spin_button_update_policy_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asCellEditable : 'a class -> base cell_editable_class
    val asEditable : 'a class -> base editable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new :
      'a adjustment_class option
       * real
       * LargeInt.int
       -> base class
    val newWithRange :
      real
       * real
       * real
       -> base class
    val configure :
      'a class
       -> 'b adjustment_class option
           * real
           * LargeInt.int
       -> unit
    val getAdjustment : 'a class -> base adjustment_class
    val getDigits : 'a class -> LargeInt.int
    val getIncrements : 'a class -> real * real
    val getNumeric : 'a class -> bool
    val getRange : 'a class -> real * real
    val getSnapToTicks : 'a class -> bool
    val getUpdatePolicy : 'a class -> spin_button_update_policy_t
    val getValue : 'a class -> real
    val getValueAsInt : 'a class -> LargeInt.int
    val getWrap : 'a class -> bool
    val setAdjustment :
      'a class
       -> 'b adjustment_class
       -> unit
    val setDigits :
      'a class
       -> LargeInt.int
       -> unit
    val setIncrements :
      'a class
       -> real * real
       -> unit
    val setNumeric :
      'a class
       -> bool
       -> unit
    val setRange :
      'a class
       -> real * real
       -> unit
    val setSnapToTicks :
      'a class
       -> bool
       -> unit
    val setUpdatePolicy :
      'a class
       -> spin_button_update_policy_t
       -> unit
    val setValue :
      'a class
       -> real
       -> unit
    val setWrap :
      'a class
       -> bool
       -> unit
    val spin :
      'a class
       -> spin_type_t * real
       -> unit
    val update : 'a class -> unit
    val changeValueSig : (scroll_type_t -> unit) -> 'a class Signal.t
    val inputSig : (unit -> LargeInt.int * real) -> 'a class Signal.t
    val outputSig : (unit -> bool) -> 'a class Signal.t
    val valueChangedSig : (unit -> unit) -> 'a class Signal.t
    val wrappedSig : (unit -> unit) -> 'a class Signal.t
    val adjustmentProp :
      {
        get : 'a class -> base adjustment_class option,
        set :
          'b adjustment_class option
           -> 'a class
           -> unit,
        new : 'b adjustment_class option -> 'a class Property.t
      }
    val climbRateProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val digitsProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val numericProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val snapToTicksProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val updatePolicyProp :
      {
        get : 'a class -> spin_button_update_policy_t,
        set :
          spin_button_update_policy_t
           -> 'a class
           -> unit,
        new : spin_button_update_policy_t -> 'a class Property.t
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
    val wrapProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
