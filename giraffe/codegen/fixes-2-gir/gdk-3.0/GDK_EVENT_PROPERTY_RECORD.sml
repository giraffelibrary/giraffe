signature GDK_EVENT_PROPERTY_RECORD =
  sig
    type property
    type 'a event_union
    include RECORD where type t = property event_union
    datatype event =
      PROPERTY_NOTIFY
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
*)
  end
