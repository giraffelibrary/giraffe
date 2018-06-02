structure GioTask :>
  GIO_TASK
    where type 'a class = 'a GioTaskClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_task_get_type" : unit -> GObjectType.FFI.val_;
    val isValid_ = fn x1 & x2 => (_import "g_task_is_valid" : GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p * unit GObjectObjectClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getCancellable_ = _import "g_task_get_cancellable" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p -> GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p;
    val getCheckCancellable_ = _import "g_task_get_check_cancellable" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p -> GBool.FFI.val_;
    val getCompleted_ = _import "g_task_get_completed" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p -> GBool.FFI.val_;
    val getContext_ = _import "g_task_get_context" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p -> GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p;
    val getPriority_ = _import "g_task_get_priority" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p -> GInt.FFI.val_;
    val getReturnOnCancel_ = _import "g_task_get_return_on_cancel" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p -> GBool.FFI.val_;
    val getSourceObject_ = _import "g_task_get_source_object" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p -> GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p;
    val hadError_ = _import "g_task_had_error" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p -> GBool.FFI.val_;
    val propagateBoolean_ = fn x1 & x2 => (_import "g_task_propagate_boolean" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val propagateInt_ = fn x1 & x2 => (_import "g_task_propagate_int" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GSSize.FFI.val_;) (x1, x2)
    val returnBoolean_ = fn x1 & x2 => (_import "g_task_return_boolean" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val returnErrorIfCancelled_ = _import "g_task_return_error_if_cancelled" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p -> GBool.FFI.val_;
    val returnInt_ = fn x1 & x2 => (_import "g_task_return_int" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p * GSSize.FFI.val_ -> unit;) (x1, x2)
    val setCheckCancellable_ = fn x1 & x2 => (_import "g_task_set_check_cancellable" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPriority_ = fn x1 & x2 => (_import "g_task_set_priority" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setReturnOnCancel_ = fn x1 & x2 => (_import "g_task_set_return_on_cancel" : GioTaskClass.FFI.notnull GioTaskClass.FFI.p * GBool.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    type 'a class = 'a GioTaskClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    fun asAsyncResult self = (GObjectObjectClass.FFI.withPtr ---> GioAsyncResultClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun isValid (result, sourceObject) = (GioAsyncResultClass.FFI.withPtr &&&> GObjectObjectClass.FFI.withOptPtr ---> GBool.FFI.fromVal) isValid_ (result & sourceObject)
    fun getCancellable self = (GioTaskClass.FFI.withPtr ---> GioCancellableClass.FFI.fromPtr false) getCancellable_ self
    fun getCheckCancellable self = (GioTaskClass.FFI.withPtr ---> GBool.FFI.fromVal) getCheckCancellable_ self
    fun getCompleted self = (GioTaskClass.FFI.withPtr ---> GBool.FFI.fromVal) getCompleted_ self
    fun getContext self = (GioTaskClass.FFI.withPtr ---> GLibMainContextRecord.FFI.fromPtr false) getContext_ self
    fun getPriority self = (GioTaskClass.FFI.withPtr ---> GInt.FFI.fromVal) getPriority_ self
    fun getReturnOnCancel self = (GioTaskClass.FFI.withPtr ---> GBool.FFI.fromVal) getReturnOnCancel_ self
    fun getSourceObject self = (GioTaskClass.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr false) getSourceObject_ self
    fun hadError self = (GioTaskClass.FFI.withPtr ---> GBool.FFI.fromVal) hadError_ self
    fun propagateBoolean self = (GioTaskClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) propagateBoolean_ (self & [])
    fun propagateInt self = (GioTaskClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GSSize.FFI.fromVal) propagateInt_ (self & [])
    fun returnBoolean self result = (GioTaskClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) returnBoolean_ (self & result)
    fun returnErrorIfCancelled self = (GioTaskClass.FFI.withPtr ---> GBool.FFI.fromVal) returnErrorIfCancelled_ self
    fun returnInt self result = (GioTaskClass.FFI.withPtr &&&> GSSize.FFI.withVal ---> I) returnInt_ (self & result)
    fun setCheckCancellable self checkCancellable = (GioTaskClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setCheckCancellable_ (self & checkCancellable)
    fun setPriority self priority = (GioTaskClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setPriority_ (self & priority)
    fun setReturnOnCancel self returnOnCancel = (GioTaskClass.FFI.withPtr &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) setReturnOnCancel_ (self & returnOnCancel)
    local
      open Property
    in
      val completedProp = {get = fn x => get "completed" boolean x}
    end
  end