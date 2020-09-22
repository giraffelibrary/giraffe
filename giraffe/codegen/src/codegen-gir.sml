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
use "fxlib-polyml.sml";


(* Load general-purpose libraries *)

print "  general-purpose libraries\n";
PolyML.Compiler.reportUnreferencedIds := true;
use "../../src/polyml.sml";
use "../../src/general/polyml.sml";


(* Load GIR-based GIRepository *)

print "  codegen\n";
use "polyml-gir.sml";

val () = constructorNames :=
  [
    "NONE",
    "SOME",
    "EQUAL",
    "LESS",
    "GREATER"
  ]


(* Get output directory *)

val outDir =
  case OS.Process.getEnv "OUT_DIR" of
    SOME s => s
  | NONE => raise Fail "Environment variable OUT_DIR not set"


(* Calculate GIRepository paths for GIR files *)

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


(* Local types for extra structures *)

val aTyVar : tyvar = (false, "a")
val bTyVar : tyvar = (false, "b")

val valueAccessorLocalType = mkLocalType ([aTyVar, bTyVar], ("", "ValueAccessor", "", "t"))

val quarkLocalType = mkLocalType ([], ("GLib", "Quark", "", "t"))
val pidLocalType = mkLocalType ([], ("GLib", "Pid", "", "t"))
val ioChannelRecordLocalType = mkLocalType ([], ("GLib", "IOChannel", "Record", "t"))
val ioConditionLocalType = mkLocalType ([], ("GLib", "IOCondition", "", "t"))

val typeLocalType = mkLocalType ([], ("GObject", "Type", "", "t"))
val valueRecordLocalType = mkLocalType ([], ("GObject", "Value", "Record", "t"))


(* Initialize GIRepository *)

val () = print "Initializing GIRepository\n"
val repo = Repository.getDefault ()
val () = List.app (Repository.prependSearchPath repo) revPaths


(* Explicitly state required namespaces.
 *
 * This is not necessary but may catch errors sooner. *)

fun require repo (namespace, version, flags) = (
  app print ["  ", mkNamespaceDep (namespace, version), "\n"];
  Repository.require repo (namespace, version, flags)
)
val flags = RepositoryLoadFlags.flags []
val () = print "Loading namespaces\n"
val _ = require repo ("GLib", "2.0", flags)
val _ = require repo ("GObject", "2.0", flags)
val _ = require repo ("GIRepository", "2.0", flags)
val _ = require repo ("GModule", "2.0", flags)
val _ = require repo ("Gio", "2.0", flags)
val _ = require repo ("Atk", "1.0", flags)
val _ = require repo ("GdkPixbuf", "2.0", flags)
val _ = require repo ("cairo", "1.0", flags)
val _ = require repo ("Pango", "1.0", flags)
val _ = require repo ("fontconfig", "2.0", flags)
val _ = require repo ("freetype2", "2.0", flags)
val _ = require repo ("PangoFT2", "1.0", flags)
val _ = require repo ("Gdk", "3.0", flags)
val _ = require repo ("xlib", "2.0", flags)
val _ = require repo ("Gtk", "3.0", flags)
val _ = require repo ("GtkSource", "3.0", flags)
val _ = require repo ("Vte", "2.90", flags)
val _ = require repo ("Vte", "2.91", flags)


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

fun gen outDir repo (x as (namespace, version, _)) initNamespaceDeps extras = (
  List.app print ["  ", mkNamespaceDep (namespace, version), "\n"];
  ((namespace, version), generateFull outDir repo x initNamespaceDeps extras)
)

fun init outDir namespace_version initNamespace extras =
  generateInit outDir namespace_version initNamespace extras

val errorLog'0 = empty

val () = print "Generating code for namespaces\n"
val () = ignore [
  (* The initial directory for GLib contains a minimal GObject namespace that
   * provides support for using GType and GValue and a structure ValueAccessor
   * through which GValues are accessed.
   *
   * Note that the version of GObjectValueRecord in the GLib namespace does
   * not include value accessors which breaks a cyclic dependency that would
   * otherwise occur between ValueAccessor and GObjectValueRecord.  The value
   * accessors are added to the version of GObjectValueRecord in the GObject
   * namespace. *)
  init outDir ("GLib", "2.0") "GObject"
    (
      [],
      [
        newSig "G_OBJECT_TYPE" [],
        newSig "G_OBJECT_VALUE_RECORD" [],
        newSig "VALUE_ACCESSOR" [],
        newSig "C_ARRAY" [],
        newSig "C_ARRAY_N" ["C_ARRAY"]
      ],
      [
        newStr ("GObject", "Type", "G_OBJECT_TYPE") [],
        newStr ("GObject", "ValueRecord", "G_OBJECT_VALUE_RECORD") [],
        extendStrDeps "ValueAccessor" ["GObjectValueRecord", "GObjectType"],

        (* CArray and CArrayN are manually generated modules that extend
         * existing functors (of the same name) with GValue accessors for
         * arrays.  Therefore their spec and strdec lists are empty but
         * dependencies are included to ensure that they are loaded first. *)
        extendFunDeps "CArray" [] ["GObjectValueRecord", "ValueAccessor"],
        extendFunDeps "CArrayN" [] ["GObjectValueRecord", "ValueAccessor"],
        extendFunDeps "ConstCArray" [] ["GObjectValueRecord", "ValueAccessor"],
        extendFunDeps "ConstCArrayN" [] ["GObjectValueRecord", "ValueAccessor"],
        extendFunDeps "VectorCArray" [] ["ValueAccessor"],
        extendFunDeps "VectorCArrayN" [] ["ValueAccessor"]
      ]
    )
]
val errorLog'1 = List.foldl insert errorLog'0 [
  (* Types is not an initial namespace but we use this mechanism to bring
   * the static types into scope in the GLib namespace by manually supplying
   * the files that would load the initial namespace to just bring GIR type
   * structures into scope.  For Poly/ML there is nothing to do. *)
  gen outDir repo ("GLib", "2.0", "GLIB") ["Types", "GObject"]
    (
      [],
      [
        newSig "G_LIB_PID_TYPE" [],
        newSig "G_LIB_SOURCE_FUNC" [],
        newSig "G_LIB_CHILD_WATCH_FUNC" [],
        newSig "G_LIB_SPAWN_CHILD_SETUP_FUNC" [],
        newSig "G_LIB_I_O_FUNC" []
      ],
      [
        newStr ("GLib", "PidType", "G_LIB_PID_TYPE") [],
        extendStrDeps "GLibPid" ["GLibPidType"],
        newStr ("GLib", "SourceFunc", "G_LIB_SOURCE_FUNC") [],
        newStr ("GLib", "ChildWatchFunc", "G_LIB_CHILD_WATCH_FUNC")
          [pidLocalType],
        newStr ("GLib", "SpawnChildSetupFunc", "G_LIB_SPAWN_CHILD_SETUP_FUNC") [],
        newStr ("GLib", "IOFunc", "G_LIB_I_O_FUNC")
          [ioChannelRecordLocalType, ioConditionLocalType],
        extendStrDeps "GLibErrorRecord" ["GLibQuark"]
      ]
    ),
  gen outDir repo ("GObject", "2.0", "GLIB") []
    (
      [],
      [
        newSig "CLOSURE_MARSHAL" [],
        newSig "SIGNAL" [],
        newSig "PROPERTY" [],
        newSig "G_OBJECT_VALUE_RECORD" [],
        newSig "G_OBJECT_VALUE" [],
        newSig "VALUE_ACCESSOR" []
      ],
      [
        (* ClosureMarshal, ValueAccessor, Signal and Property are special
         * supporting structures outside the Gtk structure.  Therefore their
         * spec and strdec lists are empty but dependencies are included to
         * ensure that they are loaded after structures that they depend on. *)
        extendStrDeps "ClosureMarshal"
          ["GObjectValueRecord", "GObjectValue", "GObjectClosureRecord"],
        extendStrDeps "ValueAccessor" [],
        extendStrDeps "Signal"
          ["GObjectObjectClass", "GObjectClosureRecord", "GObjectClosure"],
        extendStrDeps "Property"
          [
            "GObjectObjectClass",
            "GObjectBindingClass",
            "GObjectBindingFlags",
            "GObjectValueRecord",
            "GObjectValue",
            "GObjectType",
            "GObjectClosure"
          ],

        (* Signal and Property must be loaded before structures that depend
           on them. *)
        extendStrDeps "GObjectObject" ["Signal"],
        extendStrDeps "GObjectBinding" ["Property"],

        (* GObjectValueRecord and GObjectValue are manually
         * generated modules so we must provide spec and strdec values
         * to be inserted into the namespace module. *)
        newStr ("GObject", "ValueRecord", "G_OBJECT_VALUE_RECORD")
          [valueAccessorLocalType],
        newStr ("GObject", "Value", "G_OBJECT_VALUE")
          [valueRecordLocalType, typeLocalType],

        (* GObjectClosureRecord, GObjectClosure, GObjectObjectClass and
         * GObjectParamSpecClass are partially automatically generated.
         * Addition dependencies are required for the manual fixes to the
         * automatic translation. *)
        extendStrDeps "GObjectClosureRecord"
          ["GObjectType", "GObjectValueRecord", "GObjectValue"],
        extendStrDeps "GObjectClosure"
          ["ClosureMarshal", "GObjectClosureRecord"],
        extendStrDeps "GObjectObjectClass"
          ["GObjectType", "GObjectValueRecord", "GObjectValue"],
        extendStrDeps "GObjectParamSpecClass"
          ["GObjectType", "GObjectValueRecord", "GObjectValue"]
      ]
    ),
  gen outDir repo ("GModule", "2.0", "GLIB") [] ([], [], []),
  gen outDir repo ("Gio", "2.0", "GLIB") [] ([], [], []),
  gen outDir repo ("GIRepository", "2.0", "") []
    (
      [],
      [
        newSig "G_I_REPOSITORY_BASE_INFO_RECORD" []
      ],
      [
        newStr
          ("GIRepository", "BaseInfoRecord", "G_I_REPOSITORY_BASE_INFO_RECORD")
          [],
        newStr
          ("GIRepository", "TypelibRecord", "G_I_REPOSITORY_TYPELIB_RECORD")
          []
      ]
    ),
  gen outDir repo ("Atk", "1.0", "ATK") [] ([], [], []),
  gen outDir repo ("GdkPixbuf", "2.0", "GDK_PIXBUF") [] ([], [], []),
  gen outDir repo ("Pango", "1.0", "PANGO") [] ([], [], []),
  gen outDir repo ("cairo", "1.0", "") [] ([("GObject", "2.0")], [], []),
  gen outDir repo ("PangoCairo", "1.0", "PANGO") [] ([], [], []),
  gen outDir repo ("Gdk", "3.0", "GDK") []
    (
      [],
      [
        newSig "CLASSIFY_EVENT" []
      ],
      let
      in
        [
          extendStrDeps "ClassifyEvent"
            [
              "GdkEventAnyRecord",
              "GdkEventButtonRecord",
              "GdkEventConfigureRecord",
              "GdkEventCrossingRecord",
              "GdkEventDNDRecord",
              "GdkEventExposeRecord",
              "GdkEventFocusRecord",
              "GdkEventGrabBrokenRecord",
              "GdkEventKeyRecord",
              "GdkEventMotionRecord",
              "GdkEventOwnerChangeRecord",
              "GdkEventPadAxisRecord",
              "GdkEventPadButtonRecord",
              "GdkEventPadGroupModeRecord",
              "GdkEventPropertyRecord",
              "GdkEventProximityRecord",
              "GdkEventScrollRecord",
              "GdkEventSelectionRecord",
              "GdkEventSettingRecord",
              "GdkEventTouchpadPinchRecord",
              "GdkEventTouchpadSwipeRecord",
              "GdkEventTouchRecord",
              "GdkEventVisibilityRecord",
              "GdkEventWindowStateRecord"
            ]
        ]
      end
    ),
  gen outDir repo ("xlib", "2.0", "") [] ([], [], []),
  gen outDir repo ("Gtk", "3.0", "GTK") []
    (
      [],
      [
        newSig "CHILD_SIGNAL" []
      ],
      [
        extendStrDeps "ChildSignal" ["GtkWidgetClass", "GtkWidget"]
      ]
    ),
  gen outDir repo ("GtkSource", "3.0", "GTK_SOURCE") [] ([], [], []),
  gen outDir repo ("Vte", "2.90", "VTE") [] ([], [], []),
  gen outDir repo ("Vte", "2.91", "VTE") [] ([], [], [])
]

val () = writeLogFile outDir errorLog'1

