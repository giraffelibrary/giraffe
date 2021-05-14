signature GDK_EVENT_SETTING_RECORD =
  sig
    type setting
    type 'a event_union
    include
      RECORD
        where type t = setting event_union
    datatype event =
      SETTING
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
