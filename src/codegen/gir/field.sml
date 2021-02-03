(* --------------------------------------------------------------------------
 * Field
 * -------------------------------------------------------------------------- *)

datatype field_accessor =
  GET
| SET

val fieldAccessorId =
  fn
    GET => getId
  | SET => setId

(*
 *   <containerTy> -> <fieldReadTy>
 *)
fun mkGetAccessorTy (containerTy, fieldReadTy) =
  TyFun (containerTy, fieldReadTy)

(*
 *   <fieldWriteTy> -> <containerTy> -> unit
 *)
fun mkSetAccessorTy (containerTy, fieldWriteTy) =
  TyFun (fieldWriteTy, TyFun (containerTy, unitTy))

fun mkFieldAccessorTy (containerTy, fieldReadTy, fieldWriteTy) =
  fn
    GET => mkGetAccessorTy (containerTy, fieldReadTy)
  | SET => mkSetAccessorTy (containerTy, fieldWriteTy)


type field_info =
  {
    name           : string,
    id             : id,
    containerCType : string,
    version        : (string * string * string) option,
    accessors      : field_accessor list,
    info           : info
  }

fun noCTypeForContainer (namespace, name) =
  concat [
    "cannot determine offset in C struct because ",
    namespace, ".", name,
    " has no C type"
  ]

fun getFieldInfo
  repo
  vers
  getContainerField
  (containerNamespace : string)
  (containerInfo      : 'a RegisteredTypeInfo.class)
  (fieldInfo, excls) =
  let
    val () = checkDeprecated fieldInfo
    val () = checkFieldName repo vers containerInfo fieldInfo

    (* There are no introspection annotation to determine
     * whether a field is an optional value, so it is
     * assumed that a pointer may be null.  This argument
     * is not used by `resolveType` for a value type. *)
    val mayBeNull = true

    val containerName = getName containerInfo

    val containerCType =
      case RegisteredTypeInfo.getCType containerInfo of
        SOME cType => cType
      | NONE       => infoExcl (noCTypeForContainer (containerNamespace, containerName))

    val fieldVersion = BaseInfo.getVersion fieldInfo

    fun mkFieldName fieldInfo = getName fieldInfo
    fun mkFieldId fieldName = mkId (toLCC fieldName)

    val fieldName = mkFieldName fieldInfo
    val fieldId = mkFieldId fieldName

    val () =
      if FieldInfo.getBits fieldInfo <> NONE
      then infoExcl "bitfield not supported"
      else ()

    local
      val fieldFlags = FieldInfo.getFlags fieldInfo
      open FieldInfoFlags
    in
      val () =
        if anySet (fieldFlags, PRIVATE)
        then infoExcl "private"
        else ()
      val isReadable = anySet (fieldFlags, READABLE)
      val isWritable = anySet (fieldFlags, WRITABLE)
    end

    val accessors =
      case (isReadable, isWritable) of
        (true,  true)  => [GET, SET]
      | (true,  false) => [GET]
      | (false, true)  => [SET]
      | (false, false) => infoExcl "field neither readable nor writable"

    val typeInfo = FieldInfo.getType fieldInfo

    val isRef = false

    fun notExpectedForArrayLen s =
      infoExcl ("type " ^ s ^ " not expected for array length parameter")

    fun resolveArrayLenType typeInfo =
      let
        open TypeTag
      in
        case TypeInfo.getTag typeInfo of
          ERROR        => notExpectedForArrayLen "ERROR"
        | GTYPE        => notExpectedForArrayLen "GTYPE"
        | ARRAY        => notExpectedForArrayLen "ARRAY"
        | GLIST        => notExpectedForArrayLen "GLIST"
        | GSLIST       => notExpectedForArrayLen "GSLIST"
        | GHASH        => notExpectedForArrayLen "GHASH"
        | VOID         => notExpectedForArrayLen "VOID"
        | BOOLEAN      => notExpectedForArrayLen "BOOLEAN"
        | CHAR         => notExpectedForArrayLen "CHAR"       (* GIR only *)
        | UCHAR        => notExpectedForArrayLen "UCHAR"      (* GIR only *)
        | INT          => STINT                               (* GIR only *)
        | UINT         => STUINT                              (* GIR only *)
        | SHORT        => STSHORT                             (* GIR only *)
        | USHORT       => STUSHORT                            (* GIR only *)
        | LONG         => STLONG                              (* GIR only *)
        | ULONG        => STULONG                             (* GIR only *)
        | INT8         => STINT8
        | UINT8        => STUINT8
        | INT16        => STINT16
        | UINT16       => STUINT16
        | INT32        => STINT32
        | UINT32       => STUINT32
        | INT64        => STINT64
        | UINT64       => STUINT64
        | FLOAT        => notExpectedForArrayLen "FLOAT"
        | DOUBLE       => notExpectedForArrayLen "DOUBLE"
        | SIZE         => STSIZE                              (* GIR only *)
        | SSIZE        => STSSIZE                             (* GIR only *)
        | OFFSET       => notExpectedForArrayLen "OFFSET"     (* GIR only *)
        | INTPTR       => notExpectedForArrayLen "INTPTR"     (* GIR only *)
        | UINTPTR      => notExpectedForArrayLen "UINTPTR"    (* GIR only *)
        | FILENAME     => notExpectedForArrayLen "FILENAME"
        | UTF8         => notExpectedForArrayLen "UTF8"
        | UNICHAR      => notExpectedForArrayLen "UNICHAR"
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val infoType = InfoType.getType interfaceInfo
              open InfoType
            in
              case infoType of
                ALIAS aliasInfo => resolveArrayLenType (AliasInfo.getType aliasInfo)
              | _               => notExpectedForArrayLen "INTERFACE"
            end
      end

    fun notExpected s = infoExcl ("type " ^ s ^ " not expected")
    fun notSupported s = infoExcl ("type " ^ s ^ " not supported")

    fun resolveType optIRef cxtPtrDepth mayBeNull typeInfo =
      let
        open TypeTag

        fun toScalarInfo ty =
          if
            TypeInfo.isPointer typeInfo cxtPtrDepth isRef
              handle
                Fail msg => infoExcl msg
          then
            infoExcl (ptrForScalar scalarToString ty)
          else
            ISCALAR {
              ty      = ty,
              optIRef = optIRef
            }
      in
        case TypeInfo.getTag typeInfo of
          ERROR        => notExpected "ERROR"
        | GTYPE        =>
            let
              val iRef =
                case optIRef of
                  SOME iRef => updateIRefTy SIMPLE iRef
                | NONE      =>
                    makeTypeIRef containerNamespace (SOME containerName)
              val gtypeInfo = {iRef = iRef}
            in
              IGTYPE gtypeInfo
            end
        | ARRAY        =>
            let
              val () =
                case TypeInfo.getArrayType typeInfo of
                  SOME ArrayType.C  => ()
                | SOME ty           => infoExcl (arrayTypeNotSupported ty)
                | NONE              => infoExcl noArrayTypeForArray

              val isPtr =
                TypeInfo.isPointer typeInfo cxtPtrDepth isRef
                  handle
                    Fail msg => infoExcl msg

              val lengths =
                case TypeInfo.getArrayFixedSize typeInfo of
                  ~1 =>
                    let
                      val lengthsParam =
                        case TypeInfo.getArrayLength typeInfo of
                          ~1 => []
                        | n  =>
                            let
                              val fieldInfo = getContainerField containerInfo n
                              val id = mkFieldId (mkFieldName fieldInfo)
                              val ty = resolveArrayLenType (FieldInfo.getType fieldInfo)
                            in
                              [ArrayLengthParam (id, ty)]
                            end

                      val lengthsZeroTerminated =
                        if TypeInfo.isZeroTerminated typeInfo
                        then [ArrayLengthZeroTerminated]
                        else []
                    in
                      toList1 (lengthsParam @ lengthsZeroTerminated)
                        handle Empty => infoExcl "cannot determine array length"
                    end
                | n  => toList1 [ArrayLengthFixed n]
              val length = hd1 lengths

              (* An array may be empty, i.e. require zero bytes, if it has
               * a fixed size of zero or it has no null terminator and its
               * size is stored in a separate field. *)
              val arrayMayBeEmpty =
                case op :: lengths of
                  [ArrayLengthFixed 0] => true
                | [ArrayLengthParam _] => true
                | _                    => false

              (* An array that may be empty, i.e. require zero bytes, may be
               * a null pointer because malloc can return null if zero bytes
               * are requested, so such an array cannot be optional using
               * null to represent no array.  Therefore the array is optional
               * if it is a pointer that may be null and the array cannot be
               * empty and the field is not configured to be non-optional. *)
              val isOpt =
                isPtr andalso mayBeNull andalso not arrayMayBeEmpty
                 andalso not (isNonOptPointerField repo vers containerName fieldInfo)

              val xferOwn = false

              val elemTypeInfo =
                case TypeInfo.getParamType typeInfo 0 of
                  SOME typeInfo => typeInfo
                | NONE          => infoExcl noTypeParamForArray

              val elemMayBeNull = false

              val elem =
                resolveType
                  NONE
                  NONE
                  elemMayBeNull
                  elemTypeInfo

              val iRef =
                case optIRef of
                  SOME iRef => updateIRefTy SIMPLE iRef
                | NONE      =>
                    makeCArrayIRef
                      repo
                      vers
                      containerNamespace
                      (SOME containerName)
                      length
                      elem

              val arrayInfo = {
                isOpt      = isOpt,
                isPtr      = isPtr,
                xferOwn    = xferOwn,  (* unused *)
                lengths    = lengths,
                iRef       = iRef,
                elem       = elem      (* unused *)
              }
            in
              IARRAY arrayInfo
            end
        | GLIST        => notSupported "GLIST"
        | GSLIST       => notSupported "GSLIST"
        | GHASH        => notSupported "GHASH"
        | VOID         => notExpected "VOID"
        | BOOLEAN      => toScalarInfo STBOOLEAN
        | CHAR         => toScalarInfo STCHAR    (* GIR only *)
        | UCHAR        => toScalarInfo STUCHAR   (* GIR only *)
        | INT          => toScalarInfo STINT     (* GIR only *)
        | UINT         => toScalarInfo STUINT    (* GIR only *)
        | SHORT        => toScalarInfo STSHORT   (* GIR only *)
        | USHORT       => toScalarInfo STUSHORT  (* GIR only *)
        | LONG         => toScalarInfo STLONG    (* GIR only *)
        | ULONG        => toScalarInfo STULONG   (* GIR only *)
        | INT8         => toScalarInfo STINT8
        | UINT8        => toScalarInfo STUINT8
        | INT16        => toScalarInfo STINT8
        | UINT16       => toScalarInfo STUINT16
        | INT32        => toScalarInfo STINT32
        | UINT32       => toScalarInfo STUINT32
        | INT64        => toScalarInfo STINT64
        | UINT64       => toScalarInfo STUINT64
        | FLOAT        => toScalarInfo STFLOAT
        | DOUBLE       => toScalarInfo STDOUBLE
        | SIZE         => toScalarInfo STSIZE    (* GIR only *)
        | SSIZE        => toScalarInfo STSSIZE   (* GIR only *)
        | OFFSET       => notSupported "OFFSET"  (* GIR only *)
        | INTPTR       => notSupported "INTPTR"  (* GIR only *)
        | UINTPTR      => notSupported "UINTPTR" (* GIR only *)
        | FILENAME     =>
            let
              val isPtr =
                TypeInfo.isPointer typeInfo cxtPtrDepth isRef
                  handle
                    Fail msg => infoExcl msg

              val isOpt =
                isPtr andalso mayBeNull
                 andalso not (isNonOptPointerField repo vers containerName fieldInfo)

              val xferOwn = false

              val utf8Info = {
                isOpt      = isOpt,
                isPtr      = isPtr,
                xferOwn    = xferOwn,  (* unused *)
                optIRef    = optIRef
              }
            in
              IUTF8 utf8Info
            end
        | UTF8         =>
            let
              val isPtr =
                TypeInfo.isPointer typeInfo cxtPtrDepth isRef
                  handle
                    Fail msg => infoExcl msg

              val isOpt =
                isPtr andalso mayBeNull
                 andalso not (isNonOptPointerField repo vers containerName fieldInfo)

              val xferOwn = false

              val utf8Info = {
                isOpt      = isOpt,
                isPtr      = isPtr,
                xferOwn    = xferOwn,  (* unused *)
                optIRef    = optIRef
              }
            in
              IUTF8 utf8Info
            end
        | UNICHAR      => toScalarInfo STUNICHAR
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val () = checkInterfaceType repo vers interfaceInfo

              val interfaceTy = getIRefTy interfaceInfo

              val iRef =
                case optIRef of
                  SOME iRef => updateIRefTy interfaceTy iRef
                | NONE      =>
                    let
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
                ALIAS aliasInfo
                  =>
                  resolveType
                    (SOME iRef)
                    (TypeInfo.addPtrDepth typeInfo cxtPtrDepth)
                    mayBeNull
                    (AliasInfo.getType aliasInfo)
              | _ =>
                  let
                    (* `getStructType` must be called unconditionally for a
                     * struct to ensure that a field whose type is an
                     * unsupported struct is excluded. *)
                    val () =
                      case infoType of
                        STRUCT structInfo => ignore (getStructType repo vers structInfo)
                      | UNION unionInfo   => checkUnionInterfaceType repo vers unionInfo
                      | _                 => ()

                    val isPtr =
                      TypeInfo.isPointer typeInfo cxtPtrDepth isRef
                        handle
                          Fail msg => infoExcl msg

                    val isOpt =
                      isPtr andalso mayBeNull
                       andalso not (isNonOptPointerField repo vers containerName fieldInfo)

                    val (xferOwn, rootIRef) =
                      case infoType of
                        OBJECT objectInfo
                                    =>
                          (
                            false,
                            getRootObjectIRef repo containerNamespace
                              (SOME containerName)
                              (objectInfo, iRef)
                          )
                      | INTERFACE _ =>
                          (
                            false,
                            makeInterfaceRootIRef containerNamespace
                              (SOME containerName)
                          )
                      | STRUCT _    => (false, iRef)
                      | UNION _     => (false, iRef)
                      | FLAGS _     => (false, iRef)
                      | ENUM _      => (false, iRef)
                      | _           => infoExcl (unsupportedInterface infoType)

                    val interfaceInfo = {
                      rootIRef   = rootIRef,  (* unused *)
                      iRef       = iRef,
                      infoType   = infoType,
                      isOpt      = isOpt,
                      isPtr      = isPtr,
                      xferOwn    = xferOwn    (* unused *)
                    }
                  in
                    IINTERFACE interfaceInfo
                  end
            end
      end

    val info =
      resolveType
        NONE
        NONE
        mayBeNull
        typeInfo
  in
    (
      {
        name           = fieldName,
        id             = fieldId,
        containerCType = containerCType,
        version        = fieldVersion,
        accessors      = accessors,
        info           = info
      },
      excls
    )
  end

(* For each array length field, check its accessors match the accessors
 * of its array and warn if they don't match, then remove the SET
 * accessor, if present, because an array length field must be set only
 * by writing the array.  In the unlikely event that the array is not
 * readable, the GET accessor is also removed, leaving no accessors.
 *)
fun arrayLenIncompatibleAccessors (arrayFieldInfo, lenAccessors, lenName) =
  let
    open HVTextTree.H

    val {
      name      = arrayName,
      accessors = arrayAccessors,
      ...
    } : field_info = arrayFieldInfo
  in
    (String.concat o strings NONE) (
      seq [
        concat [
          "array field ", arrayName,
          " with accessors "
        ],
        seqWith (str ", ") (str o fieldAccessorId) arrayAccessors,
        concat [
          " has corresponding length field ", lenName,
          " with incompatible accessors "
        ],
        seqWith (str ", ") (str o fieldAccessorId) lenAccessors
      ]
    )
  end

fun updateFieldInfos (fieldInfos : field_info option list) : field_info option list =
  let
    (* Associate each array length field name with the field info of
     * its array. *)
    fun addLenArrayFieldInfo (fieldInfo as {info, ...}, lenArrayFieldInfos) =
      case info of
        IARRAY ({lengths, ...}) => (
          case
            List.mapPartial (fn ArrayLengthParam x => SOME x | _ => NONE) (op :: lengths)
          of
            (lenName, _) :: _ => (lenName, fieldInfo) :: lenArrayFieldInfos
          | _                 => lenArrayFieldInfos
        )
      | _                       => lenArrayFieldInfos

    val lenArrayFieldInfos = fold (Option.fold addLenArrayFieldInfo) (fieldInfos, [])

    fun getLenArrayFieldInfo lenName =
      case List.find (fn (x, _) => x = lenName) lenArrayFieldInfos of
        SOME (_, lenArrayFieldInfo) => SOME lenArrayFieldInfo
      | NONE                        => NONE

    fun update
      {
        name as lenName,
        id,
        containerCType,
        version,
        accessors = lenAccessors,
        info,
        ...
      } =
      let
        val accessors =
          case getLenArrayFieldInfo lenName of
            NONE                => lenAccessors
          | SOME arrayFieldInfo =>
              let
                val {accessors = arrayAccessors, ...} = arrayFieldInfo
                val () =
                  if arrayAccessors <> lenAccessors
                  then
                    raise Fail (
                      arrayLenIncompatibleAccessors
                        (arrayFieldInfo, lenAccessors, lenName)
                    )
                  else ()
                val allowedLenAccessors =
                  List.filter (fn a => a = GET) arrayAccessors
                fun isAllowedLenAccessor a =
                  List.exists (fn x => x = a) allowedLenAccessors
              in
                List.filter isAllowedLenAccessor lenAccessors
              end
      in
        {
          name           = name,
          id             = id,
          containerCType = containerCType,
          version        = version,
          accessors      = accessors,
          info           = info
        }
      end
  in
    List.map (Option.map update) fieldInfos
  end


(* Specification *)

fun mkFieldTy isOpt ((isReadType, interfaceTyRef), tyVarIdx) =
  let
    val (ty, tyVarIdx') =
      if isReadType
      then makeRefBaseTy false (interfaceTyRef, tyVarIdx)
      else makeRefVarTy false (interfaceTyRef, tyVarIdx)
  in
    (if isOpt then optionTy ty else ty, tyVarIdx')
  end

local
  fun mkIRefTyRef iRef =
    let
      val ifTyRef = (
        numInterfaceRefTyVars iRef,
        makeInterfaceRefTyLongId iRef
      )
    in
      ifTyRef
    end

  fun addIRefTyRef iRef isOpt (sigIRefs, extIRefs) =
    let
      val {scope, container, ...} = iRef
      val sigIRefs' =
        case scope of
          GLOBAL             => sigIRefs
        | LOCALINTERFACESELF => sigIRefs
        | _                  => insert (iRef, sigIRefs)
      val extIRefs' =
        case (scope, container) of
          (GLOBAL, SOME _) => insert (iRef, extIRefs)
        | _                => extIRefs

      val ifTyRef = mkIRefTyRef iRef
    in
      (ifTyRef, isOpt, (sigIRefs', extIRefs'))
    end
in
  fun mkFieldTypeInfoTyRef info =
    case info of
      IGTYPE {iRef}                 => (mkIRefTyRef iRef, false)
    | ISCALAR {ty, optIRef}         => (
        case optIRef of
          SOME iRef => (mkIRefTyRef iRef, false)
        | NONE      => (scalarTyRef ty, false)
      )
    | IUTF8 {isOpt, optIRef, ...}   => (
        case optIRef of
          SOME iRef => (mkIRefTyRef iRef, isOpt)
        | NONE      => (utf8TyRef, isOpt)
      )
    | IARRAY {iRef, isOpt, ...}     => (mkIRefTyRef iRef, isOpt)
    | IINTERFACE {iRef, isOpt, ...} => (mkIRefTyRef iRef, isOpt)

  (* same as above but also records interface references *)
  fun addFieldTypeInfoTyRef (info, iRefs) =
    case info of
      IGTYPE {iRef}                 => addIRefTyRef iRef false iRefs
    | ISCALAR {ty, optIRef}         => (
        case optIRef of
          SOME iRef => addIRefTyRef iRef false iRefs
        | NONE      => (scalarTyRef ty, false, iRefs)
      )
    | IUTF8 {isOpt, optIRef, ...}   => (
        case optIRef of
          SOME iRef => addIRefTyRef iRef isOpt iRefs
        | NONE      => (utf8TyRef, isOpt, iRefs)
      )
    | IARRAY {iRef, isOpt, ...}     => addIRefTyRef iRef isOpt iRefs
    | IINTERFACE {iRef, isOpt, ...} => addIRefTyRef iRef isOpt iRefs
end

fun addFieldAccessorSpec
  (containerIRef : interfaceref)
  (fieldInfo : field_info, (specs, iRefs, excls))
  : spec list * (interfaceref list * interfaceref list) * info_excl_hier list =
  let
    val {id = fieldId, accessors, info, ...} = fieldInfo

    val tyVarIdx'0 = 0
    val (containerTy, tyVarIdx'1) =
      makeIRefLocalTypeRef (makeRefVarTy false) (containerIRef, tyVarIdx'0)

    val (tyRef, isOpt, iRefs'1) = addFieldTypeInfoTyRef (info, iRefs)
    val (fieldReadTy, tyVarIdx'2) = mkFieldTy isOpt ((true, tyRef), tyVarIdx'1)
    val (fieldWriteTy, _) = mkFieldTy isOpt ((false, tyRef), tyVarIdx'2)

    val labels = map fieldAccessorId accessors
    val tys = map (mkFieldAccessorTy (containerTy, fieldReadTy, fieldWriteTy)) accessors
    val fields = ListPair.zipEq (labels, tys)

    val fieldTy = TyRec fields
  in
    (mkValSpec (fieldId, fieldTy) :: specs, iRefs'1, excls)
  end

fun mkFieldIdTy isReadType (fieldInfo : field_info, tyVarIdx) =
  let
    val {id, info, ...} = fieldInfo
    val (tyRef, isOpt) = mkFieldTypeInfoTyRef info
    val (ty, tyVarIdx') = mkFieldTy isOpt ((isReadType, tyRef), tyVarIdx)
  in
    ((id, ty), tyVarIdx')
  end


(* Declaration *)

fun addFieldOffsetFunctionStrDec
  isPolyML
  (containerIRef : interfaceref)
  (fieldInfo : field_info, (strDecs, excls))
  : strdec list * info_excl_hier list =
  let
    val {name = fieldName, ...} = fieldInfo

    val fieldNameOffset = concat [fieldName, "_'_", offsetId]
    val fieldNameOffsetUId = toLCC fieldNameOffset ^ "_"

    val containerNamespace = #namespace containerIRef
    val containerName = #name containerIRef

    val functionSymbolStr =
      mkSymbolId containerNamespace containerName
        (concat [fieldName, "_", offsetId])

    val gSizeStrId = gStrId ^ scalarStrId STSIZE

    val functionExp =
      if isPolyML
      then
        (* Construct the function body with the form:
         *
         *   call
         *     (getSymbol "giraffe_<container_namespace>_<container_name>_<field_name>_offset")
         *     (cVoid --> GSize.PolyML.cVal)
         *)
        callPolyMLFFIExp
          functionSymbolStr
          (cVoidConv, makeConv [gSizeStrId, polyMLStrId] VAL)
      else
        (* Construct the function body with the form:
         *
         *   _import "giraffe_<container_namespace>_<container_name>_<field_name>_offset"
         *     : unit -> GSize.FFI.val_;
         *)
        callMLtonFFIExp
          (functionSymbolStr, [])
          ([], mkLIdTy [gSizeStrId, ffiStrId, valId])
  in
    (
      StrDecDec (mkIdValDec (fieldNameOffsetUId, functionExp)) :: strDecs,
      excls
    )
  end

local
  fun prefixOptStrId isOpt strId = if isOpt then optStrId ^ strId else strId

  datatype struct_name =
    Id   of id
  | IRef of interfaceref

  (*
   *   <Opt><FieldTypeStrId>(<StructName>)
   *)
  fun makeFieldTypeStruct fieldTypeStructId {structName, isOpt} =
    let
      val funcId = prefixOptStrId isOpt fieldTypeStructId
      val cInterfaceStructIds = 
        case structName of
          Id id     => id :: []
        | IRef iRef => prefixInterfaceStrId iRef []
    in
      mkInstStruct (funcId, mkNameStruct cInterfaceStructIds)
    end

  fun fieldTypeGType {iRef} =
    let
      val structName = IRef iRef
    in
      makeFieldTypeStruct valueFieldTypeStrId {structName = structName, isOpt = false}
    end

  fun fieldTypeScalar {ty, optIRef, ...} =
    let
      val structName =
        case optIRef of
          NONE      => Id (gStrId ^ scalarStrId ty)
        | SOME iRef => IRef iRef
    in
      makeFieldTypeStruct valueFieldTypeStrId {structName = structName, isOpt = false}
    end

  fun fieldTypeUtf8 {isOpt, isPtr, optIRef, ...} =
    let
      val structName =
        case optIRef of
          NONE      => Id utf8StrId
        | SOME iRef => IRef iRef
    in
      makeFieldTypeStruct
        (
          if isPtr
          then pointerFieldTypeStrId
          else valueFieldTypeStrId
        )
        {structName = structName, isOpt = isOpt}
    end

  fun fieldTypeArray {isOpt, isPtr, iRef, lengths, ...} =
    let
      val structName = IRef iRef
    in
      makeFieldTypeStruct
        (
          if isPtr
          then
            case lengths of
              (ArrayLengthParam _, _) => pointerNFieldTypeStrId
            | _                       => pointerFieldTypeStrId
          else valueFieldTypeStrId
        )
        {structName = structName, isOpt = isOpt}
    end

  fun fieldTypeInterface {isOpt, isPtr, iRef, ...} =
    let
      val structName = IRef iRef
    in
      makeFieldTypeStruct
        (
          if isPtr
          then pointerFieldTypeStrId
          else valueFieldTypeStrId
        )
        {structName = structName, isOpt = isOpt}
    end

  fun makeFieldTypeStruct ({info, ...} : field_info, iRefs) =
    let
      val fieldTypeStruct =
        case info of
          IGTYPE gtypeFieldInfo         => fieldTypeGType gtypeFieldInfo
        | ISCALAR scalarFieldInfo       => fieldTypeScalar scalarFieldInfo
        | IUTF8 utf8FieldInfo           => fieldTypeUtf8 utf8FieldInfo
        | IARRAY arrayFieldInfo         => fieldTypeArray arrayFieldInfo
        | IINTERFACE interfaceFieldInfo => fieldTypeInterface interfaceFieldInfo

      val iRefs' = addIRef (info, iRefs)
    in
      (fieldTypeStruct, iRefs')
    end
in
  fun addFieldStructureStrDec
    (containerIRef : interfaceref)
    (fieldInfo : field_info, (strDecs, (iRefs, structs), excls))
    : strdec list * (interfaceref list * struct1 ListDict.t) * info_excl_hier list =
    let
      val {
        name = fieldName,
        info,
        ...
      } = fieldInfo

      val fieldNameOffset = concat [fieldName, "_'_", offsetId]
      val fieldNameOffsetUId = toLCC fieldNameOffset ^ "_"

      (**
       *   <FieldName>Field
       *)
      val fieldStructureStrId = toUCC fieldName ^ fieldStrId

      (*
       *   structure Container = <ContainerStructId>
       *)
      val containerStructureStrDec =
        mkStructStrDec (
          containerStrId,
          mkNameStruct (prefixInterfaceStrId containerIRef [])
        )

      (*
       *   structure FieldType = <FieldTypeStruct>
       *)
      val (fieldTypeStruct, iRefs') = makeFieldTypeStruct (fieldInfo, iRefs)
      val fieldTypeStructureStrDec =
        mkStructStrDec (fieldTypeStrId, fieldTypeStruct)

      (*
       *   val offset = (I ---> GSize.FFI.fromVal) <fieldName>'Offset_
       *)
      val offsetFunctionStrDec =
        let
          val offsetFunExp =
            ExpApp (
              mkParenExp (
                mkDDDRExp (
                  mkIdLNameExp iId,
                  mkLIdLNameExp [gStrId ^ scalarStrId STSIZE, ffiStrId, fromValId]
                )
              ),
              mkIdLNameExp fieldNameOffsetUId
            )
        in
          StrDecDec (mkIdValDec (offsetId, offsetFunExp))
        end

      (*
       *   FieldN(
       *     structure Container = <ContainerStructId>
       *     structure FieldType = <FieldTypeStruct>
       *     val offset = (I ---> GSize.FFI.fromVal) <fieldName>'Offset_
       *     structure NField = <LenFieldId>Field
       *     val toInt = <toIntExp(lenFieldTy)>
       *     val fromInt = <fromIntExp(lenFieldTy)>
       *   )
       *     if info is
       *        IARRAY {
       *          lengths = (ArrayLengthParam (lenFieldId, lenFieldTy), _),
       *          ...
       *         }
       *
       *   Field(
       *     structure Container = <ContainerStructId>
       *     structure FieldType = <FieldTypeStruct>
       *     val offset = (I ---> GSize.FFI.fromVal) <fieldName>'Offset_
       *   )
       *     otherwise
       *)
      val (fieldFunId, funArgStrDecs'1) =
        case info of
          IARRAY {
            lengths = (ArrayLengthParam (lenFieldId, lenFieldTy), _),
            ...
          } =>
            let
              (**
               *   val toInt = <toIntExp(lenFieldTy)>
               *)
              val toIntExp =
                case convertToInt lenFieldTy of
                  SOME NONE           => fnIdExp
                | SOME (SOME convExp) => convExp
                | NONE                => infoExcl (
                    "conversion from SML type int not defined for "
                     ^ scalarToString lenFieldTy ^ " array length field"
                  )
              val toIntStrDec = StrDecDec (mkIdValDec (toIntId, toIntExp))

              (**
               *   val fromInt = <fromIntExp(lenFieldTy)>
               *)
              val fromIntExp =
                case convertFromInt lenFieldTy of
                  SOME NONE           => fnIdExp
                | SOME (SOME convExp) => convExp
                | NONE                => infoExcl (
                    "conversion to SML type int not defined for "
                     ^ scalarToString lenFieldTy ^ " array length field"
                  )
              val fromIntStrDec = StrDecDec (mkIdValDec (fromIntId, fromIntExp))

              (**
               *   structure NField = <LenFieldId>Field
               *)
              val lenFieldStructureStrId = toUCC lenFieldId ^ fieldStrId
              val nFieldStrDec =
                mkStructStrDec (
                  nStrId ^ fieldStrId,
                  mkNameStruct [lenFieldStructureStrId]
                )

              val funArgStrDecs =
                [
                  nFieldStrDec,
                  toIntStrDec,
                  fromIntStrDec
                ]
            in
              (fieldStrId ^ nStrId, funArgStrDecs)
            end
        | _ => (fieldStrId, [])

      val funArgStrDecs'2 =
        [
          containerStructureStrDec,
          fieldTypeStructureStrDec,
          offsetFunctionStrDec
        ]
         @ funArgStrDecs'1
      val struct1 = StructInst (fieldFunId, mkStrDecsFunArg funArgStrDecs'2)

      val structDec = toList1 [(fieldStructureStrId, NONE, struct1)]
      val fieldStructureStrDec = StrDecStruct structDec
    in
      (
        fieldStructureStrDec :: strDecs,
        (iRefs', structs),
        excls
      )
    end
end


fun addFieldAccessorStrDec
  (fieldInfo : field_info, (strDecs, (iRefs, structs), excls))
  : strdec list * (interfaceref list * struct1 ListDict.t) * info_excl_hier list =
  let
    val {name = fieldName, id = fieldId, accessors, info, ...} = fieldInfo

    (**
     *   <FieldName>Field
     *)
    val fieldStructureStrId = toUCC fieldName ^ fieldStrId

    (*
     *   <accId> = fn x => <FieldName>Field.<accId> (<Namespace>.<Name>Class.toBase x)
     *     if acc is SET and info is
     *       IINTERFACE {
     *         iRef = {ty = CLASS, namespace, name, scope = GLOBAL, ...},
     *         ...
     *      }`
     *
     *   <accId> = fn x => <FieldName>Field.<accId> (<Namespace><Name>Class.toBase x)
     *     otherwise, if acc is SET and info is
     *       IINTERFACE {
     *         iRef = {ty = CLASS, namespace, name, ...},
     *         ...
     *      }`
     *
     *   <accId> = fn x => <FieldName>Field.<accId> x
     *     otherwise
     *
     * where accId is
     *
     *   set
     *     if acc is SET
     *
     *   get
     *     if acc is GET
     *)
    fun mkField acc =
      let
        val accId = fieldAccessorId acc
        val xId : id = "x"
        val xExp = mkIdLNameExp xId
        val pat = mkIdVarPat xId
        val exp =
          ExpApp (
            mkLIdLNameExp [fieldStructureStrId, accId],
            case (acc, info) of
              (SET, IINTERFACE {iRef as {ty = CLASS, ...}, isOpt, ...}) =>
                mkParenExp (
                  ExpApp (
                    let
                      val toBaseExp =
                        mkLIdLNameExp (prefixInterfaceStrId iRef [toBaseId])
                    in
                      if isOpt
                      then ExpApp (mkLIdLNameExp [optionStrId, mapId], toBaseExp)
                      else toBaseExp
                    end,
                    xExp
                  )
                )
            | _                                                         => xExp
          )
      in
        (accId : label, ExpFn (toList1 [(pat, exp)]))
      end

    val fieldExp = ExpRec (map mkField accessors)
    val fieldAccessorStrDec = StrDecDec (mkIdValDec (fieldId, fieldExp))
  in
    (
      fieldAccessorStrDec :: strDecs,
      (iRefs, structs),
      excls
    )
  end


(* C Interface - GIR only *)

val cDeclareFieldId = "GIRAFFE_DECLARE_FIELD"

fun addFieldCInterfaceDecl
  (containerNamespace : string)
  (containerName      : string)
  (
    fieldInfo       : field_info,
    cInterfaceDecls : c_interface_decl list
  )
  : c_interface_decl list =
  let
    val {name = fieldName, containerCType, version = fieldVersion, ...} = fieldInfo

    val cInterfaceDecls' =
      let
        (*
         * GIRAFFE_DECLARE_FIELD(<ContainerCType>,
         *                       <container_namespace>_<container_name>,
         *                       <field_name>)
         *)
        val decl =
          CMacroCall {
            name = cDeclareFieldId,
            args = [
              containerCType,
              String.concatWith "_" [toLCU containerNamespace, toLCU containerName],
              fieldName
            ]
          }
        val fieldCVersionDecl =
          case fieldVersion of
            SOME version => CCheckVersion {decl = decl, version = version}
          | NONE         => decl
      in
        fieldCVersionDecl :: cInterfaceDecls
      end
  in
    cInterfaceDecls'
  end
    handle InfoExcl _ => cInterfaceDecls
