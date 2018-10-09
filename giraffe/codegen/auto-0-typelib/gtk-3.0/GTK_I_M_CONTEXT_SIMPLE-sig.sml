signature GTK_I_M_CONTEXT_SIMPLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addComposeFile :
      'a class
       -> string
       -> unit
  end
