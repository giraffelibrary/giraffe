signature GTK_SCALE =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type 'a adjustment_class
    type orientation_t
    type position_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : orientation_t * 'a adjustment_class option -> base class
    val newWithRange :
      orientation_t
       * real
       * real
       * real
       -> base class
    val addMark :
      'a class
       -> real
           * position_type_t
           * string option
       -> unit
    val clearMarks : 'a class -> unit
    val getDigits : 'a class -> LargeInt.int
    val getDrawValue : 'a class -> bool
    val getLayout : 'a class -> base Pango.LayoutClass.class
    val getLayoutOffsets : 'a class -> LargeInt.int * LargeInt.int
    val getValuePos : 'a class -> position_type_t
    val setDigits :
      'a class
       -> LargeInt.int
       -> unit
    val setDrawValue :
      'a class
       -> bool
       -> unit
    val setValuePos :
      'a class
       -> position_type_t
       -> unit
    val formatValueSig : (real -> string) -> 'a class Signal.t
    val digitsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val drawValueProp : ('a class, bool, bool) Property.readwrite
    val valuePosProp : ('a class, position_type_t, position_type_t) Property.readwrite
  end
