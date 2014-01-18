structure GioPermission :>
  GIO_PERMISSION
    where type 'a class_t = 'a GioPermissionClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_permission_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val acquire_ =
        call (load_sym libgio "g_permission_acquire")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val acquireFinish_ =
        call (load_sym libgio "g_permission_acquire_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val getAllowed_ = call (load_sym libgio "g_permission_get_allowed") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getCanAcquire_ = call (load_sym libgio "g_permission_get_can_acquire") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getCanRelease_ = call (load_sym libgio "g_permission_get_can_release") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val implUpdate_ =
        call (load_sym libgio "g_permission_impl_update")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val release_ =
        call (load_sym libgio "g_permission_release")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val releaseFinish_ =
        call (load_sym libgio "g_permission_release_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a GioPermissionClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun acquire self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        acquireFinish_
        (
          self
           & result
           & []
        )
    fun getAllowed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAllowed_ self
    fun getCanAcquire self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCanAcquire_ self
    fun getCanRelease self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCanRelease_ self
    fun implUpdate self allowed canAcquire canRelease =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
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