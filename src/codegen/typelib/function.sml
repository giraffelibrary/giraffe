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

val containerForNonPtrArrayOutPar =
  "ownership transfer CONTAINER for OUT parameter with \
  \non-pointer ARRAY type not supported"

val everythingForNonPtrArrayOutPar =
  "ownership transfer EVERYTHING for OUT parameter with \
  \non-pointer ARRAY type not supported"

val everythingForNonPtrFilenameOutPar =
  "ownership transfer EVERYTHING for OUT parameter with \
  \non-pointer FILENAME type not supported"

val everythingForNonPtrStructOutPar =
  "ownership transfer EVERYTHING for OUT parameter with \
  \non-pointer STRUCT type not supported"

val everythingForNonPtrUnionOutPar =
  "ownership transfer EVERYTHING for OUT parameter with \
  \non-pointer UNION type not supported"

val nonPtrForArrayInPar =
  "non-pointer C type for ARRAY type not supported"

val nonPtrForUtf8InPar =
  "non-pointer C type for UTF8 type not supported"

val nonPtrForFilenameInPar =
  "non-pointer C type for FILENAME type not supported"

val nonPtrForObject =
  "non-pointer C type for OBJECT type not supported"

val nonPtrForInterface =
  "non-pointer C type for INTERFACE type not supported"

val nonPtrForStructInPar =
  "non-pointer C type for STRUCT type not supported"

val nonPtrForUnionInPar =
  "non-pointer C type for UNION type not supported"

val nonPtrForUtf8OutPar =
  "non-pointer C type for UTF8 type not supported"

val nonPtrForFilenameOutPar =
  "non-pointer C type for FILENAME type not supported"

val nonPtrForArrayRet =
  "non-pointer C type for ARRAY type not supported"

val nonPtrForUtf8Ret =
  "non-pointer C type for UTF8 type not supported"

val nonPtrForFilenameRet =
  "non-pointer C type for FILENAME type not supported"

val nonPtrForStructRet =
  "non-pointer C type for STRUCT type not supported"

val nonPtrForUnionRet =
  "non-pointer C type for UNION type not supported"

val nonPtrForNestedArray =
  "non-pointer C type for ARRAY type that is the element \
     \ type of a container should not be possible"

val nonPtrForNestedUtf8 =
  "non-pointer C type for UTF8 type that is the element \
     \ type of a container should not be possible"

val nonPtrForNestedFilename =
  "non-pointer C type for FILENAME type that is the element \
     \ type of a container should not be possible"

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
    isOpt      : bool,
    isPtr      : bool,
    xferOwn    : bool
  }

type interface_info =
  {
    rootIRef   : interfaceref,
    iRef       : interfaceref,
    infoType   : InfoType.t,
    isOpt      : bool,
    isPtr      : bool,
    xferOwn    : bool
  }

(* In most cases, the ownership transfer flag is only required for a pointer.
 * However, for a parameter with direction `INOUT` that is not a pointer, the
 * ownership transfer flag is still required.  Therefore `isPtr` and
 * `xferOwn` are separate state.
 *
 * It is not always true that if a value is optionally null, then it must
 * be a pointer, i.e. `isOpt` does not always imply `isPtr`: for a
 * CALLBACK, `isPtr` is false but it is possible that `isOpt` is true.
 * Therefore `isOpt` and `isPtr` are separate state.
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
    isOpt      : bool,
    isPtr      : bool,
    xferOwn    : bool,
    lengths    : array_length list1,
    iRef       : interfaceref,
    elem       : info
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

fun mkArrayLenExp length =
  case length of
    ArrayLengthZeroTerminated => NONE
  | ArrayLengthFixed n        => SOME (mkIntConstExp n)
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
        SOME lenExp
      end

fun mkArrayLenAppExp length e =
  case mkArrayLenExp length of
    SOME lenExp => ExpApp (e, lenExp)
  | NONE        => e

fun isPtrElem repo vers =
  fn
    IGTYPE _                   => false
  | ISCALAR _                  => false
  | IUTF8 _                    => true
  | IARRAY _                   => true
  | IINTERFACE {infoType, ...} =>
      let
        open InfoType
      in
        case infoType of
          FLAGS _           => false
        | ENUM _            => false
        | STRUCT structInfo => (
            case getStructType repo vers structInfo of
              ValueRecord _ => false
            | _             => true
          )
        | _                 => true
      end

fun makeCArrayStrId (elemStrId, isPtr, zeroTerminated) =
  concat [
    elemStrId,
    cStrId,
    if isPtr then ptrStrId else "",
    arrayStrId,
    if zeroTerminated then "" else nStrId
  ]

fun makeCArrayIRef repo vers functionNamespace optContainerName length elem =
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

    val isPtr = isPtrElem repo vers elem

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

fun getArrayOwnXferDepth ownXferDepth elem =
  case elem of
    IGTYPE _                           => ~1
  | ISCALAR _                          => ~1
  | IUTF8 {isPtr, xferOwn, ...}        => (
      case (isPtr, xferOwn) of
        (true,  true)  => ~1
      | (true,  false) => ownXferDepth
      | (false, _)     => ~1
    )
  | IARRAY {isPtr, xferOwn, elem, ...} => (
      case (isPtr, xferOwn) of
        (true,  true)  => getArrayOwnXferDepth (ownXferDepth + 1) elem
      | (true,  false) => ownXferDepth
      | (false, _)     => ~1
    )
  | IINTERFACE {isPtr, xferOwn, ...}   => (
      case (isPtr, xferOwn) of
        (true,  true)  => ~1
      | (true,  false) => ownXferDepth
      | (false, _)     => ~1
    )

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
  vers
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
      fun xferOwnArray dir isPtr ownXfer
        (
          nonPtrForXInPar,
          containerForNonPtrXOutPar,
          everythingForNonPtrXOutPar
        ) =
        case (dir, isPtr, ownXfer) of
          (SOME IN,      false, _)          => infoExcl nonPtrForXInPar
        | (SOME (OUT _), false, CONTAINER)  => infoExcl containerForNonPtrXOutPar
        | (SOME (OUT _), false, EVERYTHING) => infoExcl everythingForNonPtrXOutPar
        | (_,            _,     NOTHING)    => false
        | (_,            _,     CONTAINER)  => true
        | (_,            _,     EVERYTHING) => true
      val arrayMsg =
        (
          nonPtrForArrayInPar,
          containerForNonPtrArrayOutPar,
          everythingForNonPtrArrayOutPar
        )

      fun xferOwnUtf8Filename dir isPtr ownXfer
        (
          containerForX,
          nonPtrForXInPar,
          nonPtrForXOutPar
        ) =
        case (dir, isPtr, ownXfer) of
          (_,            _,     CONTAINER)  => infoExcl containerForX
        | (SOME IN,      false, _)          => infoExcl nonPtrForXInPar
        | (SOME (OUT _), false, _)          => infoExcl nonPtrForXOutPar
        | (_,            _,     NOTHING)    => false
        | (_,            _,     EVERYTHING) => true
      val utf8Msg =
        (
          containerForUtf8,
          nonPtrForUtf8InPar,
          nonPtrForUtf8OutPar
        )
      val filenameMsg =
        (
          containerForFilename,
          nonPtrForFilenameInPar,
          nonPtrForFilenameOutPar
        )

      fun xferOwnObjectInterface isPtr ownXfer nonPtrForX =
        if isPtr
        then
          case ownXfer of
            NOTHING    => false
          | EVERYTHING => true
          | CONTAINER  => infoExcl containerForInterface
        else
          infoExcl nonPtrForX
      val objectMsg = nonPtrForObject
      val interfaceMsg = nonPtrForInterface

      fun xferOwnStructUnion dir isPtr ownXfer
        (
          nonPtrForXInPar,
          everythingForNonPtrXOutPar
        ) =
        case (dir, isPtr, ownXfer) of
          (SOME IN,      false, NOTHING)    => infoExcl nonPtrForXInPar
        | (SOME IN,      false, EVERYTHING) => infoExcl nonPtrForXInPar
        | (SOME (OUT _), false, EVERYTHING) => infoExcl everythingForNonPtrXOutPar
        | (_,            _,     CONTAINER)  => infoExcl containerForInterface
        | (_,            _,     NOTHING)    => false
        | (_,            _,     EVERYTHING) => true
      val structMsg =
        (
          nonPtrForStructInPar,
          everythingForNonPtrStructOutPar
        )
      val unionMsg =
        (
          nonPtrForUnionInPar,
          everythingForNonPtrUnionOutPar
        )

      fun xferOwnFlagsEnum isPtr ptrForX =
        if isPtr
        then infoExcl ptrForX
        else false  (* not used *)
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

    fun resolveType () () (dir, mayBeNull, ownXfer) typeInfo =
      let
        open TypeTag

        fun toScalarParInfo ty =
          if
            if usePtrDefault orelse dir = NONE  (* use default for nested type *)
            then
              false
            else
              TypeInfo.isPointer typeInfo
          then
            infoExcl (ptrForScalar scalarToString ty)
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

              val () =
                case SOME (TypeInfo.getArrayType typeInfo) of
                  SOME ArrayType.C  => ()
                | SOME ty           => infoExcl (arrayTypeNotSupported ty)
                | NONE              => infoExcl noArrayTypeForArray

              val isPtr =
                if usePtrDefault orelse dir = NONE  (* use default for nested type *)
                then
                  true
                else
                  TypeInfo.isPointer typeInfo

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

              val xferOwn = xferOwnArray dir isPtr ownXfer arrayMsg
 
              val elemOwnXfer =
                case ownXfer of
                  CONTAINER => NOTHING
                | _         => ownXfer

              val elemTypeInfo =
                case TypeInfo.getParamType typeInfo 0 of
                  SOME typeInfo => typeInfo
                | NONE          => infoExcl noTypeParamForArray

              val elem =
                resolveType
                  ()
                  ()
                  (NONE, false, elemOwnXfer)
                  elemTypeInfo

              val iRef =
                case () of
                  () =>
                    makeCArrayIRef
                      repo
                      vers
                      functionNamespace
                      optContainerName
                      length
                      elem

              val arrayInfo = {
                isOpt      = isOpt,
                isPtr      = isPtr,
                xferOwn    = xferOwn,
                lengths    = lengths,
                iRef       = iRef,
                elem       = elem
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

              val isPtr =
                if usePtrDefault orelse dir = NONE  (* use default for nested type *)
                then
                  true
                else
                  TypeInfo.isPointer typeInfo

              val isOpt =
                isPtr andalso mayBeNull

              val xferOwn = xferOwnUtf8Filename dir isPtr ownXfer filenameMsg
 
              val utf8Info = {
                isOpt      = isOpt,
                isPtr      = isPtr,
                xferOwn    = xferOwn
              }
            in
              IUTF8 utf8Info
            end
        | UTF8         =>
            let
              open Transfer

              val isPtr =
                if usePtrDefault orelse dir = NONE  (* use default for nested type *)
                then
                  true
                else
                  TypeInfo.isPointer typeInfo

              val isOpt =
                isPtr andalso mayBeNull

              val xferOwn = xferOwnUtf8Filename dir isPtr ownXfer utf8Msg
 
              val utf8Info = {
                isOpt      = isOpt,
                isPtr      = isPtr,
                xferOwn    = xferOwn
              }
            in
              IUTF8 utf8Info
            end
        | UNICHAR      => toScalarParInfo STUNICHAR
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val () = checkInterfaceType repo vers interfaceInfo

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
                    (* `getStructType` must be called unconditionally for a
                     * struct to ensure that a parameter whose type is an
                     * unsupported struct is excluded. *)
                    val isStructPtr =
                      case infoType of
                        STRUCT structInfo => (
                          case getStructType repo vers structInfo of
                            ValueRecord _ => false
                          | _             => true
                        )
                      | UNION unionInfo   => (
                          checkUnionInterfaceType repo vers unionInfo;
                          false
                        )
                      | _                 => false

                    val isPtr =
                      if usePtrDefault orelse dir = NONE  (* use default for nested type *)
                      then
                        case infoType of
                          OBJECT _          => true
                        | INTERFACE _       => true
                        | STRUCT _          => (
                            case dir of
                              SOME _ => true
                            | NONE   => isStructPtr
                          )
                        | UNION _           => true
                        | FLAGS _           => false
                        | ENUM _            => false
                        |       _           => infoExcl (unsupportedInterface infoType)
                      else
                        TypeInfo.isPointer typeInfo

                    val isOpt =
                      isPtr andalso mayBeNull

                    val (xferOwn, rootIRef) =
                      case infoType of
                        OBJECT objectInfo
                                    =>
                          (
                            xferOwnObjectInterface isPtr ownXfer objectMsg,
                            getRootObjectIRef repo functionNamespace
                              optContainerName
                              (objectInfo, iRef)
                          )
                      | INTERFACE _ =>
                          (
                            xferOwnObjectInterface isPtr ownXfer interfaceMsg,
                            makeInterfaceRootIRef functionNamespace
                              optContainerName
                          )
                      | STRUCT _    => (xferOwnStructUnion dir isPtr ownXfer structMsg, iRef)
                      | UNION _     => (xferOwnStructUnion dir isPtr ownXfer unionMsg, iRef)
                      | FLAGS _     => (xferOwnFlagsEnum isPtr flagsMsg, iRef)
                      | ENUM _      => (xferOwnFlagsEnum isPtr enumMsg, iRef)
                      | _           => infoExcl (unsupportedInterface infoType)

                    val interfaceInfo = {
                      rootIRef   = rootIRef,
                      iRef       = iRef,
                      infoType   = infoType,
                      isOpt      = isOpt,
                      isPtr      = isPtr,
                      xferOwn    = xferOwn
                    }
                  in
                    IINTERFACE interfaceInfo
                  end
            end
              handle
                InfoExcl ie =>
                  raise InfoExcl (IEGrp [mkInfoExclHier (SOME typeInfo) (getInterface typeInfo) ie])
      end
        handle
          InfoExcl ie =>
            raise InfoExcl (IEGrp [mkInfoExclHier NONE typeInfo ie])

    val info =
      resolveType
        ()
        ()
        (SOME argDir, mayBeNull, ownershipTransfer)
        typeInfo
  in
    PISOME {
      name  = argId,
      dir   = argDir,
      array = NONE,  (* updated by `updateParInfos` *)
      info  = info
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

    (* For array parameter or return value, another parameter may provide its
     * length provided it has a compatible direction.  The direction is
     * compatible if one of the following conditions is satisfied:
     *  1. for an array parameter, the length parameter has the same direction
     *  2. for an array return value, the length parameter has direction OUT
     *  3. for an OUT array parameter, the length parameter has direction IN
     * In cases 1 and 2, the other parameter is compatible and treated as the
     * length parameter.  In case 3, the other parameter is compatible but is
     * treated as an ordinary parameter.
     *)
    fun isLengthParam (arrayParDir, lenDir) =
      case (arrayParDir, lenDir) of
        (SOME IN,      IN)    => SOME true   (* compatible: case 1 *)
      | (SOME (OUT _), OUT _) => SOME true   (* compatible: case 1 *)
      | (SOME INOUT,   INOUT) => SOME true   (* compatible: case 1 *)
      | (NONE,         OUT _) => SOME true   (* compatible: case 2 *)
      | (SOME (OUT _), IN)    => SOME false  (* compatible: case 3 *)
      | _                     => NONE        (* incompatible *)

    fun getArrayInfo (lenDir, lenName) =
      case List.find (fn (x, _, _) => x = lenName) lenArrayInfos of
        SOME (_, arrayParDir, arrayParInfo) => (
          case isLengthParam (arrayParDir, lenDir) of
            SOME true  => SOME arrayParInfo
          | SOME false => NONE
          | NONE       =>
              infoExcl (arrayLenIncompatibleDir (arrayParDir, arrayParInfo, lenDir, lenName))
        )
      | NONE                                => NONE

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
  vers
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
      fun xferOwnArray dir isPtr ownXfer
        (
          nonPtrForXRet,
          nonPtrForNestedX
        ) =
        case (dir, isPtr, ownXfer) of
          (SOME (),      false, _)          => infoExcl nonPtrForXRet
        | (_,            false, _)          => raise Fail nonPtrForNestedX
        | (_,            true,  NOTHING)    => false
        | (_,            true,  CONTAINER)  => true
        | (_,            true,  EVERYTHING) => true
      val arrayMsg =
        (
          nonPtrForArrayRet,
          nonPtrForNestedArray
        )

      fun xferOwnUtf8Filename dir isPtr ownXfer
        (
          containerForX,
          nonPtrForXRet,
          nonPtrForNestedX
        ) =
        case (dir, isPtr, ownXfer) of
          (SOME (),      false, _)          => infoExcl nonPtrForXRet
        | (_,            false, _)          => raise Fail nonPtrForNestedX
        | (_,            true,  NOTHING)    => false
        | (_,            true,  CONTAINER)  => infoExcl containerForX
        | (_,            true,  EVERYTHING) => true
      val utf8Msg =
        (
          containerForUtf8,
          nonPtrForUtf8Ret,
          nonPtrForNestedUtf8
        )
      val filenameMsg =
        (
          containerForFilename,
          nonPtrForFilenameRet,
          nonPtrForNestedFilename
        )

      fun xferOwnObjectInterface isPtr ownXfer nonPtrForXRet =
        if isPtr
        then
          case ownXfer of
            NOTHING    => false
          | EVERYTHING => true
          | CONTAINER  => infoExcl containerForInterface
        else
          infoExcl nonPtrForXRet
      val objectMsg = nonPtrForObject
      val interfaceMsg = nonPtrForInterface

      fun xferOwnStructUnion dir isPtr ownXfer nonPtrForXRet =
        case (dir, isPtr, ownXfer) of
          (SOME (),      false, NOTHING)    => infoExcl nonPtrForXRet
        | (SOME (),      false, EVERYTHING) => infoExcl nonPtrForXRet
        | (_,            _,     CONTAINER)  => infoExcl containerForInterface
        | (_,            false, _)          => false  (* not used *)
        | (_,            true,  NOTHING)    => false
        | (_   ,         true,  EVERYTHING) => true
      val structMsg = nonPtrForStructRet
      val unionMsg = nonPtrForUnionRet

      fun xferOwnFlagsEnum isPtr ptrForX =
        if isPtr
        then infoExcl ptrForX
        else false  (* not used *)
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

    fun resolveType () () (dir, mayBeNull, ownXfer) typeInfo =
      let
        open TypeTag

        fun toScalarRetInfo ty =
          if
            if usePtrDefault orelse dir = NONE  (* use default for nested type *)
            then
              false
            else
              TypeInfo.isPointer typeInfo
          then
            infoExcl (ptrForScalar scalarToString ty)
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

              val () =
                case SOME (TypeInfo.getArrayType typeInfo) of
                  SOME ArrayType.C  => ()
                | SOME ty           => infoExcl (arrayTypeNotSupported ty)
                | NONE              => infoExcl noArrayTypeForArray

              val isPtr =
                if usePtrDefault orelse dir = NONE  (* use default for nested type *)
                then
                  true
                else
                  TypeInfo.isPointer typeInfo

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

              val xferOwn = xferOwnArray dir isPtr ownXfer arrayMsg 

              val elemOwnXfer =
                case ownXfer of
                  CONTAINER => NOTHING
                | _         => ownXfer

              val elemTypeInfo =
                case TypeInfo.getParamType typeInfo 0 of
                  SOME typeInfo => typeInfo
                | NONE          => infoExcl noTypeParamForArray

              val elem =
                resolveType
                  ()
                  ()
                  (NONE, false, elemOwnXfer)
                  elemTypeInfo

              val iRef =
                case () of
                  () =>
                    makeCArrayIRef
                      repo
                      vers
                      functionNamespace
                      optContainerName
                      length
                      elem

              val arrayInfo = {
                isOpt      = isOpt,
                isPtr      = isPtr,
                xferOwn    = xferOwn,
                lengths    = lengths,
                iRef       = iRef,
                elem       = elem
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

              val isPtr =
                if usePtrDefault orelse dir = NONE  (* use default for nested type *)
                then
                  true
                else
                  TypeInfo.isPointer typeInfo

              val isOpt =
                isPtr andalso mayBeNull

              val xferOwn = xferOwnUtf8Filename dir isPtr ownXfer filenameMsg 

              val utf8Info = {
                isOpt      = isOpt,
                isPtr      = isPtr,
                xferOwn    = xferOwn
              }
            in
              IUTF8 utf8Info
            end
        | UTF8         =>
            let
              open Transfer

              val isPtr =
                if usePtrDefault orelse dir = NONE  (* use default for nested type *)
                then
                  true
                else
                  TypeInfo.isPointer typeInfo

              val isOpt =
                isPtr andalso mayBeNull

              val xferOwn = xferOwnUtf8Filename dir isPtr ownXfer utf8Msg 

              val utf8Info = {
                isOpt      = isOpt,
                isPtr      = isPtr,
                xferOwn    = xferOwn
              }
            in
              IUTF8 utf8Info
            end
        | UNICHAR      => toScalarRetInfo STUNICHAR
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val () = checkInterfaceType repo vers interfaceInfo

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
                    (* `getStructType` must be called unconditionally for a
                     * struct to ensure that a return value whose type is an
                     * unsupported struct is excluded. *)
                    val isStructPtr =
                      case infoType of
                        STRUCT structInfo => (
                          case getStructType repo vers structInfo of
                            ValueRecord _ => false
                          | _             => true
                        )
                      | UNION unionInfo   => (
                          checkUnionInterfaceType repo vers unionInfo;
                          false
                        )
                      | _                 => false

                    val isPtr =
                      if usePtrDefault orelse dir = NONE  (* use default for nested type *)
                      then
                        case infoType of
                          OBJECT _          => true
                        | INTERFACE _       => true
                        | STRUCT _          => (
                            case dir of
                              SOME _ => true
                            | NONE   => isStructPtr
                          )
                        | UNION _           => true
                        | FLAGS _           => false
                        | ENUM _            => false
                        | _                 => infoExcl (unsupportedInterface infoType)
                      else
                        TypeInfo.isPointer typeInfo

                    val isOpt =
                      isPtr andalso mayBeNull

                    val (xferOwn, rootIRef) =
                      case infoType of
                        OBJECT objectInfo
                                    =>
                          (
                            xferOwnObjectInterface isPtr ownXfer objectMsg,
                            getRootObjectIRef repo functionNamespace
                              optContainerName
                              (objectInfo, iRef)
                          )
                      | INTERFACE _ =>
                          (
                            xferOwnObjectInterface isPtr ownXfer interfaceMsg,
                            makeInterfaceRootIRef functionNamespace
                              optContainerName
                          )
                      | STRUCT _    => (xferOwnStructUnion dir isPtr ownXfer structMsg, iRef)
                      | UNION _     => (xferOwnStructUnion dir isPtr ownXfer unionMsg, iRef)
                      | FLAGS _     => (xferOwnFlagsEnum isPtr flagsMsg, iRef)
                      | ENUM _      => (xferOwnFlagsEnum isPtr enumMsg, iRef)
                      | _           => infoExcl (unsupportedInterface infoType)

                    val interfaceInfo = {
                      rootIRef   = rootIRef,
                      iRef       = iRef,
                      infoType   = infoType,
                      isOpt      = isOpt,
                      isPtr      = isPtr,
                      xferOwn    = xferOwn
                    }
                  in
                    IINTERFACE interfaceInfo
                  end
            end
              handle
                InfoExcl ie =>
                  raise InfoExcl (IEGrp [mkInfoExclHier (SOME typeInfo) (getInterface typeInfo) ie])
      end
        handle
          InfoExcl ie =>
            raise InfoExcl (IEGrp [mkInfoExclHier NONE typeInfo ie])

    val info =
      resolveType
        ()
        ()
        (SOME (), mayReturnNull, ownershipTransfer)
        typeInfo
  in
    RISOME {
      info = info
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
                isPtr,
                xferOwn,
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
                    isPtr      = isPtr,
                    xferOwn    = xferOwn
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
        (getParInfo false repo vers functionNamespace optContainerName functionInfo)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo vers functionNamespace optContainerName
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
        concat ["with", refStr, newStr, dupStr, optStr, ptrStr]
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

  fun touchFunExp prefixIds {isOpt} =
    let
      val optStr = if isOpt then "Opt" else ""

      val touchFunId = concat ["touch", optStr, "Ptr"]
    in
      mkLIdLNameExp (prefixIds @ [touchFunId])
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

  fun withFunUtf8 (dir, {isPtr, xferOwn, isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, ffiStrId]
    in
      withFunExp prefixIds {
        isRef = dir <> IN andalso isPtr,
        isDup = not isPtr,
        isNew = false,
        isOpt =
          case dir of
            IN    => isOpt
          | OUT _ => true
          | INOUT => isOpt,
        isPtr = true,
        xfer  =
          case (dir, xferOwn) of
            (OUT _, _)     => XferDepth 0
          | (_,     true)  => XferDepth ~1
          | (_,     false) => XferDepth 0
      }
    end

  fun withFunArray (dir, {isPtr, xferOwn, isOpt, iRef, elem, ...} : array_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]
    in
      withFunExp prefixIds {
        isRef = dir <> IN andalso isPtr,
        isDup = dir = INOUT andalso not isPtr,
        isNew =
          case dir of
            OUT _ => not isPtr
          | _     => false,
        isOpt =
          case dir of
            IN    => isOpt
          | OUT _ => isPtr
          | INOUT => isOpt,
        isPtr = true,
        xfer  =
          case (dir, isPtr, xferOwn) of
            (OUT _, false, _)     => XferNone
          | (OUT _, true,  _)     => XferDepth 0
          | (_,     _,     true)  => XferDepth (getArrayOwnXferDepth 1 elem)
          | (_,     _,     false) => XferDepth 0
      }
    end

  fun withFunInterface
    (dir, {iRef, infoType, isPtr, xferOwn, isOpt, ...} : interface_info) =
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
              STRUCT _ => isPtr
            | _        => true
          ),
        isDup =
          case (dir, infoType, isPtr) of
            (INOUT, STRUCT _, false) => true
          | (INOUT, UNION _,  false) => true
          | _                        => false,
        isNew =
          case (dir, infoType) of
            (OUT isCallerAllocates, STRUCT _) =>
              isCallerAllocates andalso not isPtr
              (* Note that `isCallerAllocates` can be true when `isPtr`
               * for disguised structs, such as GdkAtom.  For information on disguised
               * structs, see https://bugzilla.gnome.org/show_bug.cgi?id=560248 . *)
          | _                                 => false,
        isOpt =
          case dir of
            IN    => isOpt
          | OUT _ => isPtr
          | INOUT => isOpt,
        isPtr =
          case infoType of
            STRUCT _ => true
          | _        => isPtr,
        xfer  =
          case (dir, infoType, isPtr) of
            (INOUT, STRUCT _, _)     => XferFlag xferOwn
          | (_,     _,        true)  => XferFlag xferOwn
          | (_,     _,        false) => XferNone
      }
    end

  fun fromFunGType ({iRef, ...} : gtype_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]
      val exp =
        fromFunExp prefixIds {
          isOpt = false,
          xfer  = XferNone
        }
      val copiesFromPtr = false
    in
      (exp, copiesFromPtr)
    end

  fun fromFunScalar ({ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, ffiStrId]
      val exp =
        fromFunExp prefixIds {
          isOpt = false,
          xfer  = XferNone
        }
      val copiesFromPtr = false
    in
      (exp, copiesFromPtr)
    end

  fun fromFunUtf8 (_, {xferOwn, isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, ffiStrId]
      val exp =
        fromFunExp prefixIds {
          isOpt = isOpt,
          xfer  =
            XferDepth (
              if xferOwn
              then ~1
              else 0
            )
        }
      val copiesFromPtr = not xferOwn
    in
      (exp, copiesFromPtr)
    end

  fun fromFunArray (isInOut, {isPtr, xferOwn, isOpt, iRef, elem, ...} : array_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]
      val depth =
        case (isInOut, isPtr) of
          (false, false) => ~1
        | _              =>
            if xferOwn
            then getArrayOwnXferDepth 1 elem
            else 0
      val exp =
        fromFunExp prefixIds {
          isOpt =
            case (isInOut, isPtr) of
              (false, false) => false (* `isPtr` is not false for return values
                                         so this case applies to OUT parameters *)
            | _              => isOpt,
          xfer  = XferDepth depth
        }
      val copiesFromPtr = depth >= 0
    in
      (exp, copiesFromPtr)
    end

  fun fromFunInterface
    (isInOut, {iRef, infoType, isPtr, xferOwn, isOpt, ...} : interface_info) =
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

      val xfer =
        case (isInOut, infoType, isPtr) of
          (false, STRUCT _, false) => XferFlag true  (* OUT parameter *)
        | (true,  STRUCT _, false) => XferFlag xferOwn
        | _                        =>
            if isPtr
            then XferFlag xferOwn
            else XferNone
      val exp =
        fromFunExp prefixIds {
          isOpt = isOpt,
          xfer  = xfer
        }
      val copiesFromPtr = xfer = XferFlag false
    in
      (exp, copiesFromPtr)
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

  fun argValArray (name, dir, {isPtr, lengths, ...} : array_info) =
    case (dir, isPtr) of
      (OUT _, true)  => noneExp
    | (OUT _, false) => (
        (* `lengths` contains `ArrayLengthFixed` in
         * preference to `ArrayLengthParam` *)
        case findMap mkArrayLenExp (op :: lengths) of
          SOME lenExp => lenExp
        | NONE        => infoExcl "cannot determine array length"
      )
    | _               => mkIdLNameExp name

  fun argValInterface
    (name, dir, {iRef, infoType, isPtr, ...} : interface_info) =
    case dir of
      OUT _ =>
        let
          open InfoType
        in
          case infoType of
            OBJECT _    => noneExp
          | INTERFACE _ => noneExp
          | STRUCT _    =>
              if isPtr
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

  fun touchFunUtf8 (name, {isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, ffiStrId]

      val funExp =
        touchFunExp prefixIds {
          isOpt = isOpt
        }
      val exp = ExpApp (funExp, mkIdLNameExp name)
    in
      SOME exp
    end

  fun touchFunArray (name, {isOpt, iRef, ...} : array_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]

      val funExp =
        touchFunExp prefixIds {
          isOpt = isOpt
        }
      val exp = ExpApp (funExp, mkIdLNameExp name)
    in
      SOME exp
    end

  fun touchFunInterface (name, {iRef, infoType, isOpt, ...} : interface_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]

      fun mkExp () =
        let
          val funExp =
            touchFunExp prefixIds {
              isOpt = isOpt
            }
        in
          ExpApp (funExp, mkIdLNameExp name)
        end

      open InfoType
    in
      case infoType of
        OBJECT _    => SOME (mkExp ())
      | INTERFACE _ => SOME (mkExp ())
      | STRUCT _    => SOME (mkExp ())
      | UNION _     => SOME (mkExp ())
      | FLAGS _     => NONE
      | ENUM _      => NONE
      | _           =>
          infoExcl "touchFun for unidentified INTERFACE not supported"
    end

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
  fun addParInfo (parInfo, acc as (js, ks, ls, ms, ns, copyFromPtr, iRefs, structDeps)) =
    case parInfo of
      PIVOID                          => acc
    | PISOME {name, dir, array, info} =>
        let
          val (withFunExp, argValExp, fromFunExp, outParamName, outParamExp, touchFunOptExp, structDeps'1) =
            case info of
              IGTYPE gtypeParInfo         =>
                let
                  val withFunExp = withFunGType (dir, gtypeParInfo)
                  val argValExp = argValGType (name, dir, gtypeParInfo)
                  fun fromFunExp () = fromFunGType gtypeParInfo
                  fun outParamName () = mkIdVarPat name
                  fun outParamExp () = mkIdLNameExp name
                  fun touchFunOptExp () = NONE
                in
                  (withFunExp, argValExp, fromFunExp, outParamName, outParamExp, touchFunOptExp, structDeps)
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
                  fun touchFunOptExp () = NONE
                in
                  (withFunExp, argValExp, fromFunExp, outParamName, outParamExp, touchFunOptExp, structDeps)
                end
            | IUTF8 utf8ParInfo           =>
                let
                  val withFunExp = withFunUtf8 (dir, utf8ParInfo)
                  val argValExp = argValUtf8 (name, dir, utf8ParInfo)
                  fun fromFunExp () = fromFunUtf8 (dir = INOUT, utf8ParInfo)
                  fun outParamName () = mkIdVarPat name
                  fun outParamExp () = mkIdLNameExp name
                  fun touchFunOptExp () = touchFunUtf8 (name, utf8ParInfo)
                in
                  (withFunExp, argValExp, fromFunExp, outParamName, outParamExp, touchFunOptExp, structDeps)
                end
            | IARRAY arrayParInfo         =>
                let
                  val {lengths, ...} = arrayParInfo
                  val length = hd1 lengths

                  val withFunExp = withFunArray (dir, arrayParInfo)
                  val argValExp = argValArray (name, dir, arrayParInfo)
                  fun fromFunExp () = fromFunArray (dir = INOUT, arrayParInfo)
                  fun outParamName () = mkIdVarPat name
                  fun outParamExp () = mkArrayLenAppExp length (mkIdLNameExp name)
                  fun touchFunOptExp () = touchFunArray (name, arrayParInfo)
                in
                  (withFunExp, argValExp, fromFunExp, outParamName, outParamExp, touchFunOptExp, structDeps)
                end
            | IINTERFACE interfaceParInfo =>
                let
                  val withFunExp = withFunInterface (dir, interfaceParInfo)
                  val argValExp = argValInterface (name, dir, interfaceParInfo)
                  fun fromFunExp () =
                    fromFunInterface (dir = INOUT, interfaceParInfo)
                  fun outParamName () = mkIdVarPat name
                  fun outParamExp () = mkIdLNameExp name
                  fun touchFunOptExp () = touchFunInterface (name, interfaceParInfo)
                in
                  (withFunExp, argValExp, fromFunExp, outParamName, outParamExp, touchFunOptExp, structDeps)
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
            | NONE   => (mkIdVarAPat name, touchFunOptExp ()) :: ls
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
          fun addN ns =
            let
              val (fromFunExp, copiesFromPtr) = fromFunExp ()
              val copyFromPtr' = copyFromPtr orelse copiesFromPtr
            in
              (
                (fromFunExp, outParamName ()) :: ns,
                copyFromPtr'
              )
            end

          val (ks', ls', ms', (ns', copyFromPtr')) =
            case dir of
              OUT _ => (addK ks, ls,      ms,      addN ns)
            | INOUT => (addK ks, addL ls, addM ms, addN ns)
            | IN    => (ks,      addL ls, addM ms, (ns, copyFromPtr))

          val iRefs' = addIRef (info, iRefs)
        in
          (js', ks', ls', ms', ns', copyFromPtr', iRefs', structDeps')
        end

  fun addRetInfo optConstructorIRef throws (retInfo, acc as (copyFromPtr, iRefs, structDeps)) =
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
                isPtr,
                xferOwn
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
                  isPtr      = isPtr,
                  xferOwn    = xferOwn
                }

          val ((fromFunExp, copiesFromPtr), structDeps') =
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
                      (STBOOLEAN, true) => (mkIdLNameExp ignoreId, false)
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
          val copyFromPtr' = copyFromPtr orelse copiesFromPtr
        in
          (fromFunExp, (copyFromPtr', iRefs', structDeps'))
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
        IARRAY {lengths, ...} => mkArrayLenAppExp (hd1 lengths) retValExp
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

fun mkBeforeExp (a, b) = ExpInfixApp (a, beforeId, b)


fun retValCondExp retValExp (es1 : exp list1) : exp =
  ExpCond (retValExp, someExp (mkTupleExp1 es1), noneExp)


fun makeFunctionStrDecHighLevel
  repo
  vers
  (optContainerInfoIRef : ('a BaseInfoClass.class * interfaceref) option)
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

    val optContainerIRef = Option.map #2 optContainerInfoIRef
    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo vers functionNamespace optContainerName functionInfo)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo vers functionNamespace optContainerName
        functionInfo

    val parInfos = updateParInfos retInfo parInfos


    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val (revJs'1, touchFunSelf, inParamNameSelf) =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_METHOD)
      then
        case optContainerInfoIRef of
          SOME (info, iRef) =>
            let
              open InfoType
              val infoType = getType info

              val ptrIds = (withPtrId, SOME touchPtrId)
              val valIds = (withValId, NONE)

              val (withFunId, optTouchFunId) =
                case infoType of
                  OBJECT _    => ptrIds
                | INTERFACE _ => ptrIds
                | STRUCT _    => ptrIds
                | UNION _     => ptrIds
                | FLAGS _     => valIds
                | ENUM _      => valIds
                | _           => infoExcl (unsupportedInterface infoType)

              val withFun =
                ExpApp (
                  mkLIdLNameExp (
                    prefixInterfaceStrId iRef [ffiStrId, withFunId]
                  ),
                  falseExp
                )
              val argVal = selfExp
              val touchFunSelf =
                case optTouchFunId of
                  SOME touchFunId => SOME (
                    ExpApp (
                      mkLIdLNameExp (
                        prefixInterfaceStrId iRef [ffiStrId, touchFunId]
                      ),
                      selfExp
                    )
                  )
                | NONE            => NONE
              val inParamAPat = mkIdVarAPat selfId
            in
              ([(withFun, argVal)], touchFunSelf, SOME inParamAPat)
            end
        | NONE              =>
            infoExcl "function outside interface has method flag set"
      else
        ([], NONE, NONE)
    val revKs'1 = []
    val revLs'1 = []
    val revMs'1 = []
    val revNs'1 = []
    val iRefs'1 = iRefs
    val copyFromPtr'1 = false
    val structDeps'1 = structDeps

    (* Construct J, K, L, M, N vectors in forward pass over parameter infos.
     * As for a function spec, `iRefs` should be generated in a forwards
     * pass over the parameter infos so types appear in order of first
     * appearance. *)
    val (revJs'2, revKs'2, revLs'2, revMs'2, revNs'2, copyFromPtr'2, iRefs'2, structDeps'2) =
      foldl addParInfo
        (revJs'1, revKs'1, revLs'1, revMs'1, revNs'1, copyFromPtr'1, iRefs'1, structDeps'1)
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

    val (retFromFun, (copyFromPtr'3, iRefs'3, structDeps'3)) =
      addRetInfo optConstructorIRef throws (retInfo, (copyFromPtr'2, iRefs'2, structDeps'2))

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
     *   [<inParamName[1]>, ..., <inParamName[L]>] = revMap #1 revLs'2
     *
     *   SOME <self> = inParamNameSelf
     *)
    val (inParamNames, touchFuns) = foldl unzipStep unzipInit revLs'2
    val functionArgPats1 : apat list1 = toList1 (
      case (inParamNameSelf, inParamNames) of
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

    (*   <e1>
     *                 -.                                          -.
     *    before <e2>   | for SOME e2 in touchFunSelf :: touchFuns  | if copyFromPtr'3
     *                 -'                                          -'
     *)
    local
      fun mkOptBeforeExp (e1, opt) =
        case opt of
          SOME e2 => mkBeforeExp (e1, e2)
        | NONE    => e1
    in
      fun beforeTouchFuns e1 =
        if copyFromPtr'3
        then
          let
            val e1' =
              case e1 of
                ExpCond _ => mkParenExp e1
              | _         => e1
          in
            foldl (fn (b, a) => mkOptBeforeExp (a, b)) e1' (touchFunSelf :: touchFuns)
          end
        else
          e1
    end

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
     *                 -.                                         -.
     *      before <e>  | for SOME e in touchFunSelf :: touchFuns  | if copyFromPtr'3
     *                 -'                                         -'
     *   end
     *
     *     if N + M > 0, i.e. N > 0 or M > 0
     *
     *
     *   <functionCoreExp>
     *                 -.                                         -.
     *    before <e>    | for SOME e in touchFunSelf :: touchFuns  | if copyFromPtr'3
     *                 -'                                         -'
     *
     *     otherwise, i.e. N = 0 and M = 0
     *)
    val functionExp =
      case (revOutParams, revMs'2) of
        ([], []) => beforeTouchFuns functionCoreExp
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
            ExpLet (mkDecs decs'2, toList1 [beforeTouchFuns retExp])
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
 *     val getType = (I ---> GObjectType.FFI.fromVal) getType_
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

  fun parUtf8Conv (dir, {isPtr, isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, polyMLStrId]
    in
      convExp prefixIds (
        if dir <> IN andalso isPtr
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = isOpt
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

  fun parArrayConv (dir, {isPtr, isOpt, iRef, ...} : array_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [polyMLStrId]
    in
      convExp prefixIds (
        if dir <> IN andalso isPtr
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = isOpt
            }
          )
        else
          PTR {
            optDir = SOME In,
            isOpt  =
              case (dir, isPtr) of
                (OUT _, false) => false
              | _              => isOpt
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
    (dir, {iRef, infoType, isPtr, isOpt, ...} : interface_info) =
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
        if dir <> IN andalso isPtr
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = isOpt
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
            isOpt  = isOpt andalso isPtr
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
  (optContainerIRef : interfaceref option)
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

    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo vers functionNamespace optContainerName functionInfo)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo vers functionNamespace optContainerName
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

  fun parUtf8Type (dir, {isPtr, isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, ffiStrId]
    in
      typeTy true prefixIds (
        if dir <> IN andalso isPtr
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = isOpt
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

  fun parArrayType (dir, {isPtr, isOpt, iRef, ...} : array_info) =
    let
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]
    in
      typeTy true prefixIds (
        if dir <> IN andalso isPtr
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = isOpt
            }
          )
        else
          PTR {
            optDir = SOME In,
            isOpt  =
              case (dir, isPtr) of
                (OUT _, false) => false
              | _              => isOpt
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
    (dir, {iRef, infoType, isPtr, isOpt, ...} : interface_info) =
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
        if dir <> IN andalso isPtr
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = isOpt
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
            isOpt  = isOpt andalso isPtr
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
  (optContainerIRef : interfaceref option)
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

    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo vers functionNamespace optContainerName functionInfo)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo vers functionNamespace optContainerName
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
 *       _import "<getTypeSymbol>" : unit -> GObjectType.FFI.val_;
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
  addFieldOffsetFunctionStrDecs
  optContainerIRef
  fieldInfos =
  if isPolyML
  then
    fn (containerInfo, (strDecs, excls)) =>
      let
        val acc'0 = ([], excls)
        val acc'1 = addFieldOffsetFunctionStrDecs (fieldInfos, acc'0)
        val acc'2 =
          revMapInfosWithExcls
            optCons
            getNMethods
            getMethod
            (makeFunctionStrDecLowLevelPolyML repo vers optContainerIRef)
            (containerInfo, acc'1)
        val acc'3 = addInitStrDecs isPolyML acc'2
        val (localStrDecs, excls') = acc'3
      in
        case localStrDecs of
          _ :: _ => (mkPolyMLFFILocalStrDec localStrDecs :: strDecs, excls')
        | []     => (strDecs, excls')
      end
  else
    fn (containerInfo, acc'0) =>
      let
        val acc'1 = addFieldOffsetFunctionStrDecs (fieldInfos, acc'0)
        val acc'2 = 
          revMapInfosWithExcls
            optCons
            getNMethods
            getMethod
            (makeFunctionStrDecLowLevelMLton repo vers optContainerIRef)
            (containerInfo, acc'1)
        val acc'3 = addInitStrDecs isPolyML acc'2
      in
        acc'3
      end
