(* Copyright (C) 2012, 2023-2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GiraffeDebug :> GIRAFFE_DEBUG =
  struct
    (* Pattern tokens *)
    datatype tok =
        Str of string  (* [:alpha-numeric:] *)
      | Dash           (* "-" *)
      | LBrace         (* "{" *)
      | RBrace         (* "}" *)
      | Comma          (* "," *)

    (* Pattern lexer
     *
     * `lex getc` is a token reader that uses the character reader `getc`. *)
    exception Lex
    fun lex (getc : (char, 'a) StringCvt.reader) : (tok, 'a) StringCvt.reader =
      fn src =>
        case StringCvt.splitl Char.isAlphaNum getc src of
          ("", _) => (
            case getc src of
              SOME (#"-", src'1) => SOME (Dash,   src'1)
            | SOME (#"{", src'1) => SOME (LBrace, src'1)
            | SOME (#"}", src'1) => SOME (RBrace, src'1)
            | SOME (#",", src'1) => SOME (Comma,  src'1)
            | SOME _             => raise Lex
            | NONE               => NONE
          )
        | (s, src'1) => SOME (Str s, src'1)

    (* Pattern abstract syntax tree
     *
     * The type `pat` is the abstract syntax for the non-terminal `pat`. *)
    datatype pat_frag =
        All  (* Str "all" *)
      | Fixed of string
      | Cases of pat list
    withtype pat = pat_frag list

    (* A pattern has the following grammar:
     *
     *     pat =
     *       pat_frag
     *     | pat_frag , Dash , pat
     *
     *     pat_frag =
     *       Str
     *     | LBrace , RBrace
     *     | LBrace , pat_list1 , RBrace
     *
     *     pat_list1 =
     *       pat
     *     | pat , Comma , pat_list1
     *)

    (* Pattern parser *)
    exception Syntax
    local
      fun mapFst f (a, b) = (f a, b)
      fun singleton a = [a]
      fun append xs x = x :: xs
    in
      fun parsePat read (src : 'a) : pat * 'a =
        parsePatAfterPatFrags read (mapFst singleton (parsePatFrag read src))

      and parsePatAfterPatFrags read (revFrags : pat_frag list, src : 'a) : pat * 'a =
        case read src of
          SOME (Dash, src'1) =>
            parsePatAfterPatFrags read (mapFst (append revFrags) (parsePatFrag read src'1))
        | _ => (List.rev revFrags, src)

      and parsePatFrag read (src : 'a) : pat_frag * 'a =
        case read src of
          SOME (Str s, src'1) => (if s = "all" then All else Fixed s, src'1)
        | SOME (LBrace, src'1) => (
            case read src'1 of
              SOME (RBrace, src'2) => (Cases [], src'2)
            | _ => mapFst Cases (parsePatList1 read src'1)
          )
        | _ => raise Syntax

      and parsePatList1 read (src : 'a) : pat list * 'a =
        parsePatList1AfterPats read (mapFst singleton (parsePat read src))

      and parsePatList1AfterPats read (revPats : pat list, src : 'a) : pat list * 'a =
        case read src of
          SOME (Comma, src'1) =>
            parsePatList1AfterPats read (mapFst (append revPats) (parsePat read src'1))
        | SOME (RBrace, src'1) => (List.rev revPats, src'1)
        | _ => raise Syntax
    end

    val getOptsPat =
      let
        fun readEnvVar () =
          let
            val patStr'1 = Option.getOpt (OS.Process.getEnv "GIRAFFE_DEBUG", "")
            val patStr'2 = if patStr'1 = "" then "{}" else patStr'1  (* empty matches nothing *)
            val (pat, unused) = parsePat (lex Substring.getc) (Substring.full patStr'2)
            val () =
              if Substring.isEmpty unused
              then ()
              else raise Syntax
          in
            pat
          end
            handle
              Lex => (GiraffeLog.warning "invalid character in value of environment variable GIRAFFE_DEBUG"; [])
            | Syntax => (GiraffeLog.warning "syntax error in value of environment variable GIRAFFE_DEBUG"; [])
            | e => (GiraffeLog.warning (String.concat ["exception ", General.exnMessage e, " raised when processing value of environment variable GIRAFFE_DEBUG"]); [])
      in
        Fn.lazy readEnvVar
      end

    (* Pattern matching
     *
     * A trailing "all" matches anything, i.e. zero or more option fragments,
     * whereas "{all}" matches one or more option fragments.
     *)
    val rec matches : string list * pat -> bool =
      fn
        ([],             [])                     => true
      | (_ :: _,         [])                     => false
      | (_,              [All])                  => true
      | ([],             _ :: _)                 => false
      | (_  :: optFrags, All        :: patFrags) => matches (optFrags, patFrags)
      | (s1 :: optFrags, Fixed s2   :: patFrags) =>
          s1 = s2 andalso matches (optFrags, patFrags)
      | (optFrags,       Cases pats :: patFrags) =>
          List.exists (fn pat => matches (optFrags, pat @ patFrags)) pats

    fun haveOpt frags = matches (frags, getOptsPat ()) handle _ => false

    val isEnabled =  (* compile-time *)
      case OS.Process.getEnv "GIRAFFE_DEBUG" of
        NONE    => false
      | SOME "" => false
      | SOME _  => true

    val logMemEnabled =
      Fn.lazy (fn () => isEnabled andalso haveOpt ["log", "mem"])
    val logClosureEnabled =
      Fn.lazy (fn () => isEnabled andalso haveOpt ["log", "closure"])
    val logFinalizersPendingOnExitEnabled =
      Fn.lazy (fn () => isEnabled andalso haveOpt ["log", "finalizers", "pending", "on", "exit"])
    val forceFinalizationOnExitEnabled =
      Fn.lazy (fn () => isEnabled andalso haveOpt ["force", "finalization", "on", "exit"])

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

    val logMem =
      let
        val log = GiraffeLog.logDebug ["mem"]
      in
        fn {memOp, instKind, instType, instAddr} =>
          log
            [
              " ",
              getTime (), " ",
              memOpToString memOp, " ",
              instKind, " ",
              instType, " ",
              instAddr, "\n"
            ]
      end

    datatype closure1_op =
        C1Connect
      | C1ConnectAfter
      | C1Disconnect

    val closure1OpToString =
      fn
        C1Connect      => "connect"
      | C1ConnectAfter => "connect-after"
      | C1Disconnect   => "disconnect"

    val logClosure1 =
      let
        val log = GiraffeLog.logDebug ["closure"]
      in
        fn {closure1Op, closureAddr, detailedSignal, instKind, instType, instAddr} =>
          log
            [
              " ",
              getTime (), " ",
              closure1OpToString closure1Op, " ",
              closureAddr, " ",
              "\"", detailedSignal, "\" ",
              instKind, " ",
              instType, " ",
              instAddr, "\n"
            ]
      end

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

    val logClosure2 =
      let
        val log = GiraffeLog.logDebug ["closure"]
      in
        fn {closure2Op, closureAddr} =>
          log
            [
              " ",
              getTime (), " ",
              closure2OpToString closure2Op, " ",
              closureAddr, "\n"
            ]
      end

    val logFinalizersPendingOnExit =
      let
        val log = GiraffeLog.logDebug ["finalizers-pending-on-exit"]
      in
        fn {globalCount, revContextCounts} =>
          log
            (
              " " :: Int.toString globalCount ::
                List.foldl
                  (fn (count, strs) => " " :: Int.toString count :: strs)
                  ["\n"]
                  revContextCounts
            )
      end
  end
