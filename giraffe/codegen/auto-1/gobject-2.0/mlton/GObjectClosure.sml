structure GObjectClosure :>
  G_OBJECT_CLOSURE
    where type record_t = GObjectClosureRecord.t
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "g_closure_get_type" : unit -> GObjectType.C.val_;
    val invalidate_ = _import "g_closure_invalidate" : GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p -> unit;
    type record_t = GObjectClosureRecord.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun invalidate self = (GObjectClosureRecord.C.withPtr ---> I) invalidate_ self
  end
