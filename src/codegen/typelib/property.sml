(* --------------------------------------------------------------------------
 * Property
 * -------------------------------------------------------------------------- *)

(*
 * `mkParamModeTy (paramReadTy, paramWriteTy) paramMode` returns
 *
 *   unit
 *     if paramMode is NONE
 *
 *   unit -> <paramReadTy>
 *     if paramMode is SOME true
 *
 *   <paramWriteTy> -> unit
 *     if paramMode is SOME false
 *)
fun mkParamModeTy (paramReadTy, paramWriteTy) =
  fn
    NONE       => unitTy
  | SOME true  => TyFun (unitTy, paramReadTy)
  | SOME false => TyFun (paramWriteTy, unitTy)

(*
 * `mkParamGtypeExp accExp` returns
 *
 *   fn () => C.gtype <accExp> ()
 *)
fun mkParamGtypeExp accExp =
  ExpFn (toList1 [
    (
      PatA (APatConst ConstUnit),
      ExpApp (ExpApp (cGtypeExp, accExp), ExpConst ConstUnit)
    )
  ])

(*
 * `mkParamModeExp accExp optToBaseExp paramMode` returns
 *
 *   ignore
 *     if paramMode is NONE
 *
 *   fn v => fn () => C.get <accExp> v
 *     if paramMode is SOME true
 *
 *   fn v => fn x => C.set <accExp> v <xBase>
 *     if paramMode is SOME false
 *
 * where
 *
 *   xBase is
 *
 *     x
 *       if optToBase is NONE
 *
 *     (<toBase> x)
 *       if optToBase is SOME toBase
 *)
fun mkParamModeExp accExp optToBaseExp =
  fn
    NONE        => mkIdLNameExp ignoreId
  | SOME isRead =>
      let
        val vId : id = "v"
        val xId : id = "x"
        val exp'1 =
          ExpApp (
            ExpApp (if isRead then cGetExp else cSetExp, accExp),
            mkIdLNameExp vId
          )
        val xExp = mkIdLNameExp xId
        val exp =
          if isRead
          then ExpFn (toList1 [(mkConstPat ConstUnit, exp'1)])
          else
            let
              val xBaseExp =
                case optToBaseExp of
                  SOME toBaseExp => mkParenExp (ExpApp (toBaseExp, xExp))
                | NONE           => xExp
            in
              ExpFn (toList1 [(mkIdVarPat xId, ExpApp (exp'1, xBaseExp))])
            end
      in
        ExpFn (toList1 [(mkIdVarPat vId, exp)])
      end

fun getParamModes propertyInfo =
  let
    val paramFlags = PropertyInfo.getFlags propertyInfo
    val isReadable =
      GObjectParamFlags.anySet (paramFlags, GObjectParamFlags.READABLE)
    val isWritable =
      GObjectParamFlags.anySet (paramFlags, GObjectParamFlags.WRITABLE)
    val isConstructOnly =
      GObjectParamFlags.anySet (paramFlags, GObjectParamFlags.CONSTRUCT_ONLY)
  in
    case (isReadable, isWritable, isConstructOnly) of
      (true,  true,  false) => {get = SOME true, set = SOME false, init = SOME false}
    | (true,  true,  true)  => {get = SOME true, set = NONE,       init = SOME false}
    | (true,  false, _)     => {get = SOME true, set = NONE,       init = NONE}
    | (false, true,  false) => {get = NONE,      set = SOME false, init = SOME false}
    | (false, true,  true)  => {get = NONE,      set = NONE,       init = SOME false}
    | (false, false, _)     => infoExcl "property neither readable nor writable"
  end


val containerOrEverythingForProp =
  "ownership transfer CONTAINER or EVERYTHING for property not supported"


type gtype_info =
  {
    iRef : interfaceref
  }

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

datatype param_info =
  PIGTYPE of gtype_info
| PISCALAR of scalar_info
| PIUTF8 of utf8_info
| PIINTERFACE of interface_info


fun getParamInfo repo vers (containerIRef : interfaceref) propertyInfo =
  let
    val ownershipTransfer = PropertyInfo.getOwnershipTransfer propertyInfo

    val typeInfo = PropertyInfo.getType propertyInfo

    fun notExpected s = infoExcl ("type " ^ s ^ " not expected")
    fun notSupported s = infoExcl ("type " ^ s ^ " not supported")
    fun noGType s =
      infoExcl ("type " ^ s ^ " not expected: no corresponding GType")

    fun resolveType () () typeInfo =
      let
        open TypeTag

        fun toScalarInfo ty =
          {
            ty = ty
          }
      in
        case TypeInfo.getTag typeInfo of
          ERROR        => notExpected "ERROR"
        | GTYPE        =>
            let
              val iRef =
                let
                  val {
                    name      = containerName,
                    namespace = containerNamespace,
                    ...
                  } = containerIRef
                in
                  makeTypeIRef containerNamespace (SOME containerName)
                end
              val gtypeInfo = {iRef = iRef}
            in
              PIGTYPE gtypeInfo
            end
        | ARRAY        => notSupported "ARRAY"
        | GLIST        => notSupported "GLIST"
        | GSLIST       => notSupported "GSLIST"
        | GHASH        => notSupported "GHASH"
        | VOID         => notExpected "VOID"
        | BOOLEAN      => PISCALAR (toScalarInfo STBOOLEAN)
        | INT8         => noGType "INT8"
        | UINT8        => noGType "UINT8"
        | INT16        => noGType "INT16"
        | UINT16       => noGType "UINT16"
        | INT32        => PISCALAR (toScalarInfo STINT32)
        | UINT32       => PISCALAR (toScalarInfo STUINT32)
        | INT64        => PISCALAR (toScalarInfo STINT64)
        | UINT64       => PISCALAR (toScalarInfo STUINT64)
        | FLOAT        => PISCALAR (toScalarInfo STFLOAT)
        | DOUBLE       => PISCALAR (toScalarInfo STDOUBLE)
        | FILENAME     =>
            let
              val isOpt = true

              val () =
                case ownershipTransfer of
                  Transfer.NOTHING => ()
                | _                => infoExcl containerOrEverythingForProp

              val utf8Info = {
                isOpt = isOpt
              }
            in
              PIUTF8 utf8Info
            end
        | UTF8         =>
            let
              val isOpt = true

              val () =
                case ownershipTransfer of
                  Transfer.NOTHING => ()
                | _                => infoExcl containerOrEverythingForProp

              val utf8Info = {
                isOpt = isOpt
              }
            in
              PIUTF8 utf8Info
            end
        | UNICHAR      => PISCALAR (toScalarInfo STUNICHAR)
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val () = checkInterfaceType repo vers interfaceInfo

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
                        ty        = interfaceTy,
                        container = NONE
                      }
                    end

              val infoType = InfoType.getType interfaceInfo
              open InfoType
            in
              case infoType of
                _ =>
                  let
                    (* `getStructType` must be called unconditionally for a
                     * struct to ensure that a property whose type is an
                     * unsupported struct is excluded. *)
                    val () =
                      case infoType of
                        STRUCT structInfo => ignore (getStructType repo vers structInfo)
                      | UNION unionInfo   => checkUnionInterfaceType repo vers unionInfo
                      | _                 => ()

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
                      | _                => infoExcl containerOrEverythingForProp

                    val interfaceInfo = {
                      iRef     = iRef,
                      infoType = infoType,
                      isOpt    = isOpt
                    }
                  in
                    PIINTERFACE interfaceInfo
                  end
            end
      end
  in
    resolveType () () typeInfo
  end


fun mkPropertyNameId propertyName =
  mkId (toLCC (String.map (fn #"-" => #"_" | c => c) propertyName) ^ "Prop")


(* Specification *)

fun makePropertySpec
  repo
  vers
  (containerIRef as {namespace = containerNamespace, ...})
  (propertyInfo, (iRefs, excls))
  : spec * ((interfaceref list * interfaceref list) * info_excl_hier list) =
  let
    val () = checkDeprecated propertyInfo

    val propertyName = getName propertyInfo
    val propertyNameId = mkPropertyNameId propertyName

    val isGObject = containerNamespace = "GObject"

    val paramModes = getParamModes propertyInfo
    val paramInfo = getParamInfo repo vers containerIRef propertyInfo

    val tyVarIdx'0 = 0
    val (containerTy, tyVarIdx'1) =
      makeIRefLocalTypeRef makeRefVarTy (containerIRef, tyVarIdx'0)

    val (paramTyRef, iRefs'1) =
      case paramInfo of
        PIGTYPE {iRef}                 => mkIRefTyRef iRef false iRefs
      | PISCALAR {ty}                  => mkTyRef (scalarTyRef ty) false iRefs
      | PIUTF8 {isOpt}                 => mkTyRef utf8TyRef isOpt iRefs
      | PIINTERFACE {iRef, isOpt, ...} => mkIRefTyRef iRef isOpt iRefs

    val (paramReadTy, tyVarIdx'2) = mkParamTy true (paramTyRef, tyVarIdx'1)
    val (paramWriteTy, _) = mkParamTy false (paramTyRef, tyVarIdx'2)

    val tys =
      map (mkParamModeTy (paramReadTy, paramWriteTy)) [
        #get  paramModes,
        #set  paramModes,
        #init paramModes
      ]

    val propertyTypeLId =
      if isGObject
      then toList1 [concat [propertyId, "_", tId]]
      else toList1 [toUCC propertyId, tId]

    val propertyTy = TyRef (containerTy :: tys, propertyTypeLId)
  in
    (mkValSpec (propertyNameId, propertyTy), (iRefs'1, excls))
  end


(* Declaration *)

fun makePropertyStrDec
  repo
  vers
  (containerIRef : interfaceref)
  (propertyInfo, ((iRefs, structs), excls))
  : strdec * ((interfaceref list * struct1 ListDict.t) * info_excl_hier list) =
  let
    val () = checkDeprecated propertyInfo

    val propertyName = getName propertyInfo
    val propertyNameId = mkPropertyNameId propertyName

    val paramModes = getParamModes propertyInfo
    val paramInfo = getParamInfo repo vers containerIRef propertyInfo

    val (accExp, optToBase, iRefs'1) =
      case paramInfo of
        PIGTYPE {iRef}                           =>
          let
            val {scope, ...} = iRef
            val iRefs' =
              case scope of
                GLOBAL             => iRefs
              | LOCALINTERFACESELF => iRefs
              | _                  => insert (iRef, iRefs)

            val accId = tId
            val accExp = mkLIdLNameExp (prefixInterfaceStrId iRef [accId])
          in
            (accExp, NONE, iRefs')
          end
      | PISCALAR {ty}                            =>
          (mkIdLNameExp (scalarAccessorId ty), NONE, iRefs)
      | PIUTF8 {isOpt}                           =>
          let
            val accId = if isOpt then "stringOpt" else "string"
            val accExp = mkIdLNameExp accId
          in
            (accExp, NONE, iRefs)
          end
      | PIINTERFACE {iRef, infoType, isOpt, ...} =>
          let
            val {scope, ...} = iRef
            val iRefs' =
              case scope of
                GLOBAL             => iRefs
              | LOCALINTERFACESELF => iRefs
              | _                  => insert (iRef, iRefs)

            val accId = if isOpt then tOptId else tId
            val accExp = mkLIdLNameExp (prefixInterfaceStrId iRef [accId])
            val optToBaseExp =
              let
                open InfoType
              in
                case infoType of
                  OBJECT _    => SOME (toBaseOptExp isOpt iRef)
                | INTERFACE _ => SOME (toBaseOptExp isOpt iRef)
                | UNION _     => SOME (toBaseOptExp isOpt iRef)
                | _           => NONE
              end
          in
            (accExp, optToBaseExp, iRefs')
          end

    val nameExp = ExpConst (ConstString propertyName)

    (* `mkConstFn e` returns
     *
     *     fn _ => <e>
     *)
    fun mkConstFn e = ExpFn (toList1 [(PatA APatU, e)])

    val propertyExp =
      ExpRec [
        (nameId,  nameExp),
        (gtypeId, mkParamGtypeExp accExp),
        (getId,   mkConstFn (mkParamModeExp accExp optToBase (#get  paramModes))),
        (setId,   mkConstFn (mkParamModeExp accExp optToBase (#set  paramModes))),
        (initId,             mkParamModeExp accExp optToBase (#init paramModes))
      ]
  in
    (
      StrDecDec (mkIdValDec (propertyNameId, propertyExp)),
      ((iRefs'1, structs), excls)
    )
  end
