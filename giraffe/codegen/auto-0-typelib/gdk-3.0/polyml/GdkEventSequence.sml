structure GdkEventSequence :>
  GDK_EVENT_SEQUENCE
    where type t = GdkEventSequenceRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_event_sequence_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type t = GdkEventSequenceRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
