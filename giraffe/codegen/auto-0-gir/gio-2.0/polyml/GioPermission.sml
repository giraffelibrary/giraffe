structure GioPermission :>
  GIO_PERMISSION
    where type 'a class = 'a GioPermissionClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_permission_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val acquire_ =
        call (load_sym libgio "g_permission_acquire")
          (
            GioPermissionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val acquireFinish_ =
        call (load_sym libgio "g_permission_acquire_finish")
          (
            GioPermissionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val getAllowed_ = call (load_sym libgio "g_permission_get_allowed") (GioPermissionClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCanAcquire_ = call (load_sym libgio "g_permission_get_can_acquire") (GioPermissionClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCanRelease_ = call (load_sym libgio "g_permission_get_can_release") (GioPermissionClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val implUpdate_ =
        call (load_sym libgio "g_permission_impl_update")
          (
            GioPermissionClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val release_ =
        call (load_sym libgio "g_permission_release")
          (
            GioPermissionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val releaseFinish_ =
        call (load_sym libgio "g_permission_release_finish")
          (
            GioPermissionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a GioPermissionClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun acquire self cancellable =
      (
        GioPermissionClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        acquire_
        (
          self
           & cancellable
           & []
        )
    fun acquireFinish self result =
      (
        GioPermissionClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        acquireFinish_
        (
          self
           & result
           & []
        )
    fun getAllowed self = (GioPermissionClass.C.withPtr ---> FFI.Bool.C.fromVal) getAllowed_ self
    fun getCanAcquire self = (GioPermissionClass.C.withPtr ---> FFI.Bool.C.fromVal) getCanAcquire_ self
    fun getCanRelease self = (GioPermissionClass.C.withPtr ---> FFI.Bool.C.fromVal) getCanRelease_ self
    fun implUpdate self allowed canAcquire canRelease =
      (
        GioPermissionClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
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
        GioPermissionClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        release_
        (
          self
           & cancellable
           & []
        )
    fun releaseFinish self result =
      (
        GioPermissionClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
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
