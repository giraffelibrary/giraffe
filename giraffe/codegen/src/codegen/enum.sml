(* --------------------------------------------------------------------------
 * Enum
 * -------------------------------------------------------------------------- *)

val EnumId : id = "Enum"
val enumValTy : ty = mkLIdTy [FFIId, EnumId, CId, valId]
val enumRefTy : ty = mkLIdTy [FFIId, EnumId, CId, refId]
val valueId : id = "Value"

(*
 *     datatype t =
 *       <VALUENAME[1]>
 *     | ...
 *     | <VALUENAME[V]>
 *)
fun mkEnumDatatypeDec (enumInfo : 'a EnumInfoClass.t) : datatypedec =
  let
    fun mkDatatypeClause valueInfo = (getValueNameId valueInfo, NONE)
  in
    (
      toList1 [
        (
          ([], tId),
          toList1 (
            revMapInfos
              EnumInfo.getNValues
              EnumInfo.getValue
              mkDatatypeClause
              (enumInfo, [])
          ) handle
              Empty => infoError "no values"
        )
      ],
      NONE
    )
  end

val mkEnumDatatypeSpec : 'a EnumInfoClass.t -> datatypespec = mkEnumDatatypeDec


local
  val handlerName = ("GLib", "ErrorRecord", "handler")
  val handlerTemplate = ([], handlerName)

  val handlerGlobalLId : lid = mkGlobalLId handlerName
  val handlerLocalId : id = mkLocalId handlerName
  val handlerLocalLId : lid = toList1 [handlerLocalId]
  val handlerSpec = toSpec handlerTemplate
  val handlerLocalType = toLocalType handlerTemplate

(*
  val tTy : ty = mkIdTy tId
*)
  val errorExnSpec = mkExnSpec (exnErrorId, SOME tTy)
  val errorExnStrDec = StrDecDec (mkTyExnDec (exnErrorId, SOME tTy))
  val handlerTyStrDec = makeLocalTypeStrDec handlerLocalType
in
  (*
   *                                                      -.
   *     exception Error of t                              |
   *                                     -.                |
   *     type error_handler               | isGLib         |
   *     val handler : error_handler      |                | optErrorDomain
   *                                     -'                |  is SOME _
   *                                     -.                |
   *     val handler : GLib.ErrorRecord.handler            |
   *                                      | not isGLib     |
   *                                     -'               -'
   *
   * Note that `addErrorSpecs` does not implement the outer condition
   * 'optErrorDomain is SOME _'.
   *)
  fun addErrorSpecs namespace specs =
    let
      val isGLib = namespace = "GLib"
      val handlerTys = []
    in
      errorExnSpec :: (
        if isGLib
        then
          handlerSpec
           :: mkValSpec (handlerId, TyRef (handlerTys, handlerLocalLId))
           :: specs
        else
          mkValSpec (handlerId, TyRef (handlerTys, handlerGlobalLId))
           :: specs
      )
    end

  (*
   *                                                 -.
   *     exception Error of t                         |
   *                                -.                | optErrorDomain is
   *                                 | isGLib         |  SOME errorDomain
   *     type error_handler = GLibErrorRecord.handler |
   *                                -'                |
   *     val handler =                                |
   *       GLibErrorRecord.makeHandler ("<errorDomain>", C.fromVal, Error)
   *                                                 -'
   *
   * Note that `addErrorStrDecs` does not implement the outer condition
   * 'optErrorDomain is SOME errorDomain'.
   *)
  fun addErrorStrDecs namespace errorDomain =
    let
      val errorIRef = makeErrorIRef namespace (SOME "")
      val isGLib = namespace = "GLib"

      val errorMakeHandlerExp =
        mkLIdLNameExp (prefixInterfaceStrId errorIRef [makeHandlerId])

      val handlerStrDec =
        StrDecDec (
          mkIdValDec (
            handlerId,
            ExpApp (
              errorMakeHandlerExp,
              ExpParen (
                toList1 [
                  ExpConst (ConstString errorDomain),
                  mkLIdLNameExp ["C", fromValId],
                  mkIdLNameExp exnErrorId
                ]
              )
            )
          )
        )

      fun addStrDecs strDecs =
        if isGLib
        then errorExnStrDec :: handlerTyStrDec :: handlerStrDec :: strDecs
        else errorExnStrDec :: handlerStrDec :: strDecs

      val revLocalTypes = if isGLib then [handlerLocalType] else []
    in
      (addStrDecs, revLocalTypes)
    end
end


(* Signature *)

local
  (*
   *                                                      -.
   *     val null : t                                      | optErrorDomain
   *                                                      -'  is NONE
   *)
  val nullSpec = mkValSpec (nullId, tTy)

  (*
   *     structure C :
   *       sig
   *         type val_
   *         type ref_
   *         val withVal : (val_ -> 'a) -> t -> 'a
   *         val withRefVal : (ref_ -> 'a) -> t -> (val_, 'a) pair
   *         val fromVal : val_ -> t
   *         exception Value of FFI.Enum.C.val_
   *       end
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
    mkValSpec (fromValId, TyFun (valTy, tTy)),
    mkExnSpec (valueId, SOME enumValTy)
  ]
  val structCSpec = mkCStructSpec structCSpecs

  val specs'0 = [structCSpec]
in
  fun makeEnumSig
    (repo          : 'a RepositoryClass.t)
    (enumNamespace : string)
    (enumInfo      : 'a EnumInfoClass.t)
    (errs'0        : infoerrorhier list)
    : id * program * id list * infoerrorhier list =
    let
      val () = checkDeprecated enumInfo

      val optErrorDomain = EnumInfo.getErrorDomain enumInfo
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

      val typeIRef = makeTypeIRef enumNamespace (SOME enumName)

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
      val specs'5 =
        case optErrorDomain of
          SOME _ => addErrorSpecs enumNamespace specs'4
        | NONE   => nullSpec :: specs'4
      val specs'6 = SpecDatatype (mkEnumDatatypeSpec enumInfo) :: specs'5

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
  val nId : id = "n"

  (*
   *           | <VALUENAME[i]> => f <valueValue[i]>
   *)
  fun withValMatchClause (valueInfo : 'a ValueInfoClass.t) : pat * exp =
    (
      PatA (APatConst (mkIdLNameConst (getValueNameId valueInfo))),
      ExpApp (mkIdLNameExp fId, ExpConst (getEnumIntConst valueInfo))
    )

  (*
   *           | <valueValue[i]> => <VALUENAME[i]>
   *)
  fun fromValMatchClause (valueInfo : 'a ValueInfoClass.t) : pat * exp =
    (
      PatA (APatConst (getEnumIntConst valueInfo)),
      mkIdLNameExp (getValueNameId valueInfo)
    )

  (*
   *           fn
   *             <VALUENAME[1]> => f <valueValue[1]>
   *           | ...
   *           | <VALUENAME[V]> => f <valueValue[V]>
   *)
  fun withValMatchExp enumInfo =
    toList1 (
      revMapInfos
        EnumInfo.getNValues
        EnumInfo.getValue
        withValMatchClause
        (enumInfo, [])
    ) handle
        Empty => infoError "no values"

  (*
   *           fn
   *             <valueValue[1]> => <VALUENAME[1]>
   *           | ...
   *           | <valueValue[V]> => <VALUENAME[V]>
   *           | n               => raise Value n
   *)
  val raiseValueNExp =
    ExpRaise (ExpApp (mkIdLNameExp valueId, mkIdLNameExp nId))
  fun fromValMatchExp enumInfo =
    toList1 (
      revMapInfos
        EnumInfo.getNValues
        EnumInfo.getValue
        fromValMatchClause
        (enumInfo, [(PatA (APatId nId), raiseValueNExp)])
    ) handle
        Empty => infoError "no values"

  (*
   *     structure C =
   *       struct
   *         type val_ = FFI.Enum.C.val_
   *         type ref_ = FFI.Enum.C.ref_
   *         exception Value of FFI.Enum.C.val_
   *
   *         fun withVal f =
   *           fn
   *             <VALUENAME[1]> => f <valueValue[1]>
   *           | ...
   *           | <VALUENAME[V]> => f <valueValue[V]>
   *
   *         fun withRefVal f = withVal (FFI.Enum.C.withRef f)
   *
   *         val fromVal =
   *           fn
   *             <valueValue[1]> => <VALUENAME[1]>
   *           | ...
   *           | <valueValue[V]> => <VALUENAME[V]>
   *           | n               => raise Value n
   *
   *       end
   *)
  fun structCStrDec enumInfo =
    mkCStructStrDec [
      StrDecDec (mkTypeDec (valTyName, enumValTy)),
      StrDecDec (mkTypeDec (refTyName, enumRefTy)),
      StrDecDec (mkTyExnDec (valueId, SOME enumValTy)),
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (withValId, toList1 [APatId fId]),
                NONE,
                ExpFn (withValMatchExp enumInfo)
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
                      mkLIdLNameExp [FFIId, EnumId, CId, "withRef"],
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
        mkIdValDec (
          fromValId,
          ExpFn (fromValMatchExp enumInfo)
        )
      )
    ]

  (*
   *     structure PolyML =                          -.
   *       struct                                     |
   *         val VAL = FFI.Enum.PolyML.VAL            | Poly/ML only
   *         val REF = FFI.Enum.PolyML.REF            |
   *       end                                       -'
   *)
  val structPolyMLStrDec =
    mkPolyMLStructStrDec [
      StrDecDec (
        mkIdValDec (
          VALId,
          mkLIdLNameExp [FFIId, EnumId, PolyMLId, VALId]
        )
      ),
      StrDecDec (
        mkIdValDec (
          REFId,
          mkLIdLNameExp [FFIId, EnumId, PolyMLId, REFId]
        )
      )
    ]

  (*
   *                                                 -.
   *     val null = <VALUENAME[1]>                    | optErrorDomain is NONE
   *                                                 -'
   *
   * Note that `nullStrDec` does not implement the outer condition
   * 'optErrorDomain is NONE'.
   *)
  fun nullStrDec enumInfo =
    if EnumInfo.getNValues enumInfo > 0
    then
      StrDecDec (
        mkIdValDec (
          nullId,
          mkIdLNameExp (getValueNameId (EnumInfo.getValue enumInfo 0))
        )
      )
    else infoError "no values"

  (*
   *                                                 -.
   * exception <EnumNamespace><EnumName> = <EnumNamespace><EnumName>.Error
   *                                                  | when optErrorDomain
   *                                                 -' is SOME _
   *)
  fun exnModule strId : module =
    let
      val dec = mkEqExnDec (strId, toList1 [strId, exnErrorId])
    in
      ModuleDecStr (StrDecDec dec)
    end
in
  fun makeEnumStr
    (repo          : 'a RepositoryClass.t)
    (vers          : Repository.typelibvers_t)
    (libId         : id)
    (enumNamespace : string)
    (enumInfo      : 'a EnumInfoClass.t)
    (errs'0        : infoerrorhier list)
    : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
    let
      val () = checkDeprecated enumInfo

      val optErrorDomain = EnumInfo.getErrorDomain enumInfo
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
      val errorIRef = makeErrorIRef enumNamespace (SOME enumName)
      val isGLib = enumNamespace = "GLib"

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

      fun addNullStrDec strDecs = nullStrDec enumInfo :: strDecs

      val (addErrorNullStrDecs, revErrorLocalTypes) =
        case optErrorDomain of
          SOME errorDomain => addErrorStrDecs enumNamespace errorDomain
        | NONE             => (addNullStrDec, [])

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

          val strDecs'5 = addErrorNullStrDecs strDecs'4
          val strDecs'6 = addAccessorStrDecs ("enum", false) isPolyML strDecs'5
          val strDecs'7 =
            if isPolyML
            then structPolyMLStrDec :: strDecs'6
            else strDecs'6
          val strDecs'8 = structCStrDec enumInfo :: strDecs'7
          val strDecs'9 =
            StrDecDec (DecDatatype (mkEnumDatatypeDec enumInfo)) :: strDecs'8
          val struct1 = mkStructBody strDecs'9

          (* sig *)
          val sig1 = SigName enumSigId
          val sigQual'1 = revMap makeLocalTypeStrModuleQual revErrorLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrModuleQual (revLocalTypes, sigQual'1)
          val sigQual'3 =
            revMapAppend makeLocalTypeStrModuleQual
              (revAccessorLocalTypes, sigQual'2)
          val qSig : qsig = (sig1, sigQual'3)

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
          ModuleDecStr strDec :: (
            case optErrorDomain of
              SOME _ => [exnModule enumStrId]
            | NONE   => []
          )
        end

      val programMLton = mkModule false
      val programPolyML = mkModule true

      (* namespace spec *)
      val enumSpec =
        let
          (* sig *)
          val sig1 = SigName enumSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revErrorLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrSpecQual (revLocalTypes, sigQual'1)
          val sigQual'3 =
            revMapAppend makeLocalTypeStrSpecQual
              (revAccessorLocalTypes, sigQual'2)
          val qSig : qsig = (sig1, sigQual'3)
        in
          (* spec *)
          SpecStruct (toList1 [(enumStrNameId, qSig)])
        end
      val enumSpecs'1 = [enumSpec]
      val enumSpecs'2 =
        case optErrorDomain of
          SOME _ =>
            let
              val spec =
                mkExnSpec (
                  enumStrNameId,
                  SOME (TyRef ([], toList1 [enumStrNameId, tId]))
                )
            in
              spec :: enumSpecs'1
            end
        | NONE   => enumSpecs'1

      (* namespace strdec *)
      val enumStrDec =
        StrDecStruct (
          toList1 [
            (enumStrNameId, NONE, StructName (toList1 [enumStrId]))
          ]
        )
      val enumStrDecs'1 = [enumStrDec]
      val enumStrDecs'2 =
        case optErrorDomain of
          SOME _ =>
            let
              val strDec =
                StrDecDec (
                  DecExn (
                    toList1 [
                      (enumStrNameId, ExnDecTypeEq (toList1 [enumStrId]))
                    ]
                  )
                )
            in
              strDec :: enumStrDecs'1
            end
        | NONE   => enumStrDecs'1

      (* Error ENUM in GLib requires GLib.ErrorRecord structure dependence *)
      val strIRefs =
        if isGLib
        then
          case optErrorDomain of
            SOME _ => errorIRef :: iRefs'2
          | NONE   => iRefs'2
        else
          iRefs'2
    in
      (
        enumStrId,
        (enumSpecs'2, enumStrDecs'2),
        Specific {mlton = programMLton, polyml = programPolyML},
        strIRefs,
        errs'2
      )
    end
end
