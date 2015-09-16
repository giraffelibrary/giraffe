structure GioFileEnumerator :>
  GIO_FILE_ENUMERATOR
    where type 'a class_t = 'a GioFileEnumeratorClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t
    where type 'a file_info_class_t = 'a GioFileInfoClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a file_class_t = 'a GioFileClass.t =
  struct
    val getType_ = _import "g_file_enumerator_get_type" : unit -> GObjectType.C.val_;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_enumerator_close" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val closeFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_enumerator_close_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getContainer_ = _import "g_file_enumerator_get_container" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val hasPending_ = _import "g_file_enumerator_has_pending" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val isClosed_ = _import "g_file_enumerator_is_closed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val nextFile_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_enumerator_next_file" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setPending_ = fn x1 & x2 => (_import "g_file_enumerator_set_pending" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GioFileEnumeratorClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type 'a file_info_class_t = 'a GioFileInfoClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a file_class_t = 'a GioFileClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun close self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        close_
        (
          self
           & cancellable
           & []
        )
    fun closeFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun getContainer self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr false) getContainer_ self
    fun hasPending self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun nextFile self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioFileInfoClass.C.fromPtr true
      )
        nextFile_
        (
          self
           & cancellable
           & []
        )
    fun setPending self pending = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPending_ (self & pending)
    local
      open Property
    in
      val containerProp = {set = fn x => set "container" GioFileClass.tOpt x}
    end
  end
