structure GLibSource :>
  G_LIB_SOURCE
    where type t = GLibSourceRecord.t
    where type main_context_t = GLibMainContextRecord.t
    where type time_val_t = GLibTimeValRecord.t =
  struct
    val getType_ = _import "g_source_get_type" : unit -> GObjectType.FFI.val_;
    val addChildSource_ = fn x1 & x2 => (_import "g_source_add_child_source" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p * GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p -> unit;) (x1, x2)
    val attach_ = fn x1 & x2 => (_import "g_source_attach" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p * unit GLibMainContextRecord.FFI.p -> GUInt.FFI.val_;) (x1, x2)
    val destroy_ = _import "g_source_destroy" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p -> unit;
    val getCanRecurse_ = _import "g_source_get_can_recurse" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p -> GBool.FFI.val_;
    val getContext_ = _import "g_source_get_context" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p -> GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p;
    val getCurrentTime_ = fn x1 & x2 => (_import "g_source_get_current_time" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p * GLibTimeValRecord.FFI.notnull GLibTimeValRecord.FFI.p -> unit;) (x1, x2)
    val getId_ = _import "g_source_get_id" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p -> GUInt.FFI.val_;
    val getName_ = _import "g_source_get_name" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPriority_ = _import "g_source_get_priority" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p -> GInt.FFI.val_;
    val getTime_ = _import "g_source_get_time" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p -> GInt64.FFI.val_;
    val isDestroyed_ = _import "g_source_is_destroyed" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p -> GBool.FFI.val_;
    val removeChildSource_ = fn x1 & x2 => (_import "g_source_remove_child_source" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p * GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p -> unit;) (x1, x2)
    val setCanRecurse_ = fn x1 & x2 => (_import "g_source_set_can_recurse" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_source_set_name" :
              GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPriority_ = fn x1 & x2 => (_import "g_source_set_priority" : GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val remove_ = _import "g_source_remove" : GUInt.FFI.val_ -> GBool.FFI.val_;
    val setNameById_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_source_set_name_by_id" :
              GUInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GLibSourceRecord.t
    type main_context_t = GLibMainContextRecord.t
    type time_val_t = GLibTimeValRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addChildSource self childSource = (GLibSourceRecord.FFI.withPtr &&&> GLibSourceRecord.FFI.withPtr ---> I) addChildSource_ (self & childSource)
    fun attach self context = (GLibSourceRecord.FFI.withPtr &&&> GLibMainContextRecord.FFI.withOptPtr ---> GUInt.FFI.fromVal) attach_ (self & context)
    fun destroy self = (GLibSourceRecord.FFI.withPtr ---> I) destroy_ self
    fun getCanRecurse self = (GLibSourceRecord.FFI.withPtr ---> GBool.FFI.fromVal) getCanRecurse_ self
    fun getContext self = (GLibSourceRecord.FFI.withPtr ---> GLibMainContextRecord.FFI.fromPtr false) getContext_ self
    fun getCurrentTime self timeval = (GLibSourceRecord.FFI.withPtr &&&> GLibTimeValRecord.FFI.withPtr ---> I) getCurrentTime_ (self & timeval)
    fun getId self = (GLibSourceRecord.FFI.withPtr ---> GUInt.FFI.fromVal) getId_ self
    fun getName self = (GLibSourceRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getPriority self = (GLibSourceRecord.FFI.withPtr ---> GInt.FFI.fromVal) getPriority_ self
    fun getTime self = (GLibSourceRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getTime_ self
    fun isDestroyed self = (GLibSourceRecord.FFI.withPtr ---> GBool.FFI.fromVal) isDestroyed_ self
    fun removeChildSource self childSource = (GLibSourceRecord.FFI.withPtr &&&> GLibSourceRecord.FFI.withPtr ---> I) removeChildSource_ (self & childSource)
    fun setCanRecurse self canRecurse = (GLibSourceRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setCanRecurse_ (self & canRecurse)
    fun setName self name = (GLibSourceRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setName_ (self & name)
    fun setPriority self priority = (GLibSourceRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setPriority_ (self & priority)
    fun remove tag = (GUInt.FFI.withVal ---> GBool.FFI.fromVal) remove_ tag
    fun setNameById (tag, name) = (GUInt.FFI.withVal &&&> Utf8.FFI.withPtr ---> I) setNameById_ (tag & name)
  end
