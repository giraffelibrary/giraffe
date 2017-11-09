(* --------------------------------------------------------------------------
 * Namespace
 * -------------------------------------------------------------------------- *)

fun dupSig id _ = raise Fail (String.concat ["duplicate signature ", id])
fun dupStr id _ = raise Fail (String.concat ["duplicate structure ", id])
fun dupFile id _ = raise Fail (String.concat ["duplicate file for module ", id])
fun insertNew f (x as ((id, _), _)) = ListDict.insert I (f id) x
fun insertNewList f (xs, m) = List.foldr (insertNew f) m xs

fun translateInfo
  repo
  vers
  namespace
  (
    baseInfo,
    acc as (
      (
        modules'0 as (
          files'0 : program ListDict.t,
          sigs'0 : (bool * id list) ListDict.t,
          strs'0 : ((bool * (spec list * strdec list)) * id list) ListDict.t,
          numProps'0 : LargeInt.int,
          numSigs'0 : LargeInt.int,
          useAccessors'0 : bool
        ),
        constants'0,
        functions'0,
        structDeps'0
      ),
      excls'0
    )
  ) =
  case InfoType.getType baseInfo of
    InfoType.OBJECT objectInfo       =>
      let
        val () = checkInterfaceType objectInfo

        val (classSigId, classSigProgram, classSigDeps) =
          makeObjectClassSig repo namespace objectInfo

        val (
          classStrId,
          classStrSpecDec,
          classStrProgram,
          classStrIRefs
        ) =
          makeObjectClassStr repo namespace objectInfo

        val (strId, strSpecDec, strProgram, strIRefs, excls'1) =
          makeObjectStr repo vers namespace objectInfo excls'0

        val classStrDeps = map makeIRefInterfaceOtherStrId classStrIRefs
        val strDeps = map makeIRefInterfaceOtherStrId strIRefs

        val (sigId, sigProgram, sigDeps, excls'2) =
          makeObjectSig repo vers namespace objectInfo excls'1

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
        val numProps'1 = numProps'0 + ObjectInfo.getNProperties objectInfo
        val numSigs'1  = numSigs'0  + ObjectInfo.getNSignals    objectInfo
        val useAccessors'1 = true
        val modules'1 =
          (files'1, sigs'1, strs'1, numProps'1, numSigs'1, useAccessors'1)
      in
        ((modules'1, constants'0, functions'0, structDeps'0), excls'2)
      end
  | InfoType.INTERFACE interfaceInfo =>
      let
        val () = checkInterfaceType interfaceInfo

        val (classSigId, classSigProgram, classSigDeps) =
          makeInterfaceClassSig repo namespace interfaceInfo

        val (
          classStrId,
          classStrSpecDec,
          classStrProgram,
          classStrIRefs
        ) =
          makeInterfaceClassStr repo namespace interfaceInfo

        val (strId, strSpecDec, strProgram, strIRefs, excls'1) =
          makeInterfaceStr repo vers namespace interfaceInfo excls'0

        val classStrDeps = map makeIRefInterfaceOtherStrId classStrIRefs
        val strDeps = map makeIRefInterfaceOtherStrId strIRefs

        val (sigId, sigProgram, sigDeps, excls'2) =
          makeInterfaceSig repo vers namespace interfaceInfo excls'1

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
        val numProps'1 = numProps'0 + InterfaceInfo.getNProperties interfaceInfo
        val numSigs'1  = numSigs'0  + InterfaceInfo.getNSignals    interfaceInfo
        val useAccessors'1 = true
        val modules'1 =
          (files'1, sigs'1, strs'1, numProps'1, numSigs'1, useAccessors'1)
      in
        ((modules'1, constants'0, functions'0, structDeps'0), excls'2)
      end
  | InfoType.STRUCT structInfo       =>
      let
        val () = checkInterfaceType structInfo

        val (recordSigId, recordSigProgram, recordSigDeps) =
          makeStructRecordSig repo namespace structInfo

        val (
          recordStrId,
          recordStrSpecDec,
          recordStrProgram,
          recordStrIRefs
        ) =
          makeStructRecordStr repo vers namespace structInfo

        val (strId, strSpecDec, strProgram, strIRefs, excls'1) =
          makeStructStr repo vers namespace structInfo excls'0

        val recordStrDeps = map makeIRefInterfaceOtherStrId recordStrIRefs
        val strDeps = map makeIRefInterfaceOtherStrId strIRefs

        val (sigId, sigProgram, sigDeps, excls'2) =
          makeStructSig repo vers namespace structInfo excls'1

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
        val modules'1 =
          (files'1, sigs'1, strs'1, numProps'0, numSigs'0, useAccessors'0)
      in
        ((modules'1, constants'0, functions'0, structDeps'0), excls'2)
      end
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
          val () = checkInterfaceType unionInfo

          val (strId, strSpecDec, strProgram, strIRefs, excls'1) =
            makeUnionStr repo vers namespace unionInfo excls'0

          val strDeps = map makeIRefInterfaceOtherStrId strIRefs

          val (sigId, sigProgram, sigDeps, excls'2) =
            makeUnionSig repo vers namespace unionInfo excls'1

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
          val modules'1 =
            (files'1, sigs'1, strs'1, numProps'0, numSigs'0, useAccessors'0)
        in
          ((modules'1, constants'0, functions'0, structDeps'0), excls'2)
        end
      else
        acc
  | InfoType.FLAGS enumInfo          =>
      let
        val () = checkInterfaceType enumInfo

        val (strId, strSpecDec, strProgram, strIRefs, excls'1) =
          makeFlagsStr repo vers namespace enumInfo excls'0

        val strDeps = map makeIRefInterfaceOtherStrId strIRefs

        val (sigId, sigProgram, sigDeps, excls'2) =
          makeFlagsSig repo vers namespace enumInfo excls'1

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
        val useAccessors'1 =
          useAccessors'0 orelse isSome (RegisteredTypeInfo.getTypeInit enumInfo)
        val modules'1 =
          (files'1, sigs'1, strs'1, numProps'0, numSigs'0, useAccessors'1)
      in
        ((modules'1, constants'0, functions'0, structDeps'0), excls'2)
      end
  | InfoType.ENUM enumInfo           =>
      let
        val () = checkInterfaceType enumInfo

        val (strId, strSpecDec, strProgram, strIRefs, excls'1) =
          makeEnumStr repo vers namespace enumInfo excls'0

        val strDeps = map makeIRefInterfaceOtherStrId strIRefs

        val (sigId, sigProgram, sigDeps, excls'2) =
          makeEnumSig repo vers namespace enumInfo excls'1

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
        val useAccessors'1 =
          useAccessors'0 orelse isSome (RegisteredTypeInfo.getTypeInit enumInfo)
        val modules'1 =
          (files'1, sigs'1, strs'1, numProps'0, numSigs'0, useAccessors'1)
      in
        ((modules'1, constants'0, functions'0, structDeps'0), excls'2)
      end
  | InfoType.ALIAS aliasInfo         =>
      let
        val () = checkInterfaceType aliasInfo

        val (strId, strSpecDec, strProgram, strIRefs, excls'1) =
          makeAliasStr repo namespace aliasInfo excls'0

        val strDeps = map makeIRefInterfaceOtherStrId strIRefs

        val (sigId, sigProgram, sigDeps, excls'2) =
          makeAliasSig repo namespace aliasInfo excls'1

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
        val modules'1 =
          (files'1, sigs'1, strs'1, numProps'0, numSigs'0, useAccessors'0)
      in
        ((modules'1, constants'0, functions'0, structDeps'0), excls'2)
      end
  | InfoType.CONSTANT constantInfo   =>
      let
        val (spec, (_, excls'1)) =
          makeConstantSpec repo vers (constantInfo, ([], excls'0))

        val (strDec, ((_, structDeps'1), excls'2)) =
          makeConstantStrDec repo vers
            (constantInfo, (([], structDeps'0), excls'1))

        val (specs'0, strDecs'0) = constants'0
        val constants'1 = (spec :: specs'0, strDec :: strDecs'0)
      in
        ((modules'0, constants'1, functions'0, structDeps'1), excls'2)
      end
  | InfoType.FUNCTION functionInfo   =>
      let
        val (spec, (_, excls'1)) =
          makeFunctionSpec repo vers NONE (functionInfo, ([], excls'0))

        val (strDecHighLevel, ((_, structDeps'1), excls'2)) =
          makeFunctionStrDecHighLevel repo vers NONE
            (functionInfo, (([], structDeps'0), excls'1))

        val (strDecLowLevelPolyML, excls'3) =
          makeFunctionStrDecLowLevelPolyML repo vers NONE
            (functionInfo, excls'2)

        val (strDecLowLevelMLton, excls'4) =
          makeFunctionStrDecLowLevelMLton repo vers NONE
            (functionInfo, excls'3)

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
        ((modules'0, constants'0, functions'1, structDeps'1), excls'4)
      end
  | _                                => acc


fun translateLoadedNamespace repo vers namespace =
  let
    val modules'0 = (ListDict.empty, ListDict.empty, ListDict.empty, 0, 0, false)
    val constants'0 = ([], [])
    val functions'0 = ([], [], [], [])
    val structDeps'0 = ListDict.empty
    val excls'0 = []
  in
    revFoldInfosWithExcls
      (Repository.getNInfos repo vers)
      (Repository.getInfo repo vers)
      (translateInfo repo vers namespace)
      (namespace, ((modules'0, constants'0, functions'0, structDeps'0), excls'0))
  end
