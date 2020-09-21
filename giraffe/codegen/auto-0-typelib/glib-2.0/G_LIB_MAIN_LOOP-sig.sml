signature G_LIB_MAIN_LOOP =
  sig
    type t
    type main_context_t
    val getType : unit -> GObject.Type.t
    val new : main_context_t option * bool -> t
    val getContext : t -> main_context_t
    val isRunning : t -> bool
    val quit : t -> unit
    val run : t -> unit
  end
