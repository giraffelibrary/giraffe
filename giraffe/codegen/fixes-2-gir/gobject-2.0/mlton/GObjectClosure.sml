structure GObjectClosure :>
  G_OBJECT_CLOSURE
    where type t = GObjectClosureRecord.t
    where type type_t = GObjectType.t
    where type 'a marshaller = 'a ClosureMarshal.marshaller =
  struct
    val getType_ = _import "g_closure_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      _import "giraffe_g_closure_new" :
        ClosureMarshal.FFI.non_opt ClosureMarshal.FFI.p -> GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p;
    val invalidate_ = _import "g_closure_invalidate" : GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p -> unit;
    type t = GObjectClosureRecord.t
    type type_t = GObjectType.t
    type 'a marshaller = 'a ClosureMarshal.marshaller
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new marshaller func =
      (ClosureMarshal.FFI.withPtr ---> GObjectClosureRecord.FFI.fromPtr false)
        new_
        (marshaller, func)
    fun invalidate self = (GObjectClosureRecord.FFI.withPtr false ---> I) invalidate_ self
  end
