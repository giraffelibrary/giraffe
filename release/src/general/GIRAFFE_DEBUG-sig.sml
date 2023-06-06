(* Copyright (C) 2012, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature GIRAFFE_DEBUG =
  sig
    (* `isEnabled` is fixed at compile-time. *)
    val isEnabled : bool

    val logMemEnabled : unit -> bool
    val logClosureEnabled : unit -> bool
    val logFinalizersPendingOnExitEnabled : unit -> bool
    val forceFinalizationOnExitEnabled : unit -> bool

    datatype mem_op =
        MFree
      | MDup
      | MTake
      | MNew
      | MCopy
      | MClear

    val logMem :
      {
        memOp    : mem_op,
        instKind : string,
        instType : string,
        instAddr : string
      }
        -> unit

    datatype closure1_op =
        C1Connect
      | C1ConnectAfter
      | C1Disconnect

    val logClosure1 :
      {
        closure1Op     : closure1_op,
        closureAddr    : string,
        detailedSignal : string,
        instKind       : string,
        instType       : string,
        instAddr       : string
      }
       -> unit

    datatype closure2_op =
        C2DispatchEnter
      | C2DispatchLeave
      | C2DestroyEnter
      | C2DestroyLeave

    val logClosure2 :
      {
        closure2Op  : closure2_op,
        closureAddr : string
      }
       -> unit

    val logFinalizersPendingOnExit :
      {
        globalCount      : int,
        revContextCounts : int list
      }
       -> unit
  end
