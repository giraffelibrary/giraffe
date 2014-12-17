structure GLibSource :>
  G_LIB_SOURCE
    where type record_t = GLibSourceRecord.t
    where type maincontextrecord_t = GLibMainContextRecord.t =
  struct
    val getType_ = _import "g_source_get_type" : unit -> GObjectType.C.val_;
    val addChildSource_ = fn x1 & x2 => (_import "g_source_add_child_source" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p * GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> unit;) (x1, x2)
    val attach_ = fn x1 & x2 => (_import "g_source_attach" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p * GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p -> FFI.UInt32.C.val_;) (x1, x2)
    val destroy_ = _import "g_source_destroy" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> unit;
    val getCanRecurse_ = _import "g_source_get_can_recurse" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> FFI.Bool.C.val_;
    val getContext_ = _import "g_source_get_context" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p;
    val getId_ = _import "g_source_get_id" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> FFI.UInt32.C.val_;
    val getName_ = _import "g_source_get_name" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getPriority_ = _import "g_source_get_priority" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> FFI.Int32.C.val_;
    val getTime_ = _import "g_source_get_time" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> FFI.Int64.C.val_;
    val isDestroyed_ = _import "g_source_is_destroyed" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> FFI.Bool.C.val_;
    val removeChildSource_ = fn x1 & x2 => (_import "g_source_remove_child_source" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p * GLibSourceRecord.C.notnull GLibSourceRecord.C.p -> unit;) (x1, x2)
    val setCanRecurse_ = fn x1 & x2 => (_import "g_source_set_can_recurse" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
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
    val setPriority_ = fn x1 & x2 => (_import "g_source_set_priority" : GLibSourceRecord.C.notnull GLibSourceRecord.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val remove_ = _import "g_source_remove" : FFI.UInt32.C.val_ -> FFI.Bool.C.val_;
    val setNameById_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_source_set_name_by_id" :
              FFI.UInt32.C.val_
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
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addChildSource self childSource = (GLibSourceRecord.C.withPtr &&&> GLibSourceRecord.C.withPtr ---> I) addChildSource_ (self & childSource)
    fun attach self context = (GLibSourceRecord.C.withPtr &&&> GLibMainContextRecord.C.withPtr ---> FFI.UInt32.C.fromVal) attach_ (self & context)
    fun destroy self = (GLibSourceRecord.C.withPtr ---> I) destroy_ self
    fun getCanRecurse self = (GLibSourceRecord.C.withPtr ---> FFI.Bool.C.fromVal) getCanRecurse_ self
    fun getContext self = (GLibSourceRecord.C.withPtr ---> GLibMainContextRecord.C.fromPtr false) getContext_ self
    fun getId self = (GLibSourceRecord.C.withPtr ---> FFI.UInt32.C.fromVal) getId_ self
    fun getName self = (GLibSourceRecord.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getPriority self = (GLibSourceRecord.C.withPtr ---> FFI.Int32.C.fromVal) getPriority_ self
    fun getTime self = (GLibSourceRecord.C.withPtr ---> FFI.Int64.C.fromVal) getTime_ self
    fun isDestroyed self = (GLibSourceRecord.C.withPtr ---> FFI.Bool.C.fromVal) isDestroyed_ self
    fun removeChildSource self childSource = (GLibSourceRecord.C.withPtr &&&> GLibSourceRecord.C.withPtr ---> I) removeChildSource_ (self & childSource)
    fun setCanRecurse self canRecurse = (GLibSourceRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCanRecurse_ (self & canRecurse)
    fun setName self name = (GLibSourceRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setName_ (self & name)
    fun setPriority self priority = (GLibSourceRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setPriority_ (self & priority)
    fun remove tag = (FFI.UInt32.C.withVal ---> FFI.Bool.C.fromVal) remove_ tag
    fun setNameById tag name = (FFI.UInt32.C.withVal &&&> FFI.String.C.withConstPtr ---> I) setNameById_ (tag & name)
  end
