(* --------------------------------------------------------------------------
 * Flags
 * -------------------------------------------------------------------------- *)

val FlagsId = "Flags"
val allFlagsId = "allFlags"
val allFlagsExp = mkIdLNameExp allFlagsId

(*
 *     val <VALUENAME[i]> : t
 *)
fun makeFlagsValueNameSpec (valueInfo : 'a ValueInfoClass.class) : spec =
  mkValSpec (getValueNameId valueInfo, tTy)

(*
 *     val <VALUENAME[i]> = <valueValue[i]>
 *)
fun makeFlagsValueNameDec (valueInfo : 'a ValueInfoClass.class) : dec =
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
  (*
   *     include FLAGS
   *)
  val flagsInclSpec = SpecIncl (SigName (toUCU flagsStrId), [])

  val specs'0 = []
in
  fun makeFlagsSig
    (repo        : 'a RepositoryClass.class)
    (vers        : Repository.typelibvers_t)
    (enumNamespace : string)
    (enumInfo    : 'b EnumInfoClass.class)
    (excls'0     : info_excl_hier list)
    : id * program * interfaceref list * interfaceref list * info_excl_hier list =
    let
      val () = checkDeprecated enumInfo

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
        addAccessorSpecs enumInfo tTy false specs'3
      val specs'5 = addFlagsValueSpecs (enumInfo, specs'4)
      val specs'6 = flagsInclSpec :: specs'5

      val sig1 = mkSigSpec specs'6
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
   *     structure Flags = Flags(val allFlags = allFlags)
   *)
  val structFlagsStrDec =
    mkStructStrDec (
      flagsStrId,
      StructInst (
        flagsStrId,
        mkStrDecsFunArg [
          StrDecDec (mkIdValDec (allFlagsId, allFlagsExp))
        ]
      )
    )

  (*
   *     open Flags
   *)
  val openFlagsStrDec =
    StrDecDec (DecOpen (toList1 [toList1 [flagsStrId]]))
in
  fun makeFlagsStr
    (repo          : 'a RepositoryClass.class)
    (vers          : Repository.typelibvers_t)
    (enumNamespace : string)
    (enumInfo      : 'b EnumInfoClass.class)
    (excls'0       : info_excl_hier list)
    : id * (spec list * strdec list) * program * interfaceref list * info_excl_hier list =
    let
      val () = checkDeprecated enumInfo

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

      val (addGetTypeStrDecs, addAccessorStrDecs, addAccessorIRefs, revAccessorLocalTypes) =
        addAccessorRootStrDecs (enumNamespace, enumName) (K "flags") enumInfo

      val iRefs'3 = addAccessorIRefs iRefs'2

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

          val strDecs'5 = addAccessorStrDecs false isPolyML strDecs'4
          val strDecs'6 = strDecs'5
          val strDecs'7 = strDecs'6
          val strDecs'8 = [structFlagsStrDec, openFlagsStrDec] @ strDecs'7
          val strDecs'9 = addFlagsValueStrDecs (enumInfo, strDecs'8)
          val strDecs'10 =
            revMapAppend mkStructStrDec
              (ListDict.toList structDeps'2, strDecs'9)
          val strDecs'11 = addGetTypeStrDecs isPolyML strDecs'10

          val struct1 = mkBodyStruct strDecs'11

          (* sig *)
          val sig1 = SigName enumSigId
          val sigQual'1 = revMap makeLocalTypeStrModuleQual revLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrModuleQual
              (revAccessorLocalTypes, sigQual'1)
          val qSig : qsig = (sig1, sigQual'2)

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
        mkStructStrDec (enumStrNameId, StructName (toList1 [enumStrId]))
      val enumStrDecs = [enumStrDec]
    in
      (
        mkStrFile enumStrId,
        (enumSpecs, enumStrDecs),
        Specific {mlton = programMLton, polyml = programPolyML},
        iRefs'3,
        excls'2
      )
    end
end
