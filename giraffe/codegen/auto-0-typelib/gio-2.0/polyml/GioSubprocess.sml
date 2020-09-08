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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_subprocess_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_subprocess_newv")
          (
            Utf8CPtrArray.PolyML.cInPtr
             &&> GioSubprocessFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSubprocessClass.PolyML.cPtr
          )
      val communicate_ =
        call (getSymbol "g_subprocess_communicate")
          (
            GioSubprocessClass.PolyML.cPtr
             &&> GLibBytesRecord.PolyML.cOptPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibBytesRecord.PolyML.cOutRef
             &&> GLibBytesRecord.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val communicateFinish_ =
        call (getSymbol "g_subprocess_communicate_finish")
          (
            GioSubprocessClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibBytesRecord.PolyML.cOutRef
             &&> GLibBytesRecord.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val communicateUtf8_ =
        call (getSymbol "g_subprocess_communicate_utf8")
          (
            GioSubprocessClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cOutRef
             &&> Utf8.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val communicateUtf8Finish_ =
        call (getSymbol "g_subprocess_communicate_utf8_finish")
          (
            GioSubprocessClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> Utf8.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val forceExit_ = call (getSymbol "g_subprocess_force_exit") (GioSubprocessClass.PolyML.cPtr --> cVoid)
      val getExitStatus_ = call (getSymbol "g_subprocess_get_exit_status") (GioSubprocessClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getIdentifier_ = call (getSymbol "g_subprocess_get_identifier") (GioSubprocessClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIfExited_ = call (getSymbol "g_subprocess_get_if_exited") (GioSubprocessClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIfSignaled_ = call (getSymbol "g_subprocess_get_if_signaled") (GioSubprocessClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getStatus_ = call (getSymbol "g_subprocess_get_status") (GioSubprocessClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getStderrPipe_ = call (getSymbol "g_subprocess_get_stderr_pipe") (GioSubprocessClass.PolyML.cPtr --> GioInputStreamClass.PolyML.cPtr)
      val getStdinPipe_ = call (getSymbol "g_subprocess_get_stdin_pipe") (GioSubprocessClass.PolyML.cPtr --> GioOutputStreamClass.PolyML.cPtr)
      val getStdoutPipe_ = call (getSymbol "g_subprocess_get_stdout_pipe") (GioSubprocessClass.PolyML.cPtr --> GioInputStreamClass.PolyML.cPtr)
      val getSuccessful_ = call (getSymbol "g_subprocess_get_successful") (GioSubprocessClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTermSig_ = call (getSymbol "g_subprocess_get_term_sig") (GioSubprocessClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val sendSignal_ = call (getSymbol "g_subprocess_send_signal") (GioSubprocessClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val wait_ =
        call (getSymbol "g_subprocess_wait")
          (
            GioSubprocessClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val waitCheck_ =
        call (getSymbol "g_subprocess_wait_check")
          (
            GioSubprocessClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val waitCheckFinish_ =
        call (getSymbol "g_subprocess_wait_check_finish")
          (
            GioSubprocessClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val waitFinish_ =
        call (getSymbol "g_subprocess_wait_finish")
          (
            GioSubprocessClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
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
      open ValueAccessor
    in
      val flagsProp =
        {
          name = "flags",
          gtype = fn () => C.gtype GioSubprocessFlags.t (),
          get = ignore,
          set = ignore,
          init = fn x => C.set GioSubprocessFlags.t x
        }
    end
  end
