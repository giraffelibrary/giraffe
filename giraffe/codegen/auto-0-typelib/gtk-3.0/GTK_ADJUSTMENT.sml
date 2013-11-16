signature GTK_ADJUSTMENT =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val new :
      real
       -> real
       -> real
       -> real
       -> real
       -> real
       -> base class_t
    val changed : 'a class_t -> unit
    val clampPage :
      'a class_t
       -> real
       -> real
       -> unit
    val configure :
      'a class_t
       -> real
       -> real
       -> real
       -> real
       -> real
       -> real
       -> unit
    val getLower : 'a class_t -> real
    val getMinimumIncrement : 'a class_t -> real
    val getPageIncrement : 'a class_t -> real
    val getPageSize : 'a class_t -> real
    val getStepIncrement : 'a class_t -> real
    val getUpper : 'a class_t -> real
    val getValue : 'a class_t -> real
    val setLower :
      'a class_t
       -> real
       -> unit
    val setPageIncrement :
      'a class_t
       -> real
       -> unit
    val setPageSize :
      'a class_t
       -> real
       -> unit
    val setStepIncrement :
      'a class_t
       -> real
       -> unit
    val setUpper :
      'a class_t
       -> real
       -> unit
    val setValue :
      'a class_t
       -> real
       -> unit
    val valueChanged : 'a class_t -> unit
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val valueChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val lowerProp : ('a class_t, real, real) Property.readwrite
    val pageIncrementProp : ('a class_t, real, real) Property.readwrite
    val pageSizeProp : ('a class_t, real, real) Property.readwrite
    val stepIncrementProp : ('a class_t, real, real) Property.readwrite
    val upperProp : ('a class_t, real, real) Property.readwrite
    val valueProp : ('a class_t, real, real) Property.readwrite
  end
