(* --------------------------------------------------------------------------
 * Struct - record modules stubbed with empty file for now
 * -------------------------------------------------------------------------- *)

(* Record signature *)

local
in
  fun makeStructRecordSig
    (_               : 'a RepositoryClass.class)
    (structNamespace : string)
    (structInfo      : 'b StructInfoClass.class)
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
    (_               : 'a RepositoryClass.class)
    (structNamespace : string)
    (structInfo      : 'b StructInfoClass.class)
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
  (repo            : 'a RepositoryClass.class)
  (structNamespace : string)
  (structInfo      : 'b StructInfoClass.class)
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
     *     type t
     *
     *     type <varlist[1]> <local_name[1]>
     *
     *     ...
     *
     *     type <varlist[N]> <local_name[N]>
     *)
    val specs'3 = revMapAppend makeIRefLocalTypeSpec (rev sigIRefs, specs'2)

    val sig1 = mkSigSpec specs'3
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
  (repo            : 'a RepositoryClass.class)
  (vers            : Repository.typelibvers_t)
  (libId           : id)
  (structNamespace : string)
  (structInfo      : 'b StructInfoClass.class)
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
         * (interfaceref list * struct1 ListDict.t)
         * infoerrorhier list =
      ([], ([], ListDict.empty), errs'0)
    val acc'1 =
      addStructMethodStrDecsHighLevel repo structIRef (structInfo, acc'0)
    val acc'2 =
      case optGetTypeSymbol of
        SOME _ => addGetTypeFunctionStrDecHighLevel typeIRef acc'1
      | NONE   => acc'1
    val (strDecs'2, (iRefs'2, structDeps'2), errs'2) = acc'2

    val strIRefs =
      structIRef :: iRefs'2  (* `structIRef` for record structure dependence *)

    (*
     *     type t = <StructNamespace><StructName>Record.t
     * 
     *     type <varlist[1]> <local_name[1]> =
     *       <varlist[1]> <StructNamespace><TypeName[1]>.<t[1]>
     * 
     *     ...
     * 
     *     type <varlist[N]> <local_name[N]> =
     *       <varlist[N]> <StructNamespace><TypeName[N]>.<t[N]>
     *)
    val revLocalTypes = revMap makeIRefLocalType strIRefs
    val strDecs'3 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'2)

    fun mkModule isPolyML =
      let
        val (strDecs'4, _) =
          addStructMethodStrDecsLowLevel
            isPolyML
            repo
            libId
            addStructGetTypeFunctionStrDecLowLevel
            structIRef
            (structInfo, (strDecs'3, errs'2))

        val strDecs'5 =
          revMapAppend mkStructStrDec (ListDict.toList structDeps'2, strDecs'4)

        val struct1 = mkBodyStruct strDecs'5

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
