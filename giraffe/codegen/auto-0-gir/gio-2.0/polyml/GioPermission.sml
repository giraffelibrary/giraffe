structure GioPermission :>
  GIO_PERMISSION
    where type 'a class = 'a GioPermissionClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_permission_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val acquire_ =
        call (getSymbol "g_permission_acquire")
          (
            GioPermissionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val acquireFinish_ =
        call (getSymbol "g_permission_acquire_finish")
          (
            GioPermissionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getAllowed_ = call (getSymbol "g_permission_get_allowed") (GioPermissionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCanAcquire_ = call (getSymbol "g_permission_get_can_acquire") (GioPermissionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCanRelease_ = call (getSymbol "g_permission_get_can_release") (GioPermissionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val implUpdate_ =
        call (getSymbol "g_permission_impl_update")
          (
            GioPermissionClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val release_ =
        call (getSymbol "g_permission_release")
          (
            GioPermissionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val releaseFinish_ =
        call (getSymbol "g_permission_release_finish")
          (
            GioPermissionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GioPermissionClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun acquire self cancellable =
      (
        GioPermissionClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        acquire_
        (
          self
           & cancellable
           & []
        )
    fun acquireFinish self result =
      (
        GioPermissionClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        acquireFinish_
        (
          self
           & result
           & []
        )
    fun getAllowed self = (GioPermissionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAllowed_ self
    fun getCanAcquire self = (GioPermissionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCanAcquire_ self
    fun getCanRelease self = (GioPermissionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCanRelease_ self
    fun implUpdate
      self
      (
        allowed,
        canAcquire,
        canRelease
      ) =
      (
        GioPermissionClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        implUpdate_
        (
          self
           & allowed
           & canAcquire
           & canRelease
        )
    fun release self cancellable =
      (
        GioPermissionClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        release_
        (
          self
           & cancellable
           & []
        )
    fun releaseFinish self result =
      (
        GioPermissionClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        releaseFinish_
        (
          self
           & result
           & []
        )
    local
      open Property
    in
      val allowedProp = {get = fn x => get "allowed" boolean x}
      val canAcquireProp = {get = fn x => get "can-acquire" boolean x}
      val canReleaseProp = {get = fn x => get "can-release" boolean x}
    end
  end
