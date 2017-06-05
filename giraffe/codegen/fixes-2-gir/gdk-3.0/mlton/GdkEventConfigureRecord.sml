structure GdkEventConfigureRecord :>
  GDK_EVENT_CONFIGURE_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.notnull = GdkEvent.C.notnull
    where type 'a C.p = 'a GdkEvent.C.p =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type configure = unit
    type t = configure union
    datatype event =
      CONFIGURE
  end
