structure GLibMainContext :>
  G_LIB_MAIN_CONTEXT
    where type t = GLibMainContextRecord.t
    where type source_t = GLibSourceRecord.t
    where type source_func_t = GLibSourceFunc.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (externalFunctionSymbol "g_main_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (externalFunctionSymbol "g_main_context_new") (cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val acquire_ = call (externalFunctionSymbol "g_main_context_acquire") (GLibMainContextRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val dispatch_ = call (externalFunctionSymbol "g_main_context_dispatch") (GLibMainContextRecord.PolyML.cPtr --> cVoid)
      val findSourceById_ = call (externalFunctionSymbol "g_main_context_find_source_by_id") (GLibMainContextRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val invoke_ =
        call
          (externalFunctionSymbol "g_main_context_invoke_full")
          (
            GLibMainContextRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GLibSourceFunc.PolyML.cDispatchPtr
             &&> GLibSourceFunc.PolyML.cPtr
             &&> GLibSourceFunc.PolyML.cDestroyNotifyPtr
             --> cVoid
          )
      val isOwner_ = call (externalFunctionSymbol "g_main_context_is_owner") (GLibMainContextRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val iteration_ = call (externalFunctionSymbol "g_main_context_iteration") (GLibMainContextRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> GBool.PolyML.cVal)
      val pending_ = call (externalFunctionSymbol "g_main_context_pending") (GLibMainContextRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val popThreadDefault_ = call (externalFunctionSymbol "g_main_context_pop_thread_default") (GLibMainContextRecord.PolyML.cPtr --> cVoid)
      val prepare_ = call (externalFunctionSymbol "g_main_context_prepare") (GLibMainContextRecord.PolyML.cPtr &&> GInt.PolyML.cRef --> GBool.PolyML.cVal)
      val pushThreadDefault_ = call (externalFunctionSymbol "g_main_context_push_thread_default") (GLibMainContextRecord.PolyML.cPtr --> cVoid)
      val release_ = call (externalFunctionSymbol "g_main_context_release") (GLibMainContextRecord.PolyML.cPtr --> cVoid)
      val wakeup_ = call (externalFunctionSymbol "g_main_context_wakeup") (GLibMainContextRecord.PolyML.cPtr --> cVoid)
      val default_ = call (externalFunctionSymbol "g_main_context_default") (cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val getThreadDefault_ = call (externalFunctionSymbol "g_main_context_get_thread_default") (cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val refThreadDefault_ = call (externalFunctionSymbol "g_main_context_ref_thread_default") (cVoid --> GLibMainContextRecord.PolyML.cPtr)
    end
    type t = GLibMainContextRecord.t
    type source_t = GLibSourceRecord.t
    type source_func_t = GLibSourceFunc.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      val call = I ---> GLibMainContextRecord.FFI.fromPtr true
    in
      fun new () = call new_ ()
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun acquire self = call acquire_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> I
    in
      fun dispatch self = call dispatch_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false &&&> GUInt.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr false
    in
      fun findSourceById self sourceId = call findSourceById_ (self & sourceId) before GLibMainContextRecord.FFI.touchPtr self
    end
    local
      val call =
        GLibMainContextRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GLibSourceFunc.FFI.withDispatchPtr false
         &&&> GLibSourceFunc.FFI.withPtr false
         &&&> GLibSourceFunc.FFI.withDestroyNotifyPtr
         ---> I
    in
      fun invoke self (priority, function) =
        call invoke_
          (
            self
             & priority
             & ()
             & function
             & ()
          )
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isOwner self = call isOwner_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun iteration self mayBlock = call iteration_ (self & mayBlock)
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun pending self = call pending_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> I
    in
      fun popThreadDefault self = call popThreadDefault_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GBool.FFI.fromVal
    in
      fun prepare self =
        let
          val priority & retVal = call prepare_ (self & GInt.null)
        in
          if retVal then SOME priority else NONE
        end
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> I
    in
      fun pushThreadDefault self = call pushThreadDefault_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> I
    in
      fun release self = call release_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> I
    in
      fun wakeup self = call wakeup_ self
    end
    local
      val call = I ---> GLibMainContextRecord.FFI.fromPtr false
    in
      fun default () = call default_ ()
    end
    local
      val call = I ---> GLibMainContextRecord.FFI.fromPtr false
    in
      fun getThreadDefault () = call getThreadDefault_ ()
    end
    local
      val call = I ---> GLibMainContextRecord.FFI.fromPtr true
    in
      fun refThreadDefault () = call refThreadDefault_ ()
    end
  end
