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
    val getHasOrigin : 'a class -> bool
    val getLayout : 'a class -> base Pango.LayoutClass.class option
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
    val setHasOrigin :
      'a class
       -> bool
       -> unit
    val setValuePos :
      'a class
       -> position_type_t
       -> unit
    val formatValueSig : (real -> string) -> 'a class Signal.t
    val digitsProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val drawValueProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val hasOriginProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val valuePosProp :
      {
        get : 'a class -> position_type_t,
        set :
          position_type_t
           -> 'a class
           -> unit,
        new : position_type_t -> 'a class Property.t
      }
  end
