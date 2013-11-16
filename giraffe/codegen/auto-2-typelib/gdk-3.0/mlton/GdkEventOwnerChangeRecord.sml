structure GdkEventOwnerChangeRecord :>
  sig
    include GDK_EVENT_OWNER_CHANGE_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type ownerchange = unit
    type 'a event_t = 'a GdkEvent.t
    type t = ownerchange event_t


    datatype event =
      OWNERCHANGE


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
