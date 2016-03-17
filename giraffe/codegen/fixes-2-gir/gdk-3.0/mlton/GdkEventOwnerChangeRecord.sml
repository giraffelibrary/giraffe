structure GdkEventOwnerChangeRecord :>
  sig
    include GDK_EVENT_OWNER_CHANGE_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type owner_change = unit
    type 'a event_union = 'a GdkEvent.union
    type t = owner_change event_union


    datatype event =
      OWNER_CHANGE


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
