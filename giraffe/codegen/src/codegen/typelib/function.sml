(* --------------------------------------------------------------------------
 * Function
 * -------------------------------------------------------------------------- *)

(* Support for parameters and return values *)

fun arrayTypeNotSupported ty =
  concat [
    "array type ",
    case ty of
      ArrayType.C          => "C"
    | ArrayType.ARRAY      => "GArray"
    | ArrayType.PTR_ARRAY  => "GPtrArray"
    | ArrayType.BYTE_ARRAY => "GByteArray",
    " not supported"
  ]

val noArrayTypeForArray = "ARRAY type with no array type not valid"

val noTypeParamForArray =
  "ARRAY type without type parameter not valid"

val containerForUtf8 =
  "ownership transfer CONTAINER for UTF8 type not valid"

val containerForFilename =
  "ownership transfer CONTAINER for FILENAME type not valid"

val containerForInterface =
  "ownership transfer CONTAINER for INTERFACE type not valid"

val everythingForNonPtrStruct =
  "ownership transfer EVERYTHING and non-pointer C type for STRUCT type \
  \not valid"
  (* In fact this is used for a non-pointer GObject.Value out parameter where
   * the caller must call g_value_unset to free resources used by the
   * GObject.Value.  This appears to occur only for get_property functions, so
   * this is all pending property handling...
   *)

val everythingForNonPtrUnion =
  "ownership transfer EVERYTHING and non-pointer C type for UNION type \
  \not valid"

val containerForInPar =
  "ownership transfer CONTAINER for IN parameter not supported"

val everythingForInPar =
  "ownership transfer EVERYTHING for IN parameter not supported"

val everythingForInOutPar =
  "ownership transfer EVERYTHING for INOUT parameter not supported"

val nonPtrForObject =
  "non-pointer C type for OBJECT type not supported"

val nonPtrForInterface =
  "non-pointer C type for INTERFACE type not supported"

val nonPtrForStructInPar =
  "non-pointer C type for STRUCT type not supported"

val nonPtrForUnionInPar =
  "non-pointer C type for UNION type not supported"

val nonPtrForStructRet =
  "non-pointer C type for STRUCT type not supported"

val nonPtrForUnionRet =
  "non-pointer C type for UNION type not supported"

val ptrForFlags =
  "pointer C type for FLAGS type not supported"

val ptrForEnum =
  "pointer C type for ENUM type not supported"

local
  open InfoType

  val toString =
    fn
      INVALID     => "INVALID"
    | FUNCTION _  => "FUNCTION"
    | CALLBACK _  => "CALLBACK"
    | STRUCT _    => "STRUCT"
    | BOXED _     => "BOXED"
    | ENUM _      => "ENUM"
    | FLAGS _     => "FLAGS"
    | OBJECT _    => "OBJECT"
    | INTERFACE _ => "INTERFACE"
    | CONSTANT _  => "CONSTANT"
    | INVALID_0   => "INVALID_0"
    | UNION _     => "UNION"
    | VALUE _     => "VALUE"
    | SIGNAL _    => "SIGNAL"
    | VFUNC _     => "VFUNC"
    | PROPERTY _  => "PROPERTY"
    | FIELD _     => "FIELD"
    | ARG _       => "ARG"
    | TYPE _      => "TYPE"
    | UNRESOLVED  => "UNRESOLVED"
in
  fun unsupportedInterface infoType =
    concat ["type ", toString infoType, " INTERFACE not supported"]
end

fun ptrForScalar fmt ty =
  concat ["pointer C type for scalar (", fmt ty, ") not supported"]

val ptrForVoid =
  "pointer C type for VOID not supported"


datatype scalartype =
  STBOOLEAN
| STINT8
| STUINT8
| STINT16
| STUINT16
| STINT32
| STUINT32
| STINT64
| STUINT64
| STFLOAT
| STDOUBLE
| STUNICHAR

val scalarToString =
  fn
    STBOOLEAN      => "BOOLEAN"
  | STINT8         => "INT8"
  | STUINT8        => "UINT8"
  | STINT16        => "INT16"
  | STUINT16       => "UINT16"
  | STINT32        => "INT32"
  | STUINT32       => "UINT32"
  | STINT64        => "INT64"
  | STUINT64       => "UINT64"
  | STFLOAT        => "FLOAT"
  | STDOUBLE       => "DOUBLE"
  | STUNICHAR      => "UNICHAR"

val scalarStrId =
  fn
    STBOOLEAN      => "Bool"
  | STINT8         => "Int8"
  | STUINT8        => "UInt8"
  | STINT16        => "Int16"
  | STUINT16       => "UInt16"
  | STINT32        => "Int32"
  | STUINT32       => "UInt32"
  | STINT64        => "Int64"
  | STUINT64       => "UInt64"
  | STFLOAT        => "Float"
  | STDOUBLE       => "Double"
  | STUNICHAR      => "Char"

local
  fun noGType s = infoExcl ("no corresponding GType for " ^ s)
in
  val scalarAccessorId =
    fn
      STBOOLEAN      => "boolean"
    | STINT8         => noGType "INT8"
    | STUINT8        => noGType "UINT8"
    | STINT16        => noGType "INT16"
    | STUINT16       => noGType "UINT16"
    | STINT32        => "int"
    | STUINT32       => "uint"
    | STINT64        => "long"
    | STUINT64       => "ulong"
    | STFLOAT        => "float"
    | STDOUBLE       => "double"
    | STUNICHAR      => "char"
end


val boolTyRef = (0, toList1 [boolId])
val charTyRef = (0, toList1 [charId])
val word8TyRef = (0, toList1 [word8StrId, wordId])
val intTyRef = (0, toList1 [intId])
val largeIntTyRef = (0, toList1 [largeIntStrId, intId])
val realTyRef = (0, toList1 [realId])


local
in
  val scalarTyRef =
    fn
      STBOOLEAN      => boolTyRef
    | STINT8         => largeIntTyRef
    | STUINT8        => word8TyRef
    | STINT16        => largeIntTyRef
    | STUINT16       => largeIntTyRef
    | STINT32        => largeIntTyRef
    | STUINT32       => largeIntTyRef
    | STINT64        => largeIntTyRef
    | STUINT64       => largeIntTyRef
    | STFLOAT        => realTyRef
    | STDOUBLE       => realTyRef
    | STUNICHAR      => charTyRef
end


local
  structure TyRefMap = ListMap(type key = lid val eq = op =)

  val toInt =
    foldr (TyRefMap.insert (fn _ => raise Fail "toInt")) TyRefMap.empty [
      (#2 intTyRef,      NONE),
      (#2 largeIntTyRef, SOME (mkLIdLNameExp [largeIntStrId, toIntId])),
      (#2 word8TyRef,    SOME (mkLIdLNameExp [word8StrId, toIntId]))
    ]

  val fromInt =
    foldr (TyRefMap.insert (fn _ => raise Fail "fromInt")) TyRefMap.empty [
      (#2 intTyRef,      NONE),
      (#2 largeIntTyRef, SOME (mkLIdLNameExp [largeIntStrId, fromIntId])),
      (#2 word8TyRef,    SOME (mkLIdLNameExp [word8StrId, fromIntId]))
    ]
in
  fun convertToInt ty = TyRefMap.lookup toInt (#2 (scalarTyRef ty))
  fun convertFromInt ty = TyRefMap.lookup fromInt (#2 (scalarTyRef ty))
end


val utf8TyRef : int * lid = (0, toList1 [stringId])
val stringTyRef : int * lid = (0, toList1 [stringId])
val word8VectorTyRef : int * lid = (0, toList1 [word8VectorStrId, vectorId])


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
    isOpt   : bool,
    ownXfer : bool
  }

type interface_info =
  {
    rootIRef   : interfaceref,
    iRef       : interfaceref,
    infoType   : InfoType.t,
    isOpt      : bool,
    ptrOwnXfer : bool option  (* NONE when non-pointer *)
  }

(* The ownership transfer flag is only present for a pointer.  The conditions
 * for a pointer and ownership transfer are combined into a single field
 * `ptrOwnXfer` that takes the following values:
 *
 *   NONE          non-pointer
 *   SOME false    pointer with ownership not transferred
 *   SOME true     pointer with ownership transferred
 *
 * The condition `isSome ptrOwnXfer` tests for a pointer.
 *
 * It is not always true that if a value is optionally null, then it must
 * be a pointer, i.e. `isOpt` does not always imply `isSome ptrOwnXfer`: for
 * a CALLBACK, `ptrOwnXfer` is `NONE` but it is possible that `isOpt` is true.
 * Therefore `isOpt` is not included as part of option type for `ptrOwnXfer`.
 *)

datatype array_length =
  ArrayLengthZeroTerminated
| ArrayLengthFixed of LargeInt.int         (* fixed length *)
| ArrayLengthParam of string * scalartype  (* parameter name and type *)

datatype info =
  IGTYPE     of gtype_info
| ISCALAR    of scalar_info
| IUTF8      of utf8_info
| IARRAY     of array_info
| IINTERFACE of interface_info

(**
 * For `{lengths, ...} : array_info`, `lengths` is the possible array length
 * types.  There must be one but there can be more than one because an array
 * can be both zero terminated and have a parameter that specifies its
 * length.  The first length is the one used.
 *) 
withtype array_info =
  {
    isOpt   : bool,
    ownXfer : bool,
    lengths : array_length list1,
    iRef    : interfaceref,
    elem    : info
  }

fun getBaseInfo info =
  case info of
    IARRAY {elem, ...} => getBaseInfo elem
  | _                  => info

fun addIRef (info, iRefs) =
  case info of
    IGTYPE {iRef as {scope, ...}, ...}     => (
      case scope of
        GLOBAL             => iRefs
      | LOCALINTERFACESELF => iRefs
      | _                  => insert (iRef, iRefs)
    )
  | ISCALAR _                              => iRefs
  | IUTF8 _                                => iRefs
  | IARRAY {iRef as {scope, ...}, ...}     => (
      case scope of
        GLOBAL             => iRefs
      | LOCALINTERFACESELF => iRefs
      | _                  => insert (iRef, iRefs)
    )
  | IINTERFACE {iRef as {scope, ...}, ...} => (
      case scope of
        GLOBAL             => iRefs
      | LOCALINTERFACESELF => iRefs
      | _                  => insert (iRef, iRefs)
    )

fun mkArrayLenExp length e =
  case length of
    ArrayLengthZeroTerminated => e
  | ArrayLengthFixed n        => ExpApp (e, mkIntConstExp n)
  | ArrayLengthParam (id, ty) =>
      let
        val lenIntExp = mkIdLNameExp id
        val lenExp =
          case convertToInt ty of
            SOME NONE           => lenIntExp
          | SOME (SOME convExp) => mkParenExp (ExpApp (convExp, lenIntExp))
          | NONE                => infoExcl (
              "conversion from SML type int not defined for "
               ^ scalarToString ty ^ " array length parameter"
            )
      in
        ExpApp (e, lenExp)
      end

val isPtrElem =
  fn
    IGTYPE _                   => NONE
  | ISCALAR _                  => NONE
  | IUTF8 _                    => SOME true
  | IARRAY _                   => SOME true
  | IINTERFACE {infoType, ...} =>
      let
        open InfoType
      in
        case infoType of
          FLAGS _           => NONE
        | ENUM _            => NONE
        | STRUCT structInfo =>
            let
              val structName = getName structInfo
              val structNamespace = BaseInfo.getNamespace structInfo
            in
              case getStructType (structNamespace, structName) of
                ValueRecord _ => NONE
              | _             => SOME false
            end 
        | _                 => SOME false
      end

fun makeCArrayStrId (elemStrId, isPtr, zeroTerminated) =
  concat [
    elemStrId,
    cStrId,
    case isPtr of SOME _ => ptrStrId | NONE => "",
    arrayStrId,
    if zeroTerminated then "" else nStrId
  ]

fun makeCArrayIRef functionNamespace optContainerName length elem =
  let
    val elemRef =
      case elem of
        IGTYPE {iRef, ...}                         => INTERFACE iRef
      | ISCALAR {ty, ...}                          => (
          NAME (gStrId ^ scalarStrId ty)
        )
      | IUTF8 {isOpt, ...}                         => (
          if isOpt
          then infoExcl "optional UTF8 as array element not supported"
          else
            NAME utf8StrId
        )
      | IARRAY {iRef, isOpt, ...}                  => (
          if isOpt
          then infoExcl "optional ARRAY as array element not supported"
          else INTERFACE iRef
        )
      | IINTERFACE {iRef, ...}                     => INTERFACE iRef

    val arrayNamespace =
      case elemRef of
        INTERFACE {namespace, ...} => namespace
      | NAME _                     => ""  (* arrayScope = GLOBAL *)

    val elemName =
      case elemRef of
        INTERFACE iRef => makeIRefNamespaceStrId iRef
      | NAME name      => name

    val isPtr = isPtrElem elem

    val zeroTerminated =
      case length of
        ArrayLengthZeroTerminated => true
      | _                         => false

    val arrayName = makeCArrayStrId (elemName, isPtr, zeroTerminated)

    val arrayScope =
      if arrayNamespace <> functionNamespace
      then GLOBAL
      else
        case optContainerName of
          NONE               => LOCALNAMESPACE
        | SOME containerName =>
            if arrayName = containerName
            then
              raise Fail (
                concat [
                  "generated name for C array interface ", arrayName,
                  " is already an interface in namespace ", arrayNamespace
                ]
              )
            else LOCALINTERFACEOTHER

    val arrayTy = SIMPLE

    val arrayRef =
      ARRAYREF {
        isPtr          = isPtr,
        zeroTerminated = zeroTerminated,
        elemRef        = elemRef
      }
    val arrayContainer = SOME arrayRef
  in
    {
      namespace = arrayNamespace,
      name      = arrayName,
      scope     = arrayScope,
      ty        = arrayTy,
      container = arrayContainer
    }
  end

fun boolToInt b = if b then 1 else 0

fun getArrayOwnXferDepth ownXferDepth elem =
  case elem of
    IGTYPE _                     => ownXferDepth
  | ISCALAR _                    => ownXferDepth
  | IUTF8 {ownXfer, ...}         => ownXferDepth + (boolToInt ownXfer)
  | IARRAY {ownXfer, elem, ...}  =>
      if ownXfer
      then getArrayOwnXferDepth (ownXferDepth + 1) elem
      else ownXferDepth
  | IINTERFACE {ptrOwnXfer, ...} =>
      case ptrOwnXfer of
        SOME ownXfer => ownXferDepth + (boolToInt ownXfer)
      | NONE         => ownXferDepth

datatype dir =
  IN
| OUT of bool  (* flag indicates caller-allocated *)
| INOUT

datatype parinfo =
  PIVOID
| PISOME of
    {
      name  : id,
      dir   : dir,
      array : {name : id, info : array_info option} option,
      info  : info
    }

(* In the value `PISOME {name = lenName, array, ...}`, `array` has the value
 *
 *   - `NONE`
 *       if the parameter is not an array length
 *
 *   - `SOME {name, info}`
 *       if the parameter `lenName` is the length of
 *         - the array parameter called `name`, if `name` is not empty
 *         - the array return value,            if `name` is empty
 *       where `info` is
 *
 *         - `SOME arrayInfo`
 *             if the array parameter `name` uses this length parameter
 *
 *         - `NONE`
 *             if this length parameter is not required, e.g. because the
 *             array is also zero-terminated
 *)


datatype retinfo =
  RIVOID
| RISOME of {info : info}


(* 
 * For signals, `getParInfo` and `getRetInfo` must not use TypeInfo.isPointer
 * due to <https://bugzilla.gnome.org/show_bug.cgi?id=646080>.  The parameter
 * `usePtrDefault` indicates whether default pointer use should be assumed
 * rather than using the c:type attribute, which is not present for signals.
 * Also, for functions, TypeInfo.isPointer is not used for nested types, e.g.
 * array element types, because the c:type attributes do not appear to be
 * reliable.
 *)

exception Void

fun getParInfo
  usePtrDefault
  repo
  functionNamespace
  optContainerName
  callableInfo
  argInfo =
  let
    val typeInfo = ArgInfo.getType argInfo
    val () =
      case TypeInfo.getTag typeInfo of
        TypeTag.VOID =>
          if
            if usePtrDefault
            then
              true
            else
              TypeInfo.isPointer typeInfo
                handle
                  Fail msg => infoExcl msg
          then infoExcl ptrForVoid
          else raise Void
      | _            => ()

    val direction = ArgInfo.getDirection argInfo
    val mayBeNull = ArgInfo.mayBeNull argInfo

    val ownershipTransfer = ArgInfo.getOwnershipTransfer argInfo
    val isCallerAllocates = ArgInfo.isCallerAllocates argInfo

    fun mkArgName argInfo = getName argInfo
    fun mkArgId argName = mkId (toLCC argName)

    val argName = mkArgName argInfo
    val argId = mkArgId argName

    val argDir =
      case direction of
        Direction.IN    => IN
      | Direction.OUT   => OUT isCallerAllocates
      | Direction.INOUT => INOUT

    local
      open Transfer
    in
      fun ptrOwnXferObjectInterface dir isPtr ownXfer nonPtrForX =
        if isPtr
        then
          case (dir, ownXfer) of
            (_,            NOTHING)    => SOME false
          | (NONE,         EVERYTHING) => SOME true
          | (SOME (OUT _), EVERYTHING) => SOME true
          | (SOME IN,      EVERYTHING) => infoExcl everythingForInPar
          | (SOME INOUT,   EVERYTHING) => infoExcl everythingForInOutPar
          | (_,            CONTAINER)  => infoExcl containerForInterface
        else
          infoExcl nonPtrForX
      val objectMsg = nonPtrForObject
      val interfaceMsg = nonPtrForInterface

      fun ptrOwnXferStructUnion dir isPtr ownXfer (nonPtrForXInPar, everythingForNonPtrX) =
        case (dir, isPtr, ownXfer) of
          (SOME IN,      false, NOTHING)    => infoExcl nonPtrForXInPar
        | (_,            false, NOTHING)    => NONE
        | (_,            true,  NOTHING)    => SOME false
        | (NONE,         true,  EVERYTHING) => SOME true
        | (SOME (OUT _), true,  EVERYTHING) => SOME true
        | (NONE,         false, EVERYTHING) => NONE
        | (SOME _,       false, EVERYTHING) => infoExcl everythingForNonPtrX
        | (SOME IN,      true,  EVERYTHING) => infoExcl everythingForInPar
        | (SOME INOUT,   true,  EVERYTHING) => infoExcl everythingForInOutPar
        | (_,            _,     CONTAINER)  => infoExcl containerForInterface
      val structMsg = (nonPtrForStructInPar, everythingForNonPtrStruct)
      val unionMsg = (nonPtrForUnionInPar, everythingForNonPtrUnion)

      fun ptrOwnXferFlagsEnum isPtr ptrForX =
        if isPtr
        then infoExcl ptrForX
        else NONE
      val flagsMsg = ptrForFlags
      val enumMsg = ptrForEnum
    end

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
                _               => notExpectedForArrayLen "INTERFACE"
            end
      end

    fun notExpected s = infoExcl ("type " ^ s ^ " not expected")
    fun notSupported s = infoExcl ("type " ^ s ^ " not supported")

    fun resolveType () () (dir, isOpt, ownXfer) typeInfo =
      let
        open TypeTag

        fun toScalarParInfo ty =
          if
            if usePtrDefault orelse dir = NONE  (* use default for nested type *)
            then
              false
            else
              TypeInfo.isPointer typeInfo
          then infoExcl (ptrForScalar scalarToString ty)
          else
            ISCALAR {
              ty    = ty
            }
      in
        case TypeInfo.getTag typeInfo of
          ERROR        => notExpected "ERROR"
        | GTYPE        =>
            let
              val iRef =
                makeTypeIRef functionNamespace optContainerName

              val gtypeInfo = {iRef = iRef}
            in
              IGTYPE gtypeInfo
            end
        | ARRAY        =>
            let
              open Transfer

              val () =
                if dir = SOME IN
                then
                  case ownXfer of
                    NOTHING    => ()
                  | CONTAINER  => infoExcl containerForInPar
                  | EVERYTHING => infoExcl everythingForInPar
                else ()

              val ownXfer' =
                case ownXfer of
                  CONTAINER => NOTHING
                | _         => ownXfer

              val () =
                case SOME (TypeInfo.getArrayType typeInfo) of
                  SOME ArrayType.C  => ()
                | SOME ty           => infoExcl (arrayTypeNotSupported ty)
                | NONE              => infoExcl noArrayTypeForArray

              val lengths =
                case TypeInfo.getArrayFixedSize typeInfo of
                  ~1 =>
                    let
                      val lengthsParam =
                        case TypeInfo.getArrayLength typeInfo of
                          ~1 => []
                        | n  =>
                            let
                              val argInfo = CallableInfo.getArg callableInfo n
                              val id = mkArgId (mkArgName argInfo)
                              val ty = resolveArrayLenType (ArgInfo.getType argInfo)
                            in
                              [ArrayLengthParam (id, ty)]
                            end

                      val lengthsZeroTerminated =
                        if TypeInfo.isZeroTerminated typeInfo
                        then [ArrayLengthZeroTerminated]
                        else []
                    in
                      (* `ArrayLengthZeroTerminated` takes precedence over
                       * `ArrayLengthParam _` for OUT parameters only. *)
                      toList1 (
                        case dir of
                          SOME (OUT _) => lengthsZeroTerminated @ lengthsParam
                        | _            => lengthsParam @ lengthsZeroTerminated
                      )
                        handle Empty => infoExcl "cannot determine array length"
                    end
                | n  => toList1 [ArrayLengthFixed n]
              val length = hd1 lengths

              val elemTypeInfo =
                case TypeInfo.getParamType typeInfo 0 of
                  SOME typeInfo => typeInfo
                | NONE          => infoExcl noTypeParamForArray

              val elem = resolveType () () (NONE, false, ownXfer') elemTypeInfo

              val iRef =
                case () of
                  () => makeCArrayIRef functionNamespace optContainerName length elem

              val arrayInfo = {
                isOpt   = isOpt,
                ownXfer = ownXfer <> NOTHING,
                lengths = lengths,
                iRef    = iRef,
                elem    = elem
              }
            in
              IARRAY arrayInfo
            end
        | GLIST        => notSupported "GLIST"
        | GSLIST       => notSupported "GSLIST"
        | GHASH        => notSupported "GHASH"
        | VOID         => notExpected "VOID"
        | BOOLEAN      => toScalarParInfo STBOOLEAN
        | INT8         => toScalarParInfo STINT8
        | UINT8        => toScalarParInfo STUINT8
        | INT16        => toScalarParInfo STINT16
        | UINT16       => toScalarParInfo STUINT16
        | INT32        => toScalarParInfo STINT32
        | UINT32       => toScalarParInfo STUINT32
        | INT64        => toScalarParInfo STINT64
        | UINT64       => toScalarParInfo STUINT64
        | FLOAT        => toScalarParInfo STFLOAT
        | DOUBLE       => toScalarParInfo STDOUBLE
        | FILENAME     =>
            let
              open Transfer

              val utf8Info = {
                isOpt   = isOpt,
                ownXfer =
                  case ownXfer of
                    NOTHING    => false
                  | EVERYTHING =>
                      if dir = SOME IN
                      then infoExcl everythingForInPar
                      else true
                  | CONTAINER  => infoExcl containerForFilename
              }
            in
              IUTF8 utf8Info
            end
        | UTF8         =>
            let
              open Transfer

              val utf8Info = {
                isOpt   = isOpt,
                ownXfer =
                  case ownXfer of
                    NOTHING    => false
                  | EVERYTHING =>
                      if dir = SOME IN
                      then infoExcl everythingForInPar
                      else true
                  | CONTAINER  => infoExcl containerForUtf8
              }
            in
              IUTF8 utf8Info
            end
        | UNICHAR      => toScalarParInfo STUNICHAR
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val () = checkInterfaceType interfaceInfo

              val interfaceTy = getIRefTy interfaceInfo

              val interfaceName = getName interfaceInfo
              val interfaceNamespace = BaseInfo.getNamespace interfaceInfo

              val iRef =
                case () of
                  () =>
                    let
                      val interfaceScope =
                        if interfaceNamespace <> functionNamespace
                        then GLOBAL
                        else
                          case optContainerName of
                            NONE               => LOCALNAMESPACE
                          | SOME containerName =>
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
                    val isPtr =
                      if usePtrDefault orelse dir = NONE  (* use default for nested type *)
                      then
                        case infoType of
                          OBJECT _    => true
                        | INTERFACE _ => true
                        | STRUCT _    => (
                            case dir of
                              SOME _ => true
                            | NONE   => (
                                case getStructType (interfaceNamespace, interfaceName) of
                                  ValueRecord _ => false
                                | _             => true
                              )
                          )
                        | UNION _     => true
                        | FLAGS _     => false
                        | ENUM _      => false
                        | _           => infoExcl (unsupportedInterface infoType)
                      else
                        TypeInfo.isPointer typeInfo

                    val (ptrOwnXfer, rootIRef) =
                      case infoType of
                        OBJECT objectInfo
                                    =>
                          (
                            ptrOwnXferObjectInterface dir isPtr ownXfer objectMsg,
                            getRootObjectIRef repo functionNamespace
                              optContainerName
                              (objectInfo, iRef)
                          )
                      | INTERFACE _ =>
                          (
                            ptrOwnXferObjectInterface dir isPtr ownXfer interfaceMsg,
                            makeInterfaceRootIRef functionNamespace
                              optContainerName
                          )
                      | STRUCT _    => (ptrOwnXferStructUnion dir isPtr ownXfer structMsg, iRef)
                      | UNION _     => (ptrOwnXferStructUnion dir isPtr ownXfer unionMsg, iRef)
                      | FLAGS _     => (ptrOwnXferFlagsEnum isPtr flagsMsg, iRef)
                      | ENUM _      => (ptrOwnXferFlagsEnum isPtr enumMsg, iRef)
                      | _           => infoExcl (unsupportedInterface infoType)

                    val interfaceInfo = {
                      rootIRef   = rootIRef,
                      iRef       = iRef,
                      infoType   = infoType,
                      isOpt      = isOpt,
                      ptrOwnXfer = ptrOwnXfer
                    }
                  in
                    IINTERFACE interfaceInfo
                  end
            end
              handle
                InfoExcl ie =>
                  raise InfoExcl (IEGrp [mkInfoExclHier (getInterface typeInfo) ie])
      end
        handle
          InfoExcl ie =>
            raise InfoExcl (IEGrp [mkInfoExclHier typeInfo ie])
  in
    PISOME {
      name  = argId,
      dir   = argDir,
      array = NONE,  (* updated by `updateParInfos` *)
      info  =
        resolveType () () (SOME argDir, mayBeNull, ownershipTransfer) typeInfo
    }
  end
    handle Void => PIVOID


(* For each array length parameter, check that its direction is compatible
 * and update its array info.
 *)

fun arrayLenIncompatibleDir (arrayParDir, arrayParInfo, lenDir, lenName) =
  let
    open HTextTree

    val dirToString =
      fn
        IN    => "IN"
      | OUT _ => "OUT"
      | INOUT => "INOUT"
  in
    (String.concat o toStrings) (
      seq [
        case arrayParDir of
          SOME arrayDir => concat [
            "array parameter ", #name arrayParInfo,
            " with direction ", dirToString arrayDir
          ]
        | NONE          => str "array return value",
        concat [
          " has corresponding length parameter ", lenName,
          " with incompatible direction ", dirToString lenDir
        ]
      ]
    )
  end

fun updateParInfos retInfo parInfos =
  let
    fun addLenArray name (arrayParDir, info, lenArrayInfos) =
      case info of
        IARRAY (arrayInfo as {lengths, ...}) => (
          case
            List.mapPartial (fn ArrayLengthParam x => SOME x | _ => NONE) (op :: lengths)
          of
            (lenName, _) :: _ =>
              let
                val info =
                  if hd1 lengths = ArrayLengthZeroTerminated
                  then NONE
                  else SOME arrayInfo
                val arrayParInfo = {name = name, info = info}
              in
                (lenName, arrayParDir, arrayParInfo) :: lenArrayInfos
              end
          | _                 => lenArrayInfos
        ) 
      | _                                    => lenArrayInfos

    fun addParLenArray (parInfo, lenArrayInfos) =
      case parInfo of
        PIVOID                        => lenArrayInfos
      | PISOME {name, dir, info, ...} => addLenArray name (SOME dir, info, lenArrayInfos)

    val initlenArrayInfos =
      case retInfo of
        RIVOID        => []
      | RISOME {info} => addLenArray "" (NONE, info, [])

    val lenArrayInfos = foldl addParLenArray initlenArrayInfos parInfos

    (* Currently it is required that an array parameter and its length parameter
     * have the same direction and that an array return value has an OUT length
     * parameter.  This is not always the case, e.g. g_io_channel_read_chars,
     * but such functions are currently unsupported.  
     *)
    fun isCompatibleDir (arrayParDir, lenDir) =
      case (arrayParDir, lenDir) of
        (SOME IN,      IN)    => true
      | (SOME (OUT _), OUT _) => true
      | (SOME INOUT,   INOUT) => true
      | (NONE,         OUT _) => true  (* return value must have OUT length parameter *)
      | _                     => false

    fun getArrayInfo (lenDir, lenName) =
      case List.find (fn (x, _, _) => x = lenName) lenArrayInfos of
        SOME (_, arrayParDir, arrayParInfo) =>
          if isCompatibleDir (arrayParDir, lenDir)
          then SOME arrayParInfo
          else
            infoExcl (arrayLenIncompatibleDir (arrayParDir, arrayParInfo, lenDir, lenName))
      | NONE                          => NONE

    fun update parInfo =
      case parInfo of
        PIVOID                        => PIVOID
      | PISOME {name, dir, info, ...} =>
          PISOME {
            name  = name,
            dir   = dir,
            array = getArrayInfo (dir, name),
            info  = info
          }
  in
    List.map update parInfos
  end


fun getRetInfo
  usePtrDefault
  repo
  functionNamespace
  optContainerName
  callableInfo =
  let
    val typeInfo = CallableInfo.getReturnType callableInfo
    val () =
      case TypeInfo.getTag typeInfo of
        TypeTag.VOID =>
          if
            (* Don't need a c:type attribute to determine pointer depth for
             * VOID tag, so no need to use default when `usePtrDefault`. *)
            TypeInfo.isPointer typeInfo
              handle
                Fail msg => infoExcl msg
          then infoExcl ptrForVoid
          else raise Void
      | _            => ()

    val mayReturnNull = CallableInfo.mayReturnNull callableInfo

    val ownershipTransfer = CallableInfo.getCallerOwns callableInfo

    fun mkArgName argInfo = getName argInfo
    fun mkArgId argName = mkId (toLCC argName)

    local
      open Transfer
    in
      fun ptrOwnXferObjectInterface isPtr ownXfer nonPtrForX =
        if isPtr
        then
          case ownXfer of
            NOTHING    => SOME false
          | EVERYTHING => SOME true
          | CONTAINER  => infoExcl containerForInterface
        else
          infoExcl nonPtrForX
      val objectMsg = nonPtrForObject
      val interfaceMsg = nonPtrForInterface

      fun ptrOwnXferStructUnion dir isPtr ownXfer (nonPtrForXRet, everythingForNonPtrX) =
        case (dir, isPtr, ownXfer) of
          (SOME (), false, NOTHING)    => infoExcl nonPtrForXRet
        | (NONE,    false, NOTHING)    => NONE
        | (_,       true,  NOTHING)    => SOME false
        | (_,       true,  EVERYTHING) => SOME true
        | (NONE,    false, EVERYTHING) => NONE
        | (SOME _,  false, EVERYTHING) => infoExcl everythingForNonPtrX
        | (_,       _,     CONTAINER)  => infoExcl containerForInterface
      val structMsg = (nonPtrForStructRet, everythingForNonPtrStruct)
      val unionMsg = (nonPtrForUnionRet, everythingForNonPtrUnion)

      fun ptrOwnXferFlagsEnum isPtr ptrForX =
        if isPtr
        then infoExcl ptrForX
        else NONE
      val flagsMsg = ptrForFlags
      val enumMsg = ptrForEnum
    end

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
        | INT8         => STINT8
        | UINT8        => STUINT8
        | INT16        => STINT16
        | UINT16       => STUINT16
        | INT32        => STINT32
        | UINT32       => STUINT32
        | INT64        => STINT64
        | UINT64       => STUINT64
        | FLOAT        => STFLOAT
        | DOUBLE       => STDOUBLE
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
                _               => notExpectedForArrayLen "INTERFACE"
            end
      end

    fun notExpected s = infoExcl ("type " ^ s ^ " not expected")
    fun notSupported s = infoExcl ("type " ^ s ^ " not supported")

    fun resolveType () () (dir, isOpt, ownXfer) typeInfo =
      let
        open TypeTag

        fun toScalarRetInfo ty =
          if
            if usePtrDefault orelse dir = NONE  (* use default for nested type *)
            then
              false
            else
              TypeInfo.isPointer typeInfo
          then infoExcl (ptrForScalar scalarToString ty)
          else
            ISCALAR {
              ty      = ty
            }
      in
        case TypeInfo.getTag typeInfo of
          ERROR        => notExpected "ERROR"
        | GTYPE        =>
            let
              val iRef =
                makeTypeIRef functionNamespace optContainerName

              val gtypeInfo = {iRef = iRef}
            in
              IGTYPE gtypeInfo
            end
        | ARRAY        =>
            let
              open Transfer

              val ownXfer' =
                case ownXfer of
                  CONTAINER => NOTHING
                | _         => ownXfer

              val () =
                case SOME (TypeInfo.getArrayType typeInfo) of
                  SOME ArrayType.C  => ()
                | SOME ty           => infoExcl (arrayTypeNotSupported ty)
                | NONE              => infoExcl noArrayTypeForArray

              val lengths =
                case TypeInfo.getArrayFixedSize typeInfo of
                  ~1 =>
                    let
                      val lengthsParam =
                        case TypeInfo.getArrayLength typeInfo of
                          ~1 => []
                        | n  =>
                            let
                              val argInfo = CallableInfo.getArg callableInfo n
                              val id = mkArgId (mkArgName argInfo)
                              val ty = resolveArrayLenType (ArgInfo.getType argInfo)
                            in
                              [ArrayLengthParam (id, ty)]
                            end

                      val lengthsZeroTerminated =
                        if TypeInfo.isZeroTerminated typeInfo
                        then [ArrayLengthZeroTerminated]
                        else []
                    in
                      (* `ArrayLengthZeroTerminated` takes precedence over
                       * `ArrayLengthParam _`. *)
                      toList1 (lengthsZeroTerminated @ lengthsParam)
                        handle Empty => infoExcl "cannot determine array length"
                    end
                | n  => toList1 [ArrayLengthFixed n]
              val length = hd1 lengths

              val elemTypeInfo =
                case TypeInfo.getParamType typeInfo 0 of
                  SOME typeInfo => typeInfo
                | NONE          => infoExcl noTypeParamForArray

              val elem = resolveType () () (NONE, false, ownXfer') elemTypeInfo

              val iRef =
                case () of
                  () => makeCArrayIRef functionNamespace optContainerName length elem

              val arrayInfo = {
                isOpt   = isOpt,
                ownXfer = ownXfer <> NOTHING,
                lengths = lengths,
                iRef    = iRef,
                elem    = elem
              }
            in
              IARRAY arrayInfo
            end
        | GLIST        => notSupported "GLIST"
        | GSLIST       => notSupported "GSLIST"
        | GHASH        => notSupported "GHASH"
        | VOID         => notExpected "VOID"
        | BOOLEAN      => toScalarRetInfo STBOOLEAN
        | INT8         => toScalarRetInfo STINT8
        | UINT8        => toScalarRetInfo STUINT8
        | INT16        => toScalarRetInfo STINT16
        | UINT16       => toScalarRetInfo STUINT16
        | INT32        => toScalarRetInfo STINT32
        | UINT32       => toScalarRetInfo STUINT32
        | INT64        => toScalarRetInfo STINT64
        | UINT64       => toScalarRetInfo STUINT64
        | FLOAT        => toScalarRetInfo STFLOAT
        | DOUBLE       => toScalarRetInfo STDOUBLE
        | FILENAME     =>
            let
              open Transfer

              val utf8Info = {
                isOpt   = isOpt,
                ownXfer =
                  case ownXfer of
                    NOTHING    => false
                  | EVERYTHING => true
                  | CONTAINER  => infoExcl containerForFilename
              }
            in
              IUTF8 utf8Info
            end
        | UTF8         =>
            let
              open Transfer

              val utf8Info = {
                isOpt   = isOpt,
                ownXfer =
                  case ownXfer of
                    NOTHING    => false
                  | EVERYTHING => true
                  | CONTAINER  => infoExcl containerForUtf8
              }
            in
              IUTF8 utf8Info
            end
        | UNICHAR      => toScalarRetInfo STUNICHAR
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val () = checkInterfaceType interfaceInfo

              val interfaceTy = getIRefTy interfaceInfo

              val interfaceName = getName interfaceInfo
              val interfaceNamespace = BaseInfo.getNamespace interfaceInfo

              val iRef =
                case () of
                  () =>
                    let
                      val interfaceScope =
                        if interfaceNamespace <> functionNamespace
                        then GLOBAL
                        else
                          case optContainerName of
                            NONE               => LOCALNAMESPACE
                          | SOME containerName =>
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
                    val isPtr =
                      if usePtrDefault orelse dir = NONE  (* use default for nested type *)
                      then
                        case infoType of
                          OBJECT _    => true
                        | INTERFACE _ => true
                        | STRUCT _    => (
                            case dir of
                              SOME _ => true
                            | NONE   => (
                                case getStructType (interfaceNamespace, interfaceName) of
                                  ValueRecord _ => false
                                | _             => true
                              )
                          )
                        | UNION _     => true
                        | FLAGS _     => false
                        | ENUM _      => false
                        | _           => infoExcl (unsupportedInterface infoType)
                      else
                        TypeInfo.isPointer typeInfo

                    val (ptrOwnXfer, rootIRef) =
                      case infoType of
                        OBJECT objectInfo
                                    =>
                          (
                            ptrOwnXferObjectInterface isPtr ownXfer objectMsg,
                            getRootObjectIRef repo functionNamespace
                              optContainerName
                              (objectInfo, iRef)
                          )
                      | INTERFACE _ =>
                          (
                            ptrOwnXferObjectInterface isPtr ownXfer interfaceMsg,
                            makeInterfaceRootIRef functionNamespace
                              optContainerName
                          )
                      | STRUCT _    => (ptrOwnXferStructUnion dir isPtr ownXfer structMsg, iRef)
                      | UNION _     => (ptrOwnXferStructUnion dir isPtr ownXfer unionMsg, iRef)
                      | FLAGS _     => (ptrOwnXferFlagsEnum isPtr flagsMsg, iRef)
                      | ENUM _      => (ptrOwnXferFlagsEnum isPtr enumMsg, iRef)
                      | _           => infoExcl (unsupportedInterface infoType)

                    val interfaceInfo = {
                      rootIRef   = rootIRef,
                      iRef       = iRef,
                      infoType   = infoType,
                      isOpt      = isOpt,
                      ptrOwnXfer = ptrOwnXfer
                    }
                  in
                    IINTERFACE interfaceInfo
                  end
            end
              handle
                InfoExcl ie =>
                  raise InfoExcl (IEGrp [mkInfoExclHier (getInterface typeInfo) ie])
      end
        handle
          InfoExcl ie =>
            raise InfoExcl (IEGrp [mkInfoExclHier typeInfo ie])
  in
    RISOME {
      info = resolveType () () (SOME (), mayReturnNull, ownershipTransfer) typeInfo
    }
  end
    handle Void => RIVOID


(* Specification *)

fun addSpecParInfo
  (makeInRefTy, makeOutRefTy)
  (parInfo, acc as (((inTys, outTys), tyVarIdx), iRefs)) =
  let
    fun mkOpt isOpt ty = if isOpt then optionTy ty else ty

    fun addInTy isElem tyMap tyRef =
      let
        val (ty, tyVarIdx') = makeInRefTy isElem (tyRef, tyVarIdx)
      in
        ((tyMap ty :: inTys, outTys), tyVarIdx')
      end

    fun addInOutTy isElem tyMap tyRef =
      let
        val (ty, tyVarIdx') = makeInRefTy isElem (tyRef, tyVarIdx)
        val isRetCondInit = false
        val ty' = tyMap ty
      in
        ((ty' :: inTys, (ty', isRetCondInit) :: outTys), tyVarIdx')
      end

    fun addOutTy isElem tyMap tyRef =
      let
        val (ty, tyVarIdx') = makeOutRefTy isElem (tyRef, tyVarIdx)
        val isRetCondInit = true
      in
        ((inTys, (tyMap ty, isRetCondInit) :: outTys), tyVarIdx')
      end

    fun addTy dir isElem tyMap tyRef =
      case dir of
        IN    => addInTy isElem tyMap tyRef
      | INOUT => addInOutTy isElem tyMap tyRef
      | OUT _ => addOutTy isElem tyMap tyRef

    fun addIRefTy dir isElem tyMap iRef (sigIRefs, extIRefs) =
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

        val ifTyRef = (
          numInterfaceRefTyVars iRef,
          makeInterfaceRefTyLongId iRef
        )
      in
        (addTy dir isElem tyMap ifTyRef, (sigIRefs', extIRefs'))
      end
  in
    case parInfo of
      PIVOID                                => acc
    | PISOME {array = SOME _, ...}          => acc
    | PISOME {dir, array = NONE, info, ...} =>
        let
          fun addInfo isElem tyMap info =
            case info of
              IGTYPE {iRef, ...}                 =>
                addIRefTy dir isElem tyMap iRef iRefs
            | ISCALAR {ty, ...}                  =>
                (addTy dir isElem tyMap (scalarTyRef ty), iRefs)
            | IUTF8 {isOpt, ...}                 =>
                (addTy dir isElem (mkOpt isOpt o tyMap) utf8TyRef, iRefs)
            | IARRAY {isOpt, iRef, ...}          =>
                addIRefTy dir isElem (mkOpt isOpt o tyMap) iRef iRefs
            | IINTERFACE {iRef, isOpt, ...}      =>
                addIRefTy dir isElem (mkOpt isOpt o tyMap) iRef iRefs
        in
          addInfo false I info
        end
  end


fun addSpecRetInfo
  makeOutRefTy
  (optConstructorIRef)
  (retInfo, (tyVarIdx, iRefs)) =
  let
    fun mkOpt isOpt ty = if isOpt then optionTy ty else ty

    fun mkTy isElem tyMap tyRef =
      let
        val (ty, tyVarIdx') = makeOutRefTy isElem (tyRef, tyVarIdx)
      in
        (tyMap ty, tyVarIdx')
      end

    fun mkIRefTy isElem tyMap iRef (sigIRefs, extIRefs) =
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

        val ifTyRef = (
          numInterfaceRefTyVars iRef,
          makeInterfaceRefTyLongId iRef
        )
      in
        (mkTy isElem tyMap ifTyRef, (sigIRefs', extIRefs'))
      end
  in
    case retInfo of
      RIVOID        => ((unitTy, tyVarIdx), iRefs)
    | RISOME {info} =>
        let
          fun addInfo isElem tyMap info =
            case info of
              IGTYPE {iRef, ...}                 => mkIRefTy isElem tyMap iRef iRefs
            | ISCALAR {ty, ...}                  => (mkTy isElem tyMap (scalarTyRef ty), iRefs)
            | IUTF8 {isOpt, ...}                 => (mkTy isElem (mkOpt isOpt o tyMap) utf8TyRef, iRefs)
            | IARRAY {isOpt, iRef, ...}          =>
                mkIRefTy isElem (mkOpt isOpt o tyMap) iRef iRefs
            | IINTERFACE {
                iRef,
                infoType,
                isOpt,
                ptrOwnXfer,
                ...
              }                                  =>
                let
                  val interfaceRetInfo = {
                    iRef       =
                      case (optConstructorIRef, infoType) of
                        (SOME constructorIRef, InfoType.OBJECT _)    => constructorIRef
                      | (SOME constructorIRef, InfoType.INTERFACE _) => constructorIRef
                      | _                                            => iRef,
                    infoType   = infoType,
                    isOpt      = isOpt,
                    ptrOwnXfer = ptrOwnXfer
                  }
                  val {iRef, isOpt, ...} = interfaceRetInfo
                in
                  mkIRefTy isElem (mkOpt isOpt o tyMap) iRef iRefs
                end
        in
          addInfo false I info
        end
  end


fun makeFunctionSpec
  repo
  vers
  (optContainerIRef : interfaceref option)
  (functionInfo, (iRefs, excls))
  : spec * ((interfaceref list * interfaceref list) * info_excl_hier list) =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol repo vers functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameId = mkId (toLCC functionName)
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo functionNamespace optContainerName functionInfo)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo functionNamespace optContainerName
        functionInfo

    val parInfos = updateParInfos retInfo parInfos


    (* For a method function, add an initial argument type for the interface
     * that contains this function. *)
    val tyVarIdx'0 = 0
    val (inParamTypeSelf, tyVarIdx'1) =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_METHOD)
      then
        case optContainerIRef of
          SOME containerIRef =>
            let
              val (selfTy, tyVarIdx'1) =
                makeIRefLocalTypeRef (makeRefVarTy false) (containerIRef, tyVarIdx'0)
            in
              (SOME selfTy, tyVarIdx'1)
            end
        | NONE               =>
            infoExcl "function outside interface has method flag set"
      else
        (NONE, tyVarIdx'0)
    val revInTys'1 = []
    val revOutTys'1 = []
    val iRefs'1 = iRefs

    (* Add types for the arguments and the return value. *)
    val (((revInTys'2, revOutTys'2), tyVarIdx'2), iRefs'2) =
      foldl
        (addSpecParInfo (makeRefVarTy, makeRefBaseTy))
        (((revInTys'1, revOutTys'1), tyVarIdx'1), iRefs'1)
        parInfos

    val optConstructorIRef =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_CONSTRUCTOR)
      then
        case optContainerIRef of
          SOME _ => optContainerIRef
        | NONE   =>
            infoExcl "function outside interface has constructor flag set"
      else
        NONE
    val ((retValTy, _), iRefs'3) =
      addSpecRetInfo
        makeRefBaseTy
        optConstructorIRef
        (retInfo, (tyVarIdx'2, iRefs'2))

    (* Construct curried function argument types with the form:
     *
     *   unit
     *     if L = 0 and not anySet (functionFlags, flags [ISMETHOD])
     *
     *   <selfType>
     *     if L = 0 and anySet (functionFlags, flags [ISMETHOD])
     *
     *   <selfType> (->) <inParamType[1]> * ... * <inParamType[L]>
     *     if L > 0 and anySet (functionFlags, flags [ISMETHOD])
     *
     *   <inParamType[1]> * ... * <inParamType[L]>
     *     if L > 0 and not anySet (functionFlags, flags [ISMETHOD])
     *
     * where
     *
     *   [<inParamType[1]> * ... * <inParamType[L]>] = rev revInTys'2
     *
     *   SOME <selfType> = inParamTypeSelf
     *)
    val argTys =
      case (inParamTypeSelf, rev revInTys'2) of
        (NONE,        [])         => [unitTy]
      | (SOME selfTy, [])         => [selfTy]
      | (SOME selfTy, op :: tys1) => [selfTy, mkProdTy1 tys1]
      | (NONE,        op :: tys1) => [mkProdTy1 tys1]

    val throws =
      FunctionInfoFlags.anySet (functionFlags, FunctionInfoFlags.THROWS)

    (* `revOutTys'2` contains out parameter types associated with
     * the caller-allocates flag for each out parameter. *)
    val retTy =
      case (revOutTys'2, throws) of
        ([],     false) => retValTy
      | _               =>
          let
            fun getTy (ty, _) = ty
            fun getCondTy (ty, isCond) = if isCond then SOME ty else NONE

            val (outParamTysCond, outParamTysUncond) =
              partitionRevMap (getCondTy, getTy) revOutTys'2
            val outParamTys = outParamTysCond @ outParamTysUncond

            val retTys =
              case (retInfo, throws, outParamTysCond) of
                (RIVOID, _,     [])        => outParamTys

              | (RIVOID, true,  _)         => outParamTys

              | (RISOME {info = ISCALAR {ty = STBOOLEAN, ...}},
                         true,  _)         => outParamTys

              | (_,      _,     [])        => retValTy :: outParamTys

              | (_,      true,  _)         => retValTy :: outParamTys

              | (RISOME {info = ISCALAR {ty = STBOOLEAN, ...}},
                         false, ty :: tys) =>
                  optionTy (mkProdTy1 (ty, tys)) :: outParamTysUncond

              | (RIVOID, false, _ :: _)    => outParamTys

              | (_,      false, _ :: _)    => retValTy :: outParamTys

               (*
                * If conditional OUT parameters are explicitly identifed and the
                * return value provides the condition, the last two cases would
                * be replaced by:
                *
              | (_,      false, _ :: _)     =>
                  infoExcl "non-BOOLEAN return type with \
                            \conditional OUT parameters"
                *)
          in
            mkProdTy0 retTys
          end

    val functionTy = foldr TyFun retTy argTys
  in
    (mkValSpec (functionNameId, functionTy), (iRefs'3, excls))
  end

(*
 *     val getType : unit -> <typeIRef>
 *)
fun getTypeSpec typeIRef =
  let
    val (typeRefTy, _) = makeIRefLocalTypeRef (makeRefBaseTy false) (typeIRef, 0)
  in
    mkValSpec (getTypeId, TyFun (unitTy, typeRefTy))
  end


(* High-level *)

(* `addParInfo` accumulates high-level function components in the parameter
 *
 *   `(js, ks, ls, ms, ns, iRefs, strDecs)`
 *
 * The lists `js`, `ks`, `ls, `ms` and `ns` accumulate the components of the
 * vectors of sizes J, K, L, N, M and L, respectively, in the codegen for
 * HighLevelFunction.
 *
 * `js`, `ks`, `ls`, `ms` and `ns` are built up in reverse.  After iterating
 * over all `parInfo` values, the final values are as follows:
 *
 *
 *   the j<th> element of `js` contains
 *
 *     (<withFun[j]>, <argVal[j]>)
 *
 *
 *   the k<th> element of `ks` contains
 *
 *     (<outParamExp[k]>, <isCondOut[k]>)
 *
 *
 *   the l<th> element of `ls` contains
 *
 *     <inParamName[l]>
 *
 *
 *   the m<th> element of `ms` contains
 *
 *     (<lenParamName[m]>, <lenParamExp[m]>)
 *
 *
 *   the n<th> element of `ns` contains
 *
 *     (<fromFun[n]>, <outParamName[n]>)
 *
 *
 * `iRefs` accumulates the references to interfaces for generating type
 * declarations as required by the signature and the corresponding where
 * clauses on the signature ascription in the structure.
 *
 * `strDecs` accumulates structure declarations for required array types
 * which are included at the start of the structure.
 *)

local
  datatype xfer =
    XferFlag of bool
  | XferDepth of int
  | XferNone

  fun withFunExp prefixIds {isRef, isDup, isNew, isOpt, isPtr, xfer} =
    let
      val refStr = if isRef then "Ref" else ""
      val dupStr = if isDup then "Dup" else ""
      val newStr = if isNew then "New" else ""
      val optStr = if isOpt then "Opt" else ""
      val ptrStr = if isPtr then "Ptr" else "Val"

      val withFunId =
        concat ["with", refStr, dupStr, newStr, optStr, ptrStr]
      val funExp = mkLIdLNameExp (prefixIds @ [withFunId])
    in
      case xfer of
        XferFlag b  => ExpApp (funExp, mkIdLNameExp (Bool.toString b))
      | XferDepth n => ExpApp (funExp, mkIntConstExp (LargeInt.fromInt n))
      | XferNone    => funExp
    end

  fun fromFunExp prefixIds {isOpt, xfer} =
    let
      val optStr = if isOpt then "Opt" else ""
      val ptrStr = if xfer <> XferNone then "Ptr" else "Val"

      val fromFunId = concat ["from", optStr, ptrStr]
      val funExp = mkLIdLNameExp (prefixIds @ [fromFunId])
    in
      case xfer of
        XferFlag b  => ExpApp (funExp, mkIdLNameExp (Bool.toString b))
      | XferDepth n => ExpApp (funExp, mkIntConstExp (LargeInt.fromInt n))
      | XferNone    => funExp
    end

  fun withFunGType (dir, {iRef, ...} : gtype_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]
    in
      withFunExp prefixIds {
        isRef = dir <> IN,
        isDup = false,
        isNew = false,
        isOpt = false,
        isPtr = false,
        xfer  = XferNone
      }
    end

  fun withFunScalar (dir, {ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, ffiStrId]
    in
      withFunExp prefixIds {
        isRef = dir <> IN,
        isDup = false,
        isNew = false,
        isOpt = false,
        isPtr = false,
        xfer  = XferNone
      }
    end

  fun withFunUtf8 (dir, {ownXfer, isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, ffiStrId]

      val isDup = dir = INOUT andalso ownXfer
    in
      withFunExp prefixIds {
        isRef = dir <> IN,
        isDup = isDup,
        isNew = false,
        isOpt = isOpt orelse case dir of OUT _ => true | _ => false,
        isPtr = true,
        xfer  =
          if isDup
          then XferDepth 1
          else XferNone
      }
    end

  fun withFunArray (dir, {ownXfer, isOpt, iRef, elem, ...} : array_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]

      val isDup = dir = INOUT andalso ownXfer
    in
      withFunExp prefixIds {
        isRef = dir <> IN,
        isDup = isDup,
        isNew = false,
        isOpt = isOpt orelse case dir of OUT _ => true | _ => false,
        isPtr = true,
        xfer  =
          if isDup
          then XferDepth (getArrayOwnXferDepth (boolToInt ownXfer) elem)
          else XferNone
      }
    end

  fun withFunInterface
    (dir, {iRef, infoType, ptrOwnXfer, isOpt, ...} : interface_info) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef [ffiStrId]
        | INTERFACE _ => prefixInterfaceStrId iRef [ffiStrId]
        | STRUCT _    => prefixInterfaceStrId iRef [ffiStrId]
        | _           =>
            if isSelf
            then [ffiStrId]
            else prefixInterfaceStrId iRef [ffiStrId]

 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]

      open InfoType
    in
      withFunExp prefixIds {
        isRef =
          dir <> IN andalso (
            case infoType of
              STRUCT _ => isSome ptrOwnXfer
            | _        => true
          ),
        isDup =
          case (infoType, dir) of
            (OBJECT _, INOUT) => true
          | (STRUCT _, INOUT) => true
          | _                 => false,
        isNew =
          case (dir, infoType) of
            (OUT isCallerAllocates, STRUCT _) =>
              isCallerAllocates andalso ptrOwnXfer = NONE
              (* Note that `isCallerAllocates` can be true when `ptrOwnXfer <> NONE`
               * for disguised structs, such as GdkAtom.  For information on disguised
               * structs, see https://bugzilla.gnome.org/show_bug.cgi?id=560248 . *)
          | _                                 => false,
        isOpt =
          case dir of
            IN    => isOpt
          | OUT _ => isSome ptrOwnXfer
          | INOUT => false,
        isPtr =
          case infoType of
            STRUCT _ => true
          | _        => isSome ptrOwnXfer,
        xfer  = XferNone
      }
    end

  fun fromFunGType ({iRef, ...} : gtype_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]
    in
      fromFunExp prefixIds {
        isOpt = false,
        xfer  = XferNone
      }
    end

  fun fromFunScalar ({ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, ffiStrId]
    in
      fromFunExp prefixIds {
        isOpt = false,
        xfer  = XferNone
      }
    end

  fun fromFunUtf8 (_, {ownXfer, isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, ffiStrId]
    in
      fromFunExp prefixIds {
        isOpt = isOpt,
        xfer  = XferDepth (boolToInt ownXfer)
      }
    end

  fun fromFunArray (_, {ownXfer, isOpt, iRef, elem, ...} : array_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]
    in
      fromFunExp prefixIds {
        isOpt = isOpt,
        xfer  = XferDepth (getArrayOwnXferDepth (boolToInt ownXfer) elem)
      }
    end

  fun fromFunInterface
    (isInOut, {iRef, infoType, ptrOwnXfer, isOpt, ...} : interface_info) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef [ffiStrId]
        | INTERFACE _ => prefixInterfaceStrId iRef [ffiStrId]
        | STRUCT _    => prefixInterfaceStrId iRef [ffiStrId]
        | _           =>
            if isSelf
            then [ffiStrId]
            else prefixInterfaceStrId iRef [ffiStrId]

 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]

      open InfoType
    in
      fromFunExp prefixIds {
        isOpt = isOpt,
        xfer  =
          case (infoType, isInOut, ptrOwnXfer) of
            (OBJECT _,    true,  _)         => XferFlag true
          | (INTERFACE _, true,  _)         => XferFlag true
          | (STRUCT _,    false, NONE)      => XferFlag true
          | (STRUCT _,    true,  _)         => XferFlag true
          | _                               =>
              case ptrOwnXfer of
                SOME ownXfer => XferFlag ownXfer
              | NONE         => XferNone
      }
    end

  fun argValGType (name, dir, {iRef, ...} : gtype_info) =
    case dir of
      OUT _ => mkLIdLNameExp (prefixInterfaceStrId iRef [nullId])
    | _     => mkIdLNameExp name

  fun argValScalar (name, dir, {ty, ...} : scalar_info) =
    case dir of
      OUT _ => mkLIdLNameExp [gStrId ^ scalarStrId ty, nullId]
    | _     => mkIdLNameExp name

  fun argValUtf8 (name, dir, {...} : utf8_info) =
    case dir of
      OUT _ => noneExp
    | _     => mkIdLNameExp name

  fun argValArray (name, dir, {...} : array_info) =
    case dir of
      OUT _ => noneExp
    | _     => mkIdLNameExp name

  fun argValInterface
    (name, dir, {iRef, infoType, ptrOwnXfer, ...} : interface_info) =
    case dir of
      OUT _ =>
        let
          open InfoType
        in
          case infoType of
            OBJECT _    => noneExp
          | INTERFACE _ => noneExp
          | STRUCT _    =>
              if isSome ptrOwnXfer
              then noneExp
              else ExpConst ConstUnit
          | FLAGS _     =>
              ExpApp (
                mkLIdLNameExp (prefixInterfaceStrId iRef [flagsId]),
                ExpList []
              )
          | ENUM _      => mkLIdLNameExp (prefixInterfaceStrId iRef ["null"])
          | _           =>
              infoExcl "initVal for unidentified INTERFACE not supported"
        end
    | _     => mkIdLNameExp name

  fun mkLenParamExp ty arrayInfo arrayName =
    let
      val {iRef, isOpt, ...} = arrayInfo
      val strId = makeIRefInterfaceOtherStrId iRef
      val lenIntExp =
        ExpApp (
          mkLIdLNameExp [strId, lengthId],
          mkIdLNameExp arrayName
        )
      val lenExp =
        case convertFromInt ty of
          SOME NONE           => lenIntExp
        | SOME (SOME convExp) => ExpApp (convExp, mkParenExp lenIntExp)
        | NONE                => infoExcl (
            "conversion to SML type int not defined for "
             ^ scalarToString ty ^ " array length parameter"
          )

    in
      if isOpt
      then
        let
          val somePat = PatPrefix (toList1 [someId], mkIdVarPat arrayName)
          val nonePat = mkConstPat (mkIdLNameConst noneId)
          val noneExp = mkLIdLNameExp [gStrId ^ scalarStrId ty, nullId]
        in
          ExpCase (
            mkIdLNameExp arrayName,
            toList1 [
              (somePat, lenExp),
              (nonePat, noneExp)
            ]
          )
        end
      else
        lenExp
    end
in
  fun addParInfo (parInfo, acc as (js, ks, ls, ms, ns, iRefs, structDeps)) =
    case parInfo of
      PIVOID                          => acc
    | PISOME {name, dir, array, info} =>
        let
          val (withFunExp, argValExp, fromFunExp, outParamName, outParamExp, structDeps'1) =
            case info of
              IGTYPE gtypeParInfo         =>
                let
                  val withFunExp = withFunGType (dir, gtypeParInfo)
                  val argValExp = argValGType (name, dir, gtypeParInfo)
                  fun fromFunExp () = fromFunGType gtypeParInfo
                  fun outParamName () = mkIdVarPat name
                  fun outParamExp () = mkIdLNameExp name
                in
                  (withFunExp, argValExp, fromFunExp, outParamName, outParamExp, structDeps)
                end
            | ISCALAR scalarParInfo       =>
                let
                  val withFunExp = withFunScalar (dir, scalarParInfo)
                  val argValExp = argValScalar (name, dir, scalarParInfo)
                  fun fromFunExp () = fromFunScalar scalarParInfo
                  fun outParamName () =
                    case array of
                      SOME {info = NONE, ...} => PatA APatU
                    | _                       => mkIdVarPat name
                  fun outParamExp () = mkIdLNameExp name
                in
                  (withFunExp, argValExp, fromFunExp, outParamName, outParamExp, structDeps)
                end
            | IUTF8 utf8ParInfo           =>
                let
                  val withFunExp = withFunUtf8 (dir, utf8ParInfo)
                  val argValExp = argValUtf8 (name, dir, utf8ParInfo)
                  fun fromFunExp () = fromFunUtf8 (dir = INOUT, utf8ParInfo)
                  fun outParamName () = mkIdVarPat name
                  fun outParamExp () = mkIdLNameExp name
                in
                  (withFunExp, argValExp, fromFunExp, outParamName, outParamExp, structDeps)
                end
            | IARRAY arrayParInfo         =>
                let
                  val {lengths, ...} = arrayParInfo
                  val length = hd1 lengths

                  val withFunExp = withFunArray (dir, arrayParInfo)
                  val argValExp = argValArray (name, dir, arrayParInfo)
                  fun fromFunExp () = fromFunArray (dir = INOUT, arrayParInfo)
                  fun outParamName () = mkIdVarPat name
                  fun outParamExp () = mkArrayLenExp length (mkIdLNameExp name)
                in
                  (withFunExp, argValExp, fromFunExp, outParamName, outParamExp, structDeps)
                end
            | IINTERFACE interfaceParInfo =>
                let
                  val withFunExp = withFunInterface (dir, interfaceParInfo)
                  val argValExp = argValInterface (name, dir, interfaceParInfo)
                  fun fromFunExp () =
                    fromFunInterface (dir = INOUT, interfaceParInfo)
                  fun outParamName () = mkIdVarPat name
                  fun outParamExp () = mkIdLNameExp name
                in
                  (withFunExp, argValExp, fromFunExp, outParamName, outParamExp, structDeps)
                end

          val js' = (withFunExp, argValExp) :: js
          val structDeps' = structDeps'1

          fun addK ks =
            case array of
              SOME _ => ks
            | NONE   => (outParamExp (), dir <> INOUT) :: ks
          fun addL ls =
            case array of
              SOME _ => ls
            | NONE   => mkIdVarAPat name :: ls
          fun addM ms =
            case array of
              SOME {
                name = arrayName,
                info = SOME arrayInfo
              }    => (
                case info of
                  ISCALAR {ty, ...} => (name, mkLenParamExp ty arrayInfo arrayName) :: ms
                | _                 => infoExcl "non-scalar length parameter"
              )
            | SOME {
                info = NONE,
                ...
              }    => raise Fail "unused length parameter not expected for IN/INOUT parameter"
            | NONE => ms
          fun addN ns = (fromFunExp (), outParamName ()) :: ns

          val (ks', ls', ms', ns') =
            case dir of
              OUT _ => (addK ks, ls,      ms,      addN ns)
            | INOUT => (addK ks, addL ls, addM ms, addN ns)
            | IN    => (ks,      addL ls, addM ms, ns)

          val iRefs' = addIRef (info, iRefs)
        in
          (js', ks', ls', ms', ns', iRefs', structDeps')
        end

  fun addRetInfo optConstructorIRef throws (retInfo, acc as (iRefs, structDeps)) =
    case retInfo of
      RIVOID        => (mkIdLNameExp "I", acc)
    | RISOME {info} =>
        let
          (* override type in `info` for interface constructor *)
          val info' =
            case info of
              IGTYPE _  => info
            | ISCALAR _ => info
            | IUTF8 _   => info
            | IARRAY _  => info
            | IINTERFACE {
                rootIRef,
                iRef,
                infoType,
                isOpt,
                ptrOwnXfer
              }         =>
                IINTERFACE {
                  rootIRef   = rootIRef,
                  iRef       =
                    case (optConstructorIRef, infoType) of
                      (SOME constructorIRef, InfoType.OBJECT _)    => constructorIRef
                    | (SOME constructorIRef, InfoType.INTERFACE _) => constructorIRef
                    | _                                            => iRef,
                  infoType   = infoType,
                  isOpt      = isOpt,
                  ptrOwnXfer = ptrOwnXfer
                }

          val (fromFunExp, structDeps') =
            case info' of
              IGTYPE gtypeParInfo                  =>
                let
                  val fromFunExp = fromFunGType gtypeParInfo
                in
                  (fromFunExp, structDeps)
                end
            | ISCALAR (scalarParInfo as {ty, ...}) =>
                let
                  val fromFunExp =
                    case (ty, throws) of
                      (STBOOLEAN, true) => mkIdLNameExp ignoreId
                    | _                 => fromFunScalar scalarParInfo
                in
                  (fromFunExp, structDeps)
                end
            | IUTF8 utf8ParInfo                    =>
                let
                  val fromFunExp = fromFunUtf8 (false, utf8ParInfo)
                in
                  (fromFunExp, structDeps)
                end
            | IARRAY arrayParInfo                  =>
                let
                  val fromFunExp = fromFunArray (false, arrayParInfo)
                in
                  (fromFunExp, structDeps)
                end
            | IINTERFACE interfaceParInfo          =>
                let
                  val fromFunExp = fromFunInterface (false, interfaceParInfo)
                in
                  (fromFunExp, structDeps)
                end

          val iRefs' = addIRef (info', iRefs)
        in
          (fromFunExp, (iRefs', structDeps'))
        end
end


fun withFunErr namespace optName =
  mkLIdLNameExp (
    prefixInterfaceStrId (makeErrorIRef namespace optName) [handleErrorId]
  )

fun argValErr (_ : lid list) =
  ExpList []


val retValId : id = "retVal"
val retValPat : pat = mkIdVarPat retValId
val retValExp : exp = mkIdLNameExp retValId

fun getRetValPat throws =
  fn
    RIVOID        => PatA (APatConst ConstUnit)
  | RISOME {info} =>
      case (info, throws) of
        (ISCALAR {ty = STBOOLEAN, ...}, true) => PatA (APatConst ConstUnit)
      | _                                     => retValPat

val getRetValExp =
  fn
    RIVOID        => ExpConst ConstUnit
  | RISOME {info} =>
      case info of
        IARRAY {lengths, ...} => mkArrayLenExp (hd1 lengths) retValExp
      | _                     => retValExp


val aInfixId = "&"
val aAInfixId = "&&"
val aARInfixId = "&&>"
val aAARInfixId = "&&&>"
val dDRInfixId = "-->"
val dDDRInfixId = "--->"

fun mkAExp (a, b) = ExpInfixApp (a, aInfixId, b)
fun mkAPat (a, b) = PatInfix (a, aInfixId, b)
fun mkAAExp (a, b) = ExpInfixApp (a, aAInfixId, b)
fun mkAARExp (a, b) = ExpInfixApp (a, aARInfixId, b)
fun mkAAARExp (a, b) = ExpInfixApp (a, aAARInfixId, b)
fun mkDDRExp (a, b) = ExpInfixApp (a, dDRInfixId, b)
fun mkDDDRExp (a, b) = ExpInfixApp (a, dDDRInfixId, b)


fun retValCondExp retValExp (es1 : exp list1) : exp =
  ExpCond (retValExp, someExp (mkTupleExp1 es1), noneExp)


fun makeFunctionStrDecHighLevel
  repo
  vers
  (optRootContainerIRef : (interfaceref * interfaceref) option)
  (functionInfo, ((iRefs, structDeps), excls))
  : strdec * ((interfaceref list * struct1 ListDict.t) * info_excl_hier list) =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol repo vers functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameLCC = toLCC functionName
    val functionNameUId = functionNameLCC ^ "_"
    val functionNameId = mkId functionNameLCC
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val (_, optContainerIRef) =
      case optRootContainerIRef of
        SOME (rootIRef, containerIRef) => (SOME rootIRef, SOME containerIRef)
      | NONE                           => (NONE, NONE)
    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo functionNamespace optContainerName functionInfo)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo functionNamespace optContainerName
        functionInfo

    val parInfos = updateParInfos retInfo parInfos


    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val (revJs'1, inParamNameSelf) =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_METHOD)
      then
        case optContainerIRef of
          SOME iRef =>
            let
              val withFun =
                mkLIdLNameExp (
                  prefixInterfaceStrId iRef [ffiStrId, withPtrId]
                )
              val argVal = mkIdLNameExp selfId
              val inParamAPat = mkIdVarAPat selfId
            in
              ([(withFun, argVal)], SOME inParamAPat)
            end
        | NONE      =>
            infoExcl "function outside interface has method flag set"
      else
        ([], NONE)
    val revKs'1 = []
    val revLs'1 = []
    val revMs'1 = []
    val revNs'1 = []
    val iRefs'1 = iRefs
    val structDeps'1 = structDeps

    (* Construct J, K, L, M, N vectors in forward pass over parameter infos.
     * As for a function spec, `iRefs` should be generated in a forwards
     * pass over the parameter infos so types appear in order of first
     * appearance. *)
    val (revJs'2, revKs'2, revLs'2, revMs'2, revNs'2, iRefs'2, structDeps'2) =
      foldl addParInfo
        (revJs'1, revKs'1, revLs'1, revMs'1, revNs'1, iRefs'1, structDeps'1)
        parInfos

    (* For a function that may raise an exception, add a final argument for
     * the GError out parameter. *)
    val revJs'3 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.THROWS)
      then
        (
          withFunErr functionNamespace optContainerName,
          argValErr []
        ) :: revJs'2
      else
        revJs'2

    val optConstructorIRef =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_CONSTRUCTOR)
      then
        case optContainerIRef of
          SOME _ => optContainerIRef
        | NONE   =>
            infoExcl "function outside interface has constructor flag set"
      else
        NONE

    val throws =
      FunctionInfoFlags.anySet (functionFlags, FunctionInfoFlags.THROWS)

    val (retFromFun, (iRefs'3, structDeps'3)) =
      addRetInfo optConstructorIRef throws (retInfo, (iRefs'2, structDeps'2))

    (* Construct curried function arguments with the form:
     *
     *   ()
     *     if L = 0 and not anySet (functionFlags, flags [ISMETHOD])
     *
     *   <self>
     *     if L = 0 and anySet (functionFlags, flags [ISMETHOD])
     *
     *   <self> (<inParamName[1]>, ..., <inParamName[L]>)
     *     if L > 0 and anySet (functionFlags, flags [ISMETHOD])
     *
     *   (<inParamName[1]>, ..., <inParamName[L]>)
     *     if L > 0 and not anySet (functionFlags, flags [ISMETHOD])
     *
     * where
     *
     *   [<inParamName[1]>, ..., <inParamName[L]>] = rev revLs'2
     *
     *   SOME <self> = inParamNameSelf
     *)
    val functionArgPats1 : apat list1 = toList1 (
      case (inParamNameSelf, rev revLs'2) of
        (NONE,      [])                  => [APatConst ConstUnit]
      | (SOME self, [])                  => [self]
      | (SOME self, op :: inParamNames1) => [self, mkTupleAPat1 inParamNames1]
      | (NONE,      op :: inParamNames1) => [mkTupleAPat1 inParamNames1]
    )

    (* Derive non-empty lists `revWithFuns1` and `revArgVals1`.  If
     *
     *   J = 0 and not anySet (functionFlags, flags [ISMETHOD, THROWS])
     *
     * then `revWithFuns1` is `I` and `revArgVals1` is `()`.
     *)
    val (revWithFuns1 : exp list1, revArgVals1 : exp list1) =
      unzip1 (getList1 (revJs'3, (iExp, ExpConst ConstUnit)))

    (* No need to handle N = 0 here: lists `revFromFuns` and `revOutParams` may
     * be empty.  `revOutParams` contains out parameter names associated with
     * the conditional output flag for each out parameter.
     *)
    val (revFromFuns, revOutParams) = ListPair.unzip revNs'2

    (* Construct
     *
     *   <fromFun[1]> && ... && <fromFun[N]> && <retFromFun>
     *)
    val fromFunsExp = foldl mkAAExp retFromFun revFromFuns

    (*
     *   [<withFunSelf> &&&>]
     *     <withFun[1]> &&&> ... &&&> <withFun[J]> [&&&> <withFunErr>]
     *)
    val withFunsExp = foldl1 mkAAARExp revWithFuns1

    (*
     *   [self &] <argVal[1]> & ... & <argVal[J]> [& <argValErr>]
     *)
    val argValsExp = foldl1 mkAExp revArgVals1

    (*
     *   ([<withFunSelf> &&&>]
     *      <withFun[1]> &&&> ... &&&> <withFun[J]> [&&&> <withFunErr>]
     *     ---> <fromFun[1]> && ... && <fromFun[N]> && <retFromFun>)
     *     <functionName>_
     *     ([self &] <argVal[1]> & ... & <argVal[J]> [& <argValErr>])
     *)
    val functionCoreExp =
      ExpApp (
        ExpApp (
          mkParenExp (mkDDDRExp (withFunsExp, fromFunsExp)),
          mkIdLNameExp functionNameUId
        ),
        case revArgVals1 of
          (_,        _ :: _) => mkParenExp argValsExp
        | (ExpApp _, [])     => mkParenExp argValsExp
        | _                  => argValsExp
      )

    (* Construct the function body with the form:
     *
     *   let
     *     val <lenParamName[1]> = <lenParamExp[1]>
     *     ...
     *     val <lenParamName[M]> = <lenParamExp[M]>
     *
     *     val <outParamName[1]> & ... & <outParamName[N]> & <retValPat> =
     *       <functionCoreExp>
     *   in
     *     <retExp>
     *   end
     *     if N + M > 0, i.e. N > 0 or M > 0
     *
     *
     *   <functionCoreExp>
     *     otherwise, i.e. N = 0 and M = 0
     *)
    val functionExp =
      case (revOutParams, revMs'2) of
        ([], []) => functionCoreExp
      | _        =>
          let
            fun getNameExp (exp, _) = exp
            fun getCondNameExp (exp, isCond) =
              if isCond then SOME exp else NONE

            val (outParamExpsCond, outParamExpsUncond) =
              partitionRevMap (getCondNameExp, getNameExp) revKs'2
            val outParamExps = outParamExpsCond @ outParamExpsUncond

            val retValPat = getRetValPat throws retInfo
            val retValExp = getRetValExp retInfo
            val retExps =
              case (retInfo, throws, outParamExpsCond) of
                (RIVOID, _,     [])      => outParamExps

              | (RIVOID, true,  _)       => outParamExps

              | (RISOME {info = ISCALAR {ty = STBOOLEAN, ...}},
                         true,  _)       => outParamExps

              | (_,      _,     [])      => retValExp :: outParamExps

              | (_,      true,  _)       => retValExp :: outParamExps

              | (RISOME {info = ISCALAR {ty = STBOOLEAN, ...}},
                         false, e :: es) =>
                  retValCondExp retValExp (e, es) :: outParamExpsUncond

              | (RIVOID, false, _ :: _)  => outParamExps

              | (_,      false, _ :: _)  => retValExp :: outParamExps

               (*
                * If conditional OUT parameters are explicitly identifed and the
                * return value provides the condition, the last two cases would
                * be replaced by:
                *
              | (_,      false, _ :: _)  =>
                  infoExcl "non-BOOLEAN return type with \
                            \conditional out parameters"
                *)

            val retExp =
              case retExps of
                []      => ExpConst ConstUnit
              | e :: [] => e
              | e :: es => ExpParen (e, es)

            val pat = foldl mkAPat retValPat revOutParams
            val decs'1 = [DecVal (toList1 [([], false, pat, functionCoreExp)])]
            val decs'2 = revMapAppend mkIdValDec (revMs'2, decs'1)
          in
            ExpLet (mkDecs decs'2, toList1 [retExp])
          end
  in
    (
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (NameId functionNameId, functionArgPats1),
                NONE,
                functionExp
              )
            ]
          ]
        )
      ),
      ((iRefs'3, structDeps'3), excls)
    )
  end

(*
 *     val getType = (I ---> GObjectType.C.fromVal) getType_
 *)
val getTypeStrDecHighLevel =
  StrDecDec (
    mkIdValDec (
      getTypeId,
      ExpApp (
        mkParenExp (
          mkDDDRExp (iExp, mkLIdLNameExp ["GObjectType", ffiStrId, fromValId])
        ),
        mkIdLNameExp getTypeUId
      )
    )
  )



(* Low-level - common *)

datatype dir = In | Out
datatype low_level_spec =
  VAL
| PTR of {optDir : dir option, isOpt : bool}
| REF of {isInOut : bool, isOpt : bool} option



(* Low-level - Poly/ML *)

(* `callPolyMLFFIExp functionSymbol (parConvs, retConv)` constructs
 * a Poly/ML low-level function call expression as follows:
 *
 *   call
 *     (getSymbol "<functionSymbol>")
 *     (<parConvs> --> <retConv>)
 *)
fun callPolyMLFFIExp functionSymbol (parConvs, retConv) =
  ExpApp (
    ExpApp (
      mkIdLNameExp callId,
      mkParenExp (
        ExpApp (
          mkIdLNameExp getSymbolId,
          ExpConst (ConstString functionSymbol)
        )
      )
    ),
    mkParenExp (mkDDRExp (parConvs, retConv))
  )


local
  (*
   * Value conversions:
   *   <A>.cVal
   *   <A>.cRef
   *
   * Pointer conversions:
   *   <A>.c<Opt>Ptr
   *   <A>.cOut<Opt>Ref
   *   <A>.cInOut<Opt>Ref
   *
   * Array types:
   *   <A>.cIn<Opt>Ptr
   *   <A>.cOut<Opt>Ptr
   *   <A>.cOut<Opt>Ref
   *   <A>.cInOut<Opt>Ref
   *)
  fun convId spec =
    case spec of
      VAL                         => "cVal"
    | PTR {optDir, isOpt}         =>
        let
          val dirStr =
            case optDir of
              NONE     => ""
            | SOME In  => "In"
            | SOME Out => "Out"
          val optStr = if isOpt then "Opt" else ""
        in
          concat ["c", dirStr, optStr, "Ptr"]
        end
    | REF NONE                    => "cRef"
    | REF (SOME {isInOut, isOpt}) =>
        let
          val inOutStr = if isInOut then "InOut" else "Out"
          val optStr = if isOpt then "Opt" else ""
        in
          concat ["c", inOutStr, optStr, "Ref"]
        end
  fun convExp prefixIds spec = mkLIdLNameExp (prefixIds @ [convId spec])

  val retVoidConv = cVoidConv

  fun parGTypeConv (dir, {iRef, ...} : gtype_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [polyMLStrId]
    in
      convExp prefixIds (
        if dir <> IN
        then
          REF NONE
        else
          VAL
      )
    end

  fun retGTypeConv ({iRef, ...} : gtype_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [polyMLStrId]
    in
      convExp prefixIds VAL
    end

  fun parScalarConv (dir, {ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, polyMLStrId]
    in
      convExp prefixIds (
        if dir <> IN
        then
          REF NONE
        else
          VAL
      )
    end

  fun retScalarConv ({ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, polyMLStrId]
    in
      convExp prefixIds VAL
    end

  fun parUtf8Conv (dir, {isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, polyMLStrId]
    in
      convExp prefixIds (
        if dir <> IN
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else
          PTR {
            optDir = SOME In,
            isOpt  = isOpt
          }
      )
    end

  fun retUtf8Conv ({isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, polyMLStrId]
    in
      convExp prefixIds (
        PTR {
          optDir = SOME Out,
          isOpt  = isOpt
        }
      )
    end

  fun parArrayConv (dir, {isOpt, iRef, ...} : array_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [polyMLStrId]
    in
      convExp prefixIds (
        if dir <> IN
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else
          PTR {
            optDir = SOME In,
            isOpt  = isOpt
          }
      )
    end

  fun retArrayConv ({isOpt, iRef, ...} : array_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [polyMLStrId]
    in
      convExp prefixIds (
        PTR {
          optDir = SOME Out,
          isOpt  = isOpt
        }
      )
    end

  fun parInterfaceConv
    (dir, {iRef, infoType, ptrOwnXfer, isOpt, ...} : interface_info) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef [polyMLStrId]
        | INTERFACE _ => prefixInterfaceStrId iRef [polyMLStrId]
        | STRUCT _    => prefixInterfaceStrId iRef [polyMLStrId]
        | _           =>
            if isSelf
            then [polyMLStrId]
            else prefixInterfaceStrId iRef [polyMLStrId]
 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef [polyMLStrId]

      open InfoType
    in
      convExp prefixIds (
        if dir <> IN andalso isSome ptrOwnXfer
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          if dir <> IN
          then
            REF NONE
          else
            VAL
        else
          PTR {
            optDir = NONE,
            isOpt  = isOpt andalso isSome ptrOwnXfer
          }
      )
    end

  fun retInterfaceConv
    ({iRef, infoType, isOpt, ...} : interface_info) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef [polyMLStrId]
        | INTERFACE _ => prefixInterfaceStrId iRef [polyMLStrId]
        | STRUCT _    => prefixInterfaceStrId iRef [polyMLStrId]
        | _           =>
            if isSelf
            then [polyMLStrId]
            else prefixInterfaceStrId iRef [polyMLStrId]

 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef [polyMLStrId]

      open InfoType
    in
      convExp prefixIds (
        if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          VAL
        else
          PTR {
            optDir = NONE,
            isOpt  = isOpt
          }
      )
    end
in
  val makeConvId = convId
  val makeConv = convExp

  fun addParInfo (parInfo, acc) =
    case parInfo of
      PIVOID                  => acc
    | PISOME {dir, info, ...} =>
        case info of
          IGTYPE gtypeParInfo   =>
            let
              val convExp = parGTypeConv (dir, gtypeParInfo)
            in
              convExp :: acc
            end
        | ISCALAR scalarParInfo =>
            let
              val convExp = parScalarConv (dir, scalarParInfo)
            in
              convExp :: acc
            end
        | IUTF8 utf8ParInfo =>
            let
              val convExp = parUtf8Conv (dir, utf8ParInfo)
            in
              convExp :: acc
            end
        | IARRAY arrayParInfo =>
            let
              val convExp = parArrayConv (dir, arrayParInfo)
            in
              convExp :: acc
            end
        | IINTERFACE interfaceParInfo =>
            let
              val convExp = parInterfaceConv (dir, interfaceParInfo)
            in
              convExp :: acc
            end

  fun addRetInfo retInfo =
    case retInfo of
      RIVOID        => retVoidConv
    | RISOME {info} =>
        case info of
          IGTYPE gtypeRetInfo         => retGTypeConv gtypeRetInfo
        | ISCALAR scalarRetInfo       => retScalarConv scalarRetInfo
        | IUTF8 utf8RetInfo           => retUtf8Conv utf8RetInfo
        | IARRAY arrayInfo            => retArrayConv arrayInfo
        | IINTERFACE interfaceRetInfo => retInterfaceConv interfaceRetInfo

  fun parSelfConv iRef =
    convExp
      (prefixInterfaceStrId iRef [polyMLStrId])
      (
        PTR {
          optDir = NONE,
          isOpt  = false
        }
      )

  fun parErrConv namespace optName =
    convExp
      (prefixInterfaceStrId (makeErrorIRef namespace optName) [polyMLStrId])
      (
        REF (
          SOME {
            isInOut = false,
            isOpt   = true
          }
        )
      )
end


fun makeFunctionStrDecLowLevelPolyML
  repo
  vers
  (optRootContainerIRef : (interfaceref * interfaceref) option)
  (functionInfo, excls)
  : strdec * info_excl_hier list =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol repo vers functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameId = toLCC functionName ^ "_"
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val (_, optContainerIRef) =
      case optRootContainerIRef of
        SOME (rootIRef, containerIRef) => (SOME rootIRef, SOME containerIRef)
      | NONE                           => (NONE, NONE)
    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo functionNamespace optContainerName functionInfo)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo functionNamespace optContainerName
        functionInfo

    val parInfos = updateParInfos retInfo parInfos

    val functionSymbolStr = FunctionInfo.getSymbol functionInfo

    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val revParConvs'1 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_METHOD)
      then
        case optContainerIRef of
          SOME iRef => [parSelfConv iRef]
        | NONE      =>
            infoExcl "function outside interface has method flag set"
      else
        []

    (* Construct reverse list of J parameter conversions in forward pass over
     * parameter infos. *)
    val revParConvs'2 = foldl addParInfo revParConvs'1 parInfos

    (* For a function that may raise an exception, add a final argument for
     * the GError out parameter. *)
    val revParConvs'3 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.THROWS)
      then
        parErrConv functionNamespace optContainerName :: revParConvs'2
      else
        revParConvs'2

    val retConv = addRetInfo retInfo

    (* `revParConvs1 : exp list1` is
     *
     *   <paramConvErr>, <paramConv[J]>, ..., <paramConv[1]>, <selfConv>
     *     if J > 0 and anySet (FunctionFlags, ISMETHOD)
     *              and anySet (FunctionFlags, THROWS)
     *
     *   <paramConv[J]>, ..., <paramConv[1]>, <selfConv>
     *     if J > 0 and anySet (FunctionFlags, ISMETHOD)
     *              and not anySet (FunctionFlags, THROWS)
     *
     *   <paramConvErr>, <paramConv[J]>, ..., <paramConv[1]>
     *     if J > 0 and not anySet (FunctionFlags, ISMETHOD)
     *              and anySet (FunctionFlags, THROWS)
     *
     *   <paramConv[J]>, ..., <paramConv[1]>
     *     if J > 0 and not anySet (FunctionFlags, ISMETHOD)
     *              and not anySet (FunctionFlags, THROWS)
     *
     *   <paramConvErr>
     *     if J = 0 and anySet (FunctionFlags, THROWS)
     *
     *   cVoid
     *     if J = 0 and not anySet (FunctionFlags, THROWS)
     *)
    val revParConvs1 : exp list1 = getList1 (revParConvs'3, cVoidConv)

    val parConvs = foldl1 mkAARExp revParConvs1

    (* Construct the function body with the form:
     *
     *   call
     *     (getSymbol "<function_symbol>")
     *     (<parConvs> --> <retConv>)
     *)
    val functionExp =
      callPolyMLFFIExp
        functionSymbolStr
        (parConvs, retConv)
  in
    (
      StrDecDec (mkIdValDec (functionNameId, functionExp)),
      excls
    )
  end

(*
 *     val getType_ =
 *       call
 *         (getSymbol "<getTypeSymbol>")
 *         (cVoid --> GObjectType.PolyML.cVal);
 *)
fun getTypeStrDecLowLevelPolyML getTypeSymbol =
  let
    val parConvs = cVoidConv
    val retConv = makeConv ["GObjectType", polyMLStrId] VAL
  in
    StrDecDec (
      mkIdValDec (
        getTypeUId,
        callPolyMLFFIExp getTypeSymbol (parConvs, retConv)
      )
    )
  end


(* Low-level - MLton *)

(* `callMLtonFFIExp functionSymbol (parProdTys, retTy)` constructs a MLton
 * low-level function call expression as follows:
 *
 *
 *   fn <xProd[1]> & ... & <xProd[N]> =>
 *     (_import "<symbol>" : <parTy[1]> * ... * <parTy[M]> -> <retTy>;)
 *     (x<1>, ..., x<M>)
 *
 *     if N > 1
 *
 *
 *   _import "<symbol>" : <parTy[1]> * ... * <parTy[M]> -> <retTy>;
 *
 *     if N = 1
 *
 *
 *   _import "<symbol>" : unit -> <retTy>;
 *
 *     if N = 0
 *
 *
 * where
 *
 *
 *   N = length parProdTys
 *
 *
 *   xProd[n]
 *     is defined as follows, for some m:
 *
 *       x<m>
 *         if parProdTys[n] is <parTy[m]>
 *
 *       (x<m>, ..., x<m + p>)
 *         if parProdTys[n] is <parTy[m]> * ... * <parTy[m + p]>
 *
 *
 *   symbol
 *     is defined as follows:
 *
 *       mlton_<functionSymbol>
 *         if there exists an i such that parProdTys[i] is a tuple type
 *
 *       <functionSymbol>
 *
 *
 * and
 *
 *
 *   parTy[n], for 1 <= n <= N, is not a tuple type
 *
 *
 *   xProd[1]
 *     has one of the forms
 *
 *       x1
 *
 *       (x1, ...)
 *
 *
 *   xProd[n + 1]
 *     for n >= 1, has one of the forms
 *
 *       x<m + 1>
 *
 *       (x<m + 1>, ...)
 *
 *         where m is such that xProd[n] has one of the forms
 *
 *           x<m>
 *
 *           (..., x<m>)
 *
 *
 *   xProd[N]
 *     has one of the forms
 *
 *       x<M>
 *
 *       (..., x<M>)
 *)

local
  fun addProdTy (prodTy, (acc, revTuplePats, existsProdTy)) =
    let
      val tys = destProdTy0 prodTy

      fun addTy (ty, ((exps, tys, n), pats)) =
        let
          val id = "x" ^ Int.toString n
          val exps' = mkIdLNameExp id :: exps
          val tys' = ty :: tys
          val pats' = mkIdVarPat id :: pats
        in
          ((exps', tys', n + 1), pats')
        end

      val (acc', revPats') = foldl addTy (acc, []) tys

      val tuplePat =
        case rev revPats' of
          []          => PatA (APatConst ConstUnit)
        | op :: pats1 => mkTuplePat1 pats1

      val existsProdTy' =
        case prodTy of
          TyProd _ => true
        | _        => existsProdTy
    in
      (acc', tuplePat :: revTuplePats, existsProdTy')
    end
in
  fun callMLtonFFIExp functionSymbol (parProdTys, retTy) =
    let
      val ((revExps, revTys, _), revTuplePats, existsProdTy) =
        foldl addProdTy (([], [], 1), [], false) parProdTys;

      val symbol =
        if existsProdTy
        then "mlton_" ^ functionSymbol
        else functionSymbol
    in
      case (rev revExps, rev revTys, revTuplePats) of
        (op :: exps1, parTys, op :: (revTuplePats1 as (_, _ :: _))) =>
          (* Wrap with fn ... => ... when `revTuplePats` has two or more
           * elements.  Note that a match `op :: exps1` always occurs when
           * `revTuplePats` has at least one element, so its only purpose
           * is to give `exps1 : list1`.
           *)
          let
            val tupleExp = mkTupleExp1 exps1
            val pat = foldl1 mkAPat revTuplePats1
            val exp =
              ExpApp (
                mkParenExp (mkMLtonImportExp symbol (parTys, retTy)),
                tupleExp
              )
          in
            ExpFn (toList1 [(pat, exp)])
          end
      | (_,           parTys, _)                                    =>
          mkMLtonImportExp symbol (parTys, retTy)

    end
end

(*
val exp = callMLtonFFIExp "testfun" ([], unitTy);
val exp = callMLtonFFIExp "testfun" ([unitTy], unitTy);
val exp = callMLtonFFIExp "testfun" ([boolTy, boolTy], unitTy);
val exp = callMLtonFFIExp "testfun" ([mkProdTy0 [boolTy, boolTy]], unitTy);
val exp = callMLtonFFIExp "testfun" ([mkProdTy0 [boolTy, boolTy], boolTy], unitTy);

HVTextTree.V.app (fn () => print "\n", print) (HVTextTree.toV (PrettyPrint.fmtExp (HTextTree.str "") exp));
*)


local
  (*
   * Value types:
   *   <A>.val_
   *   <A>.ref_
   *
   * Pointer types:
   *   <opt> <A>.p
   *   (<inopt>, <outopt>) <A>.r
   *
   * Array types:
   *   <opt> <A>.in_p
   *   <opt> <A>.out_p
   *   (<inopt>, <outopt>) <A>.r
   *)
  local
    fun mltonStructId prefixIds id =
      case List.rev prefixIds of
        "FFI" :: revIds => List.rev (id :: "MLton" :: revIds)
      | _               => raise Fail "mltonStructId requires struct called \"FFI\""

    fun mkOptTy prefixIds isOpt =
      (if isOpt then prefixOptTy else prefixNonOptTy) prefixIds
  in
    (* `<A>.MLton.p1 * <opt> <A>.MLton.p2`
     *
     *   where <opt> is
     *     <A>.FFI.opt
     *       if `isOpt`
     *
     *     <A>.FFI.non_opt
     *       otherwise
     *)
    fun arrayPtrTy prefixIds isOpt =
      mkProdTy0 [
        TyRef ([], toList1 (mltonStructId prefixIds "p1")),
        TyRef ([mkOptTy prefixIds isOpt], toList1 (mltonStructId prefixIds "p2"))
      ]

    (* `<A>.MLton.r1 * (<inopt>, <outopt>) <A>.MLton.r2`
     *
     *   where <inopt> is
     *     <A>.FFI.opt
     *       if `isOpt orelse not isInOut`
     *
     *     <A>.FFI.non_opt
     *       otherwise
     *
     *   where <outopt> is
     *     <A>.FFI.opt
     *       if `isOpt`
     *
     *     <A>.FFI.non_opt
     *       otherwise
     *)
    fun arrayRefTy prefixIds isInOut isOpt =
      mkProdTy0 [
        TyRef ([], toList1 (mltonStructId prefixIds "r1")),
        TyRef (
          [
            mkOptTy prefixIds (isOpt orelse not isInOut),
            mkOptTy prefixIds isOpt
          ],
          toList1 (mltonStructId prefixIds "r2")
        )
      ]
  end

  fun typeTy isArrayPar prefixIds spec =
    let
      val ty =
        case spec of
          VAL                         => mkLIdTy (prefixIds @ ["val_"])
        | PTR {optDir, isOpt}         =>
            if isArrayPar
            then
              arrayPtrTy prefixIds isOpt
            else
              let
                val dirStr =
                  case optDir of
                    NONE     => ""
                  | SOME In  => "in_"
                  | SOME Out => "out_"
                val ty = (if isOpt then prefixOptTy else prefixNonOptTy) prefixIds
              in
                TyRef ([ty], toList1 (prefixIds @ [concat [dirStr, "p"]]))
              end
        | REF NONE                    => mkLIdTy (prefixIds @ ["ref_"])
        | REF (SOME {isInOut, isOpt}) =>
            if isArrayPar
            then
              arrayRefTy prefixIds isInOut isOpt
            else
              let
                val isInOpt = isOpt orelse not isInOut
                val isOutOpt = isOpt

                val tys'0 = []
                val tys'1 =
                  case isOutOpt of
                    false => prefixNonOptTy prefixIds :: tys'0
                  | true  => prefixOptTy prefixIds :: tys'0
                val tys'2 =
                  case isInOpt of
                    false => prefixNonOptTy prefixIds :: tys'1
                  | true  => prefixOptTy prefixIds :: tys'1
              in
                TyRef (tys'2, toList1 (prefixIds @ ["r"]))
              end
    in
      ty
    end

  val retVoidType = unitTy

  fun parGTypeType (dir, {iRef, ...} : gtype_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]
    in
      typeTy false prefixIds (
        if dir <> IN
        then
          REF NONE
        else
          VAL
      )
    end

  fun retGTypeType ({iRef, ...} : gtype_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]
    in
      typeTy false prefixIds VAL
    end

  fun parScalarType (dir, {ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, ffiStrId]
    in
      typeTy false prefixIds (
        if dir <> IN
        then
          REF NONE
        else
          VAL
      )
    end

  fun retScalarType ({ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, ffiStrId]
    in
      typeTy false prefixIds VAL
    end

  fun parUtf8Type (dir, {isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, ffiStrId]
    in
      typeTy true prefixIds (
        if dir <> IN
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else
          PTR {
            optDir = SOME In,
            isOpt  = isOpt
          }
      )
    end

  fun retUtf8Type ({isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, ffiStrId]
    in
      typeTy false prefixIds (
        PTR {
          optDir = SOME Out,
          isOpt  = isOpt
        }
      )
    end

  fun parArrayType (dir, {isOpt, iRef, ...} : array_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]
    in
      typeTy true prefixIds (
        if dir <> IN
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else
          PTR {
            optDir = SOME In,
            isOpt  = isOpt
          }
      )
    end

  fun retArrayType ({isOpt, iRef, ...} : array_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]
    in
      typeTy false prefixIds (
        PTR {
          optDir = SOME Out,
          isOpt  = isOpt
        }
      )
    end

  fun parInterfaceType
    (dir, {iRef, infoType, ptrOwnXfer, isOpt, ...} : interface_info) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef [ffiStrId]
        | INTERFACE _ => prefixInterfaceStrId iRef [ffiStrId]
        | STRUCT _    => prefixInterfaceStrId iRef [ffiStrId]
        | _           =>
            if isSelf
            then [ffiStrId]
            else prefixInterfaceStrId iRef [ffiStrId]
 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]

      open InfoType
    in
      typeTy false prefixIds (
        if dir <> IN andalso isSome ptrOwnXfer
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          if dir <> IN
          then
            REF NONE
          else
            VAL
        else
          PTR {
            optDir = NONE,
            isOpt  = isOpt andalso isSome ptrOwnXfer
          }
      )
    end

  fun retInterfaceType
    ({iRef, infoType, isOpt, ...} : interface_info) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef [ffiStrId]
        | INTERFACE _ => prefixInterfaceStrId iRef [ffiStrId]
        | STRUCT _    => prefixInterfaceStrId iRef [ffiStrId]
        | _           =>
            if isSelf
            then [ffiStrId]
            else prefixInterfaceStrId iRef [ffiStrId]
 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]

      open InfoType
    in
      typeTy false prefixIds (
        if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          VAL
        else
          PTR {
            optDir = NONE,
            isOpt  = isOpt
          }
      )
    end
in
  val makeLowLevelTy = typeTy

  fun addParInfo (parInfo, acc) =
    case parInfo of
      PIVOID                  => acc
    | PISOME {dir, info, ...} =>
        case info of
          IGTYPE gtypeParInfo         =>
            let
              val typeTy = parGTypeType (dir, gtypeParInfo)
            in
              typeTy :: acc
            end
        | ISCALAR scalarParInfo       =>
            let
              val typeTy = parScalarType (dir, scalarParInfo)
            in
              typeTy :: acc
            end
        | IUTF8 utf8ParInfo           =>
            let
              val typeTy = parUtf8Type (dir, utf8ParInfo)
            in
              typeTy :: acc
            end
        | IARRAY arrayParInfo         =>
            let
              val typeTy = parArrayType (dir, arrayParInfo)
            in
              typeTy :: acc
            end
        | IINTERFACE interfaceParInfo =>
            let
              val typeTy = parInterfaceType (dir, interfaceParInfo)
            in
              typeTy :: acc
            end

  fun addRetInfo retInfo =
    case retInfo of
      RIVOID        => retVoidType
    | RISOME {info} =>
        case info of
          IGTYPE gtypeRetInfo         => retGTypeType gtypeRetInfo
        | ISCALAR scalarRetInfo       => retScalarType scalarRetInfo
        | IUTF8 utf8RetInfo           => retUtf8Type utf8RetInfo
        | IARRAY arrayRetInfo         => retArrayType arrayRetInfo
        | IINTERFACE interfaceRetInfo => retInterfaceType interfaceRetInfo

  fun parSelfType iRef =
    typeTy
      false
      (prefixInterfaceStrId iRef [ffiStrId])
      (
        PTR {
          optDir = NONE,
          isOpt  = false
        }
      )

  fun parErrType namespace optName =
    typeTy
      false
      (prefixInterfaceStrId (makeErrorIRef namespace optName) [ffiStrId])
      (
        REF (
          SOME {
            isInOut = false,
            isOpt   = true
          }
        )
      )
end


fun makeFunctionStrDecLowLevelMLton
  repo
  vers
  (optRootContainerIRef : (interfaceref * interfaceref) option)
  (functionInfo, excls)
  : strdec * info_excl_hier list =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol repo vers functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameId = toLCC functionName ^ "_"
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val (_, optContainerIRef) =
      case optRootContainerIRef of
        SOME (rootIRef, containerIRef) => (SOME rootIRef, SOME containerIRef)
      | NONE                           => (NONE, NONE)
    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo functionNamespace optContainerName functionInfo)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo functionNamespace optContainerName
        functionInfo

    val parInfos = updateParInfos retInfo parInfos

    val functionSymbolStr = FunctionInfo.getSymbol functionInfo

    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val revParTypes'1 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_METHOD)
      then
        case optContainerIRef of
          SOME iRef => [parSelfType iRef]
        | NONE      =>
            infoExcl "function outside interface has method flag set"
      else
        []

    (* Construct reverse list of J parameter conversions in forward pass over
     * parameter infos. *)
    val revParTypes'2 = foldl addParInfo revParTypes'1 parInfos

    (* For a function that may raise an exception, add a final argument for
     * the GError out parameter. *)
    val revParTypes'3 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.THROWS)
      then
        parErrType functionNamespace optContainerName :: revParTypes'2
      else
        revParTypes'2

    val retType = addRetInfo retInfo

    (* `revParTypes : exp list` is
     *
     *   [<parTypeErr>, <parType[J]>, ..., <parType[1]>, <selfType>]
     *     if J > 0 and anySet (FunctionFlags, ISMETHOD)
     *              and anySet (FunctionFlags, THROWS)
     *
     *   [<parType[J]>, ..., <parType[1]>, <selfType>]
     *     if J > 0 and anySet (FunctionFlags, ISMETHOD)
     *              and not anySet (FunctionFlags, THROWS)
     *
     *   [<parTypeErr>, <parType[J]>, ..., <parType[1]>]
     *     if J > 0 and not anySet (FunctionFlags, ISMETHOD)
     *              and anySet (FunctionFlags, THROWS)
     *
     *   [<parType[J]>, ..., <parType[1]>]
     *     if J > 0 and not anySet (FunctionFlags, ISMETHOD)
     *              and not anySet (FunctionFlags, THROWS)
     *
     *   [<parTypeErr>]
     *     if J = 0 and anySet (FunctionFlags, THROWS)
     *
     *   []
     *     if J = 0 and not anySet (FunctionFlags, THROWS)
     *)
    val parTypes = rev revParTypes'3

    (* Construct the function body *)
    val functionExp = callMLtonFFIExp functionSymbolStr (parTypes, retType)
  in
    (
      StrDecDec (mkIdValDec (functionNameId, functionExp)),
      excls
    )
  end


(*
 *     val getType_ =
 *       _import "<getTypeSymbol>" : unit -> GObjectType.C.val_;
 *)
fun getTypeStrDecLowLevelMLton getTypeSymbol =
  StrDecDec (
    mkIdValDec (
      getTypeUId,
      callMLtonFFIExp getTypeSymbol ([], mkLIdTy ["GObjectType", ffiStrId, valId])
    )
  )


(* Low-level - common *)

fun mkPolyMLFFILocalStrDec strDecs =
  StrDecLocal (
    mkStrDecs [
      StrDecDec (DecOpen (toList1 [toList1 [polyMLFFIStrId]]))
    ],
    mkStrDecs strDecs
  )

fun addFunctionStrDecsLowLevel
  (getNMethods, getMethod)
  isPolyML
  repo
  vers
  addInitStrDecs
  optRootContainerIRef =
  if isPolyML
  then
    fn (containerInfo, (strDecs, excls)) =>
      let
        val acc'1 =
          revMapInfosWithExcls
            getNMethods
            getMethod
            (makeFunctionStrDecLowLevelPolyML repo vers optRootContainerIRef)
            (containerInfo, ([], excls))
        val (localStrDecs'2, excls'2) = addInitStrDecs isPolyML acc'1
      in
        case localStrDecs'2 of
          _ :: _ => (mkPolyMLFFILocalStrDec localStrDecs'2 :: strDecs, excls'2)
        | _      => (strDecs, excls'2)
      end
  else
    addInitStrDecs isPolyML o
      revMapInfosWithExcls
        getNMethods
        getMethod
        (makeFunctionStrDecLowLevelMLton repo vers optRootContainerIRef)
