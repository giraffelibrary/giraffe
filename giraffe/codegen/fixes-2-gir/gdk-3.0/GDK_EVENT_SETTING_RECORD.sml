signature GDK_EVENT_SETTING_RECORD =
  sig
    type setting
    type 'a event_union
    include RECORD where type t = setting event_union
    datatype event =
      SETTING
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
*)
  end
