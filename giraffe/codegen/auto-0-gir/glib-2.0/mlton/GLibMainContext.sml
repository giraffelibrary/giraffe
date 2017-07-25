structure GLibMainContext :>
  G_LIB_MAIN_CONTEXT
    where type t = GLibMainContextRecord.t
    where type source_t = GLibSourceRecord.t =
  struct
    val getType_ = _import "g_main_context_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_main_context_new" : unit -> GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p;
    val acquire_ = _import "g_main_context_acquire" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> GBool.FFI.val_;
    val dispatch_ = _import "g_main_context_dispatch" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> unit;
    val findSourceById_ = fn x1 & x2 => (_import "g_main_context_find_source_by_id" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p * GUInt.FFI.val_ -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;) (x1, x2)
    val isOwner_ = _import "g_main_context_is_owner" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> GBool.FFI.val_;
    val iteration_ = fn x1 & x2 => (_import "g_main_context_iteration" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p * GBool.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val pending_ = _import "g_main_context_pending" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> GBool.FFI.val_;
    val popThreadDefault_ = _import "g_main_context_pop_thread_default" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> unit;
    val pushThreadDefault_ = _import "g_main_context_push_thread_default" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> unit;
    val release_ = _import "g_main_context_release" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> unit;
    val wakeup_ = _import "g_main_context_wakeup" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> unit;
    val default_ = _import "g_main_context_default" : unit -> GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p;
    val getThreadDefault_ = _import "g_main_context_get_thread_default" : unit -> GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p;
    type t = GLibMainContextRecord.t
    type source_t = GLibSourceRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GLibMainContextRecord.FFI.fromPtr true) new_ ()
    fun acquire self = (GLibMainContextRecord.FFI.withPtr ---> GBool.FFI.fromVal) acquire_ self
    fun dispatch self = (GLibMainContextRecord.FFI.withPtr ---> I) dispatch_ self
    fun findSourceById self sourceId = (GLibMainContextRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr false) findSourceById_ (self & sourceId)
    fun isOwner self = (GLibMainContextRecord.FFI.withPtr ---> GBool.FFI.fromVal) isOwner_ self
    fun iteration self mayBlock = (GLibMainContextRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) iteration_ (self & mayBlock)
    fun pending self = (GLibMainContextRecord.FFI.withPtr ---> GBool.FFI.fromVal) pending_ self
    fun popThreadDefault self = (GLibMainContextRecord.FFI.withPtr ---> I) popThreadDefault_ self
    fun pushThreadDefault self = (GLibMainContextRecord.FFI.withPtr ---> I) pushThreadDefault_ self
    fun release self = (GLibMainContextRecord.FFI.withPtr ---> I) release_ self
    fun wakeup self = (GLibMainContextRecord.FFI.withPtr ---> I) wakeup_ self
    fun default () = (I ---> GLibMainContextRecord.FFI.fromPtr false) default_ ()
    fun getThreadDefault () = (I ---> GLibMainContextRecord.FFI.fromPtr false) getThreadDefault_ ()
  end
