structure GObjectClosure :>
  G_OBJECT_CLOSURE
    where type t = GObjectClosureRecord.t
    where type type_t = GObjectType.t
    where type 'a marshaller = 'a ClosureMarshal.marshaller =
  struct
    val getType_ = _import "g_closure_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "giraffe_g_closure_new" :
              ClosureMarshal.FFI.non_opt ClosureMarshal.FFI.dispatch_p
               * ClosureMarshal.FFI.non_opt ClosureMarshal.FFI.p
               * ClosureMarshal.FFI.destroy_notify_p
               -> GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val invalidate_ = _import "g_closure_invalidate" : GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p -> unit;
    type t = GObjectClosureRecord.t
    type type_t = GObjectType.t
    type 'a marshaller = 'a ClosureMarshal.marshaller
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new marshallerFunc =
      (
        ClosureMarshal.FFI.withDispatchPtr
         &&&> ClosureMarshal.FFI.withPtr
         &&&> ClosureMarshal.FFI.withDestroyNotifyPtr
         ---> GObjectClosureRecord.FFI.fromPtr false
      )
        new_
        (
          ()
           & marshallerFunc
           & ()
        )
    fun invalidate self = (GObjectClosureRecord.FFI.withPtr false ---> I) invalidate_ self
  end
