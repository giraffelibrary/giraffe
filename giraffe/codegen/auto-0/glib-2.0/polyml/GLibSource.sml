structure GLibSource :>
  G_LIB_SOURCE
    where type record_t = GLibSourceRecord.t
    where type maincontextrecord_t = GLibMainContextRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_source_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val addChildSource_ = call (load_sym libglib "g_source_add_child_source") (GLibSourceRecord.PolyML.PTR &&> GLibSourceRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val attach_ = call (load_sym libglib "g_source_attach") (GLibSourceRecord.PolyML.PTR &&> GLibMainContextRecord.PolyML.PTR --> FFI.PolyML.Word32.VAL)
      val destroy_ = call (load_sym libglib "g_source_destroy") (GLibSourceRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getCanRecurse_ = call (load_sym libglib "g_source_get_can_recurse") (GLibSourceRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getContext_ = call (load_sym libglib "g_source_get_context") (GLibSourceRecord.PolyML.PTR --> GLibMainContextRecord.PolyML.PTR)
      val getId_ = call (load_sym libglib "g_source_get_id") (GLibSourceRecord.PolyML.PTR --> FFI.PolyML.Word32.VAL)
      val getName_ = call (load_sym libglib "g_source_get_name") (GLibSourceRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getPriority_ = call (load_sym libglib "g_source_get_priority") (GLibSourceRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getTime_ = call (load_sym libglib "g_source_get_time") (GLibSourceRecord.PolyML.PTR --> FFI.PolyML.Int64.VAL)
      val isDestroyed_ = call (load_sym libglib "g_source_is_destroyed") (GLibSourceRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val removeChildSource_ = call (load_sym libglib "g_source_remove_child_source") (GLibSourceRecord.PolyML.PTR &&> GLibSourceRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setCanRecurse_ = call (load_sym libglib "g_source_set_can_recurse") (GLibSourceRecord.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setName_ = call (load_sym libglib "g_source_set_name") (GLibSourceRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setPriority_ = call (load_sym libglib "g_source_set_priority") (GLibSourceRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val remove_ = call (load_sym libglib "g_source_remove") (FFI.PolyML.Word32.VAL --> FFI.PolyML.Bool.VAL)
      val setNameById_ = call (load_sym libglib "g_source_set_name_by_id") (FFI.PolyML.Word32.VAL &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
    end
    type record_t = GLibSourceRecord.t
    type maincontextrecord_t = GLibMainContextRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addChildSource self childSource = (GLibSourceRecord.C.withPtr &&&> GLibSourceRecord.C.withPtr ---> I) addChildSource_ (self & childSource)
    fun attach self context = (GLibSourceRecord.C.withPtr &&&> GLibMainContextRecord.C.withPtr ---> FFI.Word32.fromVal) attach_ (self & context)
    fun destroy self = (GLibSourceRecord.C.withPtr ---> I) destroy_ self
    fun getCanRecurse self = (GLibSourceRecord.C.withPtr ---> FFI.Bool.fromVal) getCanRecurse_ self
    fun getContext self = (GLibSourceRecord.C.withPtr ---> GLibMainContextRecord.C.fromPtr false) getContext_ self
    fun getId self = (GLibSourceRecord.C.withPtr ---> FFI.Word32.fromVal) getId_ self
    fun getName self = (GLibSourceRecord.C.withPtr ---> FFI.String.fromPtr false) getName_ self
    fun getPriority self = (GLibSourceRecord.C.withPtr ---> FFI.Int32.fromVal) getPriority_ self
    fun getTime self = (GLibSourceRecord.C.withPtr ---> FFI.Int64.fromVal) getTime_ self
    fun isDestroyed self = (GLibSourceRecord.C.withPtr ---> FFI.Bool.fromVal) isDestroyed_ self
    fun removeChildSource self childSource = (GLibSourceRecord.C.withPtr &&&> GLibSourceRecord.C.withPtr ---> I) removeChildSource_ (self & childSource)
    fun setCanRecurse self canRecurse = (GLibSourceRecord.C.withPtr &&&> FFI.Bool.withVal ---> I) setCanRecurse_ (self & canRecurse)
    fun setName self name = (GLibSourceRecord.C.withPtr &&&> FFI.String.withConstPtr ---> I) setName_ (self & name)
    fun setPriority self priority = (GLibSourceRecord.C.withPtr &&&> FFI.Int32.withVal ---> I) setPriority_ (self & priority)
    fun remove tag = (FFI.Word32.withVal ---> FFI.Bool.fromVal) remove_ tag
    fun setNameById tag name = (FFI.Word32.withVal &&&> FFI.String.withConstPtr ---> I) setNameById_ (tag & name)
  end
