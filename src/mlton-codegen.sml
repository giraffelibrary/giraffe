(*
 * This file requires poly to be run with the following environment:
 *
 *   OUT_DIR=<output directory>
 *   VERSION_DIR=<the "version" directory>
 *   GIVERSION_DIR=<the "giversion" directory>
 *   GIREPOSITORY_DIR=<the "girepository" directory>
 *)

print "Loading SML libraries\n";

(* Load XML parser *)

print "  XML parser\n";
PolyML.Compiler.reportUnreferencedIds := false;
use "polyml-fxp.sml";


(* Load general-purpose libraries *)

print "  general-purpose libraries\n";
PolyML.Compiler.reportUnreferencedIds := true;
use "../release/src/polyml.sml";
use "../release/src/general/polyml.sml";


(* Load GIR-based GIRepository *)

print "  codegen\n";
use "mlton-polyml.sml";


(* Get output directory *)

val outDir =
  case OS.Process.getEnv "OUT_DIR" of
    SOME s => s
  | NONE => raise Fail "Environment variable OUT_DIR not set"


(* Calculate paths for GIR files *)

fun firstLine file =
  if OS.FileSys.access (file, [OS.FileSys.A_READ])
  then
    let
      val istrm = TextIO.openIn file
    in
      TextIO.inputLine istrm
       before TextIO.closeIn istrm
    end
  else NONE

local
  infix //
  val op // = OS.Path.concat

  fun isNL c = c = #"\r" orelse c = #"\n"
  val dropNL = Substring.string o Substring.dropr isNL o Substring.full
in
  fun mkPath versionDir giversionDir girepositoryDir namespace =
    let
      val versionFile = versionDir // namespace // "version"
      val giVersionFile = giversionDir // namespace // "giversion"

      val girPath = "gir-1.0" // (
        case firstLine giVersionFile of
          SOME giVersion => dropNL giVersion
        | NONE => raise Fail ("Failed to read GI version from " ^ giVersionFile)
      )

      val path =
        girepositoryDir // namespace // (
          case firstLine versionFile of
            SOME version => dropNL version // girPath
          | NONE => girPath
        )
    in
      OS.Path.mkCanonical path
    end
end

val revPaths =
  case (
    OS.Process.getEnv "VERSION_DIR",
    OS.Process.getEnv "GIVERSION_DIR",
    OS.Process.getEnv "GIREPOSITORY_DIR"
  ) of
    (NONE, _, _) => raise Fail "Environment variable VERSION_DIR not set"
  | (_, NONE, _) => raise Fail "Environment variable GIVERSION_DIR not set"
  | (_, _, NONE) => raise Fail "Environment variable GIREPOSITORY_DIR not set"
  | (SOME versionDir, SOME giversionDir, SOME girepositoryDir) =>
      let
        val dstrm = OS.FileSys.openDir versionDir;

        fun addPath paths =
          case OS.FileSys.readDir dstrm of
            SOME f =>
              addPath (mkPath versionDir giversionDir girepositoryDir f :: paths)
          | NONE => paths
      in
        addPath [] before OS.FileSys.closeDir dstrm
      end

val path =
  List.foldl (fn (dir, path) => ListDict.insert #1 ((dir, ()), path))
    ListDict.empty
    revPaths


(* Namespace dictionary for storing error information returned by `generate` *)

local
  fun errMsgAlreadyGen (((name, ver), _), _) =
    raise Fail (
      String.concat ["namespace ", name, " version ", ver, " already generated"]
    )
in
  structure NamespaceVersionMap =
    JoinMap(
      structure L = ListDict
      structure R = ListDict
    )
  val empty = NamespaceVersionMap.empty
  fun insert x = NamespaceVersionMap.inserti errMsgAlreadyGen x
end


(* Rename existing output directory *)

fun stripPrefix s1 s2 =
  if String.isPrefix s1 s2
  then SOME (String.extract (s2, String.size s1, NONE))
  else NONE

fun findNext outDir =
  let
    val {dir = parentDir, file = outFile} = OS.Path.splitDirFile outDir
    val outPrefix = outFile ^ "."
    val dstrm = OS.FileSys.openDir parentDir
    fun findNext ns =
      case OS.FileSys.readDir dstrm of
        SOME d => findNext (
          case stripPrefix outPrefix d of
            SOME s => (
              case Int.fromString s of
                SOME n => n :: ns
              | NONE => ns
            )
          | NONE => ns
        )
      | NONE => ns
    val ns = findNext []
    val () = OS.FileSys.closeDir dstrm
    val n = (List.foldl Int.max 0 ns) + 1
  in
    OS.Path.joinBaseExt {base = outDir, ext = SOME (Int.toString n)}
  end

val () =
  if OS.FileSys.access (outDir, [])
  then
    let
      val newDir = findNext outDir
      val () = List.app print [
        "Renaming existing output directory ",
        outDir,
        " to ",
        newDir,
        "\n"
      ]
    in
      OS.FileSys.rename {old = outDir, new = newDir}
        handle OS.SysErr (msg, _) =>
          raise Fail (
            String.concat [
              "Failed to rename existing output directory ", outDir,
              " to ", newDir, "\n",
              msg
            ]
          )
    end
  else ()


(* Create output directory *)

val () = List.app print ["Creating output directory ", outDir, "\n"]
val () =
  OS.FileSys.mkDir outDir
    handle OS.SysErr (msg, _) =>
      raise Fail ("Failed to create output directory " ^ outDir ^ "\n" ^ msg)


(* Generate code *)

fun gen outDir path (x as (namespace, version, _)) = (
  List.app print ["  ", mkNamespaceDep (namespace, version), "\n"];
  ((namespace, version), generate outDir path x)
)

val errorLog'0 = empty

val () = print "Generating code for namespaces\n"
val errorLog'1 = List.foldl insert errorLog'0 [
  gen outDir path ("GLib", "2.0", "GLIB"),
  gen outDir path ("GObject", "2.0", "GLIB"),
  gen outDir path ("GModule", "2.0", "GLIB"),
  gen outDir path ("Gio", "2.0", "GLIB"),
  gen outDir path ("Atk", "1.0", "ATK"),
  gen outDir path ("cairo", "1.0", ""),
  gen outDir path ("PangoCairo", "1.0", "PANGO"),
  gen outDir path ("Pango", "1.0", "PANGO"),
  gen outDir path ("GdkPixbuf", "2.0", "GDK_PIXBUF"),
  gen outDir path ("Gdk", "3.0", "GDK"),
  gen outDir path ("Gtk", "3.0", "GTK"),
  gen outDir path ("GtkSource", "3.0", "GTK_SOURCE"),
  gen outDir path ("Vte", "2.90", "VTE"),
  gen outDir path ("Vte", "2.91", "VTE")
]


(* Write log *)

val () = writeLogFile outDir errorLog'1
