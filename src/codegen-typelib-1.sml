(*
 * This file requires poly to be run with the following environment:
 *
 *   LD_PRELOAD=libgirepository-1.0.so:libgiraffe-girepository-2.0.so
 *   LD_LIBRARY_PATH=${REPO_DIR}/rel/src/polyml:${LD_LIBRARY_PATH}
 *   OUT_DIR=<output directory>
 *   VERSION_DIR=<the "version" directory>
 *   GIVERSION_DIR=<the "giversion" directory>
 *   GIMETADATA_DIR=<the "gimetadata" directory>
 *
 * LD_PRELOAD is required because the Giraffe libraries do not specify
 * library names (for portability).  Therefore the dynamic linking loader
 * must find the library so we must ensure that libraries in which to search
 * for symbols are loaded.  LD_LIBRARY_PATH is required to provide the path
 * for libgiraffe-girepository-2.0.so, specified in LD_PRELOAD.
 *
 * For a specific version of GObject Introspection, the lib directory should
 * be added to LD_LIBRARY_PATH.  For example, for gobject-introspection-1.42,
 * the following directory should
 * be added:
 *
 *   /opt/gobject-introspection/gobject-introspection-1.42.0/lib
 *)

print "Loading SML libraries\n";


(* Load GObject bindings *)

print "  GObject library\n";
PolyML.Compiler.reportUnreferencedIds := true;
use "../release/src/polyml.sml";
use "../release/src/general/polyml.sml";
use "../release/src/ffi/polyml.sml";

(* GLib and GObject namespaces expect dynamic linking to resolve symbol names
 * but no dynamic linking occurs when these namespaces are loaded and used in
 * the same session.  For now, the dynamic linking functions in the structure
 * PolyMLFFI are overridden to use dynamic loading.
 *
 * If code generation from TYPELIB files is supported properly in future,
 * where the SML interface is generated, loaded and evaluated within a single
 * session, then there would need to be variants of fixes-gir and extra-gir
 * that use `getSymbolFromLib` instead of `external[Data|Function]Symbol`.
 * However, there is no obvious need for this 'in-session' use of libraries
 * and it could only be used by compilers with a REPL.  For now, code
 * generation from TYPELIB files is performed only to check code generation
 * from GIR files.
 *)
structure PolyMLFFI =
  struct
    open PolyMLFFI
    val externalFunctionSymbol = getSymbol
    val externalDataSymbol = getSymbol
  end
;
use "../release/src/gir/polyml.sml";
use "../release/src/glib-2.0/polyml.sml";
use "../release/src/gobject-2.0/polyml.sml";


(* Load TYPELIB-based GIRepository *)

print "  GIRepository library\n";
use "polyml-typelib.sml";

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


(* Calculate GIRepository paths for TYPELIB files *)

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
  fun mkPath versionDir giversionDir gimetadataDir namespace =
    let
      val versionFile = versionDir // namespace // "version"
      val giversionFile = giversionDir // namespace // "giversion"

      val giPath = (
        case firstLine giversionFile of
          SOME giVersion => dropNL giVersion
        | NONE => raise Fail ("Failed to read GI version from " ^ giversionFile)
      )
       // "x86_64"
       // "girepository-1.0"

      val path =
        gimetadataDir // namespace // (
          case firstLine versionFile of
            SOME version => dropNL version // giPath
          | NONE => giPath
        )
    in
      OS.Path.mkCanonical path
    end
end

val revPaths =
  case (
    OS.Process.getEnv "VERSION_DIR",
    OS.Process.getEnv "GIVERSION_DIR",
    OS.Process.getEnv "GIMETADATA_DIR"
  ) of
    (NONE, _, _) => raise Fail "Environment variable VERSION_DIR not set"
  | (_, NONE, _) => raise Fail "Environment variable GIVERSION_DIR not set"
  | (_, _, NONE) => raise Fail "Environment variable GIMETADATA_DIR not set"
  | (SOME versionDir, SOME giversionDir, SOME gimetadataDir) =>
      let
        val dstrm = OS.FileSys.openDir versionDir;

        fun addPath paths =
          case OS.FileSys.readDir dstrm of
            SOME f =>
              addPath (mkPath versionDir giversionDir gimetadataDir f :: paths)
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

val quarkLocalType = mkLocalType ([], ("GLib", "Quark", "", "t"))
val pidLocalType = mkLocalType ([], ("GLib", "Pid", "", "t"))
val ioChannelRecordLocalType = mkLocalType ([], ("GLib", "IOChannel", "Record", "t"))
val ioConditionLocalType = mkLocalType ([], ("GLib", "IOCondition", "", "t"))

val typeLocalType = mkLocalType ([], ("GObject", "Type", "", "t"))
val valueRecordLocalType = mkLocalType ([], ("GObject", "Value", "Record", "t"))


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
val _ = require repo ("HarfBuzz", "0.0", flags)
val _ = require repo ("Pango", "1.0", flags)
val _ = require repo ("fontconfig", "2.0", flags)
val _ = require repo ("freetype2", "2.0", flags)
val _ = require repo ("PangoFc", "1.0", flags)
val _ = require repo ("PangoFT2", "1.0", flags)
val _ = require repo ("Gdk", "3.0", flags)
val _ = require repo ("xlib", "2.0", flags)
val _ = require repo ("Gtk", "3.0", flags)
val _ = require repo ("GtkSource", "3.0", flags)
val _ = require repo ("Vte", "2.90", flags)


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
        newSig "G_LIB_QUARK" [],                     (* TYPELIB only *)
        newSig "G_LIB_PID_TYPE" [],
        newSig "G_LIB_PID" [],                       (* TYPELIB only *)
        newSig "G_LIB_SOURCE_FUNC" [],
        newSig "G_LIB_CHILD_WATCH_FUNC" [],
        newSig "G_LIB_SPAWN_CHILD_SETUP_FUNC" [],
        newSig "G_LIB_I_O_FUNC" []
      ],
      [
        newStr ("GLib", "Quark", "G_LIB_QUARK") [],  (* TYPELIB only *)
        newStr ("GLib", "PidType", "G_LIB_PID_TYPE") [],
        extendStrDeps "GLibPid" ["GLibPidType"],
        newStr ("GLib", "Pid", "G_LIB_PID") [],      (* TYPELIB only *)
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
        newSig "G_OBJECT_TYPE" [],                   (* TYPELIB only *)
        newSig "G_OBJECT_VALUE_RECORD" [],
        newSig "G_OBJECT_VALUE" []
      ],
      [
        (* ClosureMarshal, Signal and Property are special
         * supporting structures outside the Gtk structure.  Therefore their
         * spec and strdec lists are empty but dependencies are included to
         * ensure that they are loaded after structures that they depend on. *)
        extendStrDeps "ClosureMarshal"
          [
            "GObjectValueRecord",
            "GObjectValueRecordCArrayN",
            "GObjectValue",
            "GObjectClosureRecord"
          ],
        extendStrDeps "Signal"
          [
            "Property",
            "GObjectObjectClass",
            "GObjectClosureRecord",
            "GObjectClosure",
            "GObjectValueRecord",
            "GObjectValueRecordCArrayN"
          ],
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

        (* GObjectType, GObjectValueRecord and GObjectValue are manually
         * generated modules so we must provide spec and strdec values
         * to be inserted into the namespace module. *)
        newStr ("GObject", "Type", "G_OBJECT_TYPE") [],  (* TYPELIB only *)
        newStr ("GObject", "ValueRecord", "G_OBJECT_VALUE_RECORD")
          [],
        newStr ("GObject", "Value", "G_OBJECT_VALUE")
          [typeLocalType],

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
  gen outDir repo ("HarfBuzz", "0.0", "HB") [] ([], [], []),
  gen outDir repo ("Pango", "1.0", "PANGO") [] ([], [], []),
  gen outDir repo ("cairo", "1.0", "") []
    (
      [("GObject", "2.0")],
      [
        newSig "CAIRO_ANTIALIAS" [],
        newSig "CAIRO_FILL_RULE" [],
        newSig "CAIRO_LINE_CAP" [],
        newSig "CAIRO_LINE_JOIN" [],
        newSig "CAIRO_OPERATOR" [],
        newSig "CAIRO_STATUS" []
      ],
      [
        newStr ("Cairo", "Antialias", "CAIRO_ANTIALIAS") [],
        newStr ("Cairo", "FillRule", "CAIRO_FILL_RULE") [],
        newStr ("Cairo", "LineCap", "CAIRO_LINE_CAP") [],
        newStr ("Cairo", "LineJoin", "CAIRO_LINE_JOIN") [],
        newStr ("Cairo", "Operator", "CAIRO_OPERATOR") [],
        newStr ("Cairo", "Status", "CAIRO_STATUS") [],
        extendStrDeps "CairoContext"
          [
            "CairoAntialias",
            "CairoFillRule",
            "CairoLineCap",
            "CairoLineJoin",
            "CairoOperator",
            "CairoStatus",
            "CairoContent",
            "CairoPatternRecord",
            "CairoSurfaceRecord"
          ]
      ]
    ),
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
  (* xlib fails because g_irepository_get_c_prefix returns NULL even though
   * this namespace has, according to the GIR file, the prefix "X".  This is
   * academic because this library is used only for aliases which is not
   * required by the TYPELIB version.
   *
   * gen outDir repo ("xlib", "2.0", "") [] ([], [], []),
   *)
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
  gen outDir repo ("Vte", "2.90", "VTE") [] ([], [], [])
]


(* Save state *)

val stateFile =
  OS.Path.joinDirFile {dir = OS.Path.dir outDir, file = "codegen-typelib.state"}
;
val () = PolyML.SaveState.saveState stateFile
;
