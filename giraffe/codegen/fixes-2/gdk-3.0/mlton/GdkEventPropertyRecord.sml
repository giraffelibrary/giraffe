structure GdkEventPropertyRecord :>
  sig
    include GDK_EVENT_PROPERTY_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type property = unit
    type 'a event_t = 'a GdkEvent.t
    type t = property event_t


    datatype event =
      PROPERTYNOTIFY


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
