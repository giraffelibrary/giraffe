structure GdkEventPropertyRecord :>
  sig
    include GDK_EVENT_PROPERTY_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type property = unit
    type 'a event_union = 'a GdkEvent.union
    type t = property event_union


    datatype event =
      PROPERTY_NOTIFY


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
