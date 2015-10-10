(* --------------------------------------------------------------------------
 * Struct - record modules stubbed with empty file for now
 * -------------------------------------------------------------------------- *)

(* Record signature *)

local
in
  fun makeStructRecordSig
    (_               : 'a RepositoryClass.t)
    (structNamespace : string)
    (structInfo      : 'b StructInfoClass.t)
    : id * program * id list =
    let
      val () = checkDeprecated structInfo

      val structName = getName structInfo

      val structRecordStrId = mkRecordStrId structNamespace structName
      val structRecordSigId = toUCU structRecordStrId

      val program = []
      val sigDeps = []
    in
      (structRecordSigId, Portable program, sigDeps)
    end
end


(* Record structure *)

local
in
  fun makeStructRecordStr
    (_               : 'a RepositoryClass.t)
    (structNamespace : string)
    (structInfo      : 'b StructInfoClass.t)
    : id * (spec list * strdec list) * program * interfaceref list =
    let
      val () = checkDeprecated structInfo

      val structName = getName structInfo

      val structRecordStrId = mkRecordStrId structNamespace structName
      val structRecordSigId = toUCU structRecordStrId

      val structRecordStrNameId = mkRecordStrNameId structName

      val isGObject = structNamespace = "GObject"

      (* module *)
      val revAccessorLocalTypes = makeAccessorLocalTypes isGObject
      val programMLton = []
      val programPolyML = []

      (* namespace spec *)
      val structRecordSpec =
        let
          (* sig *)
          val sig1 = SigName structRecordSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revAccessorLocalTypes
          val qSig : qsig = (sig1, sigQual'1)
        in
          (* spec *)
          SpecStruct (toList1 [(structRecordStrNameId, qSig)])
        end
      val structRecordSpecs = [structRecordSpec]

      (* namespace strdec *)
      val structRecordStrDec =
        StrDecStruct (
          toList1 [
            (
              structRecordStrNameId,
              NONE,
              StructName (toList1 [structRecordStrId])
            )
          ]
        )
      val structRecordStrDecs = [structRecordStrDec]
    in
      (
        structRecordStrId,
        (structRecordSpecs, structRecordStrDecs),
        Specific {mlton = programMLton, polyml = programPolyML},
        []
      )
    end
end


(* Struct signature *)

fun addStructMethodSpecs repo structIRef =
  revFoldMapInfosWithErrs
    StructInfo.getNMethods
    StructInfo.getMethod
    (makeFunctionSpec repo (SOME structIRef))

fun makeStructSig
  (repo            : 'a RepositoryClass.t)
  (structNamespace : string)
  (structInfo      : 'a StructInfoClass.t)
  (errs'0          : infoerrorhier list)
  : id * program * id list * infoerrorhier list =
  let
    val () = checkDeprecated structInfo

    val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit structInfo

    val structName = getName structInfo
    val structIRef = {
      namespace = structNamespace,
      name      = structName,
      scope     = LOCALINTERFACESELF,
      ty        = RECORD
    }

    val structStrId = mkStrId structNamespace structName
    val structSigId = toUCU structStrId

    val typeIRef = makeTypeIRef structNamespace (SOME structName)

    val acc'0
      : spec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 = addStructMethodSpecs repo structIRef (structInfo, acc'0)
    val acc'2 =
      case optGetTypeSymbol of
        SOME _ => addGetTypeFunctionSpec typeIRef acc'1
      | NONE   => acc'1
    val (specs'2, iRefs'2, errs'2) = acc'2

    val sigIRefs =
      structIRef :: iRefs'2  (* `structIRef` for record structure dependence *)

    (*
     *     type t = record_t
     *)
    val specs'3 =
      let
        val (ty, _) = makeIRefLocalTypeRef makeRefBaseTy (structIRef, 0)
      in
        mkTypeSpec (([], tId), SOME ty) :: specs'2
      end

    (*
     *     type record_t
     *
     *     type <varlist[1]> <typename[1]>_t
     *
     *     ...
     *
     *     type <varlist[N]> <typename[N]>_t
     *)
    val specs'4 = revMapAppend makeIRefLocalTypeSpec (rev sigIRefs, specs'3)

    val sig1 = mkSigSpec specs'4
    val qSig : qsig = (sig1, [])
    val sigDec = toList1 [(structSigId, qSig)]
    val program = [ModuleDecSig sigDec]
    val sigDeps = []
  in
    (structSigId, Portable program, sigDeps, errs'2)
  end


(* Struct structure *)

fun addStructMethodStrDecsLowLevel
  isPolyML
  repo
  libId
  addInitStrDecs
  structIRef =
  addFunctionStrDecsLowLevel
    (StructInfo.getNMethods, StructInfo.getMethod)
    isPolyML
    repo
    libId
    addInitStrDecs
    (SOME (structIRef, structIRef))

fun addStructMethodStrDecsHighLevel repo structIRef =
  revFoldMapInfosWithErrs
    StructInfo.getNMethods
    StructInfo.getMethod
    (makeFunctionStrDecHighLevel repo (SOME (structIRef, structIRef)))

fun makeStructStr
  (repo            : 'a RepositoryClass.t)
  (vers            : Repository.typelibvers_t)
  (libId           : id)
  (structNamespace : string)
  (structInfo      : 'a StructInfoClass.t)
  (errs'0          : infoerrorhier list)
  : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
  let
    val () = checkDeprecated structInfo

    val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit structInfo

    val structName = getName structInfo
    val structIRef = {
      namespace = structNamespace,
      name      = structName,
      scope     = LOCALINTERFACESELF,
      ty        = RECORD
    }

    val structStrId = mkStrId structNamespace structName
    val structSigId = toUCU structStrId

    val structStrNameId = mkStrNameId structName

    val typeIRef = makeTypeIRef structNamespace (SOME structName)

    val addStructGetTypeFunctionStrDecLowLevel =
      case optGetTypeSymbol of
        SOME getTypeSymbol =>
          addGetTypeFunctionStrDecLowLevel
            repo
            vers
            libId
            structNamespace
            getTypeSymbol
      | NONE               => K I

    (* module *)
    val acc'0
      : strdec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 =
      addStructMethodStrDecsHighLevel repo structIRef (structInfo, acc'0)
    val acc'2 =
      case optGetTypeSymbol of
        SOME _ => addGetTypeFunctionStrDecHighLevel typeIRef acc'1
      | NONE   => acc'1
    val (strDecs'2, iRefs'2, errs'2) = acc'2

    val strIRefs =
      structIRef :: iRefs'2  (* `structIRef` for record structure dependence *)

    (*
     *     type t = record_t
     *)
    val strDecs'3 =
      let
        val (ty, _) = makeIRefLocalTypeRef makeRefBaseTy (structIRef, 0)
      in
        StrDecDec (mkTypeDec (([], tId), ty)) :: strDecs'2
      end

    (*
     *     type record_t = <StructNamespace><StructName>Record.t
     * 
     *     type <varlist[1]> <typename[1]>_t =
     *       <varlist[1]> <StructNamespace><TypeName[1]>.t
     * 
     *     ...
     * 
     *     type <varlist[N]> <typename[N]>_t =
     *       <varlist[N]> <StructNamespace><TypeName[N]>.t
     *)
    val revLocalTypes = revMap makeIRefLocalType strIRefs
    val strDecs'4 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'3)

    fun mkModule isPolyML =
      let
        val (strDecs, _) =
          addStructMethodStrDecsLowLevel
            isPolyML
            repo
            libId
            addStructGetTypeFunctionStrDecLowLevel
            structIRef
            (structInfo, (strDecs'4, errs'2))

        val struct1 = mkStructBody strDecs

        (* sig *)
        val sig1 = SigName structSigId
        val sigQual = revMap makeLocalTypeStrModuleQual revLocalTypes
        val qSig : qsig = (sig1, sigQual)

        (* strdec *)
        val structDec = toList1 [(structStrId, SOME (true, qSig), struct1)]
        val strDec = StrDecStruct structDec
      in
        [ModuleDecStr strDec]
      end

    val programMLton = mkModule false
    val programPolyML = mkModule true

    (* namespace spec *)
    val structSpec =
      let
        (* sig *)
        val sig1 = SigName structSigId
        val sigQual = revMap makeLocalTypeStrSpecQual revLocalTypes
        val qSig : qsig = (sig1, sigQual)
      in
        (* spec *)
        SpecStruct (toList1 [(structStrNameId, qSig)])
      end

    (* namespace strdec *)
    val structStrDec =
      StrDecStruct (
        toList1 [
          (structStrNameId, NONE, StructName (toList1 [structStrId]))
        ]
      )
  in
    (
      structStrId,
      ([structSpec], [structStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      strIRefs,
      errs'2
    )
  end
