structure GioPermission :>
  GIO_PERMISSION
    where type 'a class = 'a GioPermissionClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_permission_get_type" : unit -> GObjectType.FFI.val_;
    val acquire_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_permission_acquire" :
              GioPermissionClass.FFI.notnull GioPermissionClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioPermissionClass.FFI.notnull GioPermissionClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAllowed_ = _import "g_permission_get_allowed" : GioPermissionClass.FFI.notnull GioPermissionClass.FFI.p -> GBool.FFI.val_;
    val getCanAcquire_ = _import "g_permission_get_can_acquire" : GioPermissionClass.FFI.notnull GioPermissionClass.FFI.p -> GBool.FFI.val_;
    val getCanRelease_ = _import "g_permission_get_can_release" : GioPermissionClass.FFI.notnull GioPermissionClass.FFI.p -> GBool.FFI.val_;
    val implUpdate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_permission_impl_update" :
              GioPermissionClass.FFI.notnull GioPermissionClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               * GBool.FFI.val_
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
              GioPermissionClass.FFI.notnull GioPermissionClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioPermissionClass.FFI.notnull GioPermissionClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioPermissionClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun acquire self cancellable =
      (
        GioPermissionClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        acquire_
        (
          self
           & cancellable
           & []
        )
    fun acquireFinish self result =
      (
        GioPermissionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        acquireFinish_
        (
          self
           & result
           & []
        )
    fun getAllowed self = (GioPermissionClass.FFI.withPtr ---> GBool.FFI.fromVal) getAllowed_ self
    fun getCanAcquire self = (GioPermissionClass.FFI.withPtr ---> GBool.FFI.fromVal) getCanAcquire_ self
    fun getCanRelease self = (GioPermissionClass.FFI.withPtr ---> GBool.FFI.fromVal) getCanRelease_ self
    fun implUpdate
      self
      (
        allowed,
        canAcquire,
        canRelease
      ) =
      (
        GioPermissionClass.FFI.withPtr
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
        GioPermissionClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        release_
        (
          self
           & cancellable
           & []
        )
    fun releaseFinish self result =
      (
        GioPermissionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
