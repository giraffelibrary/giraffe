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
