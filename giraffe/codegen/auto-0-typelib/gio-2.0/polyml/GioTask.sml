structure GioTask :>
  GIO_TASK
    where type 'a class = 'a GioTaskClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_task_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val isValid_ = call (getSymbol "g_task_is_valid") (GioAsyncResultClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> GBool.PolyML.cVal)
      val getCancellable_ = call (getSymbol "g_task_get_cancellable") (GioTaskClass.PolyML.cPtr --> GioCancellableClass.PolyML.cPtr)
      val getCheckCancellable_ = call (getSymbol "g_task_get_check_cancellable") (GioTaskClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCompleted_ = call (getSymbol "g_task_get_completed") (GioTaskClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getContext_ = call (getSymbol "g_task_get_context") (GioTaskClass.PolyML.cPtr --> GLibMainContextRecord.PolyML.cPtr)
      val getPriority_ = call (getSymbol "g_task_get_priority") (GioTaskClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getReturnOnCancel_ = call (getSymbol "g_task_get_return_on_cancel") (GioTaskClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSourceObject_ = call (getSymbol "g_task_get_source_object") (GioTaskClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val hadError_ = call (getSymbol "g_task_had_error") (GioTaskClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val propagateBoolean_ = call (getSymbol "g_task_propagate_boolean") (GioTaskClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val propagateInt_ = call (getSymbol "g_task_propagate_int") (GioTaskClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GInt64.PolyML.cVal)
      val returnBoolean_ = call (getSymbol "g_task_return_boolean") (GioTaskClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val returnErrorIfCancelled_ = call (getSymbol "g_task_return_error_if_cancelled") (GioTaskClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val returnInt_ = call (getSymbol "g_task_return_int") (GioTaskClass.PolyML.cPtr &&> GInt64.PolyML.cVal --> cVoid)
      val setCheckCancellable_ = call (getSymbol "g_task_set_check_cancellable") (GioTaskClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPriority_ = call (getSymbol "g_task_set_priority") (GioTaskClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setReturnOnCancel_ = call (getSymbol "g_task_set_return_on_cancel") (GioTaskClass.PolyML.cPtr &&> GBool.PolyML.cVal --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioTaskClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    fun asAsyncResult self = (GObjectObjectClass.FFI.withPtr false ---> GioAsyncResultClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun isValid (result, sourceObject) = (GioAsyncResultClass.FFI.withPtr false &&&> GObjectObjectClass.FFI.withOptPtr false ---> GBool.FFI.fromVal) isValid_ (result & sourceObject)
    fun getCancellable self = (GioTaskClass.FFI.withPtr false ---> GioCancellableClass.FFI.fromPtr false) getCancellable_ self before GioTaskClass.FFI.touchPtr self
    fun getCheckCancellable self = (GioTaskClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCheckCancellable_ self
    fun getCompleted self = (GioTaskClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCompleted_ self
    fun getContext self = (GioTaskClass.FFI.withPtr false ---> GLibMainContextRecord.FFI.fromPtr false) getContext_ self before GioTaskClass.FFI.touchPtr self
    fun getPriority self = (GioTaskClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getPriority_ self
    fun getReturnOnCancel self = (GioTaskClass.FFI.withPtr false ---> GBool.FFI.fromVal) getReturnOnCancel_ self
    fun getSourceObject self = (GioTaskClass.FFI.withPtr false ---> GObjectObjectClass.FFI.fromPtr false) getSourceObject_ self before GioTaskClass.FFI.touchPtr self
    fun hadError self = (GioTaskClass.FFI.withPtr false ---> GBool.FFI.fromVal) hadError_ self
    fun propagateBoolean self = (GioTaskClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) propagateBoolean_ (self & [])
    fun propagateInt self = (GioTaskClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GInt64.FFI.fromVal) propagateInt_ (self & [])
    fun returnBoolean self result = (GioTaskClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) returnBoolean_ (self & result)
    fun returnErrorIfCancelled self = (GioTaskClass.FFI.withPtr false ---> GBool.FFI.fromVal) returnErrorIfCancelled_ self
    fun returnInt self result = (GioTaskClass.FFI.withPtr false &&&> GInt64.FFI.withVal ---> I) returnInt_ (self & result)
    fun setCheckCancellable self checkCancellable = (GioTaskClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCheckCancellable_ (self & checkCancellable)
    fun setPriority self priority = (GioTaskClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setPriority_ (self & priority)
    fun setReturnOnCancel self returnOnCancel = (GioTaskClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) setReturnOnCancel_ (self & returnOnCancel)
    local
      open ValueAccessor
    in
      val completedProp =
        {
          name = "completed",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
    end
  end
