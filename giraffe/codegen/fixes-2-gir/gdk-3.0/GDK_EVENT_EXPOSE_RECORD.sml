signature GDK_EVENT_EXPOSE_RECORD =
  sig
    type expose
    type 'a event_union
    include RECORD where type t = expose event_union
    datatype event =
      EXPOSE
    | DAMAGE
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
*)
  end
