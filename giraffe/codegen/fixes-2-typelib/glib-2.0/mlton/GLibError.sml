structure GLibError :>
  G_LIB_ERROR
    where type record_t = GLibErrorRecord.t =
  struct
    val getType_ = _import "g_error_get_type" : unit -> GObjectType.C.val_;
    type record_t = GLibErrorRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
