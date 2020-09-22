signature GDK_EVENT_PROPERTY_RECORD =
  sig
    type property
    type 'a event_union
    include
      RECORD
        where type t = property event_union
    datatype event =
      PROPERTY_NOTIFY
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
*)
  end
