fun loadNamespace repo (namespace, version) =
  let
    val (tylib, vers) =
      Repository.require
        repo
        namespace
        version
        (RepositoryLoadFlags.flags [])

    val namespace_ =
      Repository.loadTypelib
        repo
        tylib
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
    vers
  end



datatype target =
  MLton
| PolyML

val targetString =
  fn
    MLton  => "mlton"
  | PolyML => "polyml"

fun mkTargetDir dir c = OS.Path.joinDirFile {dir = dir, file = targetString c}

fun mkFile id ext = OS.Path.joinBaseExt {base = id, ext = SOME ext}

fun mkTargetFile c id ext =
  OS.Path.joinDirFile {dir = targetString c, file = mkFile id ext}

val sml = "sml"
val mlb = "mlb"



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



fun mkProgramFile isPolyML (id, isPortable) =
  if isPortable
  then mkFile id sml
  else mkTargetFile (if isPolyML then PolyML else MLton) id sml


fun mkMLBBasDec (root, dir, base) =
  OS.Path.joinDirFile {
    dir  = root,
    file = OS.Path.joinDirFile {dir  = dir, file = mkFile base mlb}
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
    mkMLBBasDec ("..", dir, baseMLton)
  end


fun fmtNamespaceBasisMLton namespaceDeps (revSigs, revStrs) : VTextTree.t =
  let
    val mkMLtonFile = mkProgramFile false
    val basDecs'1 = revMap mkMLtonFile revStrs
    val basDecs'2 = revMapAppend mkMLtonFile (revSigs, basDecs'1)

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
        V.seq (map V.str basDecs'2)
      ),
      V.str "end"
    ]
  end


local
  fun mkUseTopLevelDec e = TopLevelDecExp (ExpApp (mkIdLNameExp "use", e))
  val useSigExp = mkUseTopLevelDec o ExpConst o ConstString o mkProgramFile true
  val useStrExp = mkUseTopLevelDec o ExpConst o ConstString o mkProgramFile true

  (*
   *   val <libId> = PolyMLFFI.load_lib "<libFile>";
   *
   * where <libFile> is the empty string (to pass NULL to dlopen).
   *)
  fun mkLibTopLevelDec repo vers namespace =
    let
      val libId = getSharedLibraryId repo vers namespace
      val libFile = ""
      val pat = PatA (APatId libId)
      val exp =
        ExpApp (
          mkLIdLNameExp [PolyMLFFIId, loadLibId],
          ExpConst (ConstString libFile)
        )
    in
      TopLevelDecDec (DecVal (toList1 [([], false, pat, exp)]), true)
    end
in
  fun fmtNamespaceBasisPolyML repo vers namespace (revSigs, revStrs)
    : VTextTree.t =
    let
      val topLevelDecs'1 = revMap useStrExp revStrs
      val topLevelDecs'2 = revMapAppend useSigExp (revSigs, topLevelDecs'1)
      val topLevelDecs'3 =
        mkLibTopLevelDec repo vers namespace :: topLevelDecs'2
          handle
            InfoError _ => topLevelDecs'2
    in
      PrettyPrint.fmtProgram topLevelDecs'3
    end
end




fun writeFile dir file v =
  let
    val file = OS.Path.joinDirFile {dir = dir, file = file}

    val ostream = TextIO.openOut file
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

fun writeProgramFileMLton dir (id, ms) =
  writeFile dir (mkTargetFile MLton id sml) (fmtModules ms)
fun writeProgramFilePolyML dir (id, ms) =
  writeFile dir (mkTargetFile PolyML id sml) (fmtModules ms)
fun writeProgramFile dir (id, program) =
  case program of
    Portable ms              => writeFile dir (mkFile id sml) (fmtModules ms)
  | Specific {mlton, polyml} => (
      writeProgramFileMLton dir (id, mlton);
      writeProgramFilePolyML dir (id, polyml)
    )

fun writeBasisFileMLton namespaceDir namespaceDeps (revSigs, revStrs) =
  writeFile namespaceDir
    (mkFile (targetString MLton) mlb)
    (fmtNamespaceBasisMLton namespaceDeps (revSigs, revStrs))

fun writeBasisFilePolyML
  repo
  vers
  namespace
  namespaceDir
  (revSigs, revStrs) =
  writeFile namespaceDir
    (mkFile (targetString PolyML) sml)
    (fmtNamespaceBasisPolyML repo vers namespace (revSigs, revStrs))

fun writeBasisFile
  repo
  vers
  namespace
  namespaceDir
  namespaceDeps
  (revSigs, revStrs) =
  let
  in
    writeBasisFileMLton namespaceDir namespaceDeps (revSigs, revStrs);
    writeBasisFilePolyML
      repo
      vers
      namespace
      namespaceDir
      (revSigs, revStrs)
  end


(* `createNamespaceDir (namespace, version)` creates the directory hierarchy
 * into which generated files for the namespace given by `namespace` and
 * `version` are placed.  The directory is created relative to the current
 * directory.  The directory name is returned.  The function fails if the
 * namespace directory already exists.
 *)

fun createNamespaceDir (namespace, version) =
  let
    val namespaceDir = String.map Char.toLower (mkBaseVersion namespace version)
  in
    OS.FileSys.mkDir namespaceDir;
    OS.FileSys.mkDir (mkTargetDir namespaceDir MLton);
    OS.FileSys.mkDir (mkTargetDir namespaceDir PolyML);
    namespaceDir
  end




fun makeNamespaceSigStr
  namespace
  (revStrs, constants, functions) =
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

    val numProps = 1  (* any non-zero value *)
    val revPropLocalTypes = makePropertyLocalTypes isGObject numProps

    (* spec *)
    val specs'1 = mkSpecs functionSpecs
    val specs'2 = mkSpecs constantSpecs @ specs'1
    val specs'3 = foldl addModuleSpecs specs'2 revStrs
    val specs'4 =
      revMapAppend (noSemi o makeLocalTypeSpec) (revPropLocalTypes, specs'3)
    val namespaceSigProgram = [
      ModuleDecSig (
        toList1 [
          (namespaceSigId, (SigSpec specs'4, []))
        ]
      )
    ]

    (* strdec *)
    val strDecs'1 = mkStrDecs functionStrDecsHighLevel
    val strDecs'2 = mkStrDecs constantStrDecs @ strDecs'1
    val strDecs'3 = foldl addModuleStrDecs strDecs'2 revStrs
    val strDecs'4 =
      revMapAppend (noSemi o makeLocalTypeStrDec) (revPropLocalTypes, strDecs'3)
    fun mkModule functionStrDecsLowLevel =
      let
        val strDecs'5 = mkStrDecs functionStrDecsLowLevel @ strDecs'4
        val sigQual'1 = revMap makeLocalTypeStrModuleQual revPropLocalTypes
        val namespaceQSig = (SigName namespaceSigId, sigQual'1)
      in
        [
          ModuleDecStr (
            StrDecStruct (
              toList1 [
                (
                  namespaceStrId,
                  SOME (false, namespaceQSig),
                  StructBody strDecs'5
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
      (namespaceSigId, Portable namespaceSigProgram),
      (
         namespaceStrId,
         Specific {
           mlton  = namespaceStrProgramMLton,
           polyml = namespaceStrProgramPolyML
         }
      )
    )
  end


fun addDeps ((_, extraDeps), (x, deps)) = (x, List.foldl insert deps extraDeps)

fun insertSig x = ListDict.insert I addDeps x
fun insertSigs (xs, m) = List.foldr insertSig m xs

fun insertStr x = ListDict.insert I addDeps x
fun insertStrs (xs, m) = List.foldr insertStr m xs

fun generate dir repo (namespace, version) (extraVers, extraSigs, extraStrs) =
  let
    val vers'1 = loadNamespace repo (namespace, version)
    val vers = Repository.extendTypelibVers extraVers vers'1

    val curDir = OS.FileSys.getDir ()
    val () = OS.FileSys.chDir dir
  in
    let
      (* `createNamespaceDir` fails if directory already exists *)
      val namespaceDir = createNamespaceDir (namespace, version)

      val namespaceDeps =
        getOpt (Repository.getDependencies repo vers namespace, [])

      (* generate code for the entire namespace *)
      val ((modules, constants, functions), errs) =
        translateLoadedNamespace repo vers namespace

      val (files'1, sigs'1, strs'1) = modules

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
       *      `strSpecsDecs'2` from step 1, `constants` and `functions`.
       *
       *   3. Extend `sigs'1` with `extraSigs` and sort the result to
       *      satisfy dependencies, giving `sigFiles'2`.
       *
       *   4. Extend `strFiles'2` with `namespaceStrId` from step 2 to give
       *      `strFiles'3`.  `namespaceStrId` must occur last.
       *
       *   5. Extend `sigFiles'2` with `namespaceSigId` from step 2 to give
       *      `sigFiles'2`.  `namespaceSigId` must occur last.
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
        namespaceSig as (namespaceSigId, namespaceSigProgram),
        namespaceStr as (namespaceStrId, namespaceStrProgram)
      ) =
        makeNamespaceSigStr namespace
          (revStrSpecsDecs'2, constants, functions)

      (* Step 3 *)
      val revSigFiles'2 =
        sort (ListDict.toList (insertSigs (extraSigs, sigs'1)))

      (* Step 4 *)
      val revSigFiles'3 =
        (namespaceSigId, isPortable namespaceSigProgram) :: revSigFiles'2

      (* Step 5 *)
      val revStrFiles'3 =
        (namespaceStrId, isPortable namespaceStrProgram) :: revStrFiles'2

      (* Step 6 *)
      val () =
        writeBasisFile repo vers namespace
          namespaceDir
          namespaceDeps
          (revSigFiles'3, revStrFiles'3)

      (* Step 7 *)
      val files'2 =
        insertNewList dupFile ([namespaceSig, namespaceStr], files'1)
    in
      (* Step 8 *)
      ListDict.appi (writeProgramFile namespaceDir) files'2;

      OS.FileSys.chDir curDir;
      errs
    end
      handle
        e => (OS.FileSys.chDir curDir; raise e)
  end


(* Support for constructing values for `extraSigs` parameter of `generate`. *)

fun makeSig nameId sigDeps = (nameId, (true, sigDeps))


(* Support for constructing values for `extraStrs` parameter of `generate`. *)

fun mkStructSpec (strId, qSig) = SpecStruct (toList1 [(strId, qSig)])
fun mkStructStrDec (strId, sigId) =
  StrDecStruct (toList1 [(strId, NONE, StructName (toList1 [sigId]))]);

fun makeStr (namespaceId, nameId, sigId) localTypes =
  let
    val strId = namespaceId ^ nameId

    val quals = map makeLocalTypeStrSpecQual localTypes
    val strDeps = map (#1 o #tyStrLId) localTypes

    val isPortable = false
  in
    (
      strId,
      (
        (
          isPortable,
          (
            [mkStructSpec (nameId, (SigName sigId, quals))],
            [mkStructStrDec (nameId, strId)]
          )
        ),
        strDeps
      )
    )
  end

fun addDep (namespaceId, nameId) (localTypes : localtype list) =
  let
    val strId = namespaceId ^ nameId

    val strDeps = map (#1 o #tyStrLId) localTypes

    val isPortable = false
  in
    (
      strId,
      (
        (
          isPortable,
          (
            [],
            []
          )
        ),
        strDeps
      )
    )
  end
