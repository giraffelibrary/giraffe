structure GioSeekable :>
  GIO_SEEKABLE
    where type 'a class = 'a GioSeekableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_seekable_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val canSeek_ = call (getSymbol "g_seekable_can_seek") (GioSeekableClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val canTruncate_ = call (getSymbol "g_seekable_can_truncate") (GioSeekableClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val seek_ =
        call (getSymbol "g_seekable_seek")
          (
            GioSeekableClass.PolyML.cPtr
             &&> GInt64.PolyML.cVal
             &&> GLibSeekType.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val tell_ = call (getSymbol "g_seekable_tell") (GioSeekableClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val truncate_ =
        call (getSymbol "g_seekable_truncate")
          (
            GioSeekableClass.PolyML.cPtr
             &&> GInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GioSeekableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canSeek self = (GioSeekableClass.FFI.withPtr ---> GBool.FFI.fromVal) canSeek_ self
    fun canTruncate self = (GioSeekableClass.FFI.withPtr ---> GBool.FFI.fromVal) canTruncate_ self
    fun seek self offset type' cancellable =
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
    fun truncate self offset cancellable =
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
