signature GDK_EVENT_D_N_D_RECORD =
  sig
    type dnd
    type 'a event_t
    type t = dnd event_t
    val t : (t, t) GObjectValue.accessor
    datatype event =
      DRAGENTER
    | DRAGLEAVE
    | DRAGMOTION
    | DRAGSTATUS
    | DROPSTART
    | DROPFINISHED
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
    val time : t -> LargeInt.int
*)
    structure C :
      sig
        type notnull
        type 'a p
        val withPtr :
          (notnull p -> 'a)
           -> t
           -> 'a
        val withOptPtr :
          (unit p -> 'a)
           -> t option
           -> 'a
        val fromPtr :
          bool
           -> notnull p
           -> t
        val fromOptPtr :
          bool
           -> unit p
           -> t option
      end
  end
