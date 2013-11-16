signature GTK_I_M_MULTICONTEXT =
  sig
    type 'a class_t
    type 'a menushellclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val appendMenuitems :
      'a class_t
       -> 'b menushellclass_t
       -> unit
    val getContextId : 'a class_t -> string
    val setContextId :
      'a class_t
       -> string
       -> unit
  end
