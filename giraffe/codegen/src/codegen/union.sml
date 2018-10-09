(* --------------------------------------------------------------------------
 * Union - stubbed with empty file for now
 * -------------------------------------------------------------------------- *)

(* Union signature *)

fun makeUnionSig
  (_              : 'a RepositoryClass.class)
  (_              : Repository.typelibvers_t)
  (unionNamespace : string)
  (unionInfo      : 'b UnionInfoClass.class)
  (excls'0        : info_excl_hier list)
  : id * program * id list * info_excl_hier list =
  let
    val () = checkDeprecated unionInfo

    val unionName = getName unionInfo
(*
    val unionIRef = {
      namespace = unionNamespace,
      name      = unionName,
      scope     = LOCALINTERFACESELF,
      ty        = UNION
    }
 *)

    val unionStrId = mkStrId unionNamespace unionName
    val unionSigId = toUCU unionStrId

    (* module *)
    val program = []
    val sigDeps = []
  in
    (mkSigFile unionSigId, Portable program, sigDeps, excls'0)
  end


(* Union structure *)

fun makeUnionStr
  (_              : 'a RepositoryClass.class)
  (_              : Repository.typelibvers_t)
  (unionNamespace : string)
  (unionInfo      : 'b UnionInfoClass.class)
  (excls'0        : info_excl_hier list)
  : id * (spec list * strdec list) * program * interfaceref list * info_excl_hier list =
  let
    val () = checkDeprecated unionInfo

    val unionName = getName unionInfo
(*
    val unionIRef = {
      namespace = unionNamespace,
      name      = unionName,
      scope     = LOCALINTERFACESELF,
      ty        = UNION
    }
 *)

    val unionStrId = mkStrId unionNamespace unionName
    val unionSigId = toUCU unionStrId

    val unionStrNameId = mkStrNameId unionName

    (* module *)
    val revLocalTypes = []
    val programMLton = []
    val programPolyML = []

    (* namespace spec *)
    val unionSpec =
      let
        (* sig *)
        val sig1 = SigName unionSigId
        val sigQual = revMap makeLocalTypeStrSpecQual revLocalTypes
        val qSig : qsig = (sig1, sigQual)
      in
        (* spec *)
        SpecStruct (toList1 [(unionStrNameId, qSig)])
      end

    (* namespace strdec *)
    val unionStrDec =
      StrDecStruct (
        toList1 [
          (unionStrNameId, NONE, StructName (toList1 [unionStrId]))
        ]
      )
  in
    (
      mkStrFile unionStrId,
      ([unionSpec], [unionStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      [],
      excls'0
    )
  end
