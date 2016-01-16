structure GdkEventVisibilityRecord :>
  sig
    include GDK_EVENT_VISIBILITY_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p

    structure PolyML :
      sig
        val PTR : C.notnull C.p PolyMLFFI.conversion
        val OPTPTR : unit C.p PolyMLFFI.conversion
      end
  end =
  struct
    type visibility = unit
    type 'a event_t = 'a GdkEvent.t
    type t = visibility event_t


    datatype event =
      VISIBILITY_NOTIFY


    structure C = GdkEvent.C
    structure PolyML = GdkEvent.PolyML


    val t = GdkEvent.t
  end
