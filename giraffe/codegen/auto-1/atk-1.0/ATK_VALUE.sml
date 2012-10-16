signature ATK_VALUE =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val getCurrentValue :
      'a class_t
       -> GObject.ValueRecord.t
       -> unit
    val getMaximumValue :
      'a class_t
       -> GObject.ValueRecord.t
       -> unit
    val getMinimumIncrement :
      'a class_t
       -> GObject.ValueRecord.t
       -> unit
    val getMinimumValue :
      'a class_t
       -> GObject.ValueRecord.t
       -> unit
    val setCurrentValue :
      'a class_t
       -> GObject.ValueRecord.t
       -> bool
  end
