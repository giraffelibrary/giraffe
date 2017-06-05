(*
 * This file requires poly to be run with the following environment:
 *
 *   LD_PRELOAD=libgirepository-1.0.so:libgiraffe-girepository-2.0.so
 *   LD_LIBRARY_PATH=${REPO_DIR}/giraffe/src/polyml:${LD_LIBRARY_PATH}
 *   OUT_DIR=<output directory>
 *   VERSION_DIR=<the "version" directory>
 *   GIVERSION_DIR=<the "giversion" directory>
 *   GIREPOSITORY_DIR=<the "girepository" directory>
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
use "../../src/sml/polyml.sml";
use "../../src/sml/general/polyml.sml";
use "../../src/sml/ffi/polyml.sml";
use "../../src/sml/gobject-2.0/polyml.sml";
use "../../src/sml/glib-2.0/polyml.sml";


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
  fun mkPath versionDir giversionDir girepositoryDir namespace =
    let
      val versionFile = versionDir // namespace // "version"
      val giVersionFile = giversionDir // namespace // "giversion"

      val girPath = "girepository-1.0" // (
        case firstLine giVersionFile of
          SOME giVersion => dropNL giVersion
        | NONE => raise Fail ("Failed to read GI version from " ^ giVersionFile)
      ) // "x86_64"

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

type 'a namespace_dict = 'a ListDict.t ListDict.t

local
  fun errMsgAlreadyGen (name, ver) =
    String.concat ["namespace ", name, " version ", ver, " already generated"]

  fun create ver x = ListDict.singleton (ver, x)
  fun update (name, ver) (x, verDict) =
    ListDict.insert I
      (fn _ => raise Fail (errMsgAlreadyGen (name, ver))) 
      ((ver, x), verDict)
in
  fun insert (((name : string, ver : string), x), dict : 'a namespace_dict) =
    ListDict.insert
      (create ver)
      (update (name, ver))
      ((name, x), dict)
     : 'a namespace_dict
end


(* Local types for extra structures *)

val aTyVar : tyvar = (false, "a")

val quarkLocalType = toLocalType ([], ("GLib", "Quark", "", "t"))
val pidLocalType = toLocalType ([], ("GLib", "Pid", "", "t"))
val ioChannelRecordLocalType = toLocalType ([], ("GLib", "IOChannel", "Record", "t"))
val ioConditionLocalType = toLocalType ([], ("GLib", "IOCondition", "", "t"))

val eventLocalType = toLocalType ([aTyVar], ("Gdk", "Event", "", "union"))
val windowClassLocalType = toLocalType ([aTyVar], ("Gdk", "Window", "Class", "class"))
val modifierTypeLocalType = toLocalType ([], ("Gdk", "ModifierType", "", "t"))


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

fun require repo namespace version flags = (
  app print ["  ", namespace, "-", version, "\n"];
  Repository.require repo namespace version flags
)
val flags = RepositoryLoadFlags.flags []
val () = print "Loading namespaces\n"
val _ = require repo "GLib" "2.0" flags
val _ = require repo "GObject" "2.0" flags
val _ = require repo "GIRepository" "2.0" flags
val _ = require repo "GModule" "2.0" flags
val _ = require repo "Gio" "2.0" flags
val _ = require repo "Atk" "1.0" flags
val _ = require repo "GdkPixbuf" "2.0" flags
val _ = require repo "cairo" "1.0" flags
val _ = require repo "Pango" "1.0" flags	
val _ = require repo "fontconfig" "2.0" flags	
val _ = require repo "freetype2" "2.0" flags	
val _ = require repo "PangoFT2" "1.0" flags	
val _ = require repo "Gdk" "3.0" flags
val _ = require repo "xlib" "2.0" flags
val _ = require repo "Gtk" "3.0" flags
val _ = require repo "GtkSource" "3.0" flags
val _ = require repo "Vte" "2.90" flags


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

fun gen outDir repo (namespace_version as (namespace, version)) extras = (
  List.app print ["  ", namespace, "-", version, "\n"];
  (namespace_version, generate outDir repo namespace_version extras)
)

val errorLog'0 = ListDict.empty

val () = print "Generating code for namespaces\n"
val errorLog'1 = List.foldl insert errorLog'0 [
  gen outDir repo ("GLib", "2.0")
    (
      [("GObject", "2.0")],
      [
        makeSig "G_LIB_QUARK" [],                     (* TYPELIB only *)
        makeSig "G_LIB_PID" [],                       (* TYPELIB only *)
        makeSig "G_LIB_SOURCE_FUNC" [],
        makeSig "G_LIB_CHILD_WATCH_FUNC" [],
        makeSig "G_LIB_SPAWN_CHILD_SETUP_FUNC" [],
        makeSig "G_LIB_I_O_FUNC" []
      ],
      [
        makeStr ("GLib", "Quark", "G_LIB_QUARK") [],  (* TYPELIB only *)
        makeStr ("GLib", "Pid", "G_LIB_PID") [],      (* TYPELIB only *)
        makeStr ("GLib", "SourceFunc", "G_LIB_SOURCE_FUNC") [],
        makeStr ("GLib", "ChildWatchFunc", "G_LIB_CHILD_WATCH_FUNC")
          [pidLocalType],
        makeStr ("GLib", "SpawnChildSetupFunc", "G_LIB_SPAWN_CHILD_SETUP_FUNC") [],
        makeStr ("GLib", "IOFunc", "G_LIB_I_O_FUNC")
          [ioChannelRecordLocalType, ioConditionLocalType],
        addDep ("GLib", "ErrorRecord") [quarkLocalType]
      ]
    ),
  gen outDir repo ("GObject", "2.0")
    (
      [],
      [
        makeSig "CLOSURE_MARSHAL" [],
        makeSig "SIGNAL" [],
        makeSig "PROPERTY" [],
        makeSig "G_OBJECT_TYPE" [],                   (* TYPELIB only *)
        makeSig "G_OBJECT_VALUE_RECORD" [],
        makeSig "G_OBJECT_VALUE" []
      ],
      [
        (* CVector and CVectorN are manually generated modules that extend
         * existing functors (of the same name) with GValue accessors for
         * arrays.  Therefore their spec and strdec lists are empty but
         * dependencies are included to ensure that they are loaded first. *)
        (
          "CVector",
          (
            (false, ([], [])),
            ["GObjectValueRecord", "GObjectValue"]
          )
        ),
        (
          "CVectorN",
          (
            (false, ([], [])),
            ["GObjectValueRecord", "GObjectValue"]
          )
        ),
        (* ClosureMarshal, Signal and Property are special supporting
         * structures outside the Gtk structure.  Therefore their spec and
         * strdec lists are empty but dependencies are included to ensure
         * that they are loaded first. *)
        (
          "ClosureMarshal",
          (
            (false, ([], [])),
            ["GObjectValueRecord", "GObjectValue"]
          )
        ),
        (
          "Signal",
          (
            (false, ([], [])),
            ["GObjectObjectClass", "GObjectClosureRecord", "GObjectClosure"]
          )
        ),
        (
          "Property",
          (
            (false, ([], [])),
            ["GObjectObjectClass", "GObjectValueRecord", "GObjectValue"]
          )
        ),

        (* GObjectType, GObjectValueRecord and GObjectValue are manually
         * generated modules so we must provide spec and strdec values
         * to be inserted into the namespace module. *)
        (                                             (* TYPELIB only *)
          "GObjectType",
          (
            (
              false,
              (
                [mkStructSpec ("Type", (SigName "G_OBJECT_TYPE", []))],
                [mkStructStrDec ("Type", "GObjectType")]
              )
            ),
            []
          )
        ),
        (
          "GObjectValueRecord",
          (
            (
              false,
              (
                [mkStructSpec ("ValueRecord", (SigName "G_OBJECT_VALUE_RECORD", []))],
                [mkStructStrDec ("ValueRecord", "GObjectValueRecord")]
              )
            ),
            []
          )
        ),
        (
          "GObjectValue",
          (
            (
              false,
              (
                [
                  mkStructSpec (
                    "Value",
                    (
                      SigName "G_OBJECT_VALUE",
                      [
                        toList1 [
                          (
                            ([], toList1 ["record_t"]),
                            TyRef ([], toList1 ["ValueRecord", "t"])
                          )
                        ],
                        toList1 [
                          (
                            ([], toList1 ["type_t"]),
                            TyRef ([], toList1 ["Type", "t"])
                          )
                        ]
                      ]
                    )
                  )
                ],
                [mkStructStrDec ("Value", "GObjectValue")]
              )
            ),
            ["GObjectType", "GObjectValueRecord"]
          )
        ),

        (* GObjectClosureRecord, GObjectClosure, GObjectObjectClass and
         * GObjectParamSpecClass are partially automatically generated.
         * Addition dependencies are required for the manual fixes to the
         * automatic translation. *)
        (
          "GObjectClosureRecord",
          (
            (false, ([], [])),
            ["GObjectType", "GObjectValueRecord", "GObjectValue"]
          )
        ),
        (
          "GObjectClosure",
          ((false, ([], [])), ["ClosureMarshal", "GObjectClosureRecord"])
        ),

        (
          "GObjectObjectClass",
          (
            (false, ([], [])),
            ["GObjectType", "GObjectValueRecord", "GObjectValue"]
          )
        ),
        (
          "GObjectParamSpecClass",
          (
            (false, ([], [])),
            ["GObjectType", "GObjectValueRecord", "GObjectValue"]
          )
        )
      ]
    ),
  gen outDir repo ("GModule", "2.0") ([], [], []),
  gen outDir repo ("Gio", "2.0") ([], [], []),
  gen outDir repo ("GIRepository", "2.0")
    (
      [],
      [
        makeSig "G_I_REPOSITORY_BASE_INFO_RECORD" []
      ],
      [
        makeStr
          ("GIRepository", "BaseInfoRecord", "G_I_REPOSITORY_BASE_INFO_RECORD")
          [],
        makeStr
          ("GIRepository", "TypelibRecord", "G_I_REPOSITORY_TYPELIB_RECORD")
          []
      ]
    ),
  gen outDir repo ("Atk", "1.0") ([], [], []),
  gen outDir repo ("GdkPixbuf", "2.0") ([], [], []),
  gen outDir repo ("Pango", "1.0") ([], [], []),
  gen outDir repo ("cairo", "1.0") ([("GObject", "2.0")], [], []),
  gen outDir repo ("PangoCairo", "1.0") ([], [], []),
  gen outDir repo ("Gdk", "3.0")
    (
      [],
      [
        makeSig "GDK_EVENT_ANY_RECORD" [],
        makeSig "GDK_EVENT_BUTTON_RECORD" [],
        makeSig "GDK_EVENT_CONFIGURE_RECORD" [],
        makeSig "GDK_EVENT_CROSSING_RECORD" [],
        makeSig "GDK_EVENT_D_N_D_RECORD" [],
        makeSig "GDK_EVENT_EXPOSE_RECORD" [],
        makeSig "GDK_EVENT_FOCUS_RECORD" [],
        makeSig "GDK_EVENT_GRAB_BROKEN_RECORD" [],
        makeSig "GDK_EVENT_KEY_RECORD" [],
        makeSig "GDK_EVENT_MOTION_RECORD" [],
        makeSig "GDK_EVENT_OWNER_CHANGE_RECORD" [],
        makeSig "GDK_EVENT_PROPERTY_RECORD" [],
        makeSig "GDK_EVENT_PROXIMITY_RECORD" [],
        makeSig "GDK_EVENT_SCROLL_RECORD" [],
        makeSig "GDK_EVENT_SELECTION_RECORD" [],
        makeSig "GDK_EVENT_SETTING_RECORD" [],
        makeSig "GDK_EVENT_VISIBILITY_RECORD" [],
        makeSig "GDK_EVENT_WINDOW_STATE_RECORD" [],
        makeSig "CLASSIFY_EVENT" []
      ],
      let
      in
        [
          makeStr
            ("Gdk", "EventAnyRecord", "GDK_EVENT_ANY_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventButtonRecord", "GDK_EVENT_BUTTON_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventConfigureRecord", "GDK_EVENT_CONFIGURE_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventCrossingRecord", "GDK_EVENT_CROSSING_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventDNDRecord", "GDK_EVENT_D_N_D_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventExposeRecord", "GDK_EVENT_EXPOSE_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventFocusRecord", "GDK_EVENT_FOCUS_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventGrabBrokenRecord", "GDK_EVENT_GRAB_BROKEN_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventKeyRecord", "GDK_EVENT_KEY_RECORD")
            [eventLocalType, windowClassLocalType, modifierTypeLocalType],
          makeStr
            ("Gdk", "EventMotionRecord", "GDK_EVENT_MOTION_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventOwnerChangeRecord", "GDK_EVENT_OWNER_CHANGE_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventPropertyRecord", "GDK_EVENT_PROPERTY_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventProximityRecord", "GDK_EVENT_PROXIMITY_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventScrollRecord", "GDK_EVENT_SCROLL_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventSelectionRecord", "GDK_EVENT_SELECTION_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventSettingRecord", "GDK_EVENT_SETTING_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventVisibilityRecord", "GDK_EVENT_VISIBILITY_RECORD")
            [eventLocalType],
          makeStr
            ("Gdk", "EventWindowStateRecord", "GDK_EVENT_WINDOW_STATE_RECORD")
            [eventLocalType],
(*
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
        "GdkEventPropertyRecord",
        "GdkEventProximityRecord",
        "GdkEventScrollRecord",
        "GdkEventSelectionRecord",
        "GdkEventSettingRecord",
        "GdkEventVisibilityRecord",
        "GdkEventWindowStateRecord"
*)
        (
          "ClassifyEvent",
          (
            (false, ([], [])),
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
              "GdkEventPropertyRecord",
              "GdkEventProximityRecord",
              "GdkEventScrollRecord",
              "GdkEventSelectionRecord",
              "GdkEventSettingRecord",
              "GdkEventVisibilityRecord",
              "GdkEventWindowStateRecord"
            ]
          )
        )
        ]
      end
    ),
  (* xlib fails because g_irepository_get_c_prefix returns NULL even though
   * this namespace has, according to the GIR file, the prefix "X".  This is
   * academic because this library is used only for aliases which is not
   * required by the TYPELIB version.
   *
   * gen outDir repo ("xlib", "2.0") ([], [], []),
   *)
  gen outDir repo ("Gtk", "3.0")
    (
      [],
      [
        makeSig "CHILD_SIGNAL" [],
        makeSig "GTK_ACTION_ENTRY" []
      ],
      [
        ("ChildSignal", ((false, ([], [])), ["GtkWidgetClass", "GtkWidget"])),
        makeStr ("Gtk", "ActionEntry", "GTK_ACTION_ENTRY") [],
        ("GtkActionGroup", ((false, ([], [])), ["GtkActionEntry", "GtkAction"]))
      ]
    ),
  gen outDir repo ("GtkSource", "3.0") ([], [], []),
  gen outDir repo ("Vte", "2.90") ([], [], [])
]


(* Save state *)

val stateFile =
  OS.Path.joinDirFile {dir = OS.Path.dir outDir, file = "codegen-typelib.state"}
;
val () = PolyML.SaveState.saveState stateFile
;
