structure GioPermission :>
  GIO_PERMISSION
    where type 'a class_t = 'a GioPermissionClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    val getType_ = _import "g_permission_get_type" : unit -> GObjectType.C.val_;
    val acquire_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_permission_acquire" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val acquireFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_permission_acquire_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAllowed_ = _import "g_permission_get_allowed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getCanAcquire_ = _import "g_permission_get_can_acquire" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getCanRelease_ = _import "g_permission_get_can_release" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val implUpdate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_permission_impl_update" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.val_
               * FFI.Bool.val_
               * FFI.Bool.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val release_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_permission_release" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val releaseFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_permission_release_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioPermissionClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun acquire self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
      )
        acquireFinish_
        (
          self
           & result
           & []
        )
    fun getAllowed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getAllowed_ self
    fun getCanAcquire self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getCanAcquire_ self
    fun getCanRelease self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getCanRelease_ self
    fun implUpdate self allowed canAcquire canRelease =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.withVal
         &&&> FFI.Bool.withVal
         &&&> FFI.Bool.withVal
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
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
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
