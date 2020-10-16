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


fun reportMissingOrCyclicDependencies m =
  let
    val () =
      print "**** Excluding from basis for missing\
                   \ or cyclic dependencies ****\n"
    val () = reportUnsortable m
  in
    ()
  end;


fun mkBasisFile optInitNamespace target =
  let
    val suffix =
      case optInitNamespace of
        SOME s => ["-", mkNamespaceFile s]
      | _      => []
  in
    addExt (
      String.concat (targetString target :: suffix),
      case target of
        MLton  => mlbFileExt
      | PolyML => smlFileExt
    )
  end

fun mkProgramFile target (file, isPortable) =
  if isPortable then file else mkTargetFile target file

fun mkExtFile (root, dir, file) =
  OS.Path.joinDirFile {
    dir  = OS.Path.joinDirFile {dir = root, file = dir},
    file = file
  }

fun mkExtNamespaceFile (dir, file) =
  case dir of
    "" => file
  | _  => mkExtFile (OS.Path.parentArc, dir, file)


fun mkExtMLBFile (root, dir, file) = mkExtFile (root, dir, addExt (file, mlbFileExt))

val mltonBasDecs = [
  mkExtMLBFile ("$(SML_LIB)", "basis", "basis"),
  mkExtMLBFile ("$(SML_LIB)", "basis", "mlton")
]
val giraffeBasDecs = [
  mkExtMLBFile ("$(GIRAFFE_SML_LIB)", "general", "mlton"),
  mkExtMLBFile ("$(GIRAFFE_SML_LIB)", "ffi", "mlton"),
  mkExtMLBFile ("$(GIRAFFE_SML_LIB)", "gir", "mlton")
]

fun mkFileBasDec (file, isPortable) =
  mkProgramFile MLton (addExt (file, smlFileExt), isPortable)

fun mkStrBasDec (file, isPortable, _) =
  mkFileBasDec (file, isPortable) 

fun mkSigBasDec (file, isPortable) =
  mkFileBasDec (file, isPortable) 

fun mkModuleBasDec file = addExt (file, mlbFileExt)

fun mkExtModuleBasDec (dir, file) =
  mkExtNamespaceFile (dir, mkModuleBasDec file)

fun mkExtBasDec (dir, file, _, _) =
  mkExtModuleBasDec (dir, file)

fun mkNamespaceDepBasDec namespaceDep =
  mkExtModuleBasDec (mkNamespaceFile namespaceDep, targetString MLton)

fun mkInitNamespaceDepBasDec initNamespace = mkBasisFile (SOME initNamespace) MLton


(**
 * For a module generated in an external namespace, an MLB file is provided.
 * The external module is included via this MLB file to ensure that it is
 * loaded only once, even if more than one namespace depends on the external
 * module.  (Currently external modules are used only for modules
 * representing containers of types in the external namespace.)
 *
 * `fmtExtBasisMLton initNamespaceDeps (_, file, fileDeps, namespaceDeps)`
 * generates an MLB file of the following form:
 *
 *     local
 *       $(SML_LIB)/basis/basis.mlb
 *       $(SML_LIB)/basis/mlton.mlb
 *       $(GIRAFFE_SML_LIB)/general/mlton.mlb
 *       $(GIRAFFE_SML_LIB)/ffi/mlton.mlb
 *       $(GIRAFFE_SML_LIB)/gir/mlton.mlb
 *       <initNamespaceDeps>
 *       <namespaceDeps>
 *       <fileDeps>
 *     in
 *       <file>
 *     end
 *
 * If `namespaceDeps` is
 *   - `[]`, then <namespaceDeps> is empty;
 *   - `[""]` then <namespaceDeps> is mlton.mlb
 * (Only these two cases are used for external container modules.)
 *)

fun fmtExtBasisMLton initNamespaceDeps (_, file, fileDeps, namespaceDeps) : VTextTree.t =
  let
    val initNamespaceDepBasDecs = map mkInitNamespaceDepBasDec initNamespaceDeps
    val namespaceDepBasDecs = revMap mkNamespaceDepBasDec namespaceDeps
    val fileDepBasDecs = revMap mkModuleBasDec fileDeps
    val localBasDecs =
      mltonBasDecs @ giraffeBasDecs
       @ initNamespaceDepBasDecs @ namespaceDepBasDecs @ fileDepBasDecs

    val isPortable = true
    val fileBasDec = mkProgramFile MLton (addExt (file, smlFileExt), isPortable)

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
        V.str fileBasDec
      ),
      V.str "end"
    ]
  end

(**
 * For any module introduced in a namespace for which another namespace could
 * later try to regenerate as an external module, it is necessary to provide
 * the expected MLB file for the module because the module is already loaded.
 * (An MLB file generated for an external module never overwrites an existing
 * MLB file.)
 *
 * `fmtStrBasisMLton _ (_, _, strId)` generates an MLB file of the following
 * form, where `strId` is the name of the module that could later be treated
 * as an external module:
 *
 *     local
 *       mlton.mlb
 *     in
 *       structure <strId>
 *     end
 *
 * The restriction to just <strId> is required because mlton.mlb may hide a
 * namespace with an initial namespace of the same name and exposing this
 * could cause a problem in MLB files that include this MLB file.
 *)

fun fmtStrBasisMLton _ (_, _, strId) : VTextTree.t =
  let
    open HVTextTree
    val indent = V.indentWith (H.str "  ") true
  in
    V.seq [
      V.str "local",
      indent (
        V.str (mkBasisFile NONE MLton)
      ),
      V.str "in",
      indent (
        V.line (H.seq [H.str "structure", H.sp 1, H.str strId])
      ),
      V.str "end"
    ]
  end


fun fmtNamespaceBasisMLton
  namespaceDeps
  initNamespaceDeps
  (revExts, revSigs, revStrs)
: VTextTree.t =
  let
    val initNamespaceDepBasDecs = map mkInitNamespaceDepBasDec initNamespaceDeps

    val extBasDecs = revMap mkExtBasDec revExts
    val sigBasDecs = revMap mkSigBasDec revSigs
    val strBasDecs = revMap mkStrBasDec revStrs

    val namespaceDepBasDecs = revMap mkNamespaceDepBasDec namespaceDeps
    val localBasDecs = mltonBasDecs @ giraffeBasDecs @ namespaceDepBasDecs

    open HVTextTree
    val indent = V.indentWith (H.str "  ") true
  in
    V.seq [
      V.seq (map V.str initNamespaceDepBasDecs),
      V.str "local",
      indent (
        V.seq (map V.str localBasDecs)
      ),
      V.str "in",
      indent (
        V.seq [
          V.seq (map V.str extBasDecs),
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
  val mkUseFileTopLevelDec = mkUseTopLevelDec o ExpConst o ConstString

  fun mkUseExtTopLevelDec e = TopLevelDecExp (ExpApp (mkIdLNameExp "useExt", e))
  val mkUseExtFileTopLevelDec = mkUseExtTopLevelDec o ExpConst o ConstString

  fun mkModuleUseDec (file, isPortable) =
    mkUseFileTopLevelDec (mkProgramFile PolyML (addExt (file, smlFileExt), isPortable))
  fun mkStrUseDec (file, isPortable, _) = mkModuleUseDec (file, isPortable)
  fun mkSigUseDec (file, isPortable) = mkModuleUseDec (file, isPortable)
  fun mkExtUseDec (dir, file, _, _) =
    mkUseExtFileTopLevelDec (
      mkExtNamespaceFile (dir, addExt (file, smlFileExt))
    )
  fun mkInitNamespaceDepUseDec initNamespace =
    mkUseFileTopLevelDec (mkBasisFile (SOME initNamespace) PolyML)
in
  fun fmtNamespaceBasisPolyML initNamespaceDeps (revExts, revSigs, revStrs)
    : VTextTree.t =
    let
      val topLevelDecs'1 = revMap mkStrUseDec revStrs
      val topLevelDecs'2 = revMapAppend mkSigUseDec (revSigs, topLevelDecs'1)
      val topLevelDecs'3 = revMapAppend mkExtUseDec (revExts, topLevelDecs'2)
      val topLevelDecs'4 =
        map mkInitNamespaceDepUseDec initNamespaceDeps @ topLevelDecs'3
    in
      PrettyPrint.fmtProgram topLevelDecs'4
    end
end




datatype write_mode =
  KEEP_EXISTING
| APPEND

fun writeFile mode (dir, file) v =
  let
    val dirFile = OS.Path.concat (dir, file)
    val exists = OS.FileSys.access (dirFile, [])
  in
    case (mode, exists) of
      (KEEP_EXISTING, true) => ()
    | _                     =>
      let
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
  end


fun fmtModules ms = PrettyPrint.fmtProgram (map mkModuleTopLevelDec ms)

fun writeProgramFile (mode, (dir, file), program) =
  case program of
    Portable common          => writeFile mode (dir, file) (fmtModules common)
  | Specific {mlton, polyml} => (
      writeFile mode (dir, mkTargetFile MLton file) (fmtModules mlton);
      writeFile mode (dir, mkTargetFile PolyML file) (fmtModules polyml)
    )

fun writeThisNamespaceFile namespaceDir (file, program) =
  let
    val file = addExt (file, smlFileExt)
  in
    writeProgramFile (APPEND, (namespaceDir, file), program)
  end

fun writeNamespaceFile repo vers namespaceDir ((namespace, file), program) =
  let
    val (mode, dir) =
      if namespace = ""
      then (APPEND, namespaceDir)
      else
        let
          val version = Repository.getVersion repo vers namespace
          val dir = mkNamespaceFile (mkNamespaceDep (namespace, version))
        in
          (KEEP_EXISTING, dir)
        end

    val file = addExt (file, smlFileExt)
  in
    writeProgramFile (mode, (dir, file), program)
  end

fun writeExtBasisFileMLton namespaceDir initNamespaceDeps (ext as (dir, file, _, _)) =
  writeFile
    KEEP_EXISTING
    (if dir = "" then namespaceDir else dir, addExt (file, mlbFileExt))
    (fmtExtBasisMLton initNamespaceDeps ext)

fun writeStrBasisFileMLton namespaceDir namespaceDeps (file, isPortable, optContainer) =
  case optContainer of
    SOME strId =>
      writeFile
        APPEND
        (namespaceDir, addExt (file, mlbFileExt))
        (fmtStrBasisMLton namespaceDeps (file, isPortable, strId))
  | NONE       => ()

fun writeBasisFileMLton
  namespaceDir
  namespaceDeps
  (optInitNamespace, initNamespaceDeps)
  (revExtsSigsStrs as (revExts, _, revStrs)) =
  let
    val () = app (writeStrBasisFileMLton namespaceDir namespaceDeps) revStrs
    val () = app (writeExtBasisFileMLton namespaceDir initNamespaceDeps) revExts

    val () =
      writeFile
        APPEND
        (namespaceDir, mkBasisFile optInitNamespace MLton)
        (fmtNamespaceBasisMLton namespaceDeps initNamespaceDeps revExtsSigsStrs)
  in
    ()
  end

fun writeBasisFilePolyML
  namespaceDir
  (optInitNamespace, initNamespaceDeps)
  revExtsSigsStrs =
  writeFile
    APPEND
    (namespaceDir, mkBasisFile optInitNamespace PolyML)
    (fmtNamespaceBasisPolyML initNamespaceDeps revExtsSigsStrs)

fun writeBasisFile
  namespaceDir
  namespaceDeps
  (optInitNamespace, initNamespaceDeps)
  revExtsSigsStrs =
  let
    val () =
      writeBasisFileMLton
        namespaceDir
        namespaceDeps
        (optInitNamespace, initNamespaceDeps)
        revExtsSigsStrs

    val () =
      writeBasisFilePolyML
        namespaceDir
        (optInitNamespace, initNamespaceDeps)
        revExtsSigsStrs
  in
    ()
  end


fun writeCInterfaceFile dir cppPrefix cInterfaceDecls =
  writeFile
    APPEND
    (dir, addExt (giraffeId, cFileExt))
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
    writeFile APPEND (namespaceDir, package) v
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
    val namespaceDir = mkNamespaceFile (mkNamespaceDep (namespace, version))

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
  (
    revStrSpecs,
    revStrStrDecs,
    constants,
    functions,
    structDeps,
    numProps,
    numSigs,
    useAccessors
  ) =
  let
    val namespaceStrId = toUCC namespace
    val namespaceSigId = toUCU namespace

    val isGObject = namespace = "GObject"

    fun noSemi x = (x, false)
    fun addModuleSpecs (revSpecs, specs) =
      revMapAppend noSemi (revSpecs, specs)
    fun addModuleStrDecs (revStrDecs, strDecs) =
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
    val specs'3 = foldl addModuleSpecs specs'2 revStrSpecs
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
    val strDecs'3 = foldl addModuleStrDecs strDecs'2 revStrStrDecs
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

fun insertSig x = FileMap.insertMap #2 updateSig x
fun insertSigs (xs, m) = List.foldr insertSig m xs

val updateStr =
  fn
    ((New,    new),   _)       => new
  | ((Extend, extra), current) =>
      let
        val ((_, (extraSpecs, extraStrDecs), _), extraStrDeps) = extra
        val ((isStrPortable, (specs, strDecs), optContainer), strDeps) = current
      in
        (
          (isStrPortable, (specs @ extraSpecs, strDecs @ extraStrDecs), optContainer),
          List.foldl insert strDeps extraStrDeps
        )
      end

fun insertStr x = FileMap.insertMap #2 updateStr x
fun insertStrs (xs, m) = List.foldr insertStr m xs

fun generateFull
  dir
  repo
  (namespace, version, cppPrefix)
  initNamespaceDeps
  (extraVers, extraSigs, extraStrs) =
  let
    val (_, vers'1) = loadNamespace repo (namespace, version)
    val vers = Repository.extendTypelibVers extraVers vers'1

    val namespaceDeps =
      getOpt (Repository.getDependencies repo vers namespace, [])

    (* generate SML code for the namespace except its signature and structure *)
    val ((files'1, exts'1, modules, constants, functions, structDeps, cInterfaceDecls), excls) =
      makeNamespaceElems repo vers namespace

    val (sigs'1, strs'1, numProps, numSigs, useAccessors) = modules

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
       *   4. Copy dependencies in `exts'1` so that they are available after
       *      sorting, then sort the result to satisfy dependencies and then
       *      add the namespace directory and namespace dependencies, giving
       *      `extFiles'2`.
       *
       *      The dependencies are required after sorting for MLB files used
       *      by MLton.  As the MLB files capture the dependencies, there is
       *      no need to sort but sorting is still required for Poly/ML 'use'
       *      files, so is done for MLton to give consistent output.
       *
       *   5. Extend `sigFiles'2` with `namespaceSigFile` from step 2 to give
       *      `sigFiles'3`.  `namespaceSigFile` must occur last.
       *
       *   6. Extend `strFiles'2` with `namespaceStrFile` from step 2 to give
       *      `strFiles'3`.  `namespaceStrFile` must occur last.
       *
       *   7. Write basis/load files using extended sorted `strFiles'3` from
       *      step 6 and extended `sigFiles'3` from step 5.
       *
       *   8. Extend `files'1` with namespace signature and structure
       *      modules from step 2, giving `files'2`.
       *
       *   9. Write module files `files'2` from step 7.
       *
       *  10. Write the C interface file.
       *
       *  11. Write the package file - GIR only.
       *)

      (* Step 1 *)
      val nil3 = ([], [], [])
      fun cons3 ((x, y, z), (xs, ys, zs)) = (x :: xs, y :: ys, z :: zs)
      val (
        revStrFiles'2   : (string * bool * string option) list,
        revStrSpecs'2   : spec list list,
        revStrStrDecs'2 : strdec list list
      ) =
        revSortMapAppendWith reportMissingOrCyclicDependencies cons3
          (
            fn (file, ((isPortable, (specs, strDecs), optContainer), _)) =>
              ((file, isPortable, optContainer), specs, strDecs)
          )
          (ListDict.toList (insertStrs (extraStrs, strs'1)), nil3)

      (* Step 2 *)
      val (
        namespaceSig as (namespaceSigFile, namespaceSigProgram),
        namespaceStr as (namespaceStrFile, namespaceStrProgram)
      ) =
        makeNamespaceSigStr namespace
          (
            revStrSpecs'2,
            revStrStrDecs'2,
            constants,
            functions,
            structDeps,
            numProps,
            numSigs,
            useAccessors
          )

      (* Step 3 *)
      val revSigFiles'2 : (string * bool) list =
        revSortMap reportMissingOrCyclicDependencies
          (fn (file, (isPortable, _)) => (file, isPortable))
          (ListDict.toList (insertSigs (extraSigs, sigs'1)))

      (* Step 4 *)
      fun addNamespaceExts ((extNamespace, exts), revExtFiles) =
        let
          val extFileNamespace =
            if extNamespace = "" andalso namespace <> defaultContainerNamespace
            then defaultContainerNamespace
            else extNamespace

          val dir =
            if extFileNamespace = ""
            then ""
            else
              let
                val version = Repository.getVersion repo vers extFileNamespace
                val dir = mkNamespaceFile (mkNamespaceDep (extFileNamespace, version))
              in
                dir
              end

          val namespaceDeps =
            if extNamespace = ""
            then []
            else [""]
        in
 	  revSortMapAppend reportMissingOrCyclicDependencies
            (fn (file, ((), fileDeps)) => (dir, file, fileDeps, namespaceDeps))
            (ListDict.toList exts, revExtFiles)
        end
      val revExtFiles'2 = NamespaceMap.foldi addNamespaceExts (exts'1, [])

      (* Step 5 *)
      val revSigFiles'3 =
        (namespaceSigFile, isPortable namespaceSigProgram) :: revSigFiles'2

      (* Step 6 *)
      val revStrFiles'3 =
        (namespaceStrFile, isPortable namespaceStrProgram, NONE) :: revStrFiles'2

      (* Step 7 *)
      val () =
        writeBasisFile namespaceDir namespaceDeps (NONE, initNamespaceDeps)
          (revExtFiles'2, revSigFiles'3, revStrFiles'3)

      (* Step 8 *)
      val files'2 =
        foldR insertThisNamespaceFile ([namespaceSig, namespaceStr], files'1)

      (* Step 9 *)
      val () = NamespaceFileMap.appi (writeNamespaceFile repo vers namespaceDir) files'2

      (* Step 10 *)
      val () = writeCInterfaceFile namespaceDir cppPrefix cInterfaceDecls

      (* Step 11 - GIR only *)
      val () = writePackageFile repo vers namespace namespaceDir

      val () = OS.FileSys.chDir curDir
    in
      excls
    end
      handle
        e => (OS.FileSys.chDir curDir; raise e)
  end

fun generateInit
  dir
  (namespace, version)
  initNamespace
  (namespaceDeps, extraSigs, extraStrs) =
  let
    val constants = ([], [])
    val functions = ([], [], [], [])
    val structDeps = ListDict.empty
    val files'1 = FileMap.empty
    val sigs'1 = FileMap.empty
    val strs'1 = FileMap.empty
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
       *        `strSpecs'2`, the entries for modules in the namespace signature.
       *        `strStrDecs'2`, the entries for modules in the namespace structure.
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
       *      step 5 and extended `sigFiles'2` from step 4.
       *
       *   7. Extend `files'1` with namespace signature and structure
       *      modules from step 2, giving `files'2`.
       *
       *   8. Write module files `files'2` from step 7.
       *)

      (* Step 1 *)
      val nil3 = ([], [], [])
      fun cons3 ((x, y, z), (xs, ys, zs)) = (x :: xs, y :: ys, z :: zs)
      val (
        revStrFiles'2   : (string * bool * string option) list,
        revStrSpecs'2   : spec list list,
        revStrStrDecs'2 : strdec list list
      ) =
        revSortMapAppendWith reportMissingOrCyclicDependencies cons3
          (
            fn (file, ((isPortable, (specs, strDecs), optContainer), _)) =>
              ((file, isPortable, optContainer), specs, strDecs)
          )
          (ListDict.toList (insertStrs (extraStrs, strs'1)), nil3)

      (* Step 2 *)
      val (
        namespaceSig as (namespaceSigFile, namespaceSigProgram),
        namespaceStr as (namespaceStrFile, namespaceStrProgram)
      ) =
        makeNamespaceSigStr initNamespace
          (
            revStrSpecs'2,
            revStrStrDecs'2,
            constants,
            functions,
            structDeps,
            numProps,
            numSigs,
            useAccessors
          )

      (* Step 3 *)
      val revSigFiles'2 : (string * bool) list =
        revSortMap reportMissingOrCyclicDependencies
          (fn (file, (isPortable, _)) => (file, isPortable))
          (ListDict.toList (insertSigs (extraSigs, sigs'1)))

      (* Step 4 *)
      val revSigFiles'3 =
        (namespaceSigFile, isPortable namespaceSigProgram) :: revSigFiles'2

      (* Step 5 *)
      val revStrFiles'3 =
        (namespaceStrFile, isPortable namespaceStrProgram, NONE) :: revStrFiles'2

      (* Step 6 *)
      val () =
        writeBasisFile namespaceDir namespaceDeps (SOME initNamespace, [])
          ([], revSigFiles'3, revStrFiles'3)

      (* Step 7 *)
      val files'2 =
        foldR insertFile ([namespaceSig, namespaceStr], files'1)

      (* Step 8 *)
      val () = FileMap.appi (writeThisNamespaceFile namespaceDir) files'2

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
    val optContainer = NONE
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
            ),
            optContainer
          ),
          strFileDeps
        )
      )
    )
  end

fun extendStrDeps strId strDeps =
  let
    val isPortable = false
    val optContainer = NONE
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
            ),
            optContainer
          ),
          strFileDeps
        )
      )
    )
  end

fun extendFunDeps funId funDeps strDeps =
  let
    val isPortable = false
    val optContainer = NONE
    val funFile = mkFunFile funId
    val funFileDeps = map mkFunFile funDeps
    val strFileDeps = map mkStrFile strDeps
  in
    (
      funFile,
      (
        Extend,
        (
          (
            isPortable,
            (
              [],
              []
            ),
            optContainer
          ),
          funFileDeps @ strFileDeps
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
        V.str (mkNamespaceDep (namespace, version)),
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
      writeFile APPEND (dir, file) text
    end
end
