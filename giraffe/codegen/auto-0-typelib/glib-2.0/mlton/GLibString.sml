structure GLibString :>
  G_LIB_STRING
    where type t = GLibStringRecord.t =
  struct
    val getType_ = _import "g_gstring_get_type" : unit -> GObjectType.FFI.val_;
    type t = GLibStringRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
