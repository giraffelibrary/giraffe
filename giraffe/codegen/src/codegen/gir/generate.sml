fun loadNamespace repo (namespace, version) =
  let
    val (typelib, vers) =
      Repository.require
        repo
        (namespace, version, RepositoryLoadFlags.flags [])

    val namespace_ =
      Repository.loadTypelib
        repo
        typelib
        (RepositoryLoadFlags.flags [])

    (* a sanity check... *)
    val () =
      if namespace = namespace_
      then ()
      else
        raise
          Fail (
            concat [
              "namespace mismatch: \"",
              namespace,
              "\" <> \"",
              namespace_,
              "\""
            ]
          )
  in
    (typelib, vers)
  end



fun mkBaseVersion base ver = String.concat [base, "-", ver]



(* `sort m` reorders `m` such that each element occurs after
 * its dependencies.  In other words, to satisfy the partial order in `m`.
 *
 *
 * The result is in reverse order.
 *)

fun listRemoveFirst ys xs = foldl removeFirst xs ys

infix **
fun (f ** g) (x, y) = (f x, g y)


fun getNext (m : (id * ('a * id list)) list) =
  let
    val (next, m'1) =
      partitionRevMap
        (fn (id, (x, [])) => SOME (id, x) | _ => NONE, I)
        m

    val ids = map #1 next
    val m'2 = revMap (I ** (I ** listRemoveFirst ids)) m'1
  in
    case next of
      _ :: _ => ()
    | []     =>
        let
          fun quote s = ["\"", String.toString s, "\""]
          fun fmt (id, (_, deps)) = (
            app (app print) [quote id, [" ("]];
            app (app print) (sepWith [", "] (map quote deps));
            print ")\n"
          )
        in
          print "**** Excluding from basis for missing\
                       \ or cyclic dependencies ****\n";
          app fmt m
        end;
    (next, m'2)
  end

fun sort (m : (id * ('a * id list)) list) : (id * 'a) list =
  let
    fun aux acc l =
      case l of
        _ :: _ =>
          let
            val (next, l') = getNext l
          in
            case next of
              _ :: _ => aux (next @ acc) l'
            | []     => acc
          end
      | []     => acc
  in
    aux [] m
  end


fun mkProgramFile target (file, isPortable) =
  if isPortable then file else mkTargetFile target file


fun mkMLBBasDec (root, dir, base) =
  OS.Path.joinDirFile {
    dir  = OS.Path.joinDirFile {dir = root, file = dir},
    file = mkFile (base, mlbFileExt)
  }

val mltonBasDecs = [
  mkMLBBasDec ("$(SML_LIB)", "basis", "basis"),
  mkMLBBasDec ("$(SML_LIB)", "basis", "mlton")
]
val giraffeBasDecs = [
  mkMLBBasDec ("$(GIRAFFE_SML_LIB)", "general", "mlton"),
  mkMLBBasDec ("$(GIRAFFE_SML_LIB)", "ffi", "mlton")
]

fun mkNamespaceBasDec namespaceDep =
  let
    val dir = String.map Char.toLower namespaceDep
    val baseMLton = targetString MLton
  in
    mkMLBBasDec (OS.Path.parentArc, dir, baseMLton)
  end


fun fmtNamespaceBasisMLton namespaceDeps (revSigs, revStrs) : VTextTree.t =
  let
    val mkMLtonFile = mkProgramFile MLton
    val sigBasDecs = revMap mkMLtonFile revSigs
    val strBasDecs = revMap mkMLtonFile revStrs

    val namespaceDepBasDecs = revMap mkNamespaceBasDec namespaceDeps
    val localBasDecs = mltonBasDecs @ giraffeBasDecs @ namespaceDepBasDecs

    open HVTextTree
    val indent = V.indentWith (H.str "  ") true
  in
    V.seq [
      V.str "local",
      indent (
        V.seq (map V.str localBasDecs)
      ),
      V.str "in",
      indent (
        V.seq [
          V.seq (map V.str sigBasDecs),
          V.str "ann",
          indent (
            V.seq [
              V.str "\"allowFFI true\"",
              V.str "\"resolveScope topdec\""
            ]
          ),
          V.str "in",
          indent (
            V.seq (map V.str strBasDecs)
          ),
          V.str "end"
        ]
      ),
      V.str "end"
    ]
  end


local
  fun mkUseTopLevelDec e = TopLevelDecExp (ExpApp (mkIdLNameExp "use", e))
  val useSigExp = mkUseTopLevelDec o ExpConst o ConstString o mkProgramFile PolyML
  val useStrExp = mkUseTopLevelDec o ExpConst o ConstString o mkProgramFile PolyML
in
  fun fmtNamespaceBasisPolyML (revSigs, revStrs)
    : VTextTree.t =
    let
      val topLevelDecs'1 = revMap useStrExp revStrs
      val topLevelDecs'2 = revMapAppend useSigExp (revSigs, topLevelDecs'1)
    in
      PrettyPrint.fmtProgram topLevelDecs'2
    end
end




fun writeFile (dir, file) v =
  let
    val dirFile = OS.Path.concat (dir, file)

    val ostream = TextIO.openAppend dirFile
    val writer = (
      fn () => TextIO.output1 (ostream, #"\n"),
      fn s => TextIO.output (ostream, s)
    )
  in
    HVTextTree.V.app writer v
      handle
        e => (TextIO.closeOut ostream; raise e);
    TextIO.closeOut ostream
  end


fun fmtModules ms = PrettyPrint.fmtProgram (map mkModuleTopLevelDec ms)

fun writeProgramFile dir (file, program) =
  case program of
    Portable common          => writeFile (dir, file) (fmtModules common)
  | Specific {mlton, polyml} => (
      writeFile (dir, mkTargetFile MLton file) (fmtModules mlton);
      writeFile (dir, mkTargetFile PolyML file) (fmtModules polyml)
    )


fun mkBasisFile target =
  mkFile (
    targetString target, 
    case target of
      MLton  => mlbFileExt
    | PolyML => smlFileExt
  )

fun writeBasisFileMLton namespaceDir namespaceDeps (revSigs, revStrs) =
  writeFile
    (namespaceDir, mkBasisFile MLton)
    (fmtNamespaceBasisMLton namespaceDeps (revSigs, revStrs))

fun writeBasisFilePolyML namespaceDir (revSigs, revStrs) =
  writeFile
    (namespaceDir, mkBasisFile PolyML)
    (fmtNamespaceBasisPolyML (revSigs, revStrs))

fun writeBasisFile
  namespaceDir
  namespaceDeps
  (revSigs, revStrs) =
  let
  in
    writeBasisFileMLton namespaceDir namespaceDeps (revSigs, revStrs);
    writeBasisFilePolyML namespaceDir (revSigs, revStrs)
  end


fun writeCInterfaceFile dir cppPrefix cInterfaceDecls =
  writeFile
    (dir, mkFile (giraffeId, cFileExt))
    (fmtCInterfaceDecls cppPrefix cInterfaceDecls)


val package = "package"

fun writePackageFile
  repo
  vers
  namespace
  namespaceDir =
  let
    val packages = Repository.getPackages repo vers namespace  (* GIR only *)

    open HVTextTree
    val v = V.seq (map V.str packages)
  in
    writeFile (namespaceDir, package) v
  end


(* `createNamespaceDir isInit (namespace, version)` creates the directory
 * hierarchy into which generated files for the namespace given by `namespace`
 * and `version` are placed.  The directory hierarchy is created relative to
 * the current directory.  The root directory name is returned.
 *
 * If `isInit` is true, the root directory name has the prefix "init-" and
 * no exception is raised if directories in the hierarchy already exist.
 *
 * If `isInit` is false, the root directory name does not have the prefix
 * "init-" and an exception is raised if the root directory already exists.
 * If possible, the root directory is created by removing the prefix "init-"
 * from an existing directory but exception is raised if this would give an
 * incomplete directory hierarchy.
 *)

fun createNamespaceDir isInit (namespace, version) =
  let
    val namespaceDir =
      String.map Char.toLower (mkBaseVersion namespace version)

    val initNamespaceDir = "init-" ^ namespaceDir

    fun mkDirHier rootDir =
      let
        fun mkDir dir =
          OS.FileSys.mkDir dir
            handle _ =>
              if isInit then () else raise Fail ("cannot create directory " ^ dir)

        val () = mkDir rootDir
        val () = mkDir (mkTargetDir rootDir MLton)
        val () = mkDir (mkTargetDir rootDir PolyML)
      in
        rootDir
      end

    fun chkDirHier rootDir =
      let
        fun chkDir dir =
          if OS.FileSys.isDir dir handle _ => false
          then ()
          else raise Fail ("directory " ^ dir ^ " is missing")

        val () = chkDir rootDir
        val () = chkDir (mkTargetDir rootDir MLton)
        val () = chkDir (mkTargetDir rootDir PolyML)
      in
        ()
      end

    fun renameDirHier (initNamespaceDir, namespaceDir) =
      let
        val () = chkDirHier initNamespaceDir
        val () = OS.FileSys.rename {old = initNamespaceDir, new = namespaceDir}
      in
        namespaceDir
      end        
  in
    if not isInit
    then
      if OS.FileSys.access (namespaceDir, [])
      then
        raise Fail ("namespace directory " ^ namespaceDir ^ " exists")
      else if OS.FileSys.access (initNamespaceDir, [])
      then
        renameDirHier (initNamespaceDir, namespaceDir)
      else
        mkDirHier namespaceDir
    else
      mkDirHier initNamespaceDir
  end




fun makeNamespaceSigStr
  namespace
  (revStrs, constants, functions, structDeps, numProps, numSigs, useAccessors) =
  let
    val namespaceStrId = toUCC namespace
    val namespaceSigId = toUCU namespace

    val isGObject = namespace = "GObject"

    fun noSemi x = (x, false)
    fun addModuleSpecs ((revSpecs, _), specs) =
      revMapAppend noSemi (revSpecs, specs)
    fun addModuleStrDecs ((_, revStrDecs), strDecs) =
      revMapAppend noSemi (revStrDecs, strDecs)

    val (constantSpecs, constantStrDecs) = constants
    val (
      functionSpecs,
      functionStrDecsHighLevel,
      functionStrDecsLowLevelMLton,
      functionLocalStrDecsLowLevelPolyML
    ) = functions

    val functionStrDecsLowLevelPolyML =
      case functionLocalStrDecsLowLevelPolyML of
          _ :: _ => [mkPolyMLFFILocalStrDec functionLocalStrDecsLowLevelPolyML]
        | _      => []

    val revPropLocalTypes = makePropertyLocalTypes isGObject numProps

    val revSigLocalTypes = makeSignalLocalTypes isGObject numSigs

    val revAccessorLocalTypes =
      if useAccessors
      then makeAccessorLocalTypes isGObject
      else []

    (* spec *)
    val specs'1 = mkSpecs functionSpecs
    val specs'2 = mkSpecs constantSpecs @ specs'1
    val specs'3 = foldl addModuleSpecs specs'2 revStrs
    val specs'4 =
      revMapAppend (noSemi o makeLocalTypeSpec) (revPropLocalTypes, specs'3)
    val specs'5 =
      revMapAppend (noSemi o makeLocalTypeSpec) (revSigLocalTypes, specs'4)
    val specs'6 =
      revMapAppend (noSemi o makeLocalTypeSpec) (revAccessorLocalTypes, specs'5)
    val namespaceSigProgram = [
      ModuleDecSig (
        toList1 [
          (namespaceSigId, (SigSpec specs'6, []))
        ]
      )
    ]

    (* strdec *)
    val strDecs'1 = mkStrDecs functionStrDecsHighLevel
    val strDecs'2 = mkStrDecs constantStrDecs @ strDecs'1
    val strDecs'3 = foldl addModuleStrDecs strDecs'2 revStrs
    val strDecs'4 =
      revMapAppend (noSemi o makeLocalTypeStrDec) (revPropLocalTypes, strDecs'3)
    val strDecs'5 =
      revMapAppend (noSemi o makeLocalTypeStrDec) (revSigLocalTypes, strDecs'4)
    val strDecs'6 =
      revMapAppend (noSemi o makeLocalTypeStrDec) (revAccessorLocalTypes, strDecs'5)
    fun mkModule functionStrDecsLowLevel =
      let
        val strDecs'7 = mkStrDecs functionStrDecsLowLevel @ strDecs'6
        val strDecs'8 =
          revMapAppend (noSemi o mkStructStrDec)
            (ListDict.toList structDeps, strDecs'7)
        val sigQual'1 = revMap makeLocalTypeStrModuleQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrModuleQual (revSigLocalTypes, sigQual'1)
        val sigQual'3 =
          revMapAppend makeLocalTypeStrModuleQual (revAccessorLocalTypes, sigQual'2)
        val namespaceQSig = (SigName namespaceSigId, sigQual'3)
      in
        [
          ModuleDecStr (
            StrDecStruct (
              toList1 [
                (
                  namespaceStrId,
                  SOME (false, namespaceQSig),
                  StructBody strDecs'8
                )
              ]
            )
          )
        ]
      end

    val namespaceStrProgramPolyML = mkModule functionStrDecsLowLevelPolyML
    val namespaceStrProgramMLton = mkModule functionStrDecsLowLevelMLton
  in
    (
      (mkSigFile namespaceSigId, Portable namespaceSigProgram),
      (
         mkStrFile namespaceStrId,
         Specific {
           mlton  = namespaceStrProgramMLton,
           polyml = namespaceStrProgramPolyML
         }
      )
    )
  end


datatype override = New | Extend

val updateSig =
  fn
    ((New,    new),   _)       => new
  | ((Extend, extra), current) =>
      let
        val (_, extraSigDeps) = extra
        val (isPortable, sigDeps) = current
      in
        (isPortable, List.foldl insert sigDeps extraSigDeps)
      end

fun insertSig x = ListDict.insert #2 updateSig x
fun insertSigs (xs, m) = List.foldr insertSig m xs

val updateStr =
  fn
    ((New,    new),   _)       => new
  | ((Extend, extra), current) =>
      let
        val ((_, (extraSpecs, extraStrDecs)), extraStrDeps) = extra
        val ((isStrPortable, (specs, strDecs)), strDeps) = current
      in
        (
          (isStrPortable, (specs @ extraSpecs, strDecs @ extraStrDecs)),
          List.foldl insert strDeps extraStrDeps
        )
      end

fun insertStr x = ListDict.insert #2 updateStr x
fun insertStrs (xs, m) = List.foldr insertStr m xs

fun generateFull dir repo (namespace, version, cppPrefix) (extraVers, extraSigs, extraStrs) =
  let
    val (_, vers'1) = loadNamespace repo (namespace, version)
    val vers = Repository.extendTypelibVers extraVers vers'1

    val namespaceDeps =
      getOpt (Repository.getDependencies repo vers namespace, [])

    (* generate SML code for the namespace except its signature and structure *)
    val ((modules, constants, functions, structDeps, cInterfaceDecls), excls) =
      makeNamespaceElems repo vers namespace

    val (files'1, sigs'1, strs'1, numProps, numSigs, useAccessors) = modules

    val curDir = OS.FileSys.getDir ()
    val () = OS.FileSys.chDir dir
  in
    let
      (* `createNamespaceDir false` fails if directory already exist *)
      val namespaceDir = createNamespaceDir false (namespace, version)

      (* Perform the following steps:
       *
       *   1. Extend `strs'1` with `extraStrs` and sort the result to
       *      satisfy dependencies, giving `strs'2`.  This is split into
       *      two lists:
       *        `strFiles'2`, each structure name with a portability flag;
       *        `strSpecsDecs'2`, the entries for modules in the namespace
       *          signature and structure.
       *
       *   2. Generate the signature and structure for the namespace module,
       *      as `namespaceSig` and `namespaceStr` respectively, using
       *      `strSpecsDecs'2` from step 1, `constants`, `functions` and
       *      `structDeps`.
       *
       *   3. Extend `sigs'1` with `extraSigs` and sort the result to
       *      satisfy dependencies, giving `sigFiles'2`.
       *
       *   4. Extend `sigFiles'2` with `namespaceSigFile` from step 2 to give
       *      `sigFiles'2`.  `namespaceSigFile` must occur last.
       *
       *   5. Extend `strFiles'2` with `namespaceStrFile` from step 2 to give
       *      `strFiles'3`.  `namespaceStrFile` must occur last.
       *
       *   6. Write basis/load files using extended sorted `strFiles'3` from
       *      step 4 and extended `sigFiles'2` from step 3.
       *
       *   7. Extend `files'1` with namespace signature and structure
       *      modules from step 2, giving `files'2`.
       *
       *   8. Write module files `files'2` from step 7.
       *
       *   9. Write the C interface file.
       *
       *  10. Write the package file - GIR only.
       *)

      (* Step 1 *)
      val revStrs'2 : (id * (bool * (spec list * strdec list))) list =
        sort (ListDict.toList (insertStrs (extraStrs, strs'1)))

      local
        fun f ((x, (y, z)), (xys, zs)) = ((x, y) :: xys, z :: zs)
      in
        val (revStrFiles'2, revStrSpecsDecs'2) = foldr f ([], []) revStrs'2
      end

      (* Step 2 *)
      val (
        namespaceSig as (namespaceSigFile, namespaceSigProgram),
        namespaceStr as (namespaceStrFile, namespaceStrProgram)
      ) =
        makeNamespaceSigStr namespace
          (
            revStrSpecsDecs'2,
            constants,
            functions,
            structDeps,
            numProps,
            numSigs,
            useAccessors
          )

      (* Step 3 *)
      val revSigFiles'2 =
        sort (ListDict.toList (insertSigs (extraSigs, sigs'1)))

      (* Step 4 *)
      val revSigFiles'3 =
        (namespaceSigFile, isPortable namespaceSigProgram) :: revSigFiles'2

      (* Step 5 *)
      val revStrFiles'3 =
        (namespaceStrFile, isPortable namespaceStrProgram) :: revStrFiles'2

      (* Step 6 *)
      val () =
        writeBasisFile namespaceDir namespaceDeps (revSigFiles'3, revStrFiles'3)

      (* Step 7 *)
      val files'2 =
        insertNewList dupFile ([namespaceSig, namespaceStr], files'1)

      (* Step 8 *)
      val () = ListDict.appi (writeProgramFile namespaceDir) files'2

      (* Step 9 *)
      val () = writeCInterfaceFile namespaceDir cppPrefix cInterfaceDecls

      (* Step 10 - GIR only *)
      val () = writePackageFile repo vers namespace namespaceDir

      val () = OS.FileSys.chDir curDir
    in
      excls
    end
      handle
        e => (OS.FileSys.chDir curDir; raise e)
  end

fun generateInit dir (namespace, version) initNamespace (namespaceDeps, extraSigs, extraStrs) =
  let
    val constants = ([], [])
    val functions = ([], [], [], [])
    val structDeps = ListDict.empty
    val files'1 = ListDict.empty
    val sigs'1 = ListDict.empty
    val strs'1 = ListDict.empty
    val numProps = 0
    val numSigs = 0
    val useAccessors = false

    val curDir = OS.FileSys.getDir ()
    val () = OS.FileSys.chDir dir
  in
    let
      (* `createNamespaceDir true` does not fail if directories already exist *)
      val namespaceDir = createNamespaceDir true (namespace, version)

      (* Perform the following steps:
       *
       *   1. Extend `strs'1` with `extraStrs` and sort the result to
       *      satisfy dependencies, giving `strs'2`.  This is split into
       *      two lists:
       *        `strFiles'2`, each structure name with a portability flag;
       *        `strSpecsDecs'2`, the entries for modules in the namespace
       *          signature and structure.
       *
       *   2. Generate the signature and structure for the namespace module,
       *      as `namespaceSig` and `namespaceStr` respectively, using
       *      `strSpecsDecs'2` from step 1, `constants`, `functions` and
       *      `structDeps`.
       *
       *   3. Extend `sigs'1` with `extraSigs` and sort the result to
       *      satisfy dependencies, giving `sigFiles'2`.
       *
       *   4. Extend `sigFiles'2` with `namespaceSigFile` from step 2 to give
       *      `sigFiles'2`.  `namespaceSigFile` must occur last.
       *
       *   5. Extend `strFiles'2` with `namespaceStrFile` from step 2 to give
       *      `strFiles'3`.  `namespaceStrFile` must occur last.
       *
       *   6. Write basis/load files using extended sorted `strFiles'3` from
       *      step 4 and extended `sigFiles'2` from step 3.
       *
       *   7. Extend `files'1` with namespace signature and structure
       *      modules from step 2, giving `files'2`.
       *
       *   8. Write module files `files'2` from step 7.
       *)

      (* Step 1 *)
      val revStrs'2 : (id * (bool * (spec list * strdec list))) list =
        sort (ListDict.toList (insertStrs (extraStrs, strs'1)))

      local
        fun f ((x, (y, z)), (xys, zs)) = ((x, y) :: xys, z :: zs)
      in
        val (revStrFiles'2, revStrSpecsDecs'2) = foldr f ([], []) revStrs'2
      end

      (* Step 2 *)
      val (
        namespaceSig as (namespaceSigFile, namespaceSigProgram),
        namespaceStr as (namespaceStrFile, namespaceStrProgram)
      ) =
        makeNamespaceSigStr initNamespace
          (
            revStrSpecsDecs'2,
            constants,
            functions,
            structDeps,
            numProps,
            numSigs,
            useAccessors
          )

      (* Step 3 *)
      val revSigFiles'2 =
        sort (ListDict.toList (insertSigs (extraSigs, sigs'1)))

      (* Step 4 *)
      val revSigFiles'3 =
        (namespaceSigFile, isPortable namespaceSigProgram) :: revSigFiles'2

      (* Step 5 *)
      val revStrFiles'3 =
        (namespaceStrFile, isPortable namespaceStrProgram) :: revStrFiles'2

      (* Step 6 *)
      val () =
        writeBasisFile namespaceDir namespaceDeps (revSigFiles'3, revStrFiles'3)

      (* Step 7 *)
      val files'2 =
        insertNewList dupFile ([namespaceSig, namespaceStr], files'1)

      (* Step 8 *)
      val () = ListDict.appi (writeProgramFile namespaceDir) files'2

      val () = OS.FileSys.chDir curDir;
    in
      ()
    end
      handle
        e => (OS.FileSys.chDir curDir; raise e)
  end


(* Support for constructing values for `extraSigs` parameter of `generate<X>`. *)

fun newSig nameId sigDeps =
  let
    val sigFile = mkSigFile nameId
    val sigFileDeps = map mkSigFile sigDeps
  in
    (sigFile, (New, (true, sigFileDeps)))
  end

fun extendSig nameId sigDeps =
  let
    val sigFile = mkSigFile nameId
    val sigFileDeps = map mkSigFile sigDeps
  in
    (sigFile, (Extend, (true, sigFileDeps)))
  end


(* Support for constructing values for `extraStrs` parameter of `generate<X>`. *)

fun mkStructSpec (strId, qSig) = SpecStruct (toList1 [(strId, qSig)])
fun mkStructStrDec (strId, sigId) =
  StrDecStruct (toList1 [(strId, NONE, StructName (toList1 [sigId]))]);

fun mkLocalType (tyVars, tyName) name = toLocalType name (tyVars, tyName)

fun newStr (namespaceId, nameId, sigId) mkLocalTypes =
  let
    val localTypes = map (fn f => f nameId) mkLocalTypes

    val strId = namespaceId ^ nameId
    val strFile = mkStrFile strId

    val quals = map makeLocalTypeStrSpecQual localTypes
    val strDeps = map (#1 o #tyStrLId) localTypes
    val strFileDeps = map mkStrFile strDeps

    val isPortable = false
  in
    (
      strFile,
      (
        New,
        (
          (
            isPortable,
            (
              [mkStructSpec (nameId, (SigName sigId, quals))],
              [mkStructStrDec (nameId, strId)]
            )
          ),
          strFileDeps
        )
      )
    )
  end

fun extendStrDeps strId strDeps =
  let
    val isPortable = false
    val strFile = mkStrFile strId
    val strFileDeps = map mkStrFile strDeps
  in
    (
      strFile,
      (
        Extend,
        (
          (
            isPortable,
            (
              [],
              []
            )
          ),
          strFileDeps
        )
      )
    )
  end


(* Write excluded log file *)

local
  open HVTextTree

  val indent = V.indentWith (H.str "  ") true

  local
    val startTag = "<tree style=\"lines\">"
    val endTag = "</tree>"
  in
    fun makeTree v = V.seq [V.str startTag, indent v, V.str endTag]
  end

  local
    val startTag = "<item>"
    val endTag = "</item>"
  in
    fun makeHItem h = H.seq [H.str startTag, h, H.str endTag]
    fun makeVItem v = V.seq [V.str startTag, indent v, V.str endTag]
  end

  fun fmtInfoExclHier ((ty, optName), infoExcl) =
    let
      val h = 
        H.seq [
          H.str ty,
          case optName of
            SOME name => H.seq [H.sp 1, H.str name]
          | NONE      => H.empty,
          case infoExcl of
            IEMsg msg => H.seq [H.str ": ", H.str msg]
          | IEGrp _   => H.empty
        ]
    in
      case infoExcl of
        IEMsg _     => V.line (makeHItem h)
      | IEGrp excls => makeVItem (
          V.seq [
            V.line h,
            V.seq (map fmtInfoExclHier excls)
          ]
        )
    end

  fun fmtLogVersion namespace (version, excls) =
    makeVItem (
      V.seq [
        V.str (String.concat [namespace, "-", version]),
        V.seq (map fmtInfoExclHier excls)
      ]
    )

  fun fmtLogNamespace (namespace, versionDict) =
    V.seq (revMap (fmtLogVersion namespace) (ListDict.toList versionDict))

  val pageStartTag = "<page xmlns=\"http://projectmallard.org/1.0/\">"
  val pageEndTag = "</page>"

  val file = "excluded-log.page"
in
  fun writeLogFile dir (excludedLog : info_excl_hier list ListDict.t ListDict.t) =
    let
      val text =
        V.seq [
          V.str pageStartTag,
          makeTree (V.seq (revMap fmtLogNamespace (ListDict.toList excludedLog))),
          V.str pageEndTag
        ]
    in
      writeFile (dir, file) text
    end
end
