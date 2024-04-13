structure GObjectClosure :>
  G_OBJECT_CLOSURE
    where type t = GObjectClosureRecord.t
    where type type_t = GObjectType.t
    where type callback = ClosureMarshal.callback =
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
    type callback = ClosureMarshal.callback
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      val call =
        ClosureMarshal.FFI.withDispatchPtr
         &&&> ClosureMarshal.FFI.withPtr
         &&&> ClosureMarshal.FFI.withDestroyNotifyPtr
         ---> GObjectClosureRecord.FFI.fromPtr false
    in
      fun new callback =
        call new_
          (
            ()
             & callback
             & ()
          )
    end
    local
      val call = GObjectClosureRecord.FFI.withPtr false ---> I
    in
      fun invalidate self = call invalidate_ self
    end
  end
