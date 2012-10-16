structure GioSeekable :>
  GIO_SEEKABLE
    where type 'a class_t = 'a GioSeekableClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t =
  struct
    val getType_ = _import "g_seekable_get_type" : unit -> GObjectType.C.val_;
    val canSeek_ = _import "g_seekable_can_seek" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val canTruncate_ = _import "g_seekable_can_truncate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val seek_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_seekable_seek" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int64.val_
               * GLibSeekType.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val tell_ = _import "g_seekable_tell" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int64.val_;
    val truncate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_seekable_truncate" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int64.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class_t = 'a GioSeekableClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canSeek self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canSeek_ self
    fun canTruncate self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canTruncate_ self
    fun seek self offset type' cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int64.withVal
         &&&> GLibSeekType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        seek_
        (
          self
           & offset
           & type'
           & cancellable
           & []
        )
    fun tell self = (GObjectObjectClass.C.withPtr ---> FFI.Int64.fromVal) tell_ self
    fun truncate self offset cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int64.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        truncate_
        (
          self
           & offset
           & cancellable
           & []
        )
  end
