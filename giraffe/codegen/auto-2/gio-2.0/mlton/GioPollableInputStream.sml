structure GioPollableInputStream :>
  GIO_POLLABLE_INPUT_STREAM
    where type 'a class_t = 'a GioPollableInputStreamClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t =
  struct
    val getType_ = _import "g_pollable_input_stream_get_type" : unit -> GObjectType.C.val_;
    val canPoll_ = _import "g_pollable_input_stream_can_poll" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val isReadable_ = _import "g_pollable_input_stream_is_readable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val readNonblocking_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_pollable_input_stream_read_nonblocking" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt64.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int64.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class_t = 'a GioPollableInputStreamClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canPoll self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canPoll_ self
    fun isReadable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isReadable_ self
    fun readNonblocking self size cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Int64.C.fromVal
      )
        readNonblocking_
        (
          self
           & size
           & cancellable
           & []
        )
  end
