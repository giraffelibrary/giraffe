structure GObjectClosure :>
  G_OBJECT_CLOSURE
    where type t = GObjectClosureRecord.t
    where type type_t = GObjectType.t
    where type 'a marshaller = 'a ClosureMarshal.marshaller =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (externalFunctionSymbol "g_closure_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call
          (externalFunctionSymbol "giraffe_g_closure_new")
          (
            ClosureMarshal.PolyML.cDispatchPtr
             &&> ClosureMarshal.PolyML.cPtr
             &&> ClosureMarshal.PolyML.cDestroyNotifyPtr
             --> GObjectClosureRecord.PolyML.cPtr
          )
      val invalidate_ = call (externalFunctionSymbol "g_closure_invalidate") (GObjectClosureRecord.PolyML.cPtr --> cVoid)
    end
    type t = GObjectClosureRecord.t
    type type_t = GObjectType.t
    type 'a marshaller = 'a ClosureMarshal.marshaller
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      val call =
        ClosureMarshal.FFI.withDispatchPtr
         &&&> ClosureMarshal.FFI.withPtr
         &&&> ClosureMarshal.FFI.withDestroyNotifyPtr
         ---> GObjectClosureRecord.FFI.fromPtr false
    in
      fun new marshallerFunc =
        call new_
          (
            ()
             & ClosureMarshal.makeCallback marshallerFunc
             & ()
          )
    end
    local
      val call = GObjectClosureRecord.FFI.withPtr false ---> I
    in
      fun invalidate self = call invalidate_ self
    end
  end
