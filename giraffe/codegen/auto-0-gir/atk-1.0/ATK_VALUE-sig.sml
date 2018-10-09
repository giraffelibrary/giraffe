signature ATK_VALUE =
  sig
    type 'a class
    type range_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getCurrentValue : 'a class -> GObject.ValueRecord.t
    val getIncrement : 'a class -> real
    val getMaximumValue : 'a class -> GObject.ValueRecord.t
    val getMinimumIncrement : 'a class -> GObject.ValueRecord.t
    val getMinimumValue : 'a class -> GObject.ValueRecord.t
    val getRange : 'a class -> range_t option
    val getValueAndText : 'a class -> real * string
    val setCurrentValue :
      'a class
       -> GObject.ValueRecord.t
       -> bool
    val setValue :
      'a class
       -> real
       -> unit
    val valueChangedSig : (real * string -> unit) -> 'a class Signal.t
  end
