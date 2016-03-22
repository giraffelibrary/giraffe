structure GioSeekable :>
  GIO_SEEKABLE
    where type 'a class = 'a GioSeekableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_seekable_get_type" : unit -> GObjectType.C.val_;
    val canSeek_ = _import "g_seekable_can_seek" : GioSeekableClass.C.notnull GioSeekableClass.C.p -> FFI.Bool.C.val_;
    val canTruncate_ = _import "g_seekable_can_truncate" : GioSeekableClass.C.notnull GioSeekableClass.C.p -> FFI.Bool.C.val_;
    val seek_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_seekable_seek" :
              GioSeekableClass.C.notnull GioSeekableClass.C.p
               * FFI.Int64.C.val_
               * GLibSeekType.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val tell_ = _import "g_seekable_tell" : GioSeekableClass.C.notnull GioSeekableClass.C.p -> FFI.Int64.C.val_;
    val truncate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_seekable_truncate" :
              GioSeekableClass.C.notnull GioSeekableClass.C.p
               * FFI.Int64.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GioSeekableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canSeek self = (GioSeekableClass.C.withPtr ---> FFI.Bool.C.fromVal) canSeek_ self
    fun canTruncate self = (GioSeekableClass.C.withPtr ---> FFI.Bool.C.fromVal) canTruncate_ self
    fun seek self offset type' cancellable =
      (
        GioSeekableClass.C.withPtr
         &&&> FFI.Int64.C.withVal
         &&&> GLibSeekType.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        seek_
        (
          self
           & offset
           & type'
           & cancellable
           & []
        )
    fun tell self = (GioSeekableClass.C.withPtr ---> FFI.Int64.C.fromVal) tell_ self
    fun truncate self offset cancellable =
      (
        GioSeekableClass.C.withPtr
         &&&> FFI.Int64.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        truncate_
        (
          self
           & offset
           & cancellable
           & []
        )
  end
