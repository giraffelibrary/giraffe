structure GioSubprocess :>
  GIO_SUBPROCESS
    where type 'a class = 'a GioSubprocessClass.class
    where type 'a initable_class = 'a GioInitableClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type subprocess_flags_t = GioSubprocessFlags.t =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    val getType_ = _import "g_subprocess_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_subprocess_newv" :
              Utf8CVector.MLton.p1
               * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2
               * GioSubprocessFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val communicate_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "g_subprocess_communicate" :
              GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p
               * unit GLibBytesRecord.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, GLibBytesRecord.FFI.notnull) GLibBytesRecord.FFI.r
               * (unit, GLibBytesRecord.FFI.notnull) GLibBytesRecord.FFI.r
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val communicateFinish_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_subprocess_communicate_finish" :
              GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, GLibBytesRecord.FFI.notnull) GLibBytesRecord.FFI.r
               * (unit, GLibBytesRecord.FFI.notnull) GLibBytesRecord.FFI.r
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
    val communicateUtf8_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & (x7, x8)
         & x9 =>
          (
            _import "mlton_g_subprocess_communicate_utf8" :
              GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * unit GioCancellableClass.FFI.p
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val communicateUtf8Finish_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_subprocess_communicate_utf8_finish" :
              GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val forceExit_ = _import "g_subprocess_force_exit" : GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p -> unit;
    val getExitStatus_ = _import "g_subprocess_get_exit_status" : GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p -> GInt.FFI.val_;
    val getIdentifier_ = _import "g_subprocess_get_identifier" : GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getIfExited_ = _import "g_subprocess_get_if_exited" : GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p -> GBool.FFI.val_;
    val getIfSignaled_ = _import "g_subprocess_get_if_signaled" : GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p -> GBool.FFI.val_;
    val getStatus_ = _import "g_subprocess_get_status" : GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p -> GInt.FFI.val_;
    val getStderrPipe_ = _import "g_subprocess_get_stderr_pipe" : GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p -> GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p;
    val getStdinPipe_ = _import "g_subprocess_get_stdin_pipe" : GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p -> GioOutputStreamClass.FFI.notnull GioOutputStreamClass.FFI.p;
    val getStdoutPipe_ = _import "g_subprocess_get_stdout_pipe" : GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p -> GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p;
    val getSuccessful_ = _import "g_subprocess_get_successful" : GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p -> GBool.FFI.val_;
    val getTermSig_ = _import "g_subprocess_get_term_sig" : GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p -> GInt.FFI.val_;
    val sendSignal_ = fn x1 & x2 => (_import "g_subprocess_send_signal" : GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val wait_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_subprocess_wait" :
              GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val waitCheck_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_subprocess_wait_check" :
              GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val waitCheckFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_subprocess_wait_check_finish" :
              GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val waitFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_subprocess_wait_finish" :
              GioSubprocessClass.FFI.notnull GioSubprocessClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioSubprocessClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type subprocess_flags_t = GioSubprocessFlags.t
    type t = base class
    fun asInitable self = (GObjectObjectClass.FFI.withPtr ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (argv, flags) =
      (
        Utf8CVector.FFI.withPtr
         &&&> GioSubprocessFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioSubprocessClass.FFI.fromPtr true
      )
        new_
        (
          argv
           & flags
           & []
        )
    fun communicate self (stdinBuf, cancellable) =
      let
        val stdoutBuf
         & stderrBuf
         & () =
          (
            GioSubprocessClass.FFI.withPtr
             &&&> GLibBytesRecord.FFI.withOptPtr
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibBytesRecord.FFI.withRefOptPtr
             &&&> GLibBytesRecord.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GLibBytesRecord.FFI.fromPtr true
                   && GLibBytesRecord.FFI.fromPtr true
                   && ignore
          )
            communicate_
            (
              self
               & stdinBuf
               & cancellable
               & NONE
               & NONE
               & []
            )
      in
        (stdoutBuf, stderrBuf)
      end
    fun communicateFinish self result =
      let
        val stdoutBuf
         & stderrBuf
         & () =
          (
            GioSubprocessClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GLibBytesRecord.FFI.withRefOptPtr
             &&&> GLibBytesRecord.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GLibBytesRecord.FFI.fromPtr true
                   && GLibBytesRecord.FFI.fromPtr true
                   && ignore
          )
            communicateFinish_
            (
              self
               & result
               & NONE
               & NONE
               & []
            )
      in
        (stdoutBuf, stderrBuf)
      end
    fun communicateUtf8 self (stdinBuf, cancellable) =
      let
        val stdoutBuf
         & stderrBuf
         & () =
          (
            GioSubprocessClass.FFI.withPtr
             &&&> Utf8.FFI.withOptPtr
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1
                   && Utf8.FFI.fromPtr 1
                   && ignore
          )
            communicateUtf8_
            (
              self
               & stdinBuf
               & cancellable
               & NONE
               & NONE
               & []
            )
      in
        (stdoutBuf, stderrBuf)
      end
    fun communicateUtf8Finish self result =
      let
        val stdoutBuf
         & stderrBuf
         & () =
          (
            GioSubprocessClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1
                   && Utf8.FFI.fromPtr 1
                   && ignore
          )
            communicateUtf8Finish_
            (
              self
               & result
               & NONE
               & NONE
               & []
            )
      in
        (stdoutBuf, stderrBuf)
      end
    fun forceExit self = (GioSubprocessClass.FFI.withPtr ---> I) forceExit_ self
    fun getExitStatus self = (GioSubprocessClass.FFI.withPtr ---> GInt.FFI.fromVal) getExitStatus_ self
    fun getIdentifier self = (GioSubprocessClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getIdentifier_ self
    fun getIfExited self = (GioSubprocessClass.FFI.withPtr ---> GBool.FFI.fromVal) getIfExited_ self
    fun getIfSignaled self = (GioSubprocessClass.FFI.withPtr ---> GBool.FFI.fromVal) getIfSignaled_ self
    fun getStatus self = (GioSubprocessClass.FFI.withPtr ---> GInt.FFI.fromVal) getStatus_ self
    fun getStderrPipe self = (GioSubprocessClass.FFI.withPtr ---> GioInputStreamClass.FFI.fromPtr false) getStderrPipe_ self
    fun getStdinPipe self = (GioSubprocessClass.FFI.withPtr ---> GioOutputStreamClass.FFI.fromPtr false) getStdinPipe_ self
    fun getStdoutPipe self = (GioSubprocessClass.FFI.withPtr ---> GioInputStreamClass.FFI.fromPtr false) getStdoutPipe_ self
    fun getSuccessful self = (GioSubprocessClass.FFI.withPtr ---> GBool.FFI.fromVal) getSuccessful_ self
    fun getTermSig self = (GioSubprocessClass.FFI.withPtr ---> GInt.FFI.fromVal) getTermSig_ self
    fun sendSignal self signalNum = (GioSubprocessClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) sendSignal_ (self & signalNum)
    fun wait self cancellable =
      (
        GioSubprocessClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        wait_
        (
          self
           & cancellable
           & []
        )
    fun waitCheck self cancellable =
      (
        GioSubprocessClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        waitCheck_
        (
          self
           & cancellable
           & []
        )
    fun waitCheckFinish self result =
      (
        GioSubprocessClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        waitCheckFinish_
        (
          self
           & result
           & []
        )
    fun waitFinish self result =
      (
        GioSubprocessClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        waitFinish_
        (
          self
           & result
           & []
        )
    local
      open Property
    in
      val flagsProp = {set = fn x => set "flags" GioSubprocessFlags.t x}
    end
  end
