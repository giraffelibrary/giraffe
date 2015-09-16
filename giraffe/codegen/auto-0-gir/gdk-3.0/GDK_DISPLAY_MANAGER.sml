signature GDK_DISPLAY_MANAGER =
  sig
    type 'a class_t
    type 'a display_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val get : unit -> base class_t
    val getDefaultDisplay : 'a class_t -> base display_class_t
    val openDisplay :
      'a class_t
       -> string
       -> base display_class_t
    val setDefaultDisplay :
      'a class_t
       -> 'b display_class_t
       -> unit
    val displayOpenedSig : (base display_class_t -> unit) -> 'a class_t Signal.signal
    val defaultDisplayProp : ('a class_t, base display_class_t option, 'b display_class_t option) Property.readwrite
  end
