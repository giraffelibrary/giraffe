(* --------------------------------------------------------------------------
 * Signal
 * -------------------------------------------------------------------------- *)

fun mkSignalNameId signalName =
  mkId (toLCC (String.map (fn #"-" => #"_" | c => c) signalName) ^ "Sig")


(* Specification *)

fun makeSignalSpec
  repo
  vers
  (containerIRef as {namespace = containerNamespace, name = containerName, ...})
  (signalInfo, (iRefs, excls))
  : spec * ((interfaceref list * interfaceref list) * info_excl_hier list) =
  let
    val () = checkDeprecated signalInfo

    val signalName = getName signalInfo
    val signalNameId = mkSignalNameId signalName
    val signalNamespace = BaseInfo.getNamespace signalInfo

    val isGObject = containerNamespace = "GObject"

    (* Ignore deprecated signals - is this needed?  Does above check suffice? *)
    (* requires glib >= 2.32
    val signalFlags = SignalInfo.getFlags signalInfo
    val () =
      if GSignalFlags.anySet (signalFlags, GSignalFlags.DEPRECATED)
      then
        infoExcl "deprecated"
      else
        ()
     *)

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo true repo vers signalNamespace (SOME containerName) signalInfo)
        (signalInfo, [])

    val retInfo =
      getRetInfo true repo vers signalNamespace (SOME containerName)
        signalInfo

    val parInfos = updateParInfos retInfo parInfos

    val tyVarIdx'0 = 0
    val revInParTyRefs'1 = []
    val revOutParTyRefs'1 = []
    val iRefs'1 = iRefs

    (* Add types for the arguments and the return value. *)
    val ((revInParTyRefs'2, revOutParTyRefs'2), iRefs'2) =
      foldl
        addSpecParInfo
        ((revInParTyRefs'1, revOutParTyRefs'1), iRefs'1)
        parInfos
    val inParTyRefs = rev revInParTyRefs'2
    val outParTyRefs = revMap #1 revOutParTyRefs'2

    val optConstructorIRef = NONE
    val (retValTyRef, iRefs'3) =
      addSpecRetInfo
        optConstructorIRef
        (retInfo, iRefs'2)

    (* Construct argument type with the form:
     *
     *   unit
     *     if L = 0
     *
     *   <inParamType[1](isRead)> * ... * <inParamType[L](isRead)>
     *     if L > 0
     *)
    fun mkArgTy isReadType tyVarIdx =
      let
        val (inParTys, tyVarIdx') =
          foldmapl (mkParamTy isReadType) (inParTyRefs, tyVarIdx)
        val argTy =
          case inParTys of
            []         => unitTy
          | op :: tys1 => mkProdTy1 tys1
      in
        (argTy, tyVarIdx')
      end

    (* Construct result type with the form:
     *
     *   unit
     *     if K = 0 and retInfo is RIVOID
     *
     *   <retValType(isRead)>
     *     if K = 0 and retInfo is not RIVOID
     *
     *   <outParamType[1](isRead)> * ... * <outParamType[K](isRead)>
     *     if K > 0 and retInfo is RIVOID
     *
     *   <retValType(isRead)>
     *    * <outParamType[1](isRead)> * ... * <outParamType[K](isRead)>
     *     if K > 0 and retInfo is not RIVOID
     *)
    fun mkResTy isReadType tyVarIdx =
      let
        val (outParTys, tyVarIdx'1) =
          foldmapl (mkParamTy isReadType) (outParTyRefs, tyVarIdx)
        val (retValTy, tyVarIdx'2) = mkParamTy isReadType (retValTyRef, tyVarIdx'1)
        val resTys =
          case retInfo of
            RIVOID => outParTys
          | _      => retValTy :: outParTys
        val resTy = mkProdTy0 resTys
      in
        (resTy, tyVarIdx'2)
      end

    (* Construct instance type with the form:
     *
     *   <var> class
     *)
    val (instTy, tyVarIdx'1) =
      makeIRefLocalTypeRef makeRefVarTy (containerIRef, tyVarIdx'0)

    (* Construct signal type with the form:
     *
     *   (
     *     <var> class,
     *     <argType(false)>,
     *     <argType(true)>,
     *     <resType(false)>,
     *     <resType(true)>
     *   )
     *     <Signal>
     *
     * where
     *
     *   <Signal> has the form:
     *
     *     signal_t
     *       if isGObject
     *
     *     Signal.t
     *       if not isGObject
     *)
    val (argWriteTy, tyVarIdx'2) = mkArgTy false tyVarIdx'1
    val (argReadTy,  tyVarIdx'3) = mkArgTy true  tyVarIdx'2
    val (resWriteTy, tyVarIdx'4) = mkResTy false tyVarIdx'3
    val (resReadTy,  _)          = mkResTy true  tyVarIdx'4
    val lid =
      if isGObject
      then toList1 [concat [signalId ^ "_" ^ tId]]
      else toList1 [toUCC signalId, tId]
    val signalTy =
      TyRef ([instTy, argWriteTy, argReadTy, resWriteTy, resReadTy], lid)
  in
    (mkValSpec (signalNameId, signalTy), (iRefs'3, excls))
  end


(* Declaration *)

(* `addParInfo` accumulates function components in the parameter
 *
 *   `(i, js, ls, ks, ns, iRefs, structDeps)`
 *
 * The lists `js`, `ls`, `ks` and `ns` accumulate the components of
 * the vectors of sizes J, L, K and N, respectively, in the codegen for
 * SignalDec.
 *
 * `js`, `ls`, `ks` and `ns` are built up in reverse.  After iterating
 * over all `parInfo` values, the final values are as follows:
 *
 *
 *   the j<th> element of `js` contains
 *
 *     (<inParamFun[j]>, (<inParamNameJ[j]>, <inParamExpJ[j]>))
 *
 *
 *   the l<th> element of `ls` contains
 *
 *     (<inParamNameL[l]>, <inParamExpL[l]>)
 *
 *
 *   the k<th> element of `ks` contains
 *
 *     (<outParamNameK[k]>, <outParamExpK[k]>)
 *
 *
 *   the n<th> element of `ns` contains
 *
 *     (<outParamFun[n]>, (<outParamNameN[n]>, <outParamExpN[n]>))
 *
 *
 * `iRefs` accumulates the references to interfaces for generating type
 * declarations as required by the signature and the corresponding where
 * clauses on the signature ascription in the structure.
 *)

local
  fun mkFunGType funExp ({iRef, ...} : gtype_info) =
    let
      val accId = tId
      val accExp = mkLIdLNameExp (prefixInterfaceStrId iRef [accId])
    in
      ExpApp (funExp, accExp)
    end

  fun mkFunScalar funExp ({ty, ...} : scalar_info) =
    ExpApp (funExp , mkIdLNameExp (scalarAccessorId ty))

  fun mkFunUtf8 funExp ({isOpt, ...} : utf8_info) =
    ExpApp (
      funExp,
      if isOpt
      then mkIdLNameExp "stringOpt"
      else mkIdLNameExp "string"
    )

  fun mkFunArray funExp ({iRef, isOpt, ...} : array_info) =
    let
      val accId = if isOpt then tOptId else tId
      val accExp = mkLIdLNameExp (prefixInterfaceStrId iRef [accId])
    in
      ExpApp (funExp, accExp)
    end

  fun mkFunInterface funExp ({iRef, isOpt, ...} : interface_info) =
    let
      val accId = if isOpt then tOptId else tId
      val accExp = mkLIdLNameExp (prefixInterfaceStrId iRef [accId])
    in
      ExpApp (funExp, accExp)
    end


  fun indexAppExp e i = ExpApp (e, mkIntConstExp i)


  fun inParamFunGType i = mkFunGType (indexAppExp parInIdExp i)

  fun inParamFunScalar i = mkFunScalar (indexAppExp parInIdExp i)

  fun inParamFunUtf8 i = mkFunUtf8 (indexAppExp parInIdExp i)

  fun inParamFunArray i = mkFunArray (indexAppExp parInIdExp i)

  fun inParamFunInterface i = mkFunInterface (indexAppExp parInIdExp i)


  fun outParamFunGType i = mkFunGType (indexAppExp parOutIdExp i)

  fun outParamFunScalar i = mkFunScalar (indexAppExp parOutIdExp i)

  fun outParamFunUtf8 i = mkFunUtf8 (indexAppExp parOutIdExp i)

  fun outParamFunArray i = mkFunArray (indexAppExp parOutIdExp i)

  fun outParamFunInterface i = mkFunInterface (indexAppExp parOutIdExp i)


  val retFunVoid = retVoidIdExp

  val retFunGType = mkFunGType retIdExp

  val retFunScalar = mkFunScalar retIdExp

  val retFunUtf8 = mkFunUtf8 retIdExp

  val retFunArray = mkFunArray retIdExp

  val retFunInterface = mkFunInterface retIdExp
in
  fun addParInfo (parInfo, acc as (i, js, ls, ks, ns, iRefs, structDeps)) =
    case parInfo of
      PIVOID                          => acc
    | PISOME {name, dir, array, info} =>
        let
          val (inParamFun, outParamFun, inParamExpJ, inParamExpL, outParamExpK, outParamExpN, structDeps'1) =
            case info of
              IGTYPE gtypeParInfo         =>
                let
                  fun inParamFun i = inParamFunGType i gtypeParInfo
                  fun outParamFun i = outParamFunGType i gtypeParInfo
                  fun inParamExpJ () = mkIdLNameExp name
                  fun inParamExpL () = mkIdLNameExp name
                  fun outParamExpK () = mkIdLNameExp name
                  fun outParamExpN () = mkIdLNameExp name
                in
                  (inParamFun, outParamFun, inParamExpJ, inParamExpL, outParamExpK, outParamExpN, structDeps)
                end
            | ISCALAR scalarParInfo       =>
                let
                  fun inParamFun i = inParamFunScalar i scalarParInfo
                  fun outParamFun i = outParamFunScalar i scalarParInfo
                  fun inParamExpJ () = mkIdLNameExp name
                  fun inParamExpL () = mkIdLNameExp name
                  fun outParamExpK () = mkIdLNameExp name
                  fun outParamExpN () = mkIdLNameExp name
                in
                  (inParamFun, outParamFun, inParamExpJ, inParamExpL, outParamExpK, outParamExpN, structDeps)
                end
            | IUTF8 utf8ParInfo           =>
                let
                  fun inParamFun i = inParamFunUtf8 i utf8ParInfo
                  fun outParamFun i = outParamFunUtf8 i utf8ParInfo
                  fun inParamExpJ () = mkIdLNameExp name
                  fun inParamExpL () = mkIdLNameExp name
                  fun outParamExpK () = mkIdLNameExp name
                  fun outParamExpN () = mkIdLNameExp name
                in
                  (inParamFun, outParamFun, inParamExpJ, inParamExpL, outParamExpK, outParamExpN, structDeps)
                end
            | IARRAY arrayParInfo         =>
                let
                  fun inParamFun i = inParamFunArray i arrayParInfo
                  fun outParamFun i = outParamFunArray i arrayParInfo

                  val {lengths, ...} = arrayParInfo
                  val length = hd1 lengths
                  fun inParamExpJ () = mkArrayLenFnExp length (mkIdLNameExp name)
                  fun inParamExpL () = mkArrayLenAppExp length (mkIdLNameExp name)
                  fun outParamExpK () = mkArrayLenAppExp length (mkIdLNameExp name)
                  fun outParamExpN () = mkArrayLenFnExp length (mkIdLNameExp name)
                in
                  (inParamFun, outParamFun, inParamExpJ, inParamExpL, outParamExpK, outParamExpN, structDeps)
                end
            | IINTERFACE interfaceParInfo =>
                let
                  fun inParamFun i = inParamFunInterface i interfaceParInfo
                  fun outParamFun i = outParamFunInterface i interfaceParInfo

                  val {iRef, infoType, isOpt, ...} = interfaceParInfo

                  fun inParamExpJ () =
                    let
                      val nameExp = mkIdLNameExp name

                      open InfoType
                    in
                      case infoType of
                        OBJECT _    => ExpApp (toBaseOptExp isOpt iRef, nameExp)
                      | INTERFACE _ => ExpApp (toBaseOptExp isOpt iRef, nameExp)
                      | UNION _     => ExpApp (toBaseOptExp isOpt iRef, nameExp)
                      | _           => nameExp
                    end
                  fun inParamExpL () = mkIdLNameExp name
                  fun outParamExpK () = mkIdLNameExp name
                  fun outParamExpN () =
                    let
                      val nameExp = mkIdLNameExp name

                      open InfoType
                    in
                      case infoType of
                        OBJECT _    => ExpApp (toBaseOptExp isOpt iRef, nameExp)
                      | INTERFACE _ => ExpApp (toBaseOptExp isOpt iRef, nameExp)
                      | UNION _     => ExpApp (toBaseOptExp isOpt iRef, nameExp)
                      | _           => nameExp
                    end
                in
                  (inParamFun, outParamFun, inParamExpJ, inParamExpL, outParamExpK, outParamExpN, structDeps)
                end

          val inParamNameJ = name
          val inParamNameL = name
          val outParamNameK = name
          val outParamNameN = name

          fun addJ js =
            let
              val inParamExpJ =
                case array of
                  SOME {
                    name = arrayName,
                    info = SOME arrayInfo
                  }    => (
                    case info of
                      ISCALAR {ty, ...} => mkLenParamExp ty arrayInfo arrayName
                    | _                 => infoExcl "non-scalar length parameter"
                  )
                | SOME {
                    info = NONE,
                    ...
                  }    => raise Fail "unused length parameter not expected for IN/INOUT parameter"
                | NONE => inParamExpJ ()
            in
              (inParamFun i, (inParamNameJ, inParamExpJ)) :: js
            end
          fun addL ls =
            case array of
              SOME _ => ls
            | NONE   => (inParamNameL, inParamExpL ()) :: ls
          fun addK ks =
            case array of
              SOME _ => ks
            | NONE   => (outParamNameK, outParamExpK ()) :: ks
          fun addN ns =
            let
              val outParamExpN =
                case array of
                  SOME {
                    name = arrayName,
                    info = SOME arrayInfo
                  }    => (
                    case info of
                      ISCALAR {ty, ...} => mkLenParamExp ty arrayInfo arrayName
                    | _                 => infoExcl "non-scalar length parameter"
                  )
                | SOME {
                    info = NONE,
                    ...
                  }    => raise Fail "unused length parameter not expected for IN/INOUT parameter"
                | NONE => outParamExpN ()
            in
              (outParamFun i, (outParamNameN, outParamExpN)) :: ns
            end

          val (js', ls', ks', ns') =
            case dir of
              IN    => (addJ js, addL ls, ks,      ns)
            | INOUT => (addJ js, addL ls, addK ks, addN ns)
            | OUT _ => (js,      ls,      addK ks, addN ns)

          val structDeps' = structDeps'1
          val i' = i + 1

          val iRefs' = addIRef (info, iRefs)
        in
          (i', js', ls', ks', ns', iRefs', structDeps')
        end

  fun addRetInfo (retInfo, iRefs, structDeps) =
    case retInfo of
      RIVOID        => (retFunVoid, unitPat, unitExp, NONE, iRefs, structDeps)
    | RISOME {info} =>
        let
          val (retFun, retValExp, retValExpK, structDeps') =
            case info of
              IGTYPE gtypeRetInfo         => (retFunGType gtypeRetInfo,   retValIdExp, retValIdExp, structDeps)
            | ISCALAR scalarRetInfo       => (retFunScalar scalarRetInfo, retValIdExp, retValIdExp, structDeps)
            | IUTF8 utf8RetInfo           => (retFunUtf8 utf8RetInfo,     retValIdExp, retValIdExp, structDeps)
            | IARRAY arrayRetInfo         =>
                let
                  val {lengths, ...} = arrayRetInfo
                  val length = hd1 lengths
                  val retValExpK = mkArrayLenAppExp length retValIdExp
                in
                  (retFunArray arrayRetInfo, retValIdExp, retValExpK, structDeps)
                end
            | IINTERFACE interfaceRetInfo =>
                let
                  val {iRef, infoType, isOpt, ...} = interfaceRetInfo
                  val retValExp =
                    let
                      open InfoType
                    in
                      case infoType of
                        OBJECT _    => ExpApp (toBaseOptExp isOpt iRef, retValIdExp)
                      | INTERFACE _ => ExpApp (toBaseOptExp isOpt iRef, retValIdExp)
                      | UNION _     => ExpApp (toBaseOptExp isOpt iRef, retValIdExp)
                      | _           => retValIdExp
                    end
                  val retValExpK = retValIdExp
                in
                  (retFunInterface interfaceRetInfo, retValExp, retValExpK, structDeps)
                end

          val iRefs' = addIRef (info, iRefs)
        in
          (retFun, retValIdPat, retValExp, SOME retValExpK, iRefs', structDeps')
        end
end


fun makeSignalStrDec
  repo
  vers
  (iRef as {name = containerName, ...} : interfaceref)
  (signalInfo, ((iRefs, structs), excls))
  : strdec * ((interfaceref list * struct1 ListDict.t) * info_excl_hier list) =
  let
    val () = checkDeprecated signalInfo

    val signalName = getName signalInfo
    val signalNameId = mkSignalNameId signalName
    val signalNamespace = BaseInfo.getNamespace signalInfo

    (* Ignore deprecated signals.  The above check does not appear to
     * suffice, for example, GtkButton::pressed.
     *)
    (* Requires glib >= 2.32, exclude for now.
    val signalFlags = SignalInfo.getFlags signalInfo
    val () =
      if GSignalFlags.anySet (signalFlags, GSignalFlags.DEPRECATED)
      then
        infoExcl "deprecated"
      else
        ()
     *)

    (* Construct parameter infos and return value info.  Note that the
     * instance of the interface that contains this signal is implicit.
     *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo true repo vers signalNamespace (SOME containerName) signalInfo)
        (signalInfo, [])

    val retInfo =
      getRetInfo true repo vers signalNamespace (SOME containerName)
        signalInfo

    val parInfos = updateParInfos retInfo parInfos

    val revJs'1 = []
    val revLs'1 = []
    val revKs'1 = []
    val revNs'1 = []
    val iRefs'1 = iRefs
    val structs'1 = structs

    (* Construct J, L and K vectors in forward pass over parameter infos.
     * As for a function spec, `iRefs` should be generated in a forwards
     * pass over the parameter infos so types appear in order of first
     * appearance. *)
    val (_, revJs'2, revLs'2, revKs'2, revNs'2, iRefs'2, structs'2) =
      foldl addParInfo
        (1, revJs'1, revLs'1, revKs'1, revNs'1, iRefs'1, structs'1)
        parInfos

    val (retFun, retValPat, retValExp, retValExpK, iRefs'3, structs'3) =
      addRetInfo (retInfo, iRefs'2, structs'2)

    val (revInParamFuns, revInParams) = ListPair.unzip revJs'2
    val (revInParamNameJs, revInParamExpJs) = ListPair.unzip revInParams

    val (revInParamNameLs, revInParamExpLs) = ListPair.unzip revLs'2

    val (revOutParamNameKs, revOutParamExpKs) = ListPair.unzip revKs'2

    val (revOutParamFuns, revOutParams) = ListPair.unzip revNs'2
    val (revOutParamNameNs, revOutParamExpNs) = ListPair.unzip revOutParams

    (* Construct result marshaller expression with the form:
     *
     *   <outParamFun[1]> &&& ... &&& <outParamFun[N]> &&& <retFun>
     *     if N > 0
     *
     *   <retFun>
     *     otherwise
     *)
    val resMarshallerExp = foldl mkAAAExp retFun revOutParamFuns

    (* Construct instance parameter marshaller expression with the form:
     *
     *   parInst <ContainerNamespace><ContainerName>Class.t
     *)
    val instParamFunExp =
      ExpApp (parInstIdExp, mkLIdLNameExp (prefixInterfaceStrId iRef [tId]))

    (* Construct argument marshaller expression with the form:
     *
     *   <instParamFunExp>
     *    &&&> <inParamFun[1]> &&&> ... &&&> <inParamFun[J]>
     *     if J > 0
     *
     *   parInst <ContainerNamespace><ContainerName>Class.t
     *     otherwise
     *)
    val argMarshallerExp =
      case revInParamFuns of
        []      => instParamFunExp
      | e :: es => mkAAARExp (instParamFunExp, foldl mkAAARExp e es)

    (* Construct marshaller expression with the form:
     *
     *   <argMarshallerExp> ---> <resMarshallerExp>
     *)
    val marshallerExp = mkDDDRExp (argMarshallerExp, resMarshallerExp)

    (* Construct marshaller declaration with the form:
     *
     *   val marshaller = <marshallerExp>
     *)
    val marshallerDec = mkIdValDec (marshallerId, marshallerExp)

    (* Construct conversion function for the instance parameter of the form:
     *
     *   <ContainerNamespace><ContainerName>Class.toBase
     *)
    val toContainerBaseExp = mkLIdLNameExp (prefixInterfaceStrId iRef [toBaseId])

    (* Construct conversion function for the instance parameter of the form:
     *
     *   GObjectObjectClass.toBase
     *)
    val objectIRef = makeObjectIRef signalNamespace (SOME containerName)
    val toObjectBaseExp = mkLIdLNameExp (prefixInterfaceStrId objectIRef [toBaseId])

    (* Construct conversion function for reading the arguments with the form:
     *
     *   fn self & <inParamNameJ[1]> & ... & <inParamNameJ[J]> =>
     *     GObjectObjectClass.toBase self & (<inParamExpL[1]>, ..., <inParamExpL[L]>)
     *     if J > 0
     *
     *   fn self => self & ()
     *     otherwise
     *)
    val argReadConvExp =
      let
        val funPat =
          case map mkIdVarPat revInParamNameJs of
            op :: revPats1 => mkAPat (mkIdVarPat selfId, foldl1 mkAPat revPats1)
          | []             => mkIdVarPat selfId

        val toBaseSelfExp = ExpApp (toObjectBaseExp, selfExp)
        val exps1 = getList1 (rev revInParamExpLs, unitExp)
        val funExp = mkAExp (toBaseSelfExp, mkTupleExp1 exps1)
      in
        ExpFn (toList1 [(funPat, funExp)])
      end

    (* Construct conversion function for writing the arguments with the form:
     *
     *   fn self & (<inParamNameL[1]>, ..., <inParamNameL[L]>) =>
     *     <ContainerNamespace><ContainerName>Class.toBase self & <inParamExpJ[1]> & ... & <inParamExpJ[J]>
     *     if J > 0
     *
     *   fn self & () => <ContainerNamespace><ContainerName>Class.toBase self
     *     otherwise
     *)
    val argWriteConvExp =
      let
        val pats1 = getList1 (revMap mkIdVarPat revInParamNameLs, unitPat)
        val funPat = mkAPat (mkIdVarPat selfId, mkTuplePat1 pats1)

        val toBaseSelfExp = ExpApp (toContainerBaseExp, selfExp)
        val funExp =
          case revInParamExpJs of
            op :: revExps1 => mkAExp (toBaseSelfExp, foldl1 mkAExp revExps1)
          | []             => toBaseSelfExp
      in
        ExpFn (toList1 [(funPat, funExp)])
      end

    (* Construct conversion function for reading the result with the form:
     *
     *   fn <outParamNameN[1]> & ... & <outParamNameN[N]> & <retValPat> => <resExp>
     *     if N > 0
     *
     *   fn <retValPat> => <resExp>
     *     otherwise
     *)
    val resReadConvExp =
      let
        val revPats1 = (retValPat, map mkIdVarPat revOutParamNameNs)
        val funPat = foldl1 mkAPat revPats1

        val resExp =
          case (retValExpK, revOutParamExpKs) of
            (SOME e, op :: es1) => mkTupleExp2 (e, es1)
          | (NONE,   op :: es1) => mkTupleExp1 es1
          | (SOME e, [])        => e
          | (NONE,   [])        => unitExp
        val funExp = resExp
      in
        ExpFn (toList1 [(funPat, funExp)])
      end

    (* Construct conversion function for writing the result with the form:
     *
     *   fn <resPat> => <outParamExpN[1]> & ... & <outParamExpN[N]> & <retValExp>
     *     if N > 0
     *
     *   fn <resPat> => <retValExp>
     *     otherwise
     *)
    val resWriteConvExp =
      let
        val resPat =
          case (retValExpK, map mkIdVarPat revOutParamNameKs) of
            (SOME _, op :: ps1) => mkTuplePat2 (retValIdPat, ps1)
          | (NONE,   op :: ps1) => mkTuplePat1 ps1
          | (SOME _, [])        => retValIdPat
          | (NONE,   [])        => unitPat
        val funPat = resPat

        val revExps1 = (retValExp, revOutParamExpNs)
        val funExp = foldl1 mkAExp revExps1
      in
        ExpFn (toList1 [(funPat, funExp)])
      end

    (* Construct signal marshaller with the form:
     *
     *   fn () =>
     *     map
     *       (
     *         <argReadConvExp>,
     *         <argWriteConvExp>,
     *         <resReadConvExp>,
     *         <resWriteConvExp>,
     *       )
     *       marshaller
     *)
    val mapMarshallerExp =
      foldl mkRevAppExp mapIdExp
        [
          ExpParen (
            toList1 [
              argReadConvExp,
              argWriteConvExp,
              resReadConvExp,
              resWriteConvExp
            ]
          ),
          marshallerIdExp
        ]
    val signalMarshallerExp = ExpFn (toList1 [(unitPat, mapMarshallerExp)])

    (* Construct signal declaration
     *
     *   val <signalName>Sig =
     *     {
     *       name = "<signal-name>",
     *       detail = "",
     *       marshaller = <signalMarshallerExp>
     *     }
     *)
    val signalDec =
      mkIdValDec (
        signalNameId,
        ExpRec
          [
            ("name",       mkStringConstExp signalName),
            ("detail",     mkStringConstExp ""),
            ("marshaller", signalMarshallerExp)
          ]
      )

    (* Construct overall signal structure declaration
     *
     *   local
     *     <marshallerDec>
     *   in
     *     <signalDec>
     *   end
     *)
    val signalStrDec =
      StrDecDec (
        DecLocal (
          mkDecs [marshallerDec],
          mkDecs [signalDec]
        )
      )
  in
    (
      signalStrDec,
      ((iRefs'3, structs'3), excls)
    )
  end
