(* Copyright (C) 2012, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GiraffeDebug :> GIRAFFE_DEBUG =
  struct
    fun isDefinedSome var =
      case OS.Process.getEnv var of
        NONE    => false
      | SOME "" => false
      | SOME _  => true

    (* To fix `isEnabled` at compile time with MLton, it is not possible to
     * use `OS.Process.getEnv` because that uses the run-time environment. *)
    val isEnabled = _command_line_const "GiraffeDebug.isEnabled" : bool = false;

    fun logMemEnabled () = isEnabled andalso isDefinedSome "GIRAFFE_DEBUG_MEM"
    fun logClosureEnabled () = isEnabled andalso isDefinedSome "GIRAFFE_DEBUG_CLOSURE"
    fun logFinalizersPendingOnExitEnabled () =
      isEnabled andalso isDefinedSome "GIRAFFE_DEBUG_FINALIZERS_PENDING_ON_EXIT"
    fun forceFinalizationOnExitEnabled () =
      isEnabled andalso isDefinedSome "GIRAFFE_DEBUG_FORCE_FINALIZATION_ON_EXIT"

    fun log msgType fields =
      let
        val msg = String.concat (["[giraffe-debug-", msgType, "] "] @ fields)
      in
        print msg
      end

    fun getTime () = LargeInt.toString (Time.toMicroseconds (Time.now ()))

    datatype mem_op =
        MFree
      | MDup
      | MTake
      | MNew
      | MCopy
      | MClear

    val memOpToString =
      fn
        MFree  => "free"
      | MDup   => "dup"
      | MTake  => "take"
      | MNew   => "new"
      | MCopy  => "copy"
      | MClear => "clear"

    fun logMem {memOp, instKind, instType, instAddr} =
      log "mem"
        [
          getTime (), " ",
          memOpToString memOp, " ",
          instKind, " ",
          instType, " ",
          instAddr, "\n"
        ]

    datatype closure1_op =
        C1Connect
      | C1ConnectAfter
      | C1Disconnect

    val closure1OpToString =
      fn
        C1Connect      => "connect"
      | C1ConnectAfter => "connect-after"
      | C1Disconnect   => "disconnect"

    fun logClosure1 {closure1Op, closureAddr, detailedSignal, instKind, instType, instAddr} =
      log "closure"
        [
          getTime (), " ",
          closure1OpToString closure1Op, " ",
          closureAddr, " ",
          "\"", detailedSignal, "\" ",
          instKind, " ",
          instType, " ",
          instAddr, "\n"
        ]

    datatype closure2_op =
        C2DispatchEnter
      | C2DispatchLeave
      | C2DestroyEnter
      | C2DestroyLeave

    val closure2OpToString =
      fn
        C2DispatchEnter => "dispatch-enter"
      | C2DispatchLeave => "dispatch-leave"
      | C2DestroyEnter  => "destroy-enter"
      | C2DestroyLeave  => "destroy-leave"

    fun logClosure2 {closure2Op, closureAddr} =
      log "closure"
        [
          getTime (), " ",
          closure2OpToString closure2Op, " ",
          closureAddr, "\n"
        ]

    fun logFinalizersPendingOnExit {globalCount, revContextCounts} =
      log "finalizers-pending-on-exit"
        (
          Int.toString globalCount ::
            List.foldl
              (fn (count, strs) => " " :: Int.toString count :: strs)
              ["\n"]
              revContextCounts
        )
  end
