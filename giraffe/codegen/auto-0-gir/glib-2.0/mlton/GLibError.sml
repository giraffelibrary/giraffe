structure GLibError :>
  G_LIB_ERROR
    where type t = GLibErrorRecord.t =
  struct
    val getType_ = _import "g_error_get_type" : unit -> GObjectType.FFI.val_;
    type t = GLibErrorRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
