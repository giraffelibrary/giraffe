structure GdkEventPropertyRecord :>
  GDK_EVENT_PROPERTY_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.notnull = GdkEvent.C.notnull
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type property = unit
    type t = property union
    datatype event =
      PROPERTY_NOTIFY
  end
