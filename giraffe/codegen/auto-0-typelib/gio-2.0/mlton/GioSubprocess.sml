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
    val getType_ = _import "g_subprocess_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_subprocess_newv" :
              Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               * GioSubprocessFlags.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p;
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
              GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p
               * GLibBytesRecord.FFI.opt GLibBytesRecord.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibBytesRecord.FFI.opt, GLibBytesRecord.FFI.non_opt) GLibBytesRecord.FFI.r
               * (GLibBytesRecord.FFI.opt, GLibBytesRecord.FFI.non_opt) GLibBytesRecord.FFI.r
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibBytesRecord.FFI.opt, GLibBytesRecord.FFI.non_opt) GLibBytesRecord.FFI.r
               * (GLibBytesRecord.FFI.opt, GLibBytesRecord.FFI.non_opt) GLibBytesRecord.FFI.r
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
    val forceExit_ = _import "g_subprocess_force_exit" : GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p -> unit;
    val getExitStatus_ = _import "g_subprocess_get_exit_status" : GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p -> GInt32.FFI.val_;
    val getIdentifier_ = _import "g_subprocess_get_identifier" : GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getIfExited_ = _import "g_subprocess_get_if_exited" : GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p -> GBool.FFI.val_;
    val getIfSignaled_ = _import "g_subprocess_get_if_signaled" : GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p -> GBool.FFI.val_;
    val getStatus_ = _import "g_subprocess_get_status" : GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p -> GInt32.FFI.val_;
    val getStderrPipe_ = _import "g_subprocess_get_stderr_pipe" : GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p -> GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p;
    val getStdinPipe_ = _import "g_subprocess_get_stdin_pipe" : GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p -> GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p;
    val getStdoutPipe_ = _import "g_subprocess_get_stdout_pipe" : GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p -> GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p;
    val getSuccessful_ = _import "g_subprocess_get_successful" : GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p -> GBool.FFI.val_;
    val getTermSig_ = _import "g_subprocess_get_term_sig" : GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p -> GInt32.FFI.val_;
    val sendSignal_ = fn x1 & x2 => (_import "g_subprocess_send_signal" : GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val wait_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_subprocess_wait" :
              GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
    fun asInitable self = (GObjectObjectClass.FFI.withPtr false ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (argv, flags) =
      (
        Utf8CPtrArray.FFI.withPtr 0
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
            GioSubprocessClass.FFI.withPtr false
             &&&> GLibBytesRecord.FFI.withOptPtr false
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibBytesRecord.FFI.withRefOptPtr true
             &&&> GLibBytesRecord.FFI.withRefOptPtr true
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
            GioSubprocessClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GLibBytesRecord.FFI.withRefOptPtr true
             &&&> GLibBytesRecord.FFI.withRefOptPtr true
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
            GioSubprocessClass.FFI.withPtr false
             &&&> Utf8.FFI.withOptPtr 0
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr ~1
                   && Utf8.FFI.fromPtr ~1
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
            GioSubprocessClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr ~1
                   && Utf8.FFI.fromPtr ~1
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
    fun forceExit self = (GioSubprocessClass.FFI.withPtr false ---> I) forceExit_ self
    fun getExitStatus self = (GioSubprocessClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getExitStatus_ self
    fun getIdentifier self = (GioSubprocessClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getIdentifier_ self
    fun getIfExited self = (GioSubprocessClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIfExited_ self
    fun getIfSignaled self = (GioSubprocessClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIfSignaled_ self
    fun getStatus self = (GioSubprocessClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getStatus_ self
    fun getStderrPipe self = (GioSubprocessClass.FFI.withPtr false ---> GioInputStreamClass.FFI.fromPtr false) getStderrPipe_ self
    fun getStdinPipe self = (GioSubprocessClass.FFI.withPtr false ---> GioOutputStreamClass.FFI.fromPtr false) getStdinPipe_ self
    fun getStdoutPipe self = (GioSubprocessClass.FFI.withPtr false ---> GioInputStreamClass.FFI.fromPtr false) getStdoutPipe_ self
    fun getSuccessful self = (GioSubprocessClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSuccessful_ self
    fun getTermSig self = (GioSubprocessClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getTermSig_ self
    fun sendSignal self signalNum = (GioSubprocessClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) sendSignal_ (self & signalNum)
    fun wait self cancellable =
      (
        GioSubprocessClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioSubprocessClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioSubprocessClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioSubprocessClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
      val flagsProp = {new = fn x => new "flags" GioSubprocessFlags.t x}
    end
  end
