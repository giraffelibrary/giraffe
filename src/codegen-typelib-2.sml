(*
 * This file should be run in a fresh session after codegen-typelib.sml has
 * been run with the same environment.
 *
 * The purpose of this file is to translate alternative versions of namespaces
 * that are translated in codegen-typelib.sml.  It is necessary to translate
 * alternative versions of a namespace in a separate session because the
 * GIRepository library does not allow multiple version of a namespace to be
 * loaded at the same time and a namespace cannot be unloaded.
 *
 * To avoid duplicating all SML from codegen-typelib.sml, and to extend the
 * existing error log from the previous session, PolyML.SaveState is used to
 * save/load the state of the previous session.
 *)

(* Get state file *)

val outDir =
  case OS.Process.getEnv "OUT_DIR" of
    SOME s => s
  | NONE => raise Fail "Environment variable OUT_DIR not set"

val stateFile =
  OS.Path.joinDirFile {dir = OS.Path.dir outDir, file = "codegen-typelib.state"}


(* Load state *)

val () = print "-------- Run 2 --------\n"
val () = PolyML.SaveState.loadState stateFile
;


(* Initialize GObject type system *)

val () = print "Initializing GObject type system\n"
val () = GObject.typeInit ()


(* Initialize GIRepository *)

val () = print "Initializing GIRepository\n"
val repo = Repository.getDefault ()
val () = List.app Repository.prependSearchPath revPaths


(* Explicitly state required namespaces.
 *
 * This is not necessary but may catch errors sooner. *)

val () = print "Loading namespaces\n"
val _ = require repo ("Vte", "2.91", flags)


(* Generate code *)

val () = print "Generating code for namespaces\n"
val errorLog'2 = List.foldl insert errorLog'1 [
  gen outDir repo ("Vte", "2.91", "VTE") [] ([], [], [])
]

val () = writeLogFile outDir errorLog'2


(* Remove state file *)

val () = OS.FileSys.remove stateFile
