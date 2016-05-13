structure GLibSource :>
  G_LIB_SOURCE
    where type t = GLibSourceRecord.t
    where type main_context_t = GLibMainContextRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_source_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val addChildSource_ = call (load_sym libglib "g_source_add_child_source") (GLibSourceRecord.PolyML.cPtr &&> GLibSourceRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val attach_ = call (load_sym libglib "g_source_attach") (GLibSourceRecord.PolyML.cPtr &&> GLibMainContextRecord.PolyML.cOptPtr --> FFI.UInt.PolyML.cVal)
      val destroy_ = call (load_sym libglib "g_source_destroy") (GLibSourceRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getCanRecurse_ = call (load_sym libglib "g_source_get_can_recurse") (GLibSourceRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getContext_ = call (load_sym libglib "g_source_get_context") (GLibSourceRecord.PolyML.cPtr --> GLibMainContextRecord.PolyML.cPtr)
      val getId_ = call (load_sym libglib "g_source_get_id") (GLibSourceRecord.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val getName_ = call (load_sym libglib "g_source_get_name") (GLibSourceRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPriority_ = call (load_sym libglib "g_source_get_priority") (GLibSourceRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getTime_ = call (load_sym libglib "g_source_get_time") (GLibSourceRecord.PolyML.cPtr --> FFI.Int64.PolyML.cVal)
      val isDestroyed_ = call (load_sym libglib "g_source_is_destroyed") (GLibSourceRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val removeChildSource_ = call (load_sym libglib "g_source_remove_child_source") (GLibSourceRecord.PolyML.cPtr &&> GLibSourceRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setCanRecurse_ = call (load_sym libglib "g_source_set_can_recurse") (GLibSourceRecord.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setName_ = call (load_sym libglib "g_source_set_name") (GLibSourceRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setPriority_ = call (load_sym libglib "g_source_set_priority") (GLibSourceRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> PolyMLFFI.cVoid)
      val remove_ = call (load_sym libglib "g_source_remove") (FFI.UInt.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val setNameById_ = call (load_sym libglib "g_source_set_name_by_id") (FFI.UInt.PolyML.cVal &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
    type t = GLibSourceRecord.t
    type main_context_t = GLibMainContextRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addChildSource self childSource = (GLibSourceRecord.C.withPtr &&&> GLibSourceRecord.C.withPtr ---> I) addChildSource_ (self & childSource)
    fun attach self context = (GLibSourceRecord.C.withPtr &&&> GLibMainContextRecord.C.withOptPtr ---> FFI.UInt.C.fromVal) attach_ (self & context)
    fun destroy self = (GLibSourceRecord.C.withPtr ---> I) destroy_ self
    fun getCanRecurse self = (GLibSourceRecord.C.withPtr ---> FFI.Bool.C.fromVal) getCanRecurse_ self
    fun getContext self = (GLibSourceRecord.C.withPtr ---> GLibMainContextRecord.C.fromPtr false) getContext_ self
    fun getId self = (GLibSourceRecord.C.withPtr ---> FFI.UInt.C.fromVal) getId_ self
    fun getName self = (GLibSourceRecord.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getPriority self = (GLibSourceRecord.C.withPtr ---> FFI.Int.C.fromVal) getPriority_ self
    fun getTime self = (GLibSourceRecord.C.withPtr ---> FFI.Int64.C.fromVal) getTime_ self
    fun isDestroyed self = (GLibSourceRecord.C.withPtr ---> FFI.Bool.C.fromVal) isDestroyed_ self
    fun removeChildSource self childSource = (GLibSourceRecord.C.withPtr &&&> GLibSourceRecord.C.withPtr ---> I) removeChildSource_ (self & childSource)
    fun setCanRecurse self canRecurse = (GLibSourceRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCanRecurse_ (self & canRecurse)
    fun setName self name = (GLibSourceRecord.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
    fun setPriority self priority = (GLibSourceRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setPriority_ (self & priority)
    fun remove tag = (FFI.UInt.C.withVal ---> FFI.Bool.C.fromVal) remove_ tag
    fun setNameById tag name = (FFI.UInt.C.withVal &&&> Utf8.C.withPtr ---> I) setNameById_ (tag & name)
  end
