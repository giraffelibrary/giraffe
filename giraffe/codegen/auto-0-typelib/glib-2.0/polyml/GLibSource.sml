structure GLibSource :>
  G_LIB_SOURCE
    where type t = GLibSourceRecord.t
    where type main_context_t = GLibMainContextRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_source_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addChildSource_ = call (getSymbol "g_source_add_child_source") (GLibSourceRecord.PolyML.cPtr &&> GLibSourceRecord.PolyML.cPtr --> cVoid)
      val attach_ = call (getSymbol "g_source_attach") (GLibSourceRecord.PolyML.cPtr &&> GLibMainContextRecord.PolyML.cOptPtr --> GUInt32.PolyML.cVal)
      val destroy_ = call (getSymbol "g_source_destroy") (GLibSourceRecord.PolyML.cPtr --> cVoid)
      val getCanRecurse_ = call (getSymbol "g_source_get_can_recurse") (GLibSourceRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getContext_ = call (getSymbol "g_source_get_context") (GLibSourceRecord.PolyML.cPtr --> GLibMainContextRecord.PolyML.cPtr)
      val getId_ = call (getSymbol "g_source_get_id") (GLibSourceRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getName_ = call (getSymbol "g_source_get_name") (GLibSourceRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPriority_ = call (getSymbol "g_source_get_priority") (GLibSourceRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getTime_ = call (getSymbol "g_source_get_time") (GLibSourceRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val isDestroyed_ = call (getSymbol "g_source_is_destroyed") (GLibSourceRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val removeChildSource_ = call (getSymbol "g_source_remove_child_source") (GLibSourceRecord.PolyML.cPtr &&> GLibSourceRecord.PolyML.cPtr --> cVoid)
      val setCanRecurse_ = call (getSymbol "g_source_set_can_recurse") (GLibSourceRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setName_ = call (getSymbol "g_source_set_name") (GLibSourceRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setPriority_ = call (getSymbol "g_source_set_priority") (GLibSourceRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val remove_ = call (getSymbol "g_source_remove") (GUInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val setNameById_ = call (getSymbol "g_source_set_name_by_id") (GUInt32.PolyML.cVal &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type t = GLibSourceRecord.t
    type main_context_t = GLibMainContextRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addChildSource self childSource = (GLibSourceRecord.FFI.withPtr &&&> GLibSourceRecord.FFI.withPtr ---> I) addChildSource_ (self & childSource)
    fun attach self context = (GLibSourceRecord.FFI.withPtr &&&> GLibMainContextRecord.FFI.withOptPtr ---> GUInt32.FFI.fromVal) attach_ (self & context)
    fun destroy self = (GLibSourceRecord.FFI.withPtr ---> I) destroy_ self
    fun getCanRecurse self = (GLibSourceRecord.FFI.withPtr ---> GBool.FFI.fromVal) getCanRecurse_ self
    fun getContext self = (GLibSourceRecord.FFI.withPtr ---> GLibMainContextRecord.FFI.fromPtr false) getContext_ self
    fun getId self = (GLibSourceRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) getId_ self
    fun getName self = (GLibSourceRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getPriority self = (GLibSourceRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getPriority_ self
    fun getTime self = (GLibSourceRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getTime_ self
    fun isDestroyed self = (GLibSourceRecord.FFI.withPtr ---> GBool.FFI.fromVal) isDestroyed_ self
    fun removeChildSource self childSource = (GLibSourceRecord.FFI.withPtr &&&> GLibSourceRecord.FFI.withPtr ---> I) removeChildSource_ (self & childSource)
    fun setCanRecurse self canRecurse = (GLibSourceRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setCanRecurse_ (self & canRecurse)
    fun setName self name = (GLibSourceRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setName_ (self & name)
    fun setPriority self priority = (GLibSourceRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setPriority_ (self & priority)
    fun remove tag = (GUInt32.FFI.withVal ---> GBool.FFI.fromVal) remove_ tag
    fun setNameById tag name = (GUInt32.FFI.withVal &&&> Utf8.FFI.withPtr ---> I) setNameById_ (tag & name)
  end
