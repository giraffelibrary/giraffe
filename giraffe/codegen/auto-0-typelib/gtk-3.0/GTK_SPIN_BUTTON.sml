signature GTK_SPIN_BUTTON =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_editable_class
    type 'a editable_class
    type spin_type_t
    type scroll_type_t
    type 'a adjustment_class
    type spin_button_update_policy_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asCellEditable : 'a class -> base cell_editable_class
    val asEditable : 'a class -> base editable_class
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
    val changeValueSig : (scroll_type_t -> unit) -> 'a class Signal.signal
    val inputSig : (unit -> LargeInt.int * real) -> 'a class Signal.signal
    val outputSig : (unit -> bool) -> 'a class Signal.signal
    val valueChangedSig : (unit -> unit) -> 'a class Signal.signal
    val wrappedSig : (unit -> unit) -> 'a class Signal.signal
    val adjustmentProp : ('a class, base adjustment_class option, 'b adjustment_class option) Property.readwrite
    val climbRateProp : ('a class, real, real) Property.readwrite
    val digitsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val numericProp : ('a class, bool, bool) Property.readwrite
    val snapToTicksProp : ('a class, bool, bool) Property.readwrite
    val updatePolicyProp : ('a class, spin_button_update_policy_t, spin_button_update_policy_t) Property.readwrite
    val valueProp : ('a class, real, real) Property.readwrite
    val wrapProp : ('a class, bool, bool) Property.readwrite
  end
