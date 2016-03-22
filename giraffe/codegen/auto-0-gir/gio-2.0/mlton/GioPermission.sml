structure GioPermission :>
  GIO_PERMISSION
    where type 'a class = 'a GioPermissionClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_permission_get_type" : unit -> GObjectType.C.val_;
    val acquire_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_permission_acquire" :
              GioPermissionClass.C.notnull GioPermissionClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioPermissionClass.C.notnull GioPermissionClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAllowed_ = _import "g_permission_get_allowed" : GioPermissionClass.C.notnull GioPermissionClass.C.p -> FFI.Bool.C.val_;
    val getCanAcquire_ = _import "g_permission_get_can_acquire" : GioPermissionClass.C.notnull GioPermissionClass.C.p -> FFI.Bool.C.val_;
    val getCanRelease_ = _import "g_permission_get_can_release" : GioPermissionClass.C.notnull GioPermissionClass.C.p -> FFI.Bool.C.val_;
    val implUpdate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_permission_impl_update" :
              GioPermissionClass.C.notnull GioPermissionClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
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
              GioPermissionClass.C.notnull GioPermissionClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioPermissionClass.C.notnull GioPermissionClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
