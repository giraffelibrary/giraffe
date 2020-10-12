(* --------------------------------------------------------------------------
 * Namespace
 * -------------------------------------------------------------------------- *)

(* Container modules *)

fun mkArrayStrModules (elemStrId, isPtr, zeroTerminated) =
  let
    val elemArrayStrId = makeCArrayStrId (elemStrId, isPtr, zeroTerminated)

    val funcId = String.concat (
      cStrId :: arrayStrId :: (if zeroTerminated then [] else [nStrId])
    )
    val funcTypeId =
      let
        val prefixId = case isPtr of true => cPointerStrId | false => cValueStrId
      in
        prefixId ^ funcId ^ typeStrId
      end
    val elemArrayTypeStrId = elemArrayStrId ^ typeStrId

    val arrayTypeStruct = (
      elemArrayTypeStrId,
      StructInst (
        funcTypeId,
        case isPtr of
          true  =>
            let
              val elemStruct = mkNameStruct [elemStrId, cStrId, pointerTypeStrId]
              val sequenceStruct = mkNameStruct ["VectorSequence"]
            in
              mkStrDecsFunArg [
                mkStructStrDec ("CElemType", elemStruct),
                mkStructStrDec ("Sequence", sequenceStruct)
              ]
            end
        | false =>
            let
              val elemStruct = mkNameStruct [elemStrId, cStrId, valueTypeStrId]
              val elemSequenceStruct =
                case elemStrId of
                  "GChar"  =>
                    mkInstStruct ("MonoVectorSequence", mkNameStruct ["CharVector"])
                | "GUInt8" =>
                    mkInstStruct ("MonoVectorSequence", mkNameStruct ["Word8Vector"])
                | _        =>
                    mkInstStruct ("CValueVectorSequence", elemStruct)
            in
              mkStrDecsFunArg [
                mkStructStrDec ("CElemType", elemStruct),
                mkStructStrDec ("ElemSequence", elemSequenceStruct)
              ]
            end
      )
    )
    val arrayStruct = (
      elemArrayStrId,
      mkInstStruct (funcId, mkNameStruct [elemArrayTypeStrId])
    )
  in
    revMap (ModuleDecStr o mkStructStrDec) [arrayStruct, arrayTypeStruct]
  end


(* Adding referenced container modules *)

val defaultContainerNamespace = "GLib"

fun dupContainer (_, current) = current

fun insertGlobalContainerFile (((namespace, file), program), m) =
  NamespaceFileMap.inserti dupContainer (((namespace, file), program), m)

fun insertLocalContainerFile ((file, program), m) =
  NamespaceFileMap.inserti dupContainer ((thisNamespace file, program), m)

fun insertGlobalContainerNoContainerError iRef =
  raise Fail (
    concat [
      "insertGlobalContainer: reference ",
      makeIRefInterfaceOtherStrId iRef,
      " is not a container" 
    ]
  )

local
  val fmtInterfaceScope =
   fn
     GLOBAL              => "GLOBAL"
   | LOCALNAMESPACE      => "LOCALNAMESPACE"
   | LOCALINTERFACEOTHER => "LOCALINTERFACEOTHER"
   | LOCALINTERFACESELF  => "LOCALINTERFACESELF"
in
  fun insertGlobalContainerScopeError (iRef as {scope, ...}) =
    raise Fail (
      concat [
        "insertGlobalContainer: reference ",
        makeIRefInterfaceOtherStrId iRef,
        " has scope ",
        fmtInterfaceScope scope,
        " but requires scope ",
        fmtInterfaceScope GLOBAL
      ]
    )

  fun insertLocalContainerScopeError (iRef as {scope, ...}) =
    raise Fail (
      concat [
        "insertLocalContainer: reference ",
        makeIRefInterfaceOtherStrId iRef,
        " has scope ",
        fmtInterfaceScope scope,
        " but requires scope ",
        fmtInterfaceScope LOCALNAMESPACE, ", ",
        fmtInterfaceScope LOCALINTERFACEOTHER, " or ",
        fmtInterfaceScope LOCALINTERFACESELF
      ]
    )
end

fun insertGlobalContainer
  localNamespace
  (
    iRef as {scope, container, ...} : interfaceref,
    acc'0
  ) =
  case scope of
    GLOBAL => (
      case container of
        SOME containerTy =>
          let
            val {namespace = extNamespace, ...} = iRef

            (* A container reference may not have a namespace, in which case
             * it is introduced in the default container namespace.  If the
             * current namespace is not the default container namespace, the
             * empty namespace must be overridden by the default container
             * namespace. *)
            val extFileNamespace =
              if extNamespace = "" andalso localNamespace <> defaultContainerNamespace
              then defaultContainerNamespace
              else extNamespace

            val extFile = mkStrFile (makeIRefInterfaceOtherStrId iRef)

            val (elemStrId, extDeps, acc'1) =
              case containerTy of
                ARRAYREF {elemRef, ...} => (
                  case elemRef of
                    INTERFACE elemIRef =>
                      let
                        val elemStrId = makeIRefInterfaceOtherStrId elemIRef

                        val (extDeps, acc'1) =
                          case elemIRef of
                            {scope = GLOBAL, container = SOME _, ...} => (
                              [mkStrFile elemStrId],
                              insertGlobalContainer localNamespace (elemIRef, acc'0)
                            )
                          | _                                         => ([], acc'0)
                      in
                        (elemStrId, extDeps, acc'1)
                      end
                  | NAME elemName      =>
                      let
                        val elemStrId = elemName
                      in
                        (elemStrId, [], acc'0)
                      end
                )

            val strModules =
              case containerTy of
                ARRAYREF {isPtr, zeroTerminated, ...} =>
                  mkArrayStrModules (elemStrId, isPtr, zeroTerminated)
            val extProgram = Portable strModules

            val (files'1, exts'1) = acc'1

            val exts'2 =
              NamespaceFileMap.insert dupContainer (
                ((extNamespace, extFile), ((), extDeps)),
                exts'1
              )

            val files'2 =
              insertGlobalContainerFile (
                ((extFileNamespace, extFile), extProgram),
                files'1
              )
          in
            (files'2, exts'2)
          end
      | _                => insertGlobalContainerNoContainerError iRef
    )
  | _      => insertGlobalContainerScopeError iRef

fun insertLocalContainer
  (
    iRef as {scope, container, ...} : interfaceref,
    acc'0
  ) =
  case scope of
    GLOBAL         => insertLocalContainerScopeError iRef
  | _              => (
      case container of
        SOME containerTy =>
          let
            val (elemNTys, elemId, elemStrId, elemNamespaceStrId, strDeps, acc'1) =
              case containerTy of
                ARRAYREF {elemRef, ...} => (
                  case elemRef of
                    INTERFACE elemIRef =>
                      let
                        val elemNamespaceStrId = makeIRefNamespaceStrId elemIRef
                        val elemStrId = makeIRefInterfaceOtherStrId elemIRef
                        val elemId = makeLocalInterfaceSelfId elemIRef
                        val elemNTys = numInterfaceRefTyVars elemIRef

                        val (strDeps, acc'1) =
                          case elemIRef of
                            {scope = GLOBAL, ...}         => ([], acc'0)
                          | _                             => (
                              [mkStrFile elemStrId],
                              insertLocalContainer (elemIRef, acc'0)
                            )
                      in
                        (elemNTys, elemId, elemStrId, elemNamespaceStrId, strDeps, acc'1)
                      end
                  | NAME elemName      =>
                      let
                        val elemNamespaceStrId = elemName
                        val elemStrId = elemName
                        val elemId = tId
                        val elemNTys = 0
                      in
                        (elemNTys, elemId, elemStrId, elemNamespaceStrId, [], acc'0)
                      end
                )

            val strFile = mkStrFile (makeIRefInterfaceOtherStrId iRef)
            val {namespace, name, ...} = iRef
            val strId = mkStrId namespace name
            val sigId = toUCU (cStrId ^ arrayStrId)
            val strNameId = mkStrNameId name

            (* module *)
            val strModules =
              case containerTy of
                ARRAYREF {isPtr, zeroTerminated, ...} =>
                  mkArrayStrModules (elemStrId, isPtr, zeroTerminated)
            val strProgram = Portable strModules

            (* namespace spec *)
            val spec =
              let
                (* sig *)
                val sig1 = SigName sigId
                local
                  (* derived from code for `makeIRefLocalType` *)
                  val (tyVars, tyId) = ([], "elem")
                  val (varTys, _) = makeTyList makeBaseTy (elemNTys, 0)
                  val tyNameLId = toList1 [elemNamespaceStrId, elemId]
                in
                  (* derived from code for `makeLocalTypeStrSpecQual` *)
                  val sigQual =
                    toList1 [((tyVars, toList1 [tyId]), TyRef (varTys, tyNameLId))]
                end
                val qSig : qsig = (sig1, [sigQual])
              in
                (* spec *)
                SpecStruct (toList1 [(strNameId, qSig)])
              end

            (* namespace strdec *)
            val strDec =
              StrDecStruct (
                toList1 [
                  (strNameId, NONE, StructName (toList1 [strId]))
                ]
              )

            val (files'1, strs'1) = acc'1

            val strs'2 =
              FileMap.insert dupContainer (
                (strFile, ((true, ([spec], [strDec]), SOME strId), strDeps)),
                strs'1
              )

            val files'2 =
              insertLocalContainerFile (
                (strFile, strProgram),
                files'1
              )
          in
            (files'2, strs'2)
          end
      | NONE             => acc'0
    )


(* Namespace elements *)

fun dupExt (_, current) = current

fun dupSig ((file, _), _) =
  raise Fail (String.concat ["duplicate signature file ", file])

fun dupStr ((file, _), _) =
  raise Fail (String.concat ["duplicate structure file ", file])

fun dupNamespaceFile (((namespace, file), _), _) =
  let
    val msgExt = if namespace = "" then [] else [" in external namespace ", namespace]
    val msg = ["duplicate file ", file] @ msgExt
  in
    raise Fail (String.concat msg)
  end

fun dupFile ((file, _), _) =
  let
    val msg = ["duplicate file ", file]
  in
    raise Fail (String.concat msg)
  end

    fun foldR f (xs, a) =
      case xs of
        x :: xs' => f (x, foldR f (xs', a))
      | []       => a


fun insertSig x = FileMap.inserti dupSig x
fun insertStr x = FileMap.inserti dupStr x
fun insertThisNamespaceFile ((file, program), m) =
  NamespaceFileMap.inserti dupNamespaceFile ((thisNamespace file, program), m)
fun insertFile x = FileMap.inserti dupFile x

fun makeInfo
  repo
  vers
  namespace
  (
    baseInfo,
    acc as (
      (
        files'0 : program NamespaceFileMap.t,
        exts'0 : (unit * string list) NamespaceFileMap.t,
        (
          sigs'0 : (bool * string list) FileMap.t,
          strs'0 : ((bool * (spec list * strdec list) * string option) * string list) FileMap.t,
          numProps'0 : LargeInt.int,
          numSigs'0 : LargeInt.int,
          useAccessors'0 : bool
        ),
        constants'0,
        functions'0,
        structDeps'0,
        cInterfaceDecls'0
      ),
      excls'0
    )
  ) =
  case InfoType.getType baseInfo of
    InfoType.OBJECT objectInfo       =>
      let
        val () = checkInterfaceType repo vers objectInfo

        val (classSigFile, classSigProgram, classSigIRefs, classExtIRefs) =
          makeObjectClassSig repo namespace objectInfo

        val (
          classStrFile,
          classStrSpecDec,
          classStrProgram,
          classStrIRefs
        ) =
          makeObjectClassStr repo namespace objectInfo

        val (strFile, strSpecDec, strProgram, strIRefs, excls'1) =
          makeObjectStr repo vers namespace objectInfo excls'0

        val classStrDeps = map (mkStrFile o makeIRefInterfaceOtherStrId) classStrIRefs
        val strDeps = map (mkStrFile o makeIRefInterfaceOtherStrId) strIRefs

        val (sigFile, sigProgram, sigIRefs, extIRefs, excls'2) =
          makeObjectSig repo vers namespace objectInfo excls'1

        val classSigDeps = map (mkSigFile o toUCU o makeIRefInterfaceOtherStrId) classSigIRefs
        val sigDeps = map (mkSigFile o toUCU o makeIRefInterfaceOtherStrId) sigIRefs

        val isClassSigPortable = isPortable classSigProgram
        val isClassStrPortable = isPortable classStrProgram
        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val (files'1, exts'1) =
          foldR (foldR (insertGlobalContainer namespace)) (
            [extIRefs, classExtIRefs],
            (files'0, exts'0)
          )
        val sigs'1 = sigs'0
        val (files'2, strs'1) =
          foldR (foldR insertLocalContainer) ([strIRefs, classStrIRefs], (files'1, strs'0))

        val sigs'2 =
          foldR insertSig (
            [
              (classSigFile, (isClassSigPortable, classSigDeps)),
              (sigFile,      (isSigPortable,      sigDeps))
            ],
            sigs'1
          )
        val strs'2 =
          foldR insertStr (
            [
              (classStrFile, ((isClassStrPortable, classStrSpecDec, NONE), classStrDeps)),
              (strFile,      ((isStrPortable,      strSpecDec,      NONE), strDeps))
            ],
            strs'1
          )
        val files'3 =
          foldR insertThisNamespaceFile (
            [
              (classSigFile, classSigProgram), (sigFile, sigProgram),
              (classStrFile, classStrProgram), (strFile, strProgram)
            ],
            files'2
          )
        val numProps'1 = numProps'0 + ObjectInfo.getNProperties objectInfo
        val numSigs'1  = numSigs'0  + ObjectInfo.getNSignals    objectInfo
        val useAccessors'1 = true
        val modules'1 =
          (sigs'2, strs'2, numProps'1, numSigs'1, useAccessors'1)
      in
        ((files'3, exts'1, modules'1, constants'0, functions'0, structDeps'0, cInterfaceDecls'0), excls'2)
      end
  | InfoType.INTERFACE interfaceInfo =>
      let
        val () = checkInterfaceType repo vers interfaceInfo

        val (classSigFile, classSigProgram, classSigIRefs, classExtIRefs) =
          makeInterfaceClassSig repo namespace interfaceInfo

        val (
          classStrFile,
          classStrSpecDec,
          classStrProgram,
          classStrIRefs
        ) =
          makeInterfaceClassStr repo namespace interfaceInfo

        val (strFile, strSpecDec, strProgram, strIRefs, excls'1) =
          makeInterfaceStr repo vers namespace interfaceInfo excls'0

        val classStrDeps = map (mkStrFile o makeIRefInterfaceOtherStrId) classStrIRefs
        val strDeps = map (mkStrFile o makeIRefInterfaceOtherStrId) strIRefs

        val (sigFile, sigProgram, sigIRefs, extIRefs, excls'2) =
          makeInterfaceSig repo vers namespace interfaceInfo excls'1

        val classSigDeps = map (mkSigFile o toUCU o makeIRefInterfaceOtherStrId) classSigIRefs
        val sigDeps = map (mkSigFile o toUCU o makeIRefInterfaceOtherStrId) sigIRefs

        val isClassSigPortable = isPortable classSigProgram
        val isClassStrPortable = isPortable classStrProgram
        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val (files'1, exts'1) =
          foldR (foldR (insertGlobalContainer namespace)) (
            [extIRefs, classExtIRefs],
            (files'0, exts'0)
          )
        val sigs'1 = sigs'0
        val (files'2, strs'1) =
          foldR (foldR insertLocalContainer) ([strIRefs, classStrIRefs], (files'1, strs'0))

        val sigs'2 =
          foldR insertSig (
            [
              (classSigFile, (isClassSigPortable, classSigDeps)),
              (sigFile,      (isSigPortable,      sigDeps))
            ],
            sigs'1
          )
        val strs'2 =
          foldR insertStr (
            [
              (classStrFile, ((isClassStrPortable, classStrSpecDec, NONE), classStrDeps)),
              (strFile,      ((isStrPortable,      strSpecDec,      NONE), strDeps))
            ],
            strs'1
          )
        val files'3 =
          foldR insertThisNamespaceFile (
            [
              (classSigFile, classSigProgram), (sigFile, sigProgram),
              (classStrFile, classStrProgram), (strFile, strProgram)
            ],
            files'2
          )
        val numProps'1 = numProps'0 + InterfaceInfo.getNProperties interfaceInfo
        val numSigs'1  = numSigs'0  + InterfaceInfo.getNSignals    interfaceInfo
        val useAccessors'1 = true
        val modules'1 =
          (sigs'2, strs'2, numProps'1, numSigs'1, useAccessors'1)
      in
        ((files'3, exts'1, modules'1, constants'0, functions'0, structDeps'0, cInterfaceDecls'0), excls'2)
      end
  | InfoType.STRUCT structInfo       =>
      let
        val () = checkInterfaceType repo vers structInfo

        val (recordSigFile, recordSigProgram, recordSigIRefs, recordExtIRefs) =
          makeStructRecordSig repo vers namespace structInfo

        val (
          recordStrFile,
          recordStrSpecDec,
          recordStrProgram,
          recordStrIRefs
        ) =
          makeStructRecordStr repo vers namespace structInfo

        val (strFile, strSpecDec, strProgram, strIRefs, excls'1) =
          makeStructStr repo vers namespace structInfo excls'0

        val recordStrDeps = map (mkStrFile o makeIRefInterfaceOtherStrId) recordStrIRefs
        val strDeps = map (mkStrFile o makeIRefInterfaceOtherStrId) strIRefs

        val (sigFile, sigProgram, sigIRefs, extIRefs, excls'2) =
          makeStructSig repo vers namespace structInfo excls'1

        val recordSigDeps = map (mkSigFile o toUCU o makeIRefInterfaceOtherStrId) recordSigIRefs
        val sigDeps = map (mkSigFile o toUCU o makeIRefInterfaceOtherStrId) sigIRefs

        val isRecordSigPortable = isPortable recordSigProgram
        val isRecordStrPortable = isPortable recordStrProgram
        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val (files'1, exts'1) =
          foldR (foldR (insertGlobalContainer namespace)) (
            [extIRefs, recordExtIRefs],
            (files'0, exts'0)
          )
        val sigs'1 = sigs'0
        val (files'2, strs'1) =
          foldR (foldR insertLocalContainer) ([strIRefs, recordStrIRefs], (files'1, strs'0))

        val sigs'2 =
          foldR insertSig (
            [
              (recordSigFile, (isRecordSigPortable, recordSigDeps)),
              (sigFile,       (isSigPortable,       sigDeps))
            ],
            sigs'1
          )
        val strs'2 =
          foldR insertStr (
            [
              (recordStrFile, ((isRecordStrPortable, recordStrSpecDec, NONE), recordStrDeps)),
              (strFile,       ((isStrPortable,       strSpecDec,       NONE), strDeps))
            ],
            strs'1
          )
        val files'3 =
          foldR insertThisNamespaceFile (
            [
              (recordSigFile, recordSigProgram), (sigFile, sigProgram),
              (recordStrFile, recordStrProgram), (strFile, strProgram)
            ],
            files'2
          )
        val modules'1 =
          (sigs'2, strs'2, numProps'0, numSigs'0, useAccessors'0)

        val cInterfaceDecls'1 =
          cInterfaceDecls'0
      in
        ((files'3, exts'1, modules'1, constants'0, functions'0, structDeps'0, cInterfaceDecls'1), excls'2)
      end
  | InfoType.UNION unionInfo         =>
      let
        val () = checkUnionInterfaceType repo vers unionInfo
        val () = checkInterfaceType repo vers unionInfo

        val (strFile, strSpecDec, strProgram, strIRefs, excls'1) =
          makeUnionStr repo vers namespace unionInfo excls'0

        val strDeps = map (mkStrFile o makeIRefInterfaceOtherStrId) strIRefs

        val (sigFile, sigProgram, sigIRefs, extIRefs, excls'2) =
          makeUnionSig repo vers namespace unionInfo excls'1

        val sigDeps = map (mkSigFile o toUCU o makeIRefInterfaceOtherStrId) sigIRefs

        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val (files'1, exts'1) =
          foldR (foldR (insertGlobalContainer namespace)) (
            [extIRefs],
            (files'0, exts'0)
          )
        val sigs'1 = sigs'0
        val (files'2, strs'1) =
          foldR (foldR insertLocalContainer) ([strIRefs], (files'1, strs'0))

        val sigs'2 =
          foldR insertSig (
            [(sigFile, (isSigPortable, sigDeps))],
            sigs'1
          )
        val strs'2 =
          foldR insertStr (
            [(strFile, ((isStrPortable, strSpecDec, NONE), strDeps))],
            strs'1
          )
        val files'3 =
          foldR insertThisNamespaceFile (
            [
              (sigFile, sigProgram),
              (strFile, strProgram)
            ],
            files'2
          )
        val modules'1 =
          (sigs'2, strs'2, numProps'0, numSigs'0, useAccessors'0)
      in
        ((files'3, exts'1, modules'1, constants'0, functions'0, structDeps'0, cInterfaceDecls'0), excls'2)
      end
  | InfoType.FLAGS enumInfo          =>
      let
        val () = checkInterfaceType repo vers enumInfo

        val (strFile, strSpecDec, strProgram, strIRefs, excls'1) =
          makeFlagsStr repo vers namespace enumInfo excls'0

        val strDeps = map (mkStrFile o makeIRefInterfaceOtherStrId) strIRefs

        val (sigFile, sigProgram, sigIRefs, extIRefs, excls'2) =
          makeFlagsSig repo vers namespace enumInfo excls'1

        val sigDeps = map (mkSigFile o toUCU o makeIRefInterfaceOtherStrId) sigIRefs

        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val (files'1, exts'1) =
          foldR (foldR (insertGlobalContainer namespace)) (
            [extIRefs],
            (files'0, exts'0)
          )
        val sigs'1 = sigs'0
        val (files'2, strs'1) =
          foldR (foldR insertLocalContainer) ([strIRefs], (files'1, strs'0))

        val sigs'2 =
          foldR insertSig (
            [(sigFile, (isSigPortable, sigDeps))],
            sigs'1
          )
        val strs'2 =
          foldR insertStr (
            [(strFile, ((isStrPortable, strSpecDec, NONE), strDeps))],
            strs'1
          )
        val files'3 =
          foldR insertThisNamespaceFile (
            [
              (sigFile, sigProgram),
              (strFile, strProgram)
            ],
            files'2
          )
        val useAccessors'1 =
          useAccessors'0 orelse isSome (RegisteredTypeInfo.getTypeInit enumInfo)
        val modules'1 =
          (sigs'2, strs'2, numProps'0, numSigs'0, useAccessors'1)
      in
        ((files'3, exts'1, modules'1, constants'0, functions'0, structDeps'0, cInterfaceDecls'0), excls'2)
      end
  | InfoType.ENUM enumInfo           =>
      let
        val () = checkInterfaceType repo vers enumInfo

        val (strFile, strSpecDec, strProgram, strIRefs, excls'1) =
          makeEnumStr repo vers namespace enumInfo excls'0

        val strDeps = map (mkStrFile o makeIRefInterfaceOtherStrId) strIRefs

        val (sigFile, sigProgram, sigIRefs, extIRefs, excls'2) =
          makeEnumSig repo vers namespace enumInfo excls'1

        val sigDeps = map (mkSigFile o toUCU o makeIRefInterfaceOtherStrId) sigIRefs

        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val (files'1, exts'1) =
          foldR (foldR (insertGlobalContainer namespace)) (
            [extIRefs],
            (files'0, exts'0)
          )
        val sigs'1 = sigs'0
        val (files'2, strs'1) =
          foldR (foldR insertLocalContainer) ([strIRefs], (files'1, strs'0))

        val sigs'2 =
          foldR insertSig (
            [(sigFile, (isSigPortable, sigDeps))],
            sigs'1
          )
        val strs'2 =
          foldR insertStr (
            [(strFile, ((isStrPortable, strSpecDec, NONE), strDeps))],
            strs'1
          )
        val files'3 =
          foldR insertThisNamespaceFile (
            [
              (sigFile, sigProgram),
              (strFile, strProgram)
            ],
            files'2
          )
        val useAccessors'1 =
          useAccessors'0 orelse isSome (RegisteredTypeInfo.getTypeInit enumInfo)
        val modules'1 =
          (sigs'2, strs'2, numProps'0, numSigs'0, useAccessors'1)
      in
        ((files'3, exts'1, modules'1, constants'0, functions'0, structDeps'0, cInterfaceDecls'0), excls'2)
      end
  | InfoType.CONSTANT constantInfo   =>
      let
        val (spec, ((_, extIRefs), excls'1)) =
          makeConstantSpec repo vers (constantInfo, (([], []), excls'0))

        val (strDec, ((strIRefs, structDeps'1), excls'2)) =
          makeConstantStrDec repo vers
            (constantInfo, (([], structDeps'0), excls'1))

        val (files'1, exts'1) =
          foldR (foldR (insertGlobalContainer namespace)) (
            [extIRefs],
            (files'0, exts'0)
          )

        val (files'2, strs'1) =
          foldR (foldR insertLocalContainer) ([strIRefs], (files'1, strs'0))

        val modules'1 =
          (sigs'0, strs'1, numProps'0, numSigs'0, useAccessors'0)

        val (specs'0, strDecs'0) = constants'0
        val constants'1 = (spec :: specs'0, strDec :: strDecs'0)
      in
        ((files'2, exts'1, modules'1, constants'1, functions'0, structDeps'1, cInterfaceDecls'0), excls'2)
      end
  | InfoType.FUNCTION functionInfo   =>
      let
        val (spec, ((_, extIRefs), excls'1)) =
          makeFunctionSpec repo vers NONE (functionInfo, (([], []), excls'0))

        val (strDecHighLevel, ((strIRefs, structDeps'1), excls'2)) =
          makeFunctionStrDecHighLevel repo vers NONE
            (functionInfo, (([], structDeps'0), excls'1))

        val (strDecLowLevelPolyML, excls'3) =
          makeFunctionStrDecLowLevelPolyML repo vers NONE
            (functionInfo, excls'2)

        val (strDecLowLevelMLton, excls'4) =
          makeFunctionStrDecLowLevelMLton repo vers NONE
            (functionInfo, excls'3)

        val (files'1, exts'1) =
          foldR (foldR (insertGlobalContainer namespace)) (
            [extIRefs],
            (files'0, exts'0)
          )

        val (files'2, strs'1) =
          foldR (foldR insertLocalContainer) ([strIRefs], (files'1, strs'0))

        val modules'1 =
          (sigs'0, strs'1, numProps'0, numSigs'0, useAccessors'0)

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
        ((files'2, exts'1, modules'1, constants'0, functions'1, structDeps'1, cInterfaceDecls'0), excls'4)
      end
  | _                                => acc


fun makeNamespaceElems repo vers namespace =
  let
    val files'0 = NamespaceFileMap.empty
    val exts'0 = NamespaceFileMap.empty
    val modules'0 = (FileMap.empty, FileMap.empty, 0, 0, false)
    val constants'0 = ([], [])
    val functions'0 = ([], [], [], [])
    val structDeps'0 = ListDict.empty
    val cInterfaceDecls'0 = []
    val excls'0 = []
  in
    revFoldInfosWithExcls
      (Repository.getNInfos repo vers)
      (Repository.getInfo repo vers)
      (makeInfo repo vers namespace)
      (
        namespace,
        ((files'0, exts'0, modules'0, constants'0, functions'0, structDeps'0, cInterfaceDecls'0), excls'0)
      )
  end
