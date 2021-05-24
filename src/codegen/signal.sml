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
    val (revInParTyRefs'1, tyVarIdx'1) = ([], tyVarIdx'0)
    val revOutParTyRefs'1 = []
    val iRefs'1 = iRefs

    (* Add types for the arguments and the return value. *)
    val ((revInParTyRefs'2, revOutParTyRefs'2), iRefs'2) =
      foldl
        addSpecParInfo
        ((revInParTyRefs'1, revOutParTyRefs'1), iRefs'1)
        parInfos
    val (inTys'2, tyVarIdx'2) = foldmapl (mkParamTy true) (rev revInParTyRefs'2, tyVarIdx'1)
    val (outTys'2, tyVarIdx'3) =
      foldmapl (foldMapFst (mkParamTy false)) (rev revOutParTyRefs'2, tyVarIdx'2)

    val optConstructorIRef = NONE
    val (retValTyRef, iRefs'3) =
      addSpecRetInfo
        optConstructorIRef
        (retInfo, iRefs'2)
    val (retValTy, tyVarIdx'4) = mkParamTy false (retValTyRef, tyVarIdx'3)

    (* Construct function argument type with the form:
     *
     *   unit
     *     if L = 0
     *
     *   <inParamType[1]> * ... * <inParamType[L]>
     *     if L > 0
     *
     * where
     *
     *   [<inParamType[1]> * ... * <inParamType[L]>] = inTys'2
     *)
    val argTys =
      case inTys'2 of
        []         => [unitTy]
      | op :: tys1 => [mkProdTy1 tys1]

    (* `outTys'2` contains out parameter types associated with
     * the caller-allocates flag for each out parameter. *)
    val retTy =
      case outTys'2 of
        []     => retValTy
      | _ :: _ =>
          let
            fun getTy (ty, _) = ty

            val outParamTys = map getTy outTys'2

            val retTys =
              case retInfo of
                RIVOID => outParamTys
              | _      => retValTy :: outParamTys
          in
            mkProdTy0 retTys  (* `length retTys > 0` so result not unit type *)
          end

    val functionTy = foldr TyFun retTy argTys

    (*
     *   <functionTy> -> <var> class signal_t
     *     if isGObject
     *
     *   <functionTy> -> <var> class Signal.t
     *     if not isGObject
     *
     *)
    val (containerTy, _) =
      makeIRefLocalTypeRef makeRefVarTy (containerIRef, tyVarIdx'4)
    val lid =
      if isGObject
      then toList1 [concat [signalId ^ "_" ^ tId]]
      else toList1 [toUCC signalId, tId]
    val signalTy = TyFun (TyParen functionTy, TyRef ([containerTy], lid))
  in
    (mkValSpec (signalNameId, signalTy), (iRefs'3, excls))
  end


(* Declaration *)

(* `addParInfo` accumulates function components in the parameter
 *
 *   `(js, ls, ks, iRefs)`
 *
 * The lists `js`, `ls` and `ks` accumulate the components of the vectors of
 * sizes J, L and K, respectively, in the CODEGEN for SignalDec.
 *
 * `js`, `ls` and `ks` are built up in reverse.  After iterating over all
 * `parInfo` values, the final values are as follows:
 *
 *
 *   the j<th> element of `js` contains
 *
 *     <inParamExp[j]>
 *
 *
 *   the l<th> element of `ls` contains
 *
 *     (<getFun[l]>, <inParamName[l]>)
 *
 *
 *   the k<th> element of `ks` contains
 *
 *     (<setFun[k]>, (<outParamName[k]>, <outParamExp[k]>))
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


  fun indexAppExp e n = ExpApp (e, ExpConst (ConstWord (n, NONE)))


  fun getFunGType n = mkFunGType (indexAppExp getExp n)

  fun getFunScalar n = mkFunScalar (indexAppExp getExp n)

  fun getFunUtf8 n = mkFunUtf8 (indexAppExp getExp n)

  fun getFunArray n = mkFunArray (indexAppExp getExp n)

  fun getFunInterface n = mkFunInterface (indexAppExp getExp n)


  fun setFunGType n = mkFunGType (indexAppExp setExp n)

  fun setFunScalar n = mkFunScalar (indexAppExp setExp n)

  fun setFunUtf8 n = mkFunUtf8 (indexAppExp setExp n)

  fun setFunArray n = mkFunArray (indexAppExp setExp n)

  fun setFunInterface n = mkFunInterface (indexAppExp setExp n)


  val retFunVoid = retVoidExp

  val retFunGType = mkFunGType retExp

  val retFunScalar = mkFunScalar retExp

  val retFunUtf8 = mkFunUtf8 retExp

  val retFunArray = mkFunArray retExp

  val retFunInterface = mkFunInterface retExp
in
  fun addParInfo (parInfo, acc as (n, js, ls, ks, iRefs, structDeps)) =
    case parInfo of
      PIVOID                          => acc
    | PISOME {name, dir, array, info} =>
        let
          val (inParamExp, getFun, setFun, outParamExp, structDeps'1) =
            case info of
              IGTYPE gtypeParInfo         =>
                let
                  fun inParamExp () = mkIdLNameExp name
                  fun getFun n = getFunGType n gtypeParInfo
                  fun setFun n = setFunGType n gtypeParInfo
                  fun outParamExp () = mkIdLNameExp name
                in
                  (inParamExp, getFun, setFun, outParamExp, structDeps)
                end
            | ISCALAR scalarParInfo       =>
                let
                  fun inParamExp () = mkIdLNameExp name
                  fun getFun n = getFunScalar n scalarParInfo
                  fun setFun n = setFunScalar n scalarParInfo
                  fun outParamExp () = mkIdLNameExp name
                in
                  (inParamExp, getFun, setFun, outParamExp, structDeps)
                end
            | IUTF8 utf8ParInfo           =>
                let
                  fun inParamExp () = mkIdLNameExp name
                  fun getFun n = getFunUtf8 n utf8ParInfo
                  fun setFun n = setFunUtf8 n utf8ParInfo
                  fun outParamExp () = mkIdLNameExp name
                in
                  (inParamExp, getFun, setFun, outParamExp, structDeps)
                end
            | IARRAY arrayParInfo         =>
                let
                  val {lengths, ...} = arrayParInfo
                  val length = hd1 lengths
                  fun inParamExp () = mkArrayLenAppExp length (mkIdLNameExp name)

                  fun getFun n = getFunArray n arrayParInfo
                  fun setFun n = setFunArray n arrayParInfo
                  fun outParamExp () = mkIdLNameExp name
                in
                  (inParamExp, getFun, setFun, outParamExp, structDeps)
                end
            | IINTERFACE interfaceParInfo =>
                let
                  val {iRef, infoType, isOpt, ...} = interfaceParInfo

                  fun inParamExp () = mkIdLNameExp name
                  fun getFun n = getFunInterface n interfaceParInfo
                  fun setFun n = setFunInterface n interfaceParInfo
                  fun outParamExp () =
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
                  (inParamExp, getFun, setFun, outParamExp, structDeps)
                end

          fun addJ js =
            case array of
              SOME _ => js
            | NONE   => inParamExp () :: js
          fun addL ls = (getFun n, name) :: ls
          fun addK ks = (setFun n, (name, outParamExp ())) :: ks

          val (js', ls', ks') =
            case dir of
              OUT _ => (js,      ls,      addK ks)
            | INOUT => (addJ js, addL ls, addK ks)
            | IN    => (addJ js, addL ls, ks)

          val structDeps' = structDeps'1
          val n' = n + 1

          val iRefs' = addIRef (info, iRefs)
        in
          (n', js', ls', ks', iRefs', structDeps')
        end

  fun addRetInfo (retInfo, iRefs, structDeps) =
    case retInfo of
      RIVOID        => (retFunVoid, ExpConst ConstUnit, iRefs, structDeps)
    | RISOME {info} =>
        let
          val (retFun, retValExp, structDeps') =
            case info of
              IGTYPE gtypeRetInfo         => (retFunGType gtypeRetInfo,   retValExp, structDeps)
            | ISCALAR scalarRetInfo       => (retFunScalar scalarRetInfo, retValExp, structDeps)
            | IUTF8 utf8RetInfo           => (retFunUtf8 utf8RetInfo,     retValExp, structDeps)
            | IARRAY arrayRetInfo         => (retFunArray arrayRetInfo,   retValExp, structDeps)
            | IINTERFACE interfaceRetInfo =>
                let
                  val {iRef, infoType, isOpt, ...} = interfaceRetInfo
                  val retValExp =
                    let
                      open InfoType
                    in
                      case infoType of
                        OBJECT _    => ExpApp (toBaseOptExp isOpt iRef, retValExp)
                      | INTERFACE _ => ExpApp (toBaseOptExp isOpt iRef, retValExp)
                      | UNION _     => ExpApp (toBaseOptExp isOpt iRef, retValExp)
                      | _           => retValExp
                    end
                in
                  (retFunInterface interfaceRetInfo, retValExp, structDeps)
                end

          val iRefs' = addIRef (info, iRefs)
        in
          (retFun, retValExp, iRefs', structDeps')
        end
end


fun makeSignalStrDec
  repo
  vers
  ({name = containerName, ...} : interfaceref)
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
    val iRefs'1 = iRefs
    val structs'1 = structs

    (* Construct J, L and K vectors in forward pass over parameter infos.
     * As for a function spec, `iRefs` should be generated in a forwards
     * pass over the parameter infos so types appear in order of first
     * appearance. *)
    val (_, revJs'2, revLs'2, revKs'2, iRefs'2, structs'2) =
      foldl addParInfo (1, revJs'1, revLs'1, revKs'1, iRefs'1, structs'1) parInfos

    val (retFun, retValExp, iRefs'3, structs'3) = addRetInfo (retInfo, iRefs'2, structs'2)


    val revInParamExps = revJs'2
    val (revGetFuns, revInParamNames) = ListPair.unzip revLs'2
    val (revSetFuns, revOutParams) = ListPair.unzip revKs'2
    val (revOutParamNames, revOutParamExps) = ListPair.unzip revOutParams

    (* Construct
     *
     *   <setFun[1]> && ... && <setFun[K]> && <retFun>
     *)
    val setRetFunsExp = foldl mkAAExp retFun revSetFuns

    (*
     *   <getFun[1]> &&&> ... &&&> <getFun[L]>
     *     if L > 0
     *
     *   void
     *     if L = 0
     *)
    val revGetFuns1 = getList1 (revGetFuns, voidExp)
    val getFunsExp = foldl1 mkAAARExp revGetFuns1

    (*
     *   (<getFun[1]> &&&> ... &&&> <getFun[L]>
     *     ---> <setFun[1]> && ... && <setFun[K]> && <retFun>)
     *)
    val marshallerExp = mkParenExp (mkDDDRExp (getFunsExp, setRetFunsExp))

    (* Construct the handler body with the form:
     *
     *   (
     *     fn <inParamName[1]> & ... & <inParamName[L]> =>
     *       let
     *         val <retPat> = f (<inParamExp[1]>, ..., <inParamExp[J]>)
     *       in
     *         <outParamExp[1]> & ... & <outParamExp[K]> & <retValExp>
     *       end
     *   )
     *     if K > 0 and L > 0
     *
     *   (
     *     fn () =>
     *       let
     *         val <retPat> = f ()
     *       in
     *         <outParamExp[1]> & ... & <outParamExp[K]> & <retValExp>
     *       end
     *   )
     *     if K > 0 and L = 0
     *
     *   (
     *     fn <inParamName[1]> & ... & <inParamName[L]> =>
     *       let
     *         val <retPat> = f (<inParamExp[1]>, ..., <inParamExp[J]>)
     *       in
     *         <retValExp>
     *       end
     *       
     *   )
     *     if K = 0 and L > 0
     *
     *   (
     *     fn () =>
     *       let
     *         val <retPat> = f ()
     *       in
     *         <retValExp>
     *       end
     *       
     *   )
     *     if K = 0 and L = 0
     *)
    val handlerExp =
      mkParenExp
          let
            (* Construct pattern
             *
             *   <inParamName[1]> & ... & <inParamName[L]>
             *     if L > 0
             *
             *   ()
             *     if L = 0
             *)
            val revInParamNamePats1 =
              getList1 (map mkIdVarPat revInParamNames, mkConstPat ConstUnit)
            val funPat = foldl1 mkAPat revInParamNamePats1

            (* Construct expression
             *
             *   f (<inParamExp[1]>, ..., <inParamExp[J]>)
             *     if L > 0
             *
             *   f ()
             *     if L = 0
             *)
            fun mkParenAppExp e = case e of ExpApp _ => mkParenExp e | _ => e
            val argExp =
              case rev revInParamExps of
                []        => ExpConst ConstUnit
              | e :: []   => mkParenAppExp e
              | op :: es1 => mkTupleExp1 es1
            val funAppExp = ExpApp (fExp, argExp)

            val funExp =
              case revMap mkIdVarPat revOutParamNames of
                []                      =>
                  let
                    (* Construct pattern
                     *
                     *   ()
                     *     if tag is VOID
                     *
                     *   retVal
                     *     otherwise
                     *)
                    val retPat =
                      case retInfo of
                        RIVOID => PatA (APatConst ConstUnit)
                      | _      => retValPat

                    val dec = DecVal (toList1 [([], false, retPat, funAppExp)])
                  in
                    ExpLet (mkDecs [dec], toList1 [retValExp])
                  end
              | op :: outParamNamePats1 =>
                  let
                    (* Construct pattern
                     *
                     *   (<outParamName[1]>, ..., <outParamName[K]>)
                     *     if tag is VOID
                     *
                     *   (retVal, <outParamName[1]>, ..., <outParamName[K]>)
                     *     otherwise
                     *)
                    val retPat =
                      case retInfo of
                        RIVOID => mkTuplePat1 outParamNamePats1
                      | _      => mkTuplePat2 (retValPat, outParamNamePats1)

                    val dec = DecVal (toList1 [([], false, retPat, funAppExp)])

                    (* Construct expression
                     *
                     *   <outParamExp[1]> & ... & <outParamExp[K]> & <retValExp>
                     *)
                    val exp = foldl mkAExp retValExp revOutParamExps
                  in
                    ExpLet (mkDecs [dec], toList1 [exp])
                  end
          in
            ExpFn (toList1 [(funPat, funExp)])
          end

    val signalNameExp = ExpConst (ConstString signalName)
    val functionExp =
      foldl mkRevAppExp signalExp [signalNameExp, marshallerExp, handlerExp]
  in
    (
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (NameId signalNameId, toList1 [mkIdVarAPat fId]),
                NONE,
                functionExp
              )
            ]
          ]
        )
      ),
      ((iRefs'3, structs'3), excls)
    )
  end
