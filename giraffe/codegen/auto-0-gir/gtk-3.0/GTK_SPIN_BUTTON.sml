signature GTK_SPIN_BUTTON =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a celleditableclass_t
    type 'a editableclass_t
    type spintype_t
    type scrolltype_t
    type 'a adjustmentclass_t
    type spinbuttonupdatepolicy_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asCellEditable : 'a class_t -> base celleditableclass_t
    val asEditable : 'a class_t -> base editableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a adjustmentclass_t option
       -> real
       -> LargeInt.int
       -> base class_t
    val newWithRange :
      real
       -> real
       -> real
       -> base class_t
    val configure :
      'a class_t
       -> 'b adjustmentclass_t option
       -> real
       -> LargeInt.int
       -> unit
    val getAdjustment : 'a class_t -> base adjustmentclass_t
    val getDigits : 'a class_t -> LargeInt.int
    val getIncrements : 'a class_t -> real * real
    val getNumeric : 'a class_t -> bool
    val getRange : 'a class_t -> real * real
    val getSnapToTicks : 'a class_t -> bool
    val getUpdatePolicy : 'a class_t -> spinbuttonupdatepolicy_t
    val getValue : 'a class_t -> real
    val getValueAsInt : 'a class_t -> LargeInt.int
    val getWrap : 'a class_t -> bool
    val setAdjustment :
      'a class_t
       -> 'b adjustmentclass_t
       -> unit
    val setDigits :
      'a class_t
       -> LargeInt.int
       -> unit
    val setIncrements :
      'a class_t
       -> real
       -> real
       -> unit
    val setNumeric :
      'a class_t
       -> bool
       -> unit
    val setRange :
      'a class_t
       -> real
       -> real
       -> unit
    val setSnapToTicks :
      'a class_t
       -> bool
       -> unit
    val setUpdatePolicy :
      'a class_t
       -> spinbuttonupdatepolicy_t
       -> unit
    val setValue :
      'a class_t
       -> real
       -> unit
    val setWrap :
      'a class_t
       -> bool
       -> unit
    val spin :
      'a class_t
       -> spintype_t
       -> real
       -> unit
    val update : 'a class_t -> unit
    val changeValueSig : (scrolltype_t -> unit) -> 'a class_t Signal.signal
    val inputSig : (unit -> LargeInt.int * real) -> 'a class_t Signal.signal
    val outputSig : (unit -> bool) -> 'a class_t Signal.signal
    val valueChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val wrappedSig : (unit -> unit) -> 'a class_t Signal.signal
    val adjustmentProp : ('a class_t, base adjustmentclass_t option, 'b adjustmentclass_t option) Property.readwrite
    val climbRateProp : ('a class_t, real, real) Property.readwrite
    val digitsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val numericProp : ('a class_t, bool, bool) Property.readwrite
    val snapToTicksProp : ('a class_t, bool, bool) Property.readwrite
    val updatePolicyProp : ('a class_t, spinbuttonupdatepolicy_t, spinbuttonupdatepolicy_t) Property.readwrite
    val valueProp : ('a class_t, real, real) Property.readwrite
    val wrapProp : ('a class_t, bool, bool) Property.readwrite
  end
