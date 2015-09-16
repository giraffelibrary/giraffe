structure GdkEventOwnerChangeRecord :>
  sig
    include GDK_EVENT_OWNER_CHANGE_RECORD
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
    type owner_change = unit
    type 'a event_t = 'a GdkEvent.t
    type t = owner_change event_t


    datatype event =
      OWNER_CHANGE


    structure C = GdkEvent.C
    structure PolyML = GdkEvent.PolyML


    val t = GdkEvent.t
  end
