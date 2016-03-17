structure GdkEventProximityRecord :>
  sig
    include GDK_EVENT_PROXIMITY_RECORD
      where type 'a event_union = 'a GdkEvent.union
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type proximity = unit
    type 'a event_union = 'a GdkEvent.union
    type t = proximity event_union


    datatype event =
      PROXIMITY_IN
    | PROXIMITY_OUT


    structure C = GdkEvent.C


    val t = GdkEvent.t
    val tOpt = GdkEvent.tOpt
  end
