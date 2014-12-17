signature GTK_SCALE =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a orientableclass_t
    type 'a adjustmentclass_t
    type orientation_t
    type positiontype_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      orientation_t
       -> 'a adjustmentclass_t option
       -> base class_t
    val newWithRange :
      orientation_t
       -> real
       -> real
       -> real
       -> base class_t
    val addMark :
      'a class_t
       -> real
       -> positiontype_t
       -> string option
       -> unit
    val clearMarks : 'a class_t -> unit
    val getDigits : 'a class_t -> LargeInt.int
    val getDrawValue : 'a class_t -> bool
    val getLayout : 'a class_t -> base Pango.LayoutClass.t
    val getLayoutOffsets : 'a class_t -> LargeInt.int * LargeInt.int
    val getValuePos : 'a class_t -> positiontype_t
    val setDigits :
      'a class_t
       -> LargeInt.int
       -> unit
    val setDrawValue :
      'a class_t
       -> bool
       -> unit
    val setValuePos :
      'a class_t
       -> positiontype_t
       -> unit
    val formatValueSig : (real -> string) -> 'a class_t Signal.signal
    val digitsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val drawValueProp : ('a class_t, bool, bool) Property.readwrite
    val valuePosProp : ('a class_t, positiontype_t, positiontype_t) Property.readwrite
  end
