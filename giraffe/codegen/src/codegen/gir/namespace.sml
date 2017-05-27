(* --------------------------------------------------------------------------
 * Namespace
 * -------------------------------------------------------------------------- *)

val structNames = ref []
val unionNames = ref []

fun dupSig id _ = raise Fail (String.concat ["duplicate signature ", id])
fun dupStr id _ = raise Fail (String.concat ["duplicate structure ", id])
fun dupFile id _ = raise Fail (String.concat ["duplicate file for module ", id])
fun insertNew f (x as ((id, _), _)) = ListDict.insert I (f id) x
fun insertNewList f (xs, m) = List.foldr (insertNew f) m xs

fun translateInfo
  repo
  vers
  getLibId
  namespace
  (
    baseInfo,
    acc as (
      (
        modules'0 as (
          files'0 : program ListDict.t,
          sigs'0 : (bool * id list) ListDict.t,
          strs'0 : ((bool * (spec list * strdec list)) * id list) ListDict.t
        ),
        constants'0,
        functions'0,
        structDeps'0
      ),
      errs'0
    )
  ) =
  case InfoType.getType baseInfo of
    InfoType.OBJECT objectInfo       =>
      let
        val libId = getLibId ()

        val (classSigId, classSigProgram, classSigDeps) =
          makeObjectClassSig repo namespace objectInfo

        val (
          classStrId,
          classStrSpecDec,
          classStrProgram,
          classStrIRefs
        ) =
          makeObjectClassStr repo namespace objectInfo

        val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
          makeObjectStr repo vers libId namespace objectInfo errs'0

        val classStrDeps = map makeIRefInterfaceOtherStrId classStrIRefs
        val strDeps = map makeIRefInterfaceOtherStrId strIRefs

        val (sigId, sigProgram, sigDeps, errs'2) =
          makeObjectSig repo namespace objectInfo errs'1

        val isClassSigPortable = isPortable classSigProgram
        val isClassStrPortable = isPortable classStrProgram
        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val sigs'1 =
          insertNewList dupSig (
            [
              (classSigId, (isClassSigPortable, classSigDeps)),
              (sigId,      (isSigPortable,      sigDeps))
           ],
           sigs'0
        )
        val strs'1 =
          insertNewList dupStr (
            [
              (classStrId, ((isClassStrPortable, classStrSpecDec), classStrDeps)),
              (strId,      ((isStrPortable,      strSpecDec),      strDeps))
            ],
            strs'0
          )
        val files'1 =
          insertNewList dupFile (
            [
              (classSigId, classSigProgram), (sigId, sigProgram),
              (classStrId, classStrProgram), (strId, strProgram)
            ],
            files'0
          )
        val modules'1 = (files'1, sigs'1, strs'1)
      in
        ((modules'1, constants'0, functions'0, structDeps'0), errs'2)
      end
  | InfoType.INTERFACE interfaceInfo =>
      let
        val libId = getLibId ()

        val (classSigId, classSigProgram, classSigDeps) =
          makeInterfaceClassSig repo namespace interfaceInfo

        val (
          classStrId,
          classStrSpecDec,
          classStrProgram,
          classStrIRefs
        ) =
          makeInterfaceClassStr repo namespace interfaceInfo

        val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
          makeInterfaceStr repo vers libId namespace interfaceInfo errs'0

        val classStrDeps = map makeIRefInterfaceOtherStrId classStrIRefs
        val strDeps = map makeIRefInterfaceOtherStrId strIRefs

        val (sigId, sigProgram, sigDeps, errs'2) =
          makeInterfaceSig repo namespace interfaceInfo errs'1

        val isClassSigPortable = isPortable classSigProgram
        val isClassStrPortable = isPortable classStrProgram
        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val sigs'1 =
          insertNewList dupSig (
            [
              (classSigId, (isClassSigPortable, classSigDeps)),
              (sigId,      (isSigPortable,      sigDeps))
            ],
            sigs'0
          )
        val strs'1 =
          insertNewList dupStr (
            [
              (classStrId, ((isClassStrPortable, classStrSpecDec), classStrDeps)),
              (strId,      ((isStrPortable,      strSpecDec),      strDeps))
            ],
            strs'0
          )
        val files'1 =
          insertNewList dupFile (
            [
              (classSigId, classSigProgram), (sigId, sigProgram),
              (classStrId, classStrProgram), (strId, strProgram)
            ],
            files'0
          )
        val modules'1 = (files'1, sigs'1, strs'1)
      in
        ((modules'1, constants'0, functions'0, structDeps'0), errs'2)
      end
  | InfoType.STRUCT structInfo       =>
      if
        let
          val structName = getName structInfo
          val structNamespace = namespace
          fun isName x = x = (structNamespace, structName)
        in
          List.exists isName (!structNames)
        end
      then
        let
          val libId = getLibId ()

          val (recordSigId, recordSigProgram, recordSigDeps) =
            makeStructRecordSig repo namespace structInfo

          val (
            recordStrId,
            recordStrSpecDec,
            recordStrProgram,
            recordStrIRefs
          ) =
            makeStructRecordStr repo namespace structInfo

          val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
            makeStructStr repo vers libId namespace structInfo errs'0

          val recordStrDeps = map makeIRefInterfaceOtherStrId recordStrIRefs
          val strDeps = map makeIRefInterfaceOtherStrId strIRefs

          val (sigId, sigProgram, sigDeps, errs'2) =
            makeStructSig repo namespace structInfo errs'1

          val isRecordSigPortable = isPortable recordSigProgram
          val isRecordStrPortable = isPortable recordStrProgram
          val isSigPortable = isPortable sigProgram
          val isStrPortable = isPortable strProgram

          val sigs'1 =
            insertNewList dupSig (
              [
                (recordSigId, (isRecordSigPortable, recordSigDeps)),
                (sigId,       (isSigPortable,       sigDeps))
              ],
              sigs'0
            )
          val strs'1 =
            insertNewList dupStr (
              [
                (recordStrId, ((isRecordStrPortable, recordStrSpecDec), recordStrDeps)),
                (strId,       ((isStrPortable,       strSpecDec),       strDeps))
              ],
              strs'0
            )
          val files'1 =
            insertNewList dupFile (
              [
                (recordSigId, recordSigProgram), (sigId, sigProgram),
                (recordStrId, recordStrProgram), (strId, strProgram)
              ],
              files'0
            )
          val modules'1 = (files'1, sigs'1, strs'1)
        in
          ((modules'1, constants'0, functions'0, structDeps'0), errs'2)
        end
      else
        acc
  | InfoType.UNION unionInfo         =>
      if
        let
          val unionName = getName unionInfo
          val unionNamespace = namespace
          fun isName x = x = (unionNamespace, unionName)
        in
          List.exists isName (!unionNames)
        end
      then
        let
          val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
            makeUnionStr repo namespace unionInfo errs'0

          val strDeps = map makeIRefInterfaceOtherStrId strIRefs

          val (sigId, sigProgram, sigDeps, errs'2) =
            makeUnionSig repo namespace unionInfo errs'1

          val isSigPortable = isPortable sigProgram
          val isStrPortable = isPortable strProgram

          val sigs'1 =
            insertNewList dupSig ([(sigId, (isSigPortable, sigDeps))], sigs'0)
          val strs'1 =
            insertNewList dupStr (
              [(strId, ((isStrPortable, strSpecDec), strDeps))],
              strs'0
            )
          val files'1 =
            insertNewList dupFile (
              [
                (sigId, sigProgram),
                (strId, strProgram)
              ],
              files'0
            )
          val modules'1 = (files'1, sigs'1, strs'1)
        in
          ((modules'1, constants'0, functions'0, structDeps'0), errs'2)
        end
      else
        acc
  | InfoType.FLAGS enumInfo          =>
      let
        val libId = getLibId ()

        val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
          makeFlagsStr repo vers libId namespace enumInfo errs'0

        val strDeps = map makeIRefInterfaceOtherStrId strIRefs

        val (sigId, sigProgram, sigDeps, errs'2) =
          makeFlagsSig repo namespace enumInfo errs'1

        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val sigs'1 =
          insertNew dupSig ((sigId, (isSigPortable, sigDeps)), sigs'0)
        val strs'1 =
          insertNewList dupStr (
            [(strId, ((isStrPortable, strSpecDec), strDeps))],
            strs'0
          )
        val files'1 =
          insertNewList dupFile (
            [
              (sigId, sigProgram),
              (strId, strProgram)
            ],
            files'0
          )
        val modules'1 = (files'1, sigs'1, strs'1)
      in
        ((modules'1, constants'0, functions'0, structDeps'0), errs'2)
      end
  | InfoType.ENUM enumInfo           =>
      let
        val libId = getLibId ()

        val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
          makeEnumStr repo vers libId namespace enumInfo errs'0

        val strDeps = map makeIRefInterfaceOtherStrId strIRefs

        val (sigId, sigProgram, sigDeps, errs'2) =
          makeEnumSig repo namespace enumInfo errs'1

        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val sigs'1 =
          insertNew dupSig ((sigId, (isSigPortable, sigDeps)), sigs'0)
        val strs'1 =
          insertNewList dupStr (
            [(strId, ((isStrPortable, strSpecDec), strDeps))],
            strs'0
          )
        val files'1 =
          insertNewList dupFile (
            [
              (sigId, sigProgram),
              (strId, strProgram)
            ],
            files'0
          )
        val modules'1 = (files'1, sigs'1, strs'1)
      in
        ((modules'1, constants'0, functions'0, structDeps'0), errs'2)
      end
  | InfoType.ALIAS aliasInfo         =>
      let
        val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
          makeAliasStr repo namespace aliasInfo errs'0

        val strDeps = map makeIRefInterfaceOtherStrId strIRefs

        val (sigId, sigProgram, sigDeps, errs'2) =
          makeAliasSig repo namespace aliasInfo errs'1

        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val sigs'1 =
          insertNew dupSig ((sigId, (isSigPortable, sigDeps)), sigs'0)
        val strs'1 =
          insertNewList dupStr (
            [(strId, ((isStrPortable, strSpecDec), strDeps))],
            strs'0
          )
        val files'1 =
          insertNewList dupFile (
            [
              (sigId, sigProgram),
              (strId, strProgram)
            ],
            files'0
          )
        val modules'1 = (files'1, sigs'1, strs'1)
      in
        ((modules'1, constants'0, functions'0, structDeps'0), errs'2)
      end
  | InfoType.CONSTANT constantInfo   =>
      let
        val (spec, (_, errs'1)) =
          makeConstantSpec (constantInfo, ([], errs'0))

        val (strDec, ((_, structDeps'1), errs'2)) =
          makeConstantStrDec (constantInfo, (([], structDeps'0), errs'1))

        val (specs'0, strDecs'0) = constants'0
        val constants'1 = (spec :: specs'0, strDec :: strDecs'0)
      in
        ((modules'0, constants'1, functions'0, structDeps'1), errs'2)
      end
  | InfoType.FUNCTION functionInfo   =>
      let
        val libId = getLibId ()

        val (spec, (_, errs'1)) =
          makeFunctionSpec repo NONE (functionInfo, ([], errs'0))

        val (strDecHighLevel, ((_, structDeps'1), errs'2)) =
          makeFunctionStrDecHighLevel repo NONE
            (functionInfo, (([], structDeps'0), errs'1))

        val (strDecLowLevelPolyML, errs'3) =
          makeFunctionStrDecLowLevelPolyML repo libId NONE
            (functionInfo, errs'2)

        val (strDecLowLevelMLton, errs'4) =
          makeFunctionStrDecLowLevelMLton repo NONE
            (functionInfo, errs'3)

        val (
          specs'0,
          strDecsHighLevel'0,
          strDecsLowLevelMLton'0,
          strDecsLowLevelPolyML'0
        ) = functions'0
        val functions'1 = (
          spec :: specs'0,
          strDecHighLevel :: strDecsHighLevel'0,
          strDecLowLevelMLton :: strDecsLowLevelMLton'0,
          strDecLowLevelPolyML :: strDecsLowLevelPolyML'0
        )
      in
        ((modules'0, constants'0, functions'1, structDeps'1), errs'4)
      end
  | _                                => acc


fun translateLoadedNamespace repo vers namespace =
  let
    val getLibId = lazy (fn () => getSharedLibraryId repo vers namespace)

    val modules'0 = (ListDict.empty, ListDict.empty, ListDict.empty)
    val constants'0 = ([], [])
    val functions'0 = ([], [], [], [])
    val structDeps'0 = ListDict.empty
    val errs'0 = []
  in
    revFoldInfosWithErrs
      (Repository.getNInfos repo vers)
      (Repository.getInfo repo vers)
      (translateInfo repo vers getLibId namespace)
      (namespace, ((modules'0, constants'0, functions'0, structDeps'0), errs'0))
  end
