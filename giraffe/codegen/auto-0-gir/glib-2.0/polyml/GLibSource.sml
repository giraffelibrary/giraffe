structure GLibSource :>
  G_LIB_SOURCE
    where type record_t = GLibSourceRecord.t
    where type main_context_record_t = GLibMainContextRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_source_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val addChildSource_ = call (load_sym libglib "g_source_add_child_source") (GLibSourceRecord.PolyML.PTR &&> GLibSourceRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val attach_ = call (load_sym libglib "g_source_attach") (GLibSourceRecord.PolyML.PTR &&> GLibMainContextRecord.PolyML.OPTPTR --> FFI.UInt.PolyML.VAL)
      val destroy_ = call (load_sym libglib "g_source_destroy") (GLibSourceRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getCanRecurse_ = call (load_sym libglib "g_source_get_can_recurse") (GLibSourceRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getContext_ = call (load_sym libglib "g_source_get_context") (GLibSourceRecord.PolyML.PTR --> GLibMainContextRecord.PolyML.PTR)
      val getId_ = call (load_sym libglib "g_source_get_id") (GLibSourceRecord.PolyML.PTR --> FFI.UInt.PolyML.VAL)
      val getName_ = call (load_sym libglib "g_source_get_name") (GLibSourceRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getPriority_ = call (load_sym libglib "g_source_get_priority") (GLibSourceRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getTime_ = call (load_sym libglib "g_source_get_time") (GLibSourceRecord.PolyML.PTR --> FFI.Int64.PolyML.VAL)
      val isDestroyed_ = call (load_sym libglib "g_source_is_destroyed") (GLibSourceRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val removeChildSource_ = call (load_sym libglib "g_source_remove_child_source") (GLibSourceRecord.PolyML.PTR &&> GLibSourceRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setCanRecurse_ = call (load_sym libglib "g_source_set_can_recurse") (GLibSourceRecord.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setName_ = call (load_sym libglib "g_source_set_name") (GLibSourceRecord.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setPriority_ = call (load_sym libglib "g_source_set_priority") (GLibSourceRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val remove_ = call (load_sym libglib "g_source_remove") (FFI.UInt.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val setNameById_ = call (load_sym libglib "g_source_set_name_by_id") (FFI.UInt.PolyML.VAL &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type record_t = GLibSourceRecord.t
    type main_context_record_t = GLibMainContextRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addChildSource self childSource = (GLibSourceRecord.C.withPtr &&&> GLibSourceRecord.C.withPtr ---> I) addChildSource_ (self & childSource)
    fun attach self context = (GLibSourceRecord.C.withPtr &&&> GLibMainContextRecord.C.withOptPtr ---> FFI.UInt.C.fromVal) attach_ (self & context)
    fun destroy self = (GLibSourceRecord.C.withPtr ---> I) destroy_ self
    fun getCanRecurse self = (GLibSourceRecord.C.withPtr ---> FFI.Bool.C.fromVal) getCanRecurse_ self
    fun getContext self = (GLibSourceRecord.C.withPtr ---> GLibMainContextRecord.C.fromPtr false) getContext_ self
    fun getId self = (GLibSourceRecord.C.withPtr ---> FFI.UInt.C.fromVal) getId_ self
    fun getName self = (GLibSourceRecord.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getPriority self = (GLibSourceRecord.C.withPtr ---> FFI.Int.C.fromVal) getPriority_ self
    fun getTime self = (GLibSourceRecord.C.withPtr ---> FFI.Int64.C.fromVal) getTime_ self
    fun isDestroyed self = (GLibSourceRecord.C.withPtr ---> FFI.Bool.C.fromVal) isDestroyed_ self
    fun removeChildSource self childSource = (GLibSourceRecord.C.withPtr &&&> GLibSourceRecord.C.withPtr ---> I) removeChildSource_ (self & childSource)
    fun setCanRecurse self canRecurse = (GLibSourceRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCanRecurse_ (self & canRecurse)
    fun setName self name = (GLibSourceRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setName_ (self & name)
    fun setPriority self priority = (GLibSourceRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setPriority_ (self & priority)
    fun remove tag = (FFI.UInt.C.withVal ---> FFI.Bool.C.fromVal) remove_ tag
    fun setNameById tag name = (FFI.UInt.C.withVal &&&> FFI.String.C.withConstPtr ---> I) setNameById_ (tag & name)
  end
