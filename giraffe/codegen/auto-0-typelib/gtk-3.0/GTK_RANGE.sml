signature GTK_RANGE =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type scroll_type_t
    type 'a adjustment_class_t
    type sensitivity_type_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val getAdjustment : 'a class_t -> base adjustment_class_t
    val getFillLevel : 'a class_t -> real
    val getFlippable : 'a class_t -> bool
    val getInverted : 'a class_t -> bool
    val getLowerStepperSensitivity : 'a class_t -> sensitivity_type_t
    val getMinSliderSize : 'a class_t -> LargeInt.int
    val getRangeRect : 'a class_t -> Cairo.RectangleIntRecord.t
    val getRestrictToFillLevel : 'a class_t -> bool
    val getRoundDigits : 'a class_t -> LargeInt.int
    val getShowFillLevel : 'a class_t -> bool
    val getSliderRange : 'a class_t -> LargeInt.int * LargeInt.int
    val getSliderSizeFixed : 'a class_t -> bool
    val getUpperStepperSensitivity : 'a class_t -> sensitivity_type_t
    val getValue : 'a class_t -> real
    val setAdjustment :
      'a class_t
       -> 'b adjustment_class_t
       -> unit
    val setFillLevel :
      'a class_t
       -> real
       -> unit
    val setFlippable :
      'a class_t
       -> bool
       -> unit
    val setIncrements :
      'a class_t
       -> real
       -> real
       -> unit
    val setInverted :
      'a class_t
       -> bool
       -> unit
    val setLowerStepperSensitivity :
      'a class_t
       -> sensitivity_type_t
       -> unit
    val setMinSliderSize :
      'a class_t
       -> LargeInt.int
       -> unit
    val setRange :
      'a class_t
       -> real
       -> real
       -> unit
    val setRestrictToFillLevel :
      'a class_t
       -> bool
       -> unit
    val setRoundDigits :
      'a class_t
       -> LargeInt.int
       -> unit
    val setShowFillLevel :
      'a class_t
       -> bool
       -> unit
    val setSliderSizeFixed :
      'a class_t
       -> bool
       -> unit
    val setUpperStepperSensitivity :
      'a class_t
       -> sensitivity_type_t
       -> unit
    val setValue :
      'a class_t
       -> real
       -> unit
    val adjustBoundsSig : (real -> unit) -> 'a class_t Signal.signal
    val changeValueSig :
      (scroll_type_t
        -> real
        -> bool)
       -> 'a class_t Signal.signal
    val moveSliderSig : (scroll_type_t -> unit) -> 'a class_t Signal.signal
    val valueChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val adjustmentProp : ('a class_t, base adjustment_class_t option, 'b adjustment_class_t option) Property.readwrite
    val fillLevelProp : ('a class_t, real, real) Property.readwrite
    val invertedProp : ('a class_t, bool, bool) Property.readwrite
    val lowerStepperSensitivityProp : ('a class_t, sensitivity_type_t, sensitivity_type_t) Property.readwrite
    val restrictToFillLevelProp : ('a class_t, bool, bool) Property.readwrite
    val roundDigitsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val showFillLevelProp : ('a class_t, bool, bool) Property.readwrite
    val upperStepperSensitivityProp : ('a class_t, sensitivity_type_t, sensitivity_type_t) Property.readwrite
  end
