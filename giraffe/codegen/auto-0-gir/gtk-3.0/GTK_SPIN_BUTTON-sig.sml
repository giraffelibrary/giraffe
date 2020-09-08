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
    val adjustmentProp : ('a class, unit -> base adjustment_class option, 'b adjustment_class option -> unit, 'b adjustment_class option -> unit) Property.t
    val climbRateProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val digitsProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val numericProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val snapToTicksProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val updatePolicyProp : ('a class, unit -> spin_button_update_policy_t, spin_button_update_policy_t -> unit, spin_button_update_policy_t -> unit) Property.t
    val valueProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val wrapProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
