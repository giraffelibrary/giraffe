structure GioSeekable :>
  GIO_SEEKABLE
    where type 'a class = 'a GioSeekableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_seekable_get_type" : unit -> GObjectType.FFI.val_;
    val canSeek_ = _import "g_seekable_can_seek" : GioSeekableClass.FFI.notnull GioSeekableClass.FFI.p -> GBool.FFI.val_;
    val canTruncate_ = _import "g_seekable_can_truncate" : GioSeekableClass.FFI.notnull GioSeekableClass.FFI.p -> GBool.FFI.val_;
    val seek_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_seekable_seek" :
              GioSeekableClass.FFI.notnull GioSeekableClass.FFI.p
               * GInt64.FFI.val_
               * GLibSeekType.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val tell_ = _import "g_seekable_tell" : GioSeekableClass.FFI.notnull GioSeekableClass.FFI.p -> GInt64.FFI.val_;
    val truncate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_seekable_truncate" :
              GioSeekableClass.FFI.notnull GioSeekableClass.FFI.p
               * GInt64.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canSeek self = (GioSeekableClass.FFI.withPtr ---> GBool.FFI.fromVal) canSeek_ self
    fun canTruncate self = (GioSeekableClass.FFI.withPtr ---> GBool.FFI.fromVal) canTruncate_ self
    fun seek
      self
      (
        offset,
        type',
        cancellable
      ) =
      (
        GioSeekableClass.FFI.withPtr
         &&&> GInt64.FFI.withVal
         &&&> GLibSeekType.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        seek_
        (
          self
           & offset
           & type'
           & cancellable
           & []
        )
    fun tell self = (GioSeekableClass.FFI.withPtr ---> GInt64.FFI.fromVal) tell_ self
    fun truncate self (offset, cancellable) =
      (
        GioSeekableClass.FFI.withPtr
         &&&> GInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        truncate_
        (
          self
           & offset
           & cancellable
           & []
        )
  end
