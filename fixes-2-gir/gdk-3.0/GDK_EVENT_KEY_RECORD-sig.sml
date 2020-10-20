signature GDK_EVENT_KEY_RECORD =
  sig
    type key
    type 'a event_union
    include
      RECORD
        where type t = key event_union
    datatype event =
      KEY_PRESS
    | KEY_RELEASE
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
  end
