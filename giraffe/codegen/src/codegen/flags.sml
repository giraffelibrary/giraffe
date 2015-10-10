(* --------------------------------------------------------------------------
 * Flags
 * -------------------------------------------------------------------------- *)

val FlagsId = "Flags"
val allFlagsId = "allFlags"
val allFlagsExp = mkIdLNameExp allFlagsId

(*
 *     val <VALUENAME[i]> : t
 *)
fun makeFlagsValueNameSpec (valueInfo : 'a ValueInfoClass.t) : spec =
  mkValSpec (getValueNameId valueInfo, tTy)

(*
 *     val <VALUENAME[i]> = <valueValue[i]>
 *)
fun makeFlagsValueNameDec (valueInfo : 'a ValueInfoClass.t) : dec =
  mkIdValDec (
    getValueNameId valueInfo,
    ExpConst (getFlagsWordConst valueInfo)
  )

(*
 *     val <VALUENAME[1]> : t
 *     ...
 *     val <VALUENAME[V]> : t
 *     <specs>
 *)
fun addFlagsValueSpecs (enumInfo, specs) : spec list =
  revMapInfos
    EnumInfo.getNValues
    EnumInfo.getValue
    makeFlagsValueNameSpec
    (enumInfo, specs)

(*
 *     val <VALUENAME[1]> = <valueValue[1]>
 *     ...
 *     val <VALUENAME[V]> = <valueValue[V]>
 *     val allFlags = [
 *       <VALUENAME[1]>,
 *       ...,
 *       <VALUENAME[V]>
 *     ]
 *     <strDecs>
 *)
fun addFlagsValueStrDecs (enumInfo, strDecs) : strdec list =
  let
    val allFlagsStrDec =
      StrDecDec (
        mkIdValDec (allFlagsId, makeFlagsEnumValueNameListExp enumInfo)
      )
  in
    revMapInfos
      EnumInfo.getNValues
      EnumInfo.getValue
      (StrDecDec o makeFlagsValueNameDec)
      (enumInfo, allFlagsStrDec :: strDecs)
  end


(* Signature *)

local
  val flagsTyLName : tylname = ([], toList1 [flagsId])

  (*
   *     include BIT_FLAGS where type flags = t
   *)
  val tTypeSpec = SpecType (true, toList1 [(tTyName, NONE)])

  (*
   *     include BIT_FLAGS where type flags = t
   *)
  val bitFlagsInclSpec =
    SpecIncl (
      SigName (toUCU bitFlagsName),
      [toList1 [(flagsTyLName, tTy)]]
    )

  (*
   *     structure C :
   *       sig
   *         type val_
   *         type ref_
   *         val withVal : (val_ -> 'a) -> t -> 'a
   *         val withRefVal : (ref_ -> 'a) -> t -> (val_, 'a) pair
   *         val fromVal : val_ -> t
   *       endz
   *)
  val structCSpecs = [
    mkTypeSpec (valTyName, NONE),
    mkTypeSpec (refTyName, NONE),
    mkValSpec (
      withValId,
      TyFun (TyParen (TyFun (valTy, aVarTy)), TyFun (tTy, aVarTy))
    ),
    mkValSpec (
      withRefValId,
      TyFun (
        TyParen (TyFun (refTy, aVarTy)),
        TyFun (tTy, pairTy (valTy, aVarTy))
      )
    ),
    mkValSpec (fromValId, TyFun (valTy, tTy))
  ]
  val structCSpec = mkCStructSpec structCSpecs

  val specs'0 = [structCSpec]
in
  fun makeFlagsSig
    (repo        : 'a RepositoryClass.t)
    (enumNamespace : string)
    (enumInfo    : 'a EnumInfoClass.t)
    (errs'0      : infoerrorhier list)
    : id * program * id list * infoerrorhier list =
    let
      val () = checkDeprecated enumInfo

      val enumName = getName enumInfo
      val enumIRef = {
        namespace = enumNamespace,
        name      = enumName,
        scope     = LOCALINTERFACESELF,
        ty        = SIMPLE
      }

      val enumStrId = mkStrId enumNamespace enumName
      val enumSigId = toUCU enumStrId

      val typeIRef = makeTypeIRef enumNamespace (SOME enumName)
      val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit enumInfo

      val acc'0 = (specs'0, [], errs'0)
      val acc'1 = addFlagsEnumMethodSpecs repo enumIRef (enumInfo, acc'0)
      val acc'2 =
        case optGetTypeSymbol of
          SOME _ => addGetTypeFunctionSpec typeIRef acc'1
        | NONE   => acc'1

      val (specs'2, iRefs'2, errs'2) = acc'2
      val specs'3 = revMapAppend makeIRefLocalTypeSpec (iRefs'2, specs'2)
      val specs'4 =
        addAccessorSpecs enumNamespace enumInfo (tTy, tTy) false specs'3
      val specs'5 = addFlagsValueSpecs (enumInfo, specs'4)
      val specs'6 = tTypeSpec :: bitFlagsInclSpec :: specs'5

      val sig1 = mkSigSpec specs'6
      val qSig : qsig = (sig1, [])
      val sigDec = toList1 [(enumSigId, qSig)]
      val program = [ModuleDecSig sigDec]
      val sigDeps = []
    in
      (enumSigId, Portable program, sigDeps, errs'2)
    end
end


(* Structure *)

local
  val wId = "w"
  val bitFlagsIdUCC = toUCC bitFlagsName

  (*
   *     structure BitFlags = Word32BitFlags (val allFlags = allFlags)
   *)
  val structBitFlagsStrDec =
    StrDecStruct (
      toList1 [
        (
          bitFlagsIdUCC,
          NONE,
          StructInst (
            "Word32BitFlags",
            mkFunArgStrDec [
              StrDecDec (mkIdValDec (allFlagsId, allFlagsExp))
            ]
          )
        )
      ]
    )

  (*
   *     open BitFlags
   *)
  val openBitFlagsStrDec =
    StrDecDec (DecOpen (toList1 [toList1 [bitFlagsIdUCC]]))

  (*
   *     type t = flags
   *)
  val tTypeStrDec = StrDecDec (DecType (toList1 [(tTyName, flagsTy)]))

  (*
   *     structure PolyML =                          -.
   *       struct                                     |
   *         val VAL = FFI.Flags.PolyML.VAL           | Poly/ML only
   *         val REF = FFI.Flags.PolyML.REF           |
   *       end                                       -'
   *)
  val structPolyMLStrDec =
    mkPolyMLStructStrDec [
      StrDecDec (
        mkIdValDec (
          VALId,
          mkLIdLNameExp [FFIId, FlagsId, PolyMLId, VALId]
        )
      ),
      StrDecDec (
        mkIdValDec (
          REFId,
          mkLIdLNameExp [FFIId, FlagsId, PolyMLId, REFId]
        )
      )
    ]

  (*
   *     structure C =
   *       struct
   *         type val_ = FFI.Flags.C.val_
   *         type ref_ = FFI.Flags.C.ref_
   *         fun withVal f = f
   *         fun withRefVal f = withVal (FFI.Flags.C.withRef f)
   *         fun fromVal w = w
   *       end
   *)
  val structCStrDec =
    mkCStructStrDec [
      StrDecDec (mkTypeDec (valTyName, mkLIdTy [FFIId, FlagsId, CId, valId])),
      StrDecDec (mkTypeDec (refTyName, mkLIdTy [FFIId, FlagsId, CId, refId])),
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (withValId, toList1 [APatId fId]),
                NONE,
                mkIdLNameExp fId
              )
            ]
          ]
        )
      ),
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (withRefValId, toList1 [APatId fId]),
                NONE,
                ExpApp (
                  mkIdLNameExp withValId,
                  mkParenExp (
                    ExpApp (
                      mkLIdLNameExp [FFIId, FlagsId, CId, "withRef"],
                      mkIdLNameExp fId
                    )
                  )
                )
              )
            ]
          ]
        )
      ),
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (fromValId, toList1 [APatId wId]),
                NONE,
                mkIdLNameExp wId
              )
            ]
          ]
        )
      )
    ]
in
  fun makeFlagsStr
    (repo          : 'a RepositoryClass.t)
    (vers          : Repository.typelibvers_t)
    (libId         : id)
    (enumNamespace : string)
    (enumInfo      : 'a EnumInfoClass.t)
    (errs'0        : infoerrorhier list)
    : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
    let
      val () = checkDeprecated enumInfo

      val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit enumInfo

      val enumName = getName enumInfo
      val enumIRef = {
        namespace = enumNamespace,
        name      = enumName,
        scope     = LOCALINTERFACESELF,
        ty        = SIMPLE
      }

      val enumStrId = mkStrId enumNamespace enumName
      val enumSigId = toUCU enumStrId

      val enumStrNameId = mkStrNameId enumName

      val typeIRef = makeTypeIRef enumNamespace (SOME enumName)

      (* module *)
      val acc'0
        : strdec list
           * interfaceref list
           * infoerrorhier list =
        ([], [], errs'0)
      val acc'1 =
        addFlagsEnumMethodStrDecsHighLevel repo enumIRef (enumInfo, acc'0)
      val acc'2 =
        case optGetTypeSymbol of
          SOME _ => addGetTypeFunctionStrDecHighLevel typeIRef acc'1
        | NONE   => acc'1
      val (strDecs'2, iRefs'2, errs'2) = acc'2

      val revLocalTypes = revMap makeIRefLocalType iRefs'2
      val strDecs'3 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'2)

      val (addAccessorStrDecs, revAccessorLocalTypes) =
        addAccessorRootStrDecs repo vers libId enumNamespace enumInfo

      fun mkModule isPolyML =
        let
          val (strDecs'4, _) =
            addFlagsEnumMethodStrDecsLowLevel
              isPolyML
              repo
              libId
              (K I)
              enumIRef
              (enumInfo, (strDecs'3, errs'2))

          val strDecs'5 = addAccessorStrDecs ("flags", false) isPolyML strDecs'4

          val strDecs'6 =
            if isPolyML
            then structPolyMLStrDec :: strDecs'5
            else strDecs'5
          val strDecs'7 = structCStrDec :: strDecs'6
          val strDecs'8 =
            [structBitFlagsStrDec, openBitFlagsStrDec, tTypeStrDec]
             @ strDecs'7
          val strDecs'9 = addFlagsValueStrDecs (enumInfo, strDecs'8)
          val struct1 = mkStructBody strDecs'9

          (* sig *)
          val sig1 = SigName enumSigId
          val sigQual'1 = revMap makeLocalTypeStrModuleQual revLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrModuleQual
              (revAccessorLocalTypes, sigQual'1)
          val qSig : qsig = (sig1, sigQual'2)

          val sigSpecs'1 =
            if isPolyML
            then [structPolyMLSpec]
            else []
          val sigSpecs'2 = SpecIncl qSig :: sigSpecs'1
          val sig1 = mkSigSpec sigSpecs'2
          val qSig : qsig = (sig1, [])

          (* strdec *)
          val structDec = toList1 [(enumStrId, SOME (true, qSig), struct1)]
          val strDec = StrDecStruct structDec
        in
          [ModuleDecStr strDec]
        end

      val programMLton = mkModule false
      val programPolyML = mkModule true

      (* namespace spec *)
      val enumSpec =
        let
          (* sig *)
          val sig1 = SigName enumSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrSpecQual
              (revAccessorLocalTypes, sigQual'1)
          val qSig : qsig = (sig1, sigQual'2)
        in
          (* spec *)
          SpecStruct (toList1 [(enumStrNameId, qSig)])
        end
      val enumSpecs = [enumSpec]

      (* namespace strdec *)
      val enumStrDec =
        StrDecStruct (
          toList1 [
            (enumStrNameId, NONE, StructName (toList1 [enumStrId]))
          ]
        )
      val enumStrDecs = [enumStrDec]
    in
      (
        enumStrId,
        (enumSpecs, enumStrDecs),
        Specific {mlton = programMLton, polyml = programPolyML},
        iRefs'2,
        errs'2
      )
    end
end
