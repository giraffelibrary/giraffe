structure GioFileEnumerator :>
  GIO_FILE_ENUMERATOR
    where type 'a class = 'a GioFileEnumeratorClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a file_class = 'a GioFileClass.class =
  struct
    val getType_ = _import "g_file_enumerator_get_type" : unit -> GObjectType.C.val_;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_enumerator_close" :
              GioFileEnumeratorClass.C.notnull GioFileEnumeratorClass.C.p
               * unit GioCancellableClass.C.p
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
              GioFileEnumeratorClass.C.notnull GioFileEnumeratorClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getContainer_ = _import "g_file_enumerator_get_container" : GioFileEnumeratorClass.C.notnull GioFileEnumeratorClass.C.p -> GioFileClass.C.notnull GioFileClass.C.p;
    val hasPending_ = _import "g_file_enumerator_has_pending" : GioFileEnumeratorClass.C.notnull GioFileEnumeratorClass.C.p -> FFI.Bool.C.val_;
    val isClosed_ = _import "g_file_enumerator_is_closed" : GioFileEnumeratorClass.C.notnull GioFileEnumeratorClass.C.p -> FFI.Bool.C.val_;
    val nextFile_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_enumerator_next_file" :
              GioFileEnumeratorClass.C.notnull GioFileEnumeratorClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileInfoClass.C.notnull GioFileInfoClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setPending_ = fn x1 & x2 => (_import "g_file_enumerator_set_pending" : GioFileEnumeratorClass.C.notnull GioFileEnumeratorClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioFileEnumeratorClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun close self cancellable =
      (
        GioFileEnumeratorClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
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
        GioFileEnumeratorClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun getContainer self = (GioFileEnumeratorClass.C.withPtr ---> GioFileClass.C.fromPtr false) getContainer_ self
    fun hasPending self = (GioFileEnumeratorClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GioFileEnumeratorClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun nextFile self cancellable =
      (
        GioFileEnumeratorClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.C.fromPtr true
      )
        nextFile_
        (
          self
           & cancellable
           & []
        )
    fun setPending self pending = (GioFileEnumeratorClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPending_ (self & pending)
    local
      open Property
    in
      val containerProp = {set = fn x => set "container" GioFileClass.tOpt x}
    end
  end
