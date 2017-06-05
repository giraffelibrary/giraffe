signature GDK_EVENT_ANY_RECORD =
  sig
    type any
    type 'a event_union
    include RECORD where type t = any event_union
    datatype event =
      DELETE
    | DESTROY
    | MAP
    | UNMAP
    | CLIENT_EVENT
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
*)
  end
