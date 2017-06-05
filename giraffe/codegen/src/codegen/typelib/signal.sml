(* --------------------------------------------------------------------------
 * Signal
 * -------------------------------------------------------------------------- *)

fun mkSignalNameId signalName =
  mkId (toLCC (String.map (fn #"-" => #"_" | c => c) signalName) ^ "Sig")


(* Specification *)

fun makeSignalSpec
  repo
  (containerIRef as {name = containerName, ...})
  (signalInfo, (iRefs, errs))
  : spec * (interfaceref list * infoerrorhier list) =
  let
    val () = checkDeprecated signalInfo

    val signalName = getName signalInfo
    val signalNameId = mkSignalNameId signalName
    val signalNamespace = BaseInfo.getNamespace signalInfo

    (* Ignore deprecated signals - is this needed?  Does above check suffice? *)
    (* requires glib >= 2.32
    val signalFlags = SignalInfo.getFlags signalInfo
    val () =
      if GSignalFlags.anySet (signalFlags, GSignalFlags.DEPRECATED)
      then
        infoError "deprecated"
      else
        ()
     *)

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo true repo signalNamespace (SOME containerName) signalInfo)
        (signalInfo, [])

    val retInfo =
      getRetInfo true repo signalNamespace (SOME containerName)
        signalInfo

    val parInfos = updateParInfos retInfo parInfos

    val tyVarIdx'0 = 0
    val (revInTys'1, tyVarIdx'1) = ([], tyVarIdx'0)
    val revOutTys'1 = []
    val iRefs'1 = iRefs

    (* Add types for the arguments and the return value. *)
    val (((revInTys'2, revOutTys'2), tyVarIdx'2), iRefs'2) =
      foldl
        (addSpecParInfo (makeRefBaseTy, makeRefVarTy))
        (((revInTys'1, revOutTys'1), tyVarIdx'1), iRefs'1)
        parInfos

    val optConstructorIRef = NONE
    val ((retValTy, tyVarIdx'3), iRefs'3) =
      addSpecRetInfo
        makeRefVarTy
        optConstructorIRef
        (retInfo, (tyVarIdx'2, iRefs'2))

    (* Handle case L = 0. *)
    val revInTys'3 =
      case revInTys'2 of
        []     => [unitTy]
      | _ :: _ => revInTys'2

    (* `revOutTys'2` contains out parameter types associated with
     * the caller-allocates flag for each out parameter. *)
    val retTy =
      case revOutTys'2 of
        []     => retValTy
      | _ :: _ =>
          let
            fun getTy (ty, _) = ty

            val outParamTys = revMap getTy revOutTys'2

            val retTys =
              case retInfo of
                RIVOID => outParamTys
              | _      => retValTy :: outParamTys
          in
            mkProdTy0 retTys  (* `length retTys > 0` so result not unit type *)
          end

    val functionTy = foldl TyFun retTy revInTys'3

    (*
     * <functionTy> -> <var> class Signal.signal
     *)
    val (containerTy, _) =
      makeIRefLocalTypeRef (makeRefVarTy false) (containerIRef, tyVarIdx'3)
    val signalTy = TyFun (TyParen functionTy, signalTy containerTy)
  in
    (mkValSpec (signalNameId, signalTy), (iRefs'3, errs))
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
 *     (<setFun[k]>, <outParamName[k]>)
 *
 *
 * `iRefs` accumulates the references to interfaces for generating type
 * declarations as required by the signature and the corresponding where
 * clauses on the signature ascription in the structure.
 *)

local
  fun mkFunScalar funExp ({ty, ...} : scalar_info) =
    ExpApp (funExp , mkIdLNameExp (scalarAccessorId ty))

  fun mkFunUtf8 funExp ({isOpt, ...} : utf8_info) =
    ExpApp (
      funExp,
      if isOpt
      then mkIdLNameExp "stringOpt"
      else mkIdLNameExp "string"
    )

  fun mkFunArray (funExp, arrayStrId) ({isOpt, ...} : array_info) =
    ExpApp (
      funExp,
      mkLIdLNameExp [arrayStrId, if isOpt then tOptId else tId]
    )

  fun mkFunInterface funExp ({iRef, isOpt, ...} : interface_info) =
    let
      val accId = if isOpt then tOptId else tId
      val accExp = mkLIdLNameExp (prefixInterfaceStrId iRef [accId])
    in
      ExpApp (funExp, accExp)
    end


  fun indexAppExp e n = ExpApp (e, ExpConst (ConstWord (n, NONE)))


  fun getFunScalar n = mkFunScalar (indexAppExp getExp n)

  fun getFunUtf8 n = mkFunUtf8 (indexAppExp getExp n)

  fun getFunArray (n, arrayStrId) = mkFunArray (indexAppExp getExp n, arrayStrId)

  fun getFunInterface n = mkFunInterface (indexAppExp getExp n)


  fun setFunScalar n = mkFunScalar (indexAppExp setExp n)

  fun setFunUtf8 n = mkFunUtf8 (indexAppExp setExp n)

  fun setFunArray (n, arrayStrId) = mkFunArray (indexAppExp setExp n, arrayStrId)

  fun setFunInterface n = mkFunInterface (indexAppExp setExp n)


  val retFunVoid = retVoidExp

  val retFunScalar = mkFunScalar retExp

  val retFunUtf8 = mkFunUtf8 retExp

  fun retFunArray arrayStrId = mkFunArray (retExp, arrayStrId)

  val retFunInterface = mkFunInterface retExp
in
  fun addParInfo (parInfo, acc as (n, js, ls, ks, iRefs, structDeps)) =
    case parInfo of
      PIVOID                          => acc
    | PISOME {name, dir, array, info} =>
        let
          val (inParamExp, getFun, setFun, structDeps'1) =
            case info of
              ISCALAR scalarParInfo       =>
                let
                  fun inParamExp () = mkIdLNameExp name
                  fun getFun n = getFunScalar n scalarParInfo
                  fun setFun n = setFunScalar n scalarParInfo
                in
                  (inParamExp, getFun, setFun, structDeps)
                end
            | IUTF8 utf8ParInfo           =>
                let
                  fun inParamExp () = mkIdLNameExp name
                  fun getFun n = getFunUtf8 n utf8ParInfo
                  fun setFun n = setFunUtf8 n utf8ParInfo
                in
                  (inParamExp, getFun, setFun, structDeps)
                end
            | IARRAY arrayParInfo         =>
                let
                  val {length, elem, ...} = arrayParInfo
                  val (arrayStrId, structDeps'1) =
                    cArrayStrIdStructDeps length elem structDeps
                  fun inParamExp () = mkArrayLenExp length (mkIdLNameExp name)

                  fun getFun n = getFunArray (n, arrayStrId) arrayParInfo
                  fun setFun n = setFunArray (n, arrayStrId) arrayParInfo
                in
                  (inParamExp, getFun, setFun, structDeps'1)
                end
            | IINTERFACE interfaceParInfo =>
                let
                  fun inParamExp () = mkIdLNameExp name
                  fun getFun n = getFunInterface n interfaceParInfo
                  fun setFun n = setFunInterface n interfaceParInfo
                in
                  (inParamExp, getFun, setFun, structDeps)
                end

          fun addJ js =
            case array of
              SOME _ => js
            | NONE   => inParamExp () :: js
          fun addL ls = (getFun n, name) :: ls
          fun addK ks = (setFun n, name) :: ks

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
      RIVOID        => (retFunVoid, iRefs, structDeps)
    | RISOME {info} =>
        let
          val (retFun, structDeps') =
            case info of
              ISCALAR scalarRetInfo    => (retFunScalar scalarRetInfo, structDeps)
            | IUTF8 utf8RetInfo        => (retFunUtf8 utf8RetInfo, structDeps)
            | IARRAY arrayRetInfo      =>
                let
                  val {length, elem, ...} = arrayRetInfo
                  val (arrayStrId, structDeps'1) =
                    cArrayStrIdStructDeps length elem structDeps
                in
                  (retFunArray arrayStrId arrayRetInfo, structDeps'1)
                end
            | IINTERFACE interfaceInfo => (retFunInterface interfaceInfo, structDeps)

          val iRefs' = addIRef (info, iRefs)
        in
          (retFun, iRefs', structDeps')
        end
end


fun makeSignalStrDec
  repo
  ({name = containerName, ...} : interfaceref)
  (signalInfo, ((iRefs, structs), errs))
  : strdec * ((interfaceref list * struct1 ListDict.t) * infoerrorhier list) =
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
        infoError "deprecated"
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
        (getParInfo true repo signalNamespace (SOME containerName) signalInfo)
        (signalInfo, [])

    val retInfo =
      getRetInfo true repo signalNamespace (SOME containerName)
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

    val (retFun, iRefs'3, structs'3) = addRetInfo (retInfo, iRefs'2, structs'2)


    val revInParamExps = revJs'2
    val (revGetFuns, revInParamNames) = ListPair.unzip revLs'2
    val (revSetFuns, revOutParamNames) = ListPair.unzip revKs'2

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
     *     fn inParamName[1] & ... & inParamName[L] =>
     *       let
     *         val <retPat> = f inParamExp[1] ... inParamExp[J]
     *       in
     *         outParamName[1] & ... & outParamName[K] & <retVal>
     *       end
     *   )
     *     if K > 0 and L > 0
     *
     *   (
     *     fn () =>
     *       let
     *         val <retPat> = f ()
     *       in
     *         outParamName[1] & ... & outParamName[K] & <retVal>
     *       end
     *   )
     *     if K > 0 and L = 0
     *
     *   (
     *     fn inParamName[1] & ... & inParamName[L] =>
     *       f inParamExp[1] ... inParamExp[J]
     *   )
     *     if K = 0 and L > 1
     *
     *   f
     *     if K = 0 and L <= 0
     *)
    val handlerExp =
      case (revOutParamNames, revInParamNames) of
        ([], [])      => fExp
      | ([], _ :: []) => fExp
      | _             => mkParenExp
          let
            (* Construct pattern
             *
             *   inParamName[1] & ... & inParamName[L]
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
             *   f inParamExp[1] ... inParamExp[J]
             *     if L > 0
             *
             *   f ()
             *     if L = 0
             *)
            fun mkParenAppExp e = case e of ExpApp _ => mkParenExp e | _ => e
            val inParamExps =
              case revMap mkParenAppExp revInParamExps of
                [] => [ExpConst ConstUnit]
              | es => es
            val funAppExp = foldl mkRevAppExp fExp inParamExps

            val funExp =
              case revMap mkIdVarPat revOutParamNames of
                []                      => funAppExp
              | op :: outParamNamePats1 =>
                  let
                    (* Construct pattern
                     *
                     *   (outParamName[1], ..., outParamName[K])
                     *     if tag is VOID
                     *
                     *   (retVal, outParamName[1], ..., outParamName[K])
                     *     otherwise
                     *)
                    val retPat =
                      case retInfo of
                        RIVOID => mkTuplePat1 outParamNamePats1
                      | _      => mkTuplePat2 (retValPat, outParamNamePats1)

                    val dec = DecVal (toList1 [([], false, retPat, funAppExp)])

                    (* Construct expression
                     *
                     *   outParamName[1] & ... & outParamName[K] & <retVal>
                     *)
                    val (_, retValExp) = retVal retInfo
                    val exp =
                      foldl mkAExp retValExp (map mkIdLNameExp revOutParamNames)
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
      ((iRefs'3, structs'3), errs)
    )
  end



(* --------------------------------------------------------------------------
 * Property
 * -------------------------------------------------------------------------- *)

val containerOrEverythingForProp =
  "ownership transfer CONTAINER or EVERYTHING for property not supported"


type scalar_info =
  {
    ty    : scalartype
  }

type utf8_info =
  {
    isOpt : bool
  }

type interface_info =
  {
    iRef     : interfaceref,
    infoType : InfoType.t,
    isOpt    : bool
  }

datatype mode =
  READONLY
| WRITEONLY
| READWRITE

datatype paraminfo =
  PISCALAR of mode * scalar_info
| PIUTF8 of mode * utf8_info
| PIINTERFACE of mode * interface_info


fun getParamInfo _ (containerIRef : interfaceref) propertyInfo =
  let
    val ownershipTransfer = PropertyInfo.getOwnershipTransfer propertyInfo

    val typeInfo = PropertyInfo.getType propertyInfo

    val paramFlags = PropertyInfo.getFlags propertyInfo
    val isReadable =
      GObjectParamFlags.anySet (paramFlags, GObjectParamFlags.READABLE);
    val isWritable =
      GObjectParamFlags.anySet (paramFlags, GObjectParamFlags.WRITABLE);

    val mode =
      case (isReadable, isWritable) of
        (true,  false) => READONLY
      | (false, true)  => WRITEONLY
      | (true,  true)  => READWRITE
      | (false, false) => infoError "property neither readable nor writable"

    fun notExpected s = infoError ("type " ^ s ^ " not expected")
    fun notSupported s = infoError ("type " ^ s ^ " not supported")
    fun noGType s =
      infoError ("type " ^ s ^ " not expected: no corresponding GType")

    fun resolveType () () typeInfo =
      let
        open TypeTag

        fun toScalarInfo ty =
          if
            TypeInfo.isPointer typeInfo
          then
            infoError (ptrForScalar scalarToString ty)
          else
            {
              ty = ty
            }
      in
        case TypeInfo.getTag typeInfo of
          ERROR        => notExpected "ERROR"
        | GTYPE        => notSupported "GTYPE"
        | ARRAY        => notSupported "ARRAY"
        | GLIST        => notSupported "GLIST"
        | GSLIST       => notSupported "GSLIST"
        | GHASH        => notSupported "GHASH"
        | VOID         => notExpected "VOID"
        | BOOLEAN      => PISCALAR (mode, toScalarInfo STBOOLEAN)
        | INT8         => noGType "INT8"
        | UINT8        => noGType "UINT8"
        | INT16        => noGType "INT16"
        | UINT16       => noGType "UINT16"
        | INT32        => PISCALAR (mode, toScalarInfo STINT32)
        | UINT32       => PISCALAR (mode, toScalarInfo STUINT32)
        | INT64        => PISCALAR (mode, toScalarInfo STINT64)
        | UINT64       => PISCALAR (mode, toScalarInfo STUINT64)
        | FLOAT        => PISCALAR (mode, toScalarInfo STFLOAT)
        | DOUBLE       => PISCALAR (mode, toScalarInfo STDOUBLE)
        | FILENAME     =>
            let
              val isOpt = true

              val () =
                case ownershipTransfer of
                  Transfer.NOTHING => ()
                | _                => infoError containerOrEverythingForProp

              val utf8Info = {
                isOpt = isOpt
              }
            in
              PIUTF8 (mode, utf8Info)
            end
        | UTF8         =>
            let
              val isOpt = true

              val () =
                case ownershipTransfer of
                  Transfer.NOTHING => ()
                | _                => infoError containerOrEverythingForProp

              val utf8Info = {
                isOpt = isOpt
              }
            in
              PIUTF8 (mode, utf8Info)
            end
        | UNICHAR      => PISCALAR (mode, toScalarInfo STUNICHAR)
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val interfaceTy = getIRefTy interfaceInfo

              val iRef =
                case () of
                  () =>
                    let
                      val {
                        name      = containerName,
                        namespace = containerNamespace,
                        ...
                      } = containerIRef

                      val interfaceName = getName interfaceInfo
                      val interfaceNamespace =
                        BaseInfo.getNamespace interfaceInfo
                      val interfaceScope =
                        if interfaceNamespace <> containerNamespace
                        then GLOBAL
                        else
                          if interfaceName = containerName
                          then LOCALINTERFACESELF
                          else LOCALINTERFACEOTHER
                    in
                      {
                        namespace = interfaceNamespace,
                        name      = interfaceName,
                        scope     = interfaceScope,
                        ty        = interfaceTy
                      }
                    end

              val infoType = InfoType.getType interfaceInfo
              open InfoType
            in
              case infoType of
                _ =>
                  let
                    (* There are no introspection annotation to determine
                     * whether a property is an optional value, though almost
                     * all (pointer) values can be null.
                     *)
                    val isOpt =
                      case infoType of
                        OBJECT _    => true
                      | INTERFACE _ => true
                      | STRUCT _    => true
                      | UNION _     => true
                      | _           => false

                    val () =
                      case ownershipTransfer of
                        Transfer.NOTHING => ()
                      | _                => infoError containerOrEverythingForProp

                    val interfaceInfo = {
                      iRef     = iRef,
                      infoType = infoType,
                      isOpt    = isOpt
                    }
                  in
                    PIINTERFACE (mode, interfaceInfo)
                  end
            end
      end
  in
    resolveType () () typeInfo
  end


fun mkPropertyNameId propertyName =
  mkId (toLCC (String.map (fn #"-" => #"_" | c => c) propertyName) ^ "Prop")


(* Specification *)

fun mkParamTy isOpt ((isReadType, interfaceTyRef), tyVarIdx) =
  let
    val (ty, tyVarIdx') =
      if isReadType
      then makeRefBaseTy false (interfaceTyRef, tyVarIdx)
      else makeRefVarTy false (interfaceTyRef, tyVarIdx)
  in
    (if isOpt then optionTy ty else ty, tyVarIdx')
  end

fun makePropertySpec
  repo
  (containerIRef as {namespace = containerNamespace, ...})
  (propertyInfo, (iRefs, errs))
  : spec * (interfaceref list * infoerrorhier list) =
  let
    val () = checkDeprecated propertyInfo

    val propertyName = getName propertyInfo
    val propertyNameId = mkPropertyNameId propertyName

    val isGObject = containerNamespace = "GObject"

    val paramInfo = getParamInfo repo containerIRef propertyInfo


    val tyVarIdx'0 = 0
    val (containerTy, tyVarIdx'1) =
      makeIRefLocalTypeRef (makeRefVarTy false) (containerIRef, tyVarIdx'0)

    fun mkTy mode isOpt (tyRef, tyVarIdx) =
      let
        val aux = foldmapl (mkParamTy isOpt)
        val ((tys, tyVarIdx'), mId) =
          case mode of
            READONLY  => (aux ([(true, tyRef)], tyVarIdx), "readonly")
          | WRITEONLY => (aux ([(false, tyRef)], tyVarIdx), "writeonly")
          | READWRITE => (
              aux ([(true, tyRef), (false, tyRef)], tyVarIdx),
              "readwrite"
            )
        val lid =
          if isGObject
          then toList1 [concat ["property_", mId]]
          else toList1 ["Property", mId]
      in
        (TyRef (containerTy :: tys, lid), tyVarIdx')
      end

    val ((propertyTy, _), iRefs'1) =
      case paramInfo of
        PISCALAR (mode, {ty})                  =>
          (mkTy mode false (scalarTyRef ty, tyVarIdx'1), iRefs)
      | PIUTF8 (mode, {isOpt})                 =>
          (mkTy mode isOpt (utf8TyRef, tyVarIdx'1), iRefs)
      | PIINTERFACE (mode, {iRef, isOpt, ...}) =>
          let
            val {scope, ...} = iRef
            val iRefs' =
              case scope of
                GLOBAL             => iRefs
              | LOCALINTERFACESELF => iRefs
              | _                  => insert (iRef, iRefs)

            val interfaceTyRef = (
              numInterfaceRefTyVars iRef,
              makeInterfaceRefTyLongId iRef
            )
          in
            (mkTy mode isOpt (interfaceTyRef, tyVarIdx'1), iRefs')
          end
  in
    (mkValSpec (propertyNameId, propertyTy), (iRefs'1, errs))
  end


(* Declaration *)

fun makePropertyStrDec
  repo
  (containerIRef : interfaceref)
  (propertyInfo, ((iRefs, structs), errs))
  : strdec * ((interfaceref list * struct1 ListDict.t) * infoerrorhier list) =
  let
    val () = checkDeprecated propertyInfo

    val propertyName = getName propertyInfo
    val propertyNameId = mkPropertyNameId propertyName

    val paramInfo = getParamInfo repo containerIRef propertyInfo

    val (mode, accExp, iRefs'1) =
      case paramInfo of
        PISCALAR (mode, {ty})                  =>
          (mode, mkIdLNameExp (scalarAccessorId ty), iRefs)
      | PIUTF8 (mode, {isOpt})                 =>
          let
            val accId = if isOpt then "stringOpt" else "string"
            val accExp = mkIdLNameExp accId
          in
            (mode, accExp, iRefs)
          end
      | PIINTERFACE (mode, {iRef, isOpt, ...}) =>
          let
            val {scope, ...} = iRef
            val iRefs' =
              case scope of
                GLOBAL             => iRefs
              | LOCALINTERFACESELF => iRefs
              | _                  => insert (iRef, iRefs)

            val accId = if isOpt then tOptId else tId
            val accExp = mkLIdLNameExp (prefixInterfaceStrId iRef [accId])
          in
            (mode, accExp, iRefs')
          end

    (*
     *   <id> = fn x => <id> "<property-name>" <accExp> x
     *)
    fun mkField propertyName accExp id =
      let
        val xId : id = "x"
        val propertyNameExp = ExpConst (ConstString propertyName)
        val pat = mkIdVarPat xId
        val exp =
          ExpApp (
            ExpApp (
              ExpApp (mkIdLNameExp id, propertyNameExp),
              accExp
            ),
            mkIdLNameExp xId
          )
      in
        (id : label, ExpFn (toList1 [(pat, exp)]))
      end

    val propertyExp =
      ExpRec (
        case mode of
          READONLY  => map (mkField propertyName accExp) [getId]
        | WRITEONLY => map (mkField propertyName accExp) [setId]
        | READWRITE => map (mkField propertyName accExp) [getId, setId]
      )
  in
    (
      StrDecDec (mkIdValDec (propertyNameId, propertyExp)),
      ((iRefs'1, structs), errs)
    )
  end
