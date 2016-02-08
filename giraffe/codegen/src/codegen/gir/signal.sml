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
        (getParInfo true repo signalNamespace (SOME containerName))
        (signalInfo, [])

    val retInfo =
      getRetInfo true repo signalNamespace (SOME containerName)
        signalInfo

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
     * <functionTy> -> <var> class_t Signal.signal
     *)
    val (containerTy, _) =
      makeIRefLocalTypeRef makeRefVarTy (containerIRef, tyVarIdx'3)
    val signalTy = TyFun (TyParen functionTy, signalTy containerTy)
  in
    (mkValSpec (signalNameId, signalTy), (iRefs'3, errs))
  end


(* Declaration *)

(* `addParInfo` accumulates function components in the parameter
 *
 *   `(ks, ls, iRefs)`
 *
 * The lists `ks` and `ls` accumulate the components of the vectors of
 * sizes K and L, respectively, in the CODEGEN for SignalDec.
 *
 * `ks` and `ls` are built up in reverse.  After iterating over all
 * `parInfo` values, the final values are as follows:
 *
 *
 *   the k<th> element of `ks` contains
 *
 *     (<setFun[k]>, <outParamName[k]>)
 *
 *
 *   the l<th> element of `ls` contains
 *
 *     (<getFun[l]>, <inParamName[l]>)
 *
 *
 * `iRefs` accumulates the references to interfaces for generating type
 * declarations as required by the signature and the corresponding where
 * clauses on the signature ascription in the structure.
 *)

local
  fun mkFunScalar funExp ({ty, ...} : scalarinfo) =
    ExpApp (funExp , mkIdLNameExp (scalarAccessorId ty))

  fun mkFunUtf8 funExp ({isOpt, ...} : utf8info) =
    ExpApp (
      funExp,
      if isOpt
      then mkIdLNameExp "stringOpt"
      else mkIdLNameExp "string"
    )

  fun mkFunInterface funExp ({iRef, isOpt, ...} : interfaceinfo) =
    let
      val accId = if isOpt then tOptId else tId
      val accExp = mkLIdLNameExp (prefixInterfaceStrId iRef [accId])
    in
      ExpApp (funExp, accExp)
    end


  fun indexAppExp e n = ExpApp (e, ExpConst (ConstWord (n, NONE)))


  fun getFunScalar n = mkFunScalar (indexAppExp getExp n)

  fun getFunUtf8 n = mkFunUtf8 (indexAppExp getExp n)

  fun getFunInterface n = mkFunInterface (indexAppExp getExp n)


  fun setFunScalar n = mkFunScalar (indexAppExp setExp n)

  fun setFunUtf8 n = mkFunUtf8 (indexAppExp setExp n)

  fun setFunInterface n = mkFunInterface (indexAppExp setExp n)


  val retFunVoid = retVoidExp

  val retFunScalar = mkFunScalar retExp

  val retFunUtf8 = mkFunUtf8 retExp

  val retFunInterface = mkFunInterface retExp


  fun parNameScalar ({name, ...} : scalarinfo) = name

  fun parNameUtf8 ({name, ...} : utf8info) = name

  fun parNameInterface ({name, ...} : interfaceinfo) = name
in
  fun addParInfo (parInfo, acc as (n, ks, ls, iRefs)) =
    case parInfo of
      PIVOID => acc
    | PISCALAR (dir, scalarParInfo) =>
        let
          val parName = parNameScalar scalarParInfo
          fun makeK n = (setFunScalar n scalarParInfo, parName)
          fun makeL n = (getFunScalar n scalarParInfo, parName)

          val (ks', ls') =
            case dir of
              OUT _ => (makeK n :: ks, ls)
            | INOUT => (makeK n :: ks, makeL n :: ls)
            | IN    => (ks,            makeL n :: ls)
        in
          (n + 1, ks', ls', iRefs)
        end
    | PIUTF8 (dir, utf8ParInfo) =>
        let
          val parName = parNameUtf8 utf8ParInfo
          fun makeK n = (setFunUtf8 n utf8ParInfo, parName)
          fun makeL n = (getFunUtf8 n utf8ParInfo, parName)
          val (ks', ls') =
            case dir of
              OUT _ => (makeK n :: ks, ls)
            | INOUT => (makeK n :: ks, makeL n :: ls)
            | IN    => (ks,            makeL n :: ls)
        in
          (n + 1, ks', ls', iRefs)
        end
    | PIINTERFACE (dir, interfaceParInfo as {iRef, ...}) =>
        let
          val parName = parNameInterface interfaceParInfo
          fun makeK n = (setFunInterface n interfaceParInfo, parName)
          fun makeL n = (getFunInterface n interfaceParInfo, parName)
          val (ks', ls') =
            case dir of
              OUT _ => (makeK n :: ks, ls)
            | INOUT => (makeK n :: ks, makeL n :: ls)
            | IN    => (ks,            makeL n :: ls)

          val {scope, ...} = iRef
          val iRefs' =
            case scope of
              GLOBAL             => iRefs
            | LOCALINTERFACESELF => iRefs
            | _                  => insert (iRef, iRefs)
        in
          (n + 1, ks', ls', iRefs')
        end

  fun addRetInfo (retInfo, iRefs) =
    case retInfo of
      RIVOID                    => (retFunVoid, iRefs)
    | RISCALAR scalarRetInfo    => (retFunScalar scalarRetInfo, iRefs)
    | RIUTF8 utf8RetInfo        => (retFunUtf8 utf8RetInfo, iRefs)
    | RIINTERFACE interfaceInfo =>
        let
          val {iRef, ...} = interfaceInfo
          val {scope, ...} = iRef
          val iRefs' =
            case scope of
              GLOBAL             => iRefs
            | LOCALINTERFACESELF => iRefs
            | _                  => insert (iRef, iRefs)
        in
          (retFunInterface interfaceInfo, iRefs')
        end
end


fun makeSignalStrDec
  repo
  ({name = containerName, ...} : interfaceref)
  (signalInfo, (iRefs, errs))
  : strdec * (interfaceref list * infoerrorhier list) =
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
        (getParInfo true repo signalNamespace (SOME containerName))
        (signalInfo, [])

    val retInfo =
      getRetInfo true repo signalNamespace (SOME containerName)
        signalInfo

    val revLs'1 = []
    val revKs'1 = []
    val iRefs'1 = iRefs

    (* Construct K and L vectors in forward pass over parameter infos.
     * As for a function spec, `iRefs` should be generated in a forwards
     * pass over the parameter infos so types appear in order of first
     * appearance. *)
    val (_, revKs'2, revLs'2, iRefs'2) =
      foldl addParInfo (1, revKs'1, revLs'1, iRefs'1) parInfos

    val (retFun, iRefs'3) = addRetInfo (retInfo, iRefs'2)


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
     *         val <retPat> = f inParamName[1] ... inParamName[L]
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
     *       f inParamName[1] ... inParamName[L]
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
             *   f inParamName[1] ... inParamName[L]
             *     if L > 0
             *
             *   f ()
             *     if L = 0
             *)
            val inParamNameExps =
              case revMap mkIdLNameExp revInParamNames of
                [] => [ExpConst ConstUnit]
              | es => es
            val funAppExp = foldl mkRevAppExp fExp inParamNameExps

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
      (iRefs'3, errs)
    )
  end



(* --------------------------------------------------------------------------
 * Property
 * -------------------------------------------------------------------------- *)

val containerOrEverythingForProp =
  "ownership transfer CONTAINER or EVERYTHING for property not supported"


type scalarinfo =
  {
    ty    : scalartype
  }

type utf8info =
  {
    isOpt : bool
  }

type interfaceinfo =
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
  PISCALAR of mode * scalarinfo
| PIUTF8 of mode * utf8info
| PIINTERFACE of mode * interfaceinfo


fun getParamInfo _ (containerIRef : interfaceref) propertyInfo =
  let
    val ownershipTransfer = PropertyInfo.getOwnershipTransfer propertyInfo

    val typeInfo = PropertyInfo.getType propertyInfo

    val isRef = false

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

    fun resolveType optIRef cxtPtrDepth typeInfo =
      let
        open TypeTag

        fun toScalarInfo ty =
          if
            TypeInfo.isPointer typeInfo cxtPtrDepth isRef
              handle
                Fail msg => infoError msg
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
        | CHAR         => PISCALAR (mode, toScalarInfo STCHAR)    (* GIR only *)
        | UCHAR        => PISCALAR (mode, toScalarInfo STUCHAR)   (* GIR only *)
        | INT          => PISCALAR (mode, toScalarInfo STINT)     (* GIR only *)
        | UINT         => PISCALAR (mode, toScalarInfo STUINT)    (* GIR only *)
        | SHORT        => PISCALAR (mode, toScalarInfo STSHORT)   (* GIR only *)
        | USHORT       => PISCALAR (mode, toScalarInfo STUSHORT)  (* GIR only *)
        | LONG         => PISCALAR (mode, toScalarInfo STLONG)    (* GIR only *)
        | ULONG        => PISCALAR (mode, toScalarInfo STULONG)   (* GIR only *)
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
        | SIZE         => PISCALAR (mode, toScalarInfo STSIZE)    (* GIR only *)
        | SSIZE        => PISCALAR (mode, toScalarInfo STSSIZE)   (* GIR only *)
        | OFFSET       => notSupported "OFFSET"                   (* GIR only *)
        | INTPTR       => notSupported "INTPTR"                   (* GIR only *)
        | UINTPTR      => notSupported "UINTPTR"                  (* GIR only *)
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
                case optIRef of
                  SOME iRef => updateIRefTy interfaceTy iRef
                | NONE      =>
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
                ALIAS aliasInfo
                  =>
                  resolveType
                    (SOME iRef)
                    (TypeInfo.addPtrDepth typeInfo cxtPtrDepth)
                    (AliasInfo.getType aliasInfo)
              | _ =>
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
    resolveType NONE NONE typeInfo
  end


fun mkPropertyNameId propertyName =
  mkId (toLCC (String.map (fn #"-" => #"_" | c => c) propertyName) ^ "Prop")


(* Specification *)

fun mkParamTy isOpt ((isReadType, interfaceTyRef), tyVarIdx) =
  let
    val (ty, tyVarIdx') =
      if isReadType
      then makeRefBaseTy (interfaceTyRef, tyVarIdx)
      else makeRefVarTy (interfaceTyRef, tyVarIdx)
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
      makeIRefLocalTypeRef makeRefVarTy (containerIRef, tyVarIdx'0)

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
  (propertyInfo, (iRefs, errs))
  : strdec * (interfaceref list * infoerrorhier list) =
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
      (iRefs'1, errs)
    )
  end
