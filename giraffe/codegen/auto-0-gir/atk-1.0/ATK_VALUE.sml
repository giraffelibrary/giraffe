signature ATK_VALUE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getCurrentValue :
      'a class
       -> GObject.ValueRecord.t
       -> unit
    val getMaximumValue :
      'a class
       -> GObject.ValueRecord.t
       -> unit
    val getMinimumIncrement :
      'a class
       -> GObject.ValueRecord.t
       -> unit
    val getMinimumValue :
      'a class
       -> GObject.ValueRecord.t
       -> unit
    val setCurrentValue :
      'a class
       -> GObject.ValueRecord.t
       -> bool
  end
