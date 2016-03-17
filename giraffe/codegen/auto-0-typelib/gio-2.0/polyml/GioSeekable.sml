structure GioSeekable :>
  GIO_SEEKABLE
    where type 'a class = 'a GioSeekableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_seekable_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val canSeek_ = call (load_sym libgio "g_seekable_can_seek") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val canTruncate_ = call (load_sym libgio "g_seekable_can_truncate") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val seek_ =
        call (load_sym libgio "g_seekable_seek")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int64.PolyML.cVal
             &&> GLibSeekType.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val tell_ = call (load_sym libgio "g_seekable_tell") (GObjectObjectClass.PolyML.cPtr --> FFI.Int64.PolyML.cVal)
      val truncate_ =
        call (load_sym libgio "g_seekable_truncate")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int64.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a GioSeekableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canSeek self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canSeek_ self
    fun canTruncate self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canTruncate_ self
    fun seek self offset type' cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int64.C.withVal
         &&&> GLibSeekType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
    fun tell self = (GObjectObjectClass.C.withPtr ---> FFI.Int64.C.fromVal) tell_ self
    fun truncate self offset cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int64.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
