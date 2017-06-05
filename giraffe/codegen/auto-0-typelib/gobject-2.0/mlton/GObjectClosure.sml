structure GObjectClosure :>
  G_OBJECT_CLOSURE
    where type t = GObjectClosureRecord.t
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "g_closure_get_type" : unit -> GObjectType.FFI.val_;
    val invalidate_ = _import "g_closure_invalidate" : GObjectClosureRecord.FFI.notnull GObjectClosureRecord.FFI.p -> unit;
    type t = GObjectClosureRecord.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun invalidate self = (GObjectClosureRecord.FFI.withPtr ---> I) invalidate_ self
  end
