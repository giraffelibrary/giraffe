structure GioSeekable :>
  GIO_SEEKABLE
    where type 'a class_t = 'a GioSeekableClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_seekable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val canSeek_ = call (load_sym libgio "g_seekable_can_seek") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val canTruncate_ = call (load_sym libgio "g_seekable_can_truncate") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val seek_ =
        call (load_sym libgio "g_seekable_seek")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int64.PolyML.VAL
             &&> GLibSeekType.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val tell_ = call (load_sym libgio "g_seekable_tell") (GObjectObjectClass.PolyML.PTR --> FFI.Int64.PolyML.VAL)
      val truncate_ =
        call (load_sym libgio "g_seekable_truncate")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int64.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a GioSeekableClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canSeek self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canSeek_ self
    fun canTruncate self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canTruncate_ self
    fun seek self offset type' cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int64.C.withVal
         &&&> GLibSeekType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
