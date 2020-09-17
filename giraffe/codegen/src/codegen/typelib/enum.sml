(* --------------------------------------------------------------------------
 * Enum
 * -------------------------------------------------------------------------- *)

val enumId : id = "enum"
val enumStrId : id = "Enum"
val enumStrLId : lid = toList1 [enumStrId]
val enumTyLName : tylname = ([], toList1 [enumId])
val enumTyName : tyname = ([], enumId)
val enumTy : ty = mkIdTy enumId
val gIntTy : ty = mkLIdTy [gStrId ^ scalarStrId STINT32, tId]
val valueExnId : id = "Value"

(* An enum can have more than one literal with the same value.  To ensure
 * that literals have unique values, only the first literal for each value is
 * used.  A map is provided to index literals by value.
 *)
structure LargeIntMap = ListMap(type key = LargeInt.int val eq = op =)

fun addValue (valueInfo, m) =
  LargeIntMap.insert #2
    ((ValueInfo.getValueInt valueInfo, valueInfo), m)

val emptyValues = LargeIntMap.empty


(*
 *     datatype enum =
 *       <VALUENAME[1]>
 *     | ...
 *     | <VALUENAME[V]>
 *)
fun mkEnumDatatypeDec (enumInfo : 'a EnumInfoClass.class) : datatypedec =
  let
    fun mkDatatypeClause valueInfo = (NameId (getValueNameId valueInfo), NONE)

    val revValues =
      foldInfos
        EnumInfo.getNValues
        EnumInfo.getValue
        addValue
        (enumInfo, emptyValues)
  in
    (
      toList1 [
        (
          ([], enumId),
          toList1 (
            revMap (mkDatatypeClause o #2) (LargeIntMap.toList revValues)
          ) handle
              Empty => infoExcl "no values"
        )
      ],
      NONE
    )
  end

val mkEnumDatatypeSpec : 'a EnumInfoClass.class -> datatypespec = mkEnumDatatypeDec


local
  val handlerName = ("GLib", "Error", "Record", "handler")
  val handlerTemplate = ([], handlerName)

  val handlerGlobalLId : lid = mkGlobalLId handlerName
  val handlerLocalId : id = mkLocalId "" handlerName
  val handlerLocalLId : lid = toList1 [handlerLocalId]
  val handlerSpec = toSpec "" handlerTemplate
  val handlerLocalType = toLocalType "" handlerTemplate

(*
  val tTy : ty = mkIdTy tId
*)
  val errorExnSpec = mkExnSpec (errorExnId, SOME tTy)
  val errorExnStrDec = StrDecDec (mkTyExnDec (NameId errorExnId, SOME tTy))
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
   *       GLibErrorRecord.makeHandler ("<errorDomain>", FFI.fromVal, Error)
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
                  mkLIdLNameExp [ffiStrId, fromValId],
                  mkIdLNameExp errorExnId
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
   *
   *     include ENUM where type t = enum
   *
   *)
  val enumInclSpec = SpecIncl (SigName (toUCU enumStrId), [toList1 [(tTyLName, mkIdTy enumId)]])

  val specs'0 = []
in
  fun makeEnumSig
    (repo          : 'a RepositoryClass.class)
    (vers          : Repository.typelibvers_t)
    (enumNamespace : string)
    (enumInfo      : 'b EnumInfoClass.class)
    (excls'0       : info_excl_hier list)
    : id * program * interfaceref list * interfaceref list * info_excl_hier list =
    let
      val () = checkDeprecated enumInfo

      val optErrorDomain = EnumInfo.getErrorDomain enumInfo
      val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit enumInfo

      val enumName = getName enumInfo
      val enumIRef = {
        namespace = enumNamespace,
        name      = enumName,
        scope     = LOCALINTERFACESELF,
        ty        = SIMPLE,
        container = NONE
      }

      val enumStrId = mkStrId enumNamespace enumName
      val enumSigId = toUCU enumStrId

      val typeIRef = makeTypeIRef enumNamespace (SOME enumName)

      val acc'0 = (specs'0, ([], []), excls'0)
      val acc'1 = addFlagsEnumMethodSpecs repo vers enumIRef (enumInfo, acc'0)
      val acc'2 = addOptGetTypeFunctionSpec optGetTypeSymbol typeIRef acc'1

      val (specs'2, (sigIRefs'2, extIRefs'2), excls'2) = acc'2
      val specs'3 = revMapAppend makeIRefLocalTypeSpec (sigIRefs'2, specs'2)
      val specs'4 =
        addAccessorSpecs enumNamespace enumInfo (tTy, tTy) false specs'3
      val specs'5 =
        case optErrorDomain of
          SOME _ => addErrorSpecs enumNamespace specs'4
        | NONE   => specs'4
      val specs'6 = enumInclSpec :: specs'5
      val specs'7 = SpecDatatype (mkEnumDatatypeSpec enumInfo) :: specs'6

      val sig1 = mkSigSpec specs'7
      val qSig : qsig = (sig1, [])
      val sigDec = toList1 [(enumSigId, qSig)]
      val program = [ModuleDecSig sigDec]
      val sigIRefs = []
    in
      (mkSigFile enumSigId, Portable program, sigIRefs, extIRefs'2, excls'2)
    end
end


(* Structure *)

local

  (*
   *     val null = <VALUENAME[1]>
   *)
  fun nullValDec enumInfo =
    if EnumInfo.getNValues enumInfo > 0
    then
      mkIdValDec (
        nullId,
        mkIdLNameExp (getValueNameId (EnumInfo.getValue enumInfo 0))
      )
    else infoExcl "no values"

  (*
   *           | <VALUENAME[i]> => <valueValue[i]>
   *)
  fun toValMatchClause (valueInfo : 'a ValueInfoClass.class) : pat * exp =
    (
      PatA (APatConst (mkIdLNameConst (getValueNameId valueInfo))),
      ExpConst (getEnumIntConst valueInfo)
    )

  (*
   *           | <valueValue[i]> => <VALUENAME[i]>
   *)
  fun fromValMatchClause (valueInfo : 'a ValueInfoClass.class) : pat * exp =
    (
      PatA (APatConst (getEnumIntConst valueInfo)),
      mkIdLNameExp (getValueNameId valueInfo)
    )

  (*
   *           fn
   *             <VALUENAME[1]> => <valueValue[1]>
   *           | ...
   *           | <VALUENAME[V]> => <valueValue[V]>
   *)
  fun toIntMatchExp enumInfo =
    let
      val revValues =
        foldInfos
          EnumInfo.getNValues
          EnumInfo.getValue
          addValue
          (enumInfo, emptyValues)
    in
      toList1 (
        revMap (toValMatchClause o #2) (LargeIntMap.toList revValues)
      ) handle
          Empty => infoExcl "no values"
    end

  (*
   *           fn
   *             <valueValue[1]> => <VALUENAME[1]>
   *           | ...
   *           | <valueValue[V]> => <VALUENAME[V]>
   *           | n               => raise Value n
   *)
  val nId : id = "n"
  val raiseValueNExp =
    ExpRaise (ExpApp (mkIdLNameExp valueExnId, mkIdLNameExp nId))
  fun fromIntMatchExp enumInfo =
    let
      val revValues =
        foldInfos
          EnumInfo.getNValues
          EnumInfo.getValue
          addValue
          (enumInfo, emptyValues)
    in
      toList1 (
        revMapAppend (fromValMatchClause o #2)
          (LargeIntMap.toList revValues, [(mkIdVarPat nId, raiseValueNExp)])
      ) handle
          Empty => infoExcl "no values"
    end

  (*
   *     structure Enum =
   *       Enum(
   *          <strDecs>
   *       )
   *)
  fun mkEnumStructStrDec strDecs : strdec =
    mkStructStrDec (enumStrId, StructInst (enumStrId, mkStrDecsFunArg strDecs))

  (*
   *     structure Enum =
   *       Enum(
   *         type enum = enum
   *         val null = <VALUENAME[1]>
   *
   *         val toInt =
   *           fn
   *             <VALUENAME[1]> => f <valueValue[1]>
   *           | ...
   *           | <VALUENAME[V]> => f <valueValue[V]>
   *
   *         exception Value of GInt.t
   *
   *         val fromInt =
   *           fn
   *             <valueValue[1]> => <VALUENAME[1]>
   *           | ...
   *           | <valueValue[V]> => <VALUENAME[V]>
   *           | n               => raise Value n
   *       )
   *)
  fun structEnumStrDec enumInfo =
    mkEnumStructStrDec [
      StrDecDec (mkTypeDec (enumTyName, enumTy)),
      StrDecDec (nullValDec enumInfo),
      StrDecDec (
        mkIdValDec (
          toIntId,
          ExpFn (toIntMatchExp enumInfo)
        )
      ),
      StrDecDec (mkTyExnDec (NameId valueExnId, SOME gIntTy)),
      StrDecDec (
        mkIdValDec (
          fromIntId,
          ExpFn (fromIntMatchExp enumInfo)
        )
      )
    ]

  (*
   *                                                 -.
   * exception <EnumNamespace><EnumName> = <EnumNamespace><EnumName>.Error
   *                                                  | when optErrorDomain
   *                                                 -' is SOME _
   *)
  fun exnModule strId : module =
    let
      val dec = mkEqExnDec (NameId strId, LNameId (toList1 [strId, errorExnId]))
    in
      ModuleDecStr (StrDecDec dec)
    end
in
  fun makeEnumStr
    (repo          : 'a RepositoryClass.class)
    (vers          : Repository.typelibvers_t)
    (enumNamespace : string)
    (enumInfo      : 'b EnumInfoClass.class)
    (excls'0       : info_excl_hier list)
    : id * (spec list * strdec list) * program * interfaceref list * info_excl_hier list =
    let
      val () = checkDeprecated enumInfo

      val optErrorDomain = EnumInfo.getErrorDomain enumInfo
      val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit enumInfo

      val enumName = getName enumInfo
      val enumIRef = {
        namespace = enumNamespace,
        name      = enumName,
        scope     = LOCALINTERFACESELF,
        ty        = SIMPLE,
        container = NONE
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
           * (interfaceref list * struct1 ListDict.t)
           * info_excl_hier list =
        ([], ([], ListDict.empty), excls'0)
      val acc'1 =
        addFlagsEnumMethodStrDecsHighLevel
          repo
          vers
          (enumInfo, enumIRef)
          (enumInfo, acc'0)
      val acc'2 = addOptGetTypeFunctionStrDecHighLevel optGetTypeSymbol typeIRef acc'1
      val (strDecs'2, (iRefs'2, structDeps'2), excls'2) = acc'2

      val revLocalTypes = revMap makeIRefLocalType iRefs'2
      val strDecs'3 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'2)

      val (addAccessorStrDecs, addAccessorIRefs, revAccessorLocalTypes) =
        addAccessorRootStrDecs (enumNamespace, enumName) (K "enum") enumInfo

      val iRefs'3 = addAccessorIRefs iRefs'2

      val (addErrorStrDecs, revErrorLocalTypes) =
        case optErrorDomain of
          SOME errorDomain => addErrorStrDecs enumNamespace errorDomain
        | NONE             => (Fn.id, [])

      fun mkModule isPolyML =
        let
          val (strDecs'4, _) =
            addFlagsEnumMethodStrDecsLowLevel
              isPolyML
              repo
              vers
              (K I)
              enumIRef
              (enumInfo, (strDecs'3, excls'2))

          val strDecs'5 = addErrorStrDecs strDecs'4
          val strDecs'6 = addAccessorStrDecs false isPolyML strDecs'5
          val strDecs'7 = StrDecDec (DecOpen (toList1 [enumStrLId])) :: strDecs'6
          val strDecs'8 = structEnumStrDec enumInfo :: strDecs'7
          val strDecs'9 =
            StrDecDec (DecDatatype (mkEnumDatatypeDec enumInfo)) :: strDecs'8
          val strDecs'10 =
            revMapAppend mkStructStrDec
              (ListDict.toList structDeps'2, strDecs'9)

          val struct1 = mkBodyStruct strDecs'10

          (* sig *)
          val sig1 = SigName enumSigId
          val sigQual'1 = revMap makeLocalTypeStrModuleQual revErrorLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrModuleQual (revLocalTypes, sigQual'1)
          val sigQual'3 =
            revMapAppend makeLocalTypeStrModuleQual
              (revAccessorLocalTypes, sigQual'2)
          val qSig : qsig = (sig1, sigQual'3)

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
        mkStructStrDec (enumStrNameId, StructName (toList1 [enumStrId]))
      val enumStrDecs'1 = [enumStrDec]
      val enumStrDecs'2 =
        case optErrorDomain of
          SOME _ =>
            let
              val strDec =
                StrDecDec (
                  mkEqExnDec
                    (NameId enumStrNameId, LNameId (toList1 [enumStrId]))
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
            SOME _ => errorIRef :: iRefs'3
          | NONE   => iRefs'3
        else
          iRefs'3
    in
      (
        mkStrFile enumStrId,
        (enumSpecs'2, enumStrDecs'2),
        Specific {mlton = programMLton, polyml = programPolyML},
        strIRefs,
        excls'2
      )
    end
end
