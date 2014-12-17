signature GTK_RANGE =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a orientableclass_t
    type scrolltype_t
    type 'a adjustmentclass_t
    type sensitivitytype_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val getAdjustment : 'a class_t -> base adjustmentclass_t
    val getFillLevel : 'a class_t -> real
    val getFlippable : 'a class_t -> bool
    val getInverted : 'a class_t -> bool
    val getLowerStepperSensitivity : 'a class_t -> sensitivitytype_t
    val getMinSliderSize : 'a class_t -> LargeInt.int
    val getRangeRect : 'a class_t -> Cairo.RectangleIntRecord.t
    val getRestrictToFillLevel : 'a class_t -> bool
    val getRoundDigits : 'a class_t -> LargeInt.int
    val getShowFillLevel : 'a class_t -> bool
    val getSliderRange : 'a class_t -> LargeInt.int * LargeInt.int
    val getSliderSizeFixed : 'a class_t -> bool
    val getUpperStepperSensitivity : 'a class_t -> sensitivitytype_t
    val getValue : 'a class_t -> real
    val setAdjustment :
      'a class_t
       -> 'b adjustmentclass_t
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
       -> sensitivitytype_t
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
       -> sensitivitytype_t
       -> unit
    val setValue :
      'a class_t
       -> real
       -> unit
    val adjustBoundsSig : (real -> unit) -> 'a class_t Signal.signal
    val changeValueSig :
      (scrolltype_t
        -> real
        -> bool)
       -> 'a class_t Signal.signal
    val moveSliderSig : (scrolltype_t -> unit) -> 'a class_t Signal.signal
    val valueChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val adjustmentProp : ('a class_t, base adjustmentclass_t option, 'b adjustmentclass_t option) Property.readwrite
    val fillLevelProp : ('a class_t, real, real) Property.readwrite
    val invertedProp : ('a class_t, bool, bool) Property.readwrite
    val lowerStepperSensitivityProp : ('a class_t, sensitivitytype_t, sensitivitytype_t) Property.readwrite
    val restrictToFillLevelProp : ('a class_t, bool, bool) Property.readwrite
    val roundDigitsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val showFillLevelProp : ('a class_t, bool, bool) Property.readwrite
    val upperStepperSensitivityProp : ('a class_t, sensitivitytype_t, sensitivitytype_t) Property.readwrite
  end
