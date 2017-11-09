signature GDK_EVENT_VISIBILITY_RECORD =
  sig
    type visibility
    type 'a event_union
    include RECORD where type t = visibility event_union
    datatype event =
      VISIBILITY_NOTIFY
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
*)
  end
