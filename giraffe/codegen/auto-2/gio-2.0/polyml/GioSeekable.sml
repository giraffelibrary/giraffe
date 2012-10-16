structure GioSeekable :>
  GIO_SEEKABLE
    where type 'a class_t = 'a GioSeekableClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_seekable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val canSeek_ = call (load_sym libgio "g_seekable_can_seek") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val canTruncate_ = call (load_sym libgio "g_seekable_can_truncate") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val seek_ =
        call (load_sym libgio "g_seekable_seek")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int64.VAL
             &&> GLibSeekType.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val tell_ = call (load_sym libgio "g_seekable_tell") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int64.VAL)
      val truncate_ =
        call (load_sym libgio "g_seekable_truncate")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int64.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
    end
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
