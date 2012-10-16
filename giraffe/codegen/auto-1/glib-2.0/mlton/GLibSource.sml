structure GLibSource :>
  G_LIB_SOURCE
    where type record_t = GLibSourceRecord.t
    where type maincontextrecord_t = GLibMainContextRecord.t =
  struct
    val getType_ = _import "g_source_get_type" : unit -> GObjectType.C.val_;
    val addChildSource_ = fn x1 & x2 => (_import "g_source_add_child_source" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p * GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> unit;) (x1, x2)
    val attach_ = fn x1 & x2 => (_import "g_source_attach" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p * unit GLibMainContextRecord.C.p -> FFI.Word32.val_;) (x1, x2)
    val destroy_ = _import "g_source_destroy" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> unit;
    val getCanRecurse_ = _import "g_source_get_can_recurse" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> FFI.Bool.val_;
    val getContext_ = _import "g_source_get_context" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p;
    val getId_ = _import "g_source_get_id" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> FFI.Word32.val_;
    val getName_ = _import "g_source_get_name" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> FFI.String.notnull FFI.String.out_p;
    val getPriority_ = _import "g_source_get_priority" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> FFI.Int32.val_;
    val getTime_ = _import "g_source_get_time" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> FFI.Int64.val_;
    val isDestroyed_ = _import "g_source_is_destroyed" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> FFI.Bool.val_;
    val removeChildSource_ = fn x1 & x2 => (_import "g_source_remove_child_source" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p * GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> unit;) (x1, x2)
    val setCanRecurse_ = fn x1 & x2 => (_import "g_source_set_can_recurse" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_source_set_name" :
              GLibSourceRecord.C.notnull GLibSourceRecord.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPriority_ = fn x1 & x2 => (_import "g_source_set_priority" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p * FFI.Int32.val_ -> unit;) (x1, x2)
    val remove_ = _import "g_source_remove" : FFI.Word32.val_ -> FFI.Bool.val_;
    val setNameById_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_source_set_name_by_id" :
              FFI.Word32.val_
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type record_t = GLibSourceRecord.t
    type maincontextrecord_t = GLibMainContextRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addChildSource self childSource = (GLibSourceRecord.C.withPtr &&&> GLibSourceRecord.C.withPtr ---> I) addChildSource_ (self & childSource)
    fun attach self context = (GLibSourceRecord.C.withPtr &&&> GLibMainContextRecord.C.withOptPtr ---> FFI.Word32.fromVal) attach_ (self & context)
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
