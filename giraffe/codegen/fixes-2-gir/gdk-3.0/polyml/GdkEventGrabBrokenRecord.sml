structure GdkEventGrabBrokenRecord :>
  sig
    include GDK_EVENT_GRAB_BROKEN_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p

    structure PolyML :
      sig
        val PTR : C.notnull C.p CInterface.Conversion
        val OPTPTR : unit C.p CInterface.Conversion
      end
  end =
  struct
    type grab_broken = unit
    type 'a event_t = 'a GdkEvent.t
    type t = grab_broken event_t


    datatype event =
      GRAB_BROKEN


    structure C = GdkEvent.C
    structure PolyML = GdkEvent.PolyML


    val t = GdkEvent.t
  end
