signature GDK_EVENT_SETTING_RECORD =
  sig
    type setting
    type 'a event_union
    include
      RECORD
        where type t = setting event_union
    datatype event =
      SETTING
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
(*
    val window : t -> base Window.t
    val sendEvent : t -> bool
*)
  end
