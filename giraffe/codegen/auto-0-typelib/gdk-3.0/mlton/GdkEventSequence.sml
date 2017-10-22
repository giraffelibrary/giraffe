structure GdkEventSequence :>
  GDK_EVENT_SEQUENCE
    where type t = GdkEventSequenceRecord.t =
  struct
    val getType_ = _import "gdk_event_sequence_get_type" : unit -> GObjectType.FFI.val_;
    type t = GdkEventSequenceRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
