signature GTK_RANGE =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type scroll_type_t
    type 'a adjustment_class
    type sensitivity_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val getAdjustment : 'a class -> base adjustment_class
    val getFillLevel : 'a class -> real
    val getFlippable : 'a class -> bool
    val getInverted : 'a class -> bool
    val getLowerStepperSensitivity : 'a class -> sensitivity_type_t
    val getMinSliderSize : 'a class -> LargeInt.int
    val getRangeRect : 'a class -> Gdk.RectangleRecord.t
    val getRestrictToFillLevel : 'a class -> bool
    val getRoundDigits : 'a class -> LargeInt.int
    val getShowFillLevel : 'a class -> bool
    val getSliderRange : 'a class -> LargeInt.int * LargeInt.int
    val getSliderSizeFixed : 'a class -> bool
    val getUpperStepperSensitivity : 'a class -> sensitivity_type_t
    val getValue : 'a class -> real
    val setAdjustment :
      'a class
       -> 'b adjustment_class
       -> unit
    val setFillLevel :
      'a class
       -> real
       -> unit
    val setFlippable :
      'a class
       -> bool
       -> unit
    val setIncrements :
      'a class
       -> real * real
       -> unit
    val setInverted :
      'a class
       -> bool
       -> unit
    val setLowerStepperSensitivity :
      'a class
       -> sensitivity_type_t
       -> unit
    val setMinSliderSize :
      'a class
       -> LargeInt.int
       -> unit
    val setRange :
      'a class
       -> real * real
       -> unit
    val setRestrictToFillLevel :
      'a class
       -> bool
       -> unit
    val setRoundDigits :
      'a class
       -> LargeInt.int
       -> unit
    val setShowFillLevel :
      'a class
       -> bool
       -> unit
    val setSliderSizeFixed :
      'a class
       -> bool
       -> unit
    val setUpperStepperSensitivity :
      'a class
       -> sensitivity_type_t
       -> unit
    val setValue :
      'a class
       -> real
       -> unit
    val adjustBoundsSig : (real -> unit) -> 'a class Signal.t
    val changeValueSig : (scroll_type_t * real -> bool) -> 'a class Signal.t
    val moveSliderSig : (scroll_type_t -> unit) -> 'a class Signal.t
    val valueChangedSig : (unit -> unit) -> 'a class Signal.t
    val adjustmentProp : ('a class, base adjustment_class option, 'b adjustment_class option) Property.readwrite
    val fillLevelProp : ('a class, real, real) Property.readwrite
    val invertedProp : ('a class, bool, bool) Property.readwrite
    val lowerStepperSensitivityProp : ('a class, sensitivity_type_t, sensitivity_type_t) Property.readwrite
    val restrictToFillLevelProp : ('a class, bool, bool) Property.readwrite
    val roundDigitsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val showFillLevelProp : ('a class, bool, bool) Property.readwrite
    val upperStepperSensitivityProp : ('a class, sensitivity_type_t, sensitivity_type_t) Property.readwrite
  end
