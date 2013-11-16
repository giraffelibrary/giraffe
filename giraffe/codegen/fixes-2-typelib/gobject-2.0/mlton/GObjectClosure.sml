structure GObjectClosure :>
  G_OBJECT_CLOSURE
    where type record_t = GObjectClosureRecord.t
    where type type_t = GObjectType.t
    where type 'a marshaller = 'a ClosureMarshal.marshaller =
  struct
    val getType_ = _import "g_closure_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      _import "giraffe_g_closure_new" :
        ClosureMarshal.C.callback -> GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p;
    val invalidate_ = _import "g_closure_invalidate" : GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p -> unit;
    type record_t = GObjectClosureRecord.t
    type type_t = GObjectType.t
    type 'a marshaller = 'a ClosureMarshal.marshaller
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new marshaller callback =
      (ClosureMarshal.C.withCallback ---> GObjectClosureRecord.C.fromPtr false)
        new_
        (marshaller, callback)
    fun invalidate self = (GObjectClosureRecord.C.withPtr ---> I) invalidate_ self
  end
