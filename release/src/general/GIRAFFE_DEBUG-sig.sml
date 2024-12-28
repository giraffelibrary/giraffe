(* Copyright (C) 2012, 2023-2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature GIRAFFE_DEBUG =
  sig
    (* `isEnabled` is fixed at compile-time. *)
    val isEnabled : bool

    (* Option format
     *
     * An option is a sequence of alphanumeric string fragments separated by
     * the "-" character, for example, "abc1-2def-4-b".  In the environment
     * variable GIRAFFE_DEBUG, multiple options can be specified by a pattern
     * that each option is matched against.  A pattern generalizes the option
     * format as follows:
     *   - A sub-sequence of fragments may be a choice of sub-sequences,
     *     specified as a comma-separated list in braces, without whitespace.
     *     For example, options "ab-c-ef", "ab-c-d-ef" and "ab-d-ef" all
     *     match the pattern "ab-{c,c-d,d}-ef".
     *   - The fragment "all" is special and any option fragment matches it,
     *     except that a trailing "all" is matched by zero or more trailing
     *     option fragments.  Note that a trailing "{all}" is matched by one
     *     or more trailing option fragments.  For example, "a-b-c" matches
     *     the patterns
     *       - "all";
     *       - "a-all" and "a-{all}" but not "all-c";
     *       - "all-all-c", "a-all-c", "all-b-c", "a-b-all" and "a-b-{all}";
     *       - "a-b-c-all" but not "a-b-c-{all}" nor "a-b-c-all-all".
     *
     *
     * Options
     *
     * The following options can be specified in the environment variable
     * GIRAFFE_DEBUG:
     *
     *     log-mem
     *     log-closure
     *     log-finalizers-pending-on-exit
     *     force-finalization-on-exit
     *)

    (* The following functions test whether an option is enabled, by
     * matching against the pattern specified by the environment variable
     * GIRAFFE_DEBUG.
     *
     *   `logMemEnabled ()`
     *     Indicates whether "log-mem" matches.
     *
     *   `logClosureEnabled ()`
     *     Indicates whether "log-closure" matches.
     *
     *   `logFinalizersPendingOnExitEnabled ()`
     *     Indicates whether "log-finalizers-pending-on-exit" matches.
     *
     *   `forceFinalizationOnExitEnabled ()`
     *     Indicates whether "force-finalization-on-exit" matches.
     *)
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
