signature GTK_TOGGLE_ACTION =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> string option
       -> string option
       -> string option
       -> base class_t
    val getActive : 'a class_t -> bool
    val getDrawAsRadio : 'a class_t -> bool
    val setActive :
      'a class_t
       -> bool
       -> unit
    val setDrawAsRadio :
      'a class_t
       -> bool
       -> unit
    val toggled : 'a class_t -> unit
    val toggledSig : (unit -> unit) -> 'a class_t Signal.signal
    val activeProp : ('a class_t, bool, bool) Property.readwrite
    val drawAsRadioProp : ('a class_t, bool, bool) Property.readwrite
  end
