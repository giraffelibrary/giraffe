signature GDK_DISPLAY_MANAGER =
  sig
    type 'a class_t
    type 'a displayclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val get : unit -> base class_t
    val getDefaultDisplay : 'a class_t -> base displayclass_t
    val openDisplay :
      'a class_t
       -> string
       -> base displayclass_t
    val setDefaultDisplay :
      'a class_t
       -> 'b displayclass_t
       -> unit
    val displayOpenedSig : (base displayclass_t -> unit) -> 'a class_t Signal.signal
    val defaultDisplayProp : ('a class_t, base displayclass_t option, 'b displayclass_t option) Property.readwrite
  end
