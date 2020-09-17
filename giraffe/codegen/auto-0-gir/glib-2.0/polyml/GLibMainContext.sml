structure GLibMainContext :>
  G_LIB_MAIN_CONTEXT
    where type t = GLibMainContextRecord.t
    where type source_t = GLibSourceRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_main_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_main_context_new") (cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val acquire_ = call (getSymbol "g_main_context_acquire") (GLibMainContextRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val dispatch_ = call (getSymbol "g_main_context_dispatch") (GLibMainContextRecord.PolyML.cPtr --> cVoid)
      val findSourceById_ = call (getSymbol "g_main_context_find_source_by_id") (GLibMainContextRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val isOwner_ = call (getSymbol "g_main_context_is_owner") (GLibMainContextRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val iteration_ = call (getSymbol "g_main_context_iteration") (GLibMainContextRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> GBool.PolyML.cVal)
      val pending_ = call (getSymbol "g_main_context_pending") (GLibMainContextRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val popThreadDefault_ = call (getSymbol "g_main_context_pop_thread_default") (GLibMainContextRecord.PolyML.cPtr --> cVoid)
      val pushThreadDefault_ = call (getSymbol "g_main_context_push_thread_default") (GLibMainContextRecord.PolyML.cPtr --> cVoid)
      val release_ = call (getSymbol "g_main_context_release") (GLibMainContextRecord.PolyML.cPtr --> cVoid)
      val wakeup_ = call (getSymbol "g_main_context_wakeup") (GLibMainContextRecord.PolyML.cPtr --> cVoid)
      val default_ = call (getSymbol "g_main_context_default") (cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val getThreadDefault_ = call (getSymbol "g_main_context_get_thread_default") (cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val refThreadDefault_ = call (getSymbol "g_main_context_ref_thread_default") (cVoid --> GLibMainContextRecord.PolyML.cPtr)
    end
    type t = GLibMainContextRecord.t
    type source_t = GLibSourceRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GLibMainContextRecord.FFI.fromPtr true) new_ ()
    fun acquire self = (GLibMainContextRecord.FFI.withPtr false ---> GBool.FFI.fromVal) acquire_ self
    fun dispatch self = (GLibMainContextRecord.FFI.withPtr false ---> I) dispatch_ self
    fun findSourceById self sourceId = (GLibMainContextRecord.FFI.withPtr false &&&> GUInt.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr false) findSourceById_ (self & sourceId) before GLibMainContextRecord.FFI.touchPtr self
    fun isOwner self = (GLibMainContextRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isOwner_ self
    fun iteration self mayBlock = (GLibMainContextRecord.FFI.withPtr false &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) iteration_ (self & mayBlock)
    fun pending self = (GLibMainContextRecord.FFI.withPtr false ---> GBool.FFI.fromVal) pending_ self
    fun popThreadDefault self = (GLibMainContextRecord.FFI.withPtr false ---> I) popThreadDefault_ self
    fun pushThreadDefault self = (GLibMainContextRecord.FFI.withPtr false ---> I) pushThreadDefault_ self
    fun release self = (GLibMainContextRecord.FFI.withPtr false ---> I) release_ self
    fun wakeup self = (GLibMainContextRecord.FFI.withPtr false ---> I) wakeup_ self
    fun default () = (I ---> GLibMainContextRecord.FFI.fromPtr false) default_ ()
    fun getThreadDefault () = (I ---> GLibMainContextRecord.FFI.fromPtr false) getThreadDefault_ ()
    fun refThreadDefault () = (I ---> GLibMainContextRecord.FFI.fromPtr true) refThreadDefault_ ()
  end
