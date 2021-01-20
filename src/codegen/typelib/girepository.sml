open GIRepository


type info_id = string * string option  (* info type and optional name *)

datatype info_excl =
  IEMsg of string
| IEGrp of info_excl_hier list

withtype info_excl_hier = info_id * info_excl

local
  open InfoType

  (* `getName NONE info` returns the name of `info`.
   *
   * `getName (SOME parentInfo) info` returns the name of `info` qualified its
   * namespace if its namespace differs from the namespace of `parentInfo`.
   *)
  fun getName optParentInfo info =
    let
      val name =
        case BaseInfo.getName info of
          SOME name => name
        | NONE      => "(none)"

      val longName =
        case optParentInfo of
          NONE            => [name]
        | SOME parentInfo =>
            let
              val namespace = BaseInfo.getNamespace info
            in
              if namespace <> BaseInfo.getNamespace parentInfo
              then [namespace, name]
              else [name]
            end
    in
      SOME (String.concatWith "." longName)
    end

  fun getTypeTag typeInfo =
    SOME (TypeTag.toString (TypeInfo.getTag typeInfo))

  fun getId optParentInfo info =
    case getType info of
      INVALID        => ("(invalid)",    NONE)
    | FUNCTION info  => ("function",     getName NONE info)
    | CALLBACK info  => ("callback",     getName optParentInfo info)
    | STRUCT info    => ("struct",       getName optParentInfo info)
    | BOXED info     => ("boxed",        getName optParentInfo info)
    | ENUM info      => ("enum",         getName optParentInfo info)
    | FLAGS info     => ("flags",        getName optParentInfo info)
    | OBJECT info    => ("object",       getName optParentInfo info)
    | INTERFACE info => ("interface",    getName optParentInfo info)
    | CONSTANT info  => ("constant",     getName NONE info)
    | INVALID_0      => ("(invalid_0)",  NONE)
    | UNION info     => ("union",        getName optParentInfo info)
    | VALUE info     => ("value",        getName NONE info)
    | SIGNAL info    => ("signals",      getName NONE info)
    | VFUNC info     => ("vfunc",        getName NONE info)
    | PROPERTY info  => ("property",     getName NONE info)
    | FIELD info     => ("field",        getName NONE info)
    | ARG info       => ("arg",          getName NONE info)
    | TYPE info      => ("type",         getTypeTag info)
    | UNRESOLVED     => ("(unresolved)", NONE)
in
  (* In `mkInfoExclHier optParentInfo info ie`, `optParentInfo` should
   * provide the parent info if its namespace may be different from the
   * namespace of `info`.
   *)
  fun mkInfoExclHier optParentInfo info ie : info_excl_hier =
    ((getId optParentInfo info), ie)
end


exception InfoExcl of info_excl

fun infoExcl msg = raise InfoExcl (IEMsg msg)


fun existsInfo (getN : 'a -> LargeInt.int) getNth p info =
  let
    fun aux n =
      if n <= 0
      then false
      else
        let
          val n' = n - 1
        in
          if p (getNth info n') handle InfoExcl _ => false
          then true
          else aux n'
        end
  in
    aux (getN info)
  end

fun revMapInfos (getN : 'a -> LargeInt.int) getNth f (info, xs) =
  let
    fun aux xs n =
      if n <= 0
      then xs
      else
        let
          val n' = n - 1
          val info' = getNth info n'
          val xs' =
            let
              val x = f info'
            in
              x :: xs
            end
              handle
                InfoExcl ie =>
                  raise InfoExcl (IEGrp [mkInfoExclHier NONE info' ie])
        in
          aux xs' n'
        end
  in
    aux xs (getN info)
  end

fun revFoldInfos (getN : 'a -> LargeInt.int) getNth f (info, acc) =
  let
    fun aux acc n =
      if n <= 0
      then acc
      else
        let
          val n' = n - 1
          val info' = getNth info n'
          val acc' =
            f (info', acc)
              handle
                InfoExcl ie =>
                  raise InfoExcl (IEGrp [mkInfoExclHier NONE info' ie])
        in
          aux acc' n'
        end
  in
    aux acc (getN info)
  end

fun foldInfos (getN : 'a -> LargeInt.int) getNth f (info, acc) =
  let
    val N = getN info
    fun aux acc n =
      if n >= N
      then acc
      else
        let
          val info' = getNth info n
          val acc' =
            f (info', acc)
              handle
                InfoExcl ie =>
                  raise InfoExcl (IEGrp [mkInfoExclHier NONE info' ie])
          val n' = n + 1
        in
          aux acc' n'
        end
  in
    aux acc 0
  end

fun revFoldMapInfos (getN : 'a -> LargeInt.int) getNth f (info, (xs, acc)) =
  let
    fun aux (xs, acc) n =
      if n <= 0
      then (xs, acc)
      else
        let
          val n' = n - 1
          val info' = getNth info n'

          val (xs', acc') =
            let
              val (x, acc') = f (info', acc)
            in
              (x :: xs, acc')
            end
              handle
                InfoExcl ie =>
                  raise InfoExcl (IEGrp [mkInfoExclHier NONE info' ie])
        in
          aux (xs', acc') n'
        end
  in
    aux (xs, acc) (getN info)
  end


fun revMapInfosWithExcls cons (getN : 'a -> LargeInt.int) getNth f (info, (xs, excls)) =
  let
    fun aux (xs, excls) n =
      if n <= 0
      then (xs, excls : info_excl_hier list)
      else
        let
          val n' = n - 1
          val info' = getNth info n'
          val (xs', excls') =
            let
              val (x, fExcls) = f (info', [] : info_excl_hier list)
              val excls' =
                case fExcls of
                  []     => excls
                | _ :: _ => mkInfoExclHier NONE info' (IEGrp fExcls) :: excls
            in
              (cons (SOME x, xs), excls')
            end
              handle
                InfoExcl ie =>
                  (cons (NONE, xs), mkInfoExclHier NONE info' ie :: excls)
        in
          aux (xs', excls') n'
        end
  in
    aux (xs, excls) (getN info)
  end

fun revFoldInfosWithExcls (getN : 'a -> LargeInt.int) getNth f (info, (acc, excls)) =
  let
    fun aux (acc, excls) n =
      if n <= 0
      then (acc, excls : info_excl_hier list)
      else
        let
          val n' = n - 1
          val info' = getNth info n'
          val (acc', excls') =
            let
              val (acc', fExcls) = f (info', (acc, [] : info_excl_hier list))
              val excls' =
                case fExcls of
                  []     => excls
                | _ :: _ => mkInfoExclHier NONE info' (IEGrp fExcls) :: excls
            in
              (acc', excls')
            end
              handle
                InfoExcl ie =>
                  (acc, mkInfoExclHier NONE info' ie :: excls)
        in
          aux (acc', excls') n'
        end
  in
    aux (acc, excls) (getN info)
  end

fun revFoldMapInfosWithExcls cons (getN : 'a -> LargeInt.int) getNth f (info, (xs, acc, excls)) =
  let
    fun aux (xs, acc, excls) n =
      if n <= 0
      then (xs, acc, excls : info_excl_hier list)
      else
        let
          val n' = n - 1
          val info' = getNth info n'
          val (xs', acc', excls') =
            let
              val (x, (acc', fExcls)) = f (info', (acc, [] : info_excl_hier list))
              val excls' =
                case fExcls of
                  []     => excls
                | _ :: _ => mkInfoExclHier NONE info' (IEGrp fExcls) :: excls
            in
              (cons (SOME x, xs), acc', excls')
            end
              handle
                InfoExcl ie =>
                  (cons (NONE, xs), acc, mkInfoExclHier NONE info' ie :: excls)
        in
          aux (xs', acc', excls') n'
        end
  in
    aux (xs, acc, excls) (getN info)
  end

fun optCons x = Option.fold (op ::) x



(* `getSharedLibraryFile repo vers namespace` returns the first filename in
 * the comma-separated list of shared libraries for `namespace`.
 *
 * At this stage it is not known why there can be multiple files listed for
 * a namespace.
 *)

fun getSharedLibraryFile repo vers namespace =
  case Repository.getSharedLibrary repo vers namespace of
    SOME sharedLibraries => (
      case String.fields (fn c => c = #",") sharedLibraries of
        sharedLibrary :: _ => sharedLibrary
      | []                 => infoExcl "no shared library"
    )
  | NONE               => infoExcl "no shared library"

(* On Darwin, the shared library file returned by `getSharedLibraryFile`
 * includes a path.  `getSharedLibraryFileName` returns just the file name,
 * i.e. removes the path.
 *)

fun getSharedLibraryFileName repo vers namespace =
  OS.Path.file (getSharedLibraryFile repo vers namespace)


(* Common *)

fun getName info =
  case BaseInfo.getName info of
    SOME name => name
  | NONE      => infoExcl "no name"

fun getParent objectInfo =
  case ObjectInfo.getParent objectInfo of
    SOME parentObjectInfo => parentObjectInfo
  | NONE                  => infoExcl "no parent info"

fun getInterface typeInfo =
  case TypeInfo.getInterface typeInfo of
    SOME interfaceInfo => interfaceInfo
  | NONE               => infoExcl "no interface info"

fun checkDeprecated _ = ()

fun checkNonClassStruct structInfo =
  if StructInfo.isGtypeStruct structInfo
  then infoExcl "class struct"
  else ()


(* Interface types *)

fun checkInterfaceType repo vers interfaceInfo =
  let
    val name = getName interfaceInfo
    val namespace = BaseInfo.getNamespace interfaceInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
    fun infoExclInterfaceType match =
      infoExcl (concat ["interface type excluded by configuration (", match, ")"])
  in
    if nvsExists (nv, fn x => x = name) (!excludedInterfaceTypes)
    then infoExclInterfaceType "excludedInterfaceTypes"
    else if
      nvsExists (nv, fn x => String.isPrefix x name)
        (!excludedInterfaceTypePrefixes)
    then
      infoExclInterfaceType "excludedInterfaceTypePrefixes"
    else if
      nvsExists (nv, fn x => String.isSuffix x name)
        (!excludedInterfaceTypeSuffixes)
    then
      infoExclInterfaceType "excludedInterfaceTypeSuffixes"
    else ()
  end


(* Struct types *)

local
  fun addTypeCPtrFieldNames revPrefix (typeInfo, acc) =
    let
      open TypeTag
    in
      case TypeInfo.getTag typeInfo of
        ERROR        => revPrefix :: acc
      | GTYPE        => acc
      | ARRAY        => revPrefix :: acc
      | GLIST        => revPrefix :: acc
      | GSLIST       => revPrefix :: acc
      | GHASH        => revPrefix :: acc
      | VOID         => revPrefix :: acc  (* only for void * so always a reference *)
      | BOOLEAN      => acc
      | INT8         => acc  
      | UINT8        => acc  
      | INT16        => acc  
      | UINT16       => acc  
      | INT32        => acc  
      | UINT32       => acc  
      | INT64        => acc  
      | UINT64       => acc  
      | FLOAT        => acc  
      | DOUBLE       => acc  
      | FILENAME     => revPrefix :: acc
      | UTF8         => revPrefix :: acc
      | UNICHAR      => acc
      | INTERFACE    =>
          let
            val interfaceInfo = getInterface typeInfo

            open InfoType
            val infoType = getType interfaceInfo
          in
            case infoType of
              FLAGS _           => acc
            | ENUM _            => acc
            | STRUCT structInfo =>
                if TypeInfo.isPointer typeInfo
                then revPrefix :: acc
                else addStructCPtrFieldNames revPrefix (structInfo, acc)
            | _                 => revPrefix :: acc
          end
    end

  and addFieldCPtrFieldNames revPrefix (fieldInfo, acc) =
    addTypeCPtrFieldNames
      (valOf (BaseInfo.getName fieldInfo) :: revPrefix)
      (FieldInfo.getType fieldInfo, acc)

  and addStructCPtrFieldNames revPrefix (structInfo, acc) =
    revFoldInfos
      StructInfo.getNFields
      StructInfo.getField
      (addFieldCPtrFieldNames revPrefix)
      (structInfo, acc)
in
  fun getStructCPtrFieldNames structInfo =
    let
      val cPtrNames =
        addStructCPtrFieldNames [] (StructInfoClass.toBase structInfo, [])
    in
      map (String.concatWith "." o rev) cPtrNames
    end
end

fun getStructType repo vers structInfo =
  let
    val name = getName structInfo
    val namespace = BaseInfo.getNamespace structInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
  in
    case nvsLookup (nv, name) (!structTypes) of
      SOME structType => structType
    | NONE            =>
        (* A record that is a registered type is a boxed type.  The default
         * behaviour is to treat such a record as a reference-only record to
         * use the boxed type allocation functions.  To enable a record that
         * is a registered type to be treated like a value also, the struct
         * type must be manually configured.
         *)
        case RegisteredTypeInfo.getTypeInit structInfo of
          SOME _ => Record Boxed
        | NONE   =>
            (* A struct can still be copied if it is flat, i.e. none of the
             * fields are references in C except that, if a struct has no
             * fields, we assume that the struct has data and is opaque, and
             * it is not known how to copy the struct.
             *)
            if StructInfo.getNFields structInfo = 0
            then infoExcl "neither duplicate nor copy operation available\
                            \ because struct type is not registered and has\
                            \ no fields"
            else
              case getStructCPtrFieldNames structInfo of
                []             => ValueRecord Flat
              | cPtrFieldNames =>
                  infoExcl (
                    concat [
                      "neither duplicate nor copy operation available\
                        \ because struct type is not registered and has\
                        \ fields that are references via a C pointer",
                      " (",
                      String.concatWith ", " cPtrFieldNames,
                      ")"
                    ]
                  )
  end


(* Union types *)

fun checkUnionInterfaceType repo vers unionInfo =
  let
    val name = getName unionInfo
    val namespace = BaseInfo.getNamespace unionInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
  in
    if nvsExists (nv, fn x => x = name) (!includedUnionNames)
    then ()
    else infoExcl "union interface type not included by configuration \
                                                          \(includedUnionNames)"
  end


(* Function names *)

fun checkFunctionSymbol repo vers functionInfo =
  let
    val symbol = FunctionInfo.getSymbol functionInfo
    val namespace = BaseInfo.getNamespace functionInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
    fun infoExclFunctionSymbol match =
      infoExcl (concat ["function excluded by configuration (", match, ")"])
  in
    if nvsExists (nv, fn x => x = symbol) (!excludedFunctionSymbols)
    then infoExclFunctionSymbol "excludedFunctionSymbols"
    else if
      nvsExists (nv, fn x => String.isPrefix x symbol)
        (!excludedFunctionSymbolPrefixes)
    then
      infoExclFunctionSymbol "excludedFunctionSymbolPrefixes"
    else if
      nvsExists (nv, fn x => String.isSuffix x symbol)
        (!excludedFunctionSymbolSuffixes)
    then
      infoExclFunctionSymbol "excludedFunctionSymbolSuffixes"
    else ()
  end

fun checkFunctionName name =
  if List.exists (fn x => x = name) (!nonUserFunctionNames)
  then
    infoExcl "non-user function excluded by configuration \
                                                        \(nonUserFunctionNames)"
  else ()


(* Fields *)

fun checkFieldName repo vers containerInfo fieldInfo =
  let
    val name = getName fieldInfo
    val namespace = BaseInfo.getNamespace fieldInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
    fun infoExclFieldNameNotIncl match =
      infoExcl (concat ["field not included by configuration (", match, ")"])
    fun infoExclFieldNameExcl match =
      infoExcl (concat ["field excluded by configuration (", match, ")"])
  in
    if
      case InfoType.getType containerInfo of
        InfoType.OBJECT _ => true
      | _                 => false
    then
      if not (nvsExists (nv, fn x => x = name) (!includedClassFieldNames))
      then infoExclFieldNameNotIncl "includedClassFieldNames"
      else ()
    else if nvsExists (nv, fn x => x = name) (!excludedFieldNames)
    then infoExclFieldNameExcl "excludedFieldNames"
    else if
      nvsExists (nv, fn x => String.isPrefix x name)
        (!excludedFieldNamePrefixes)
    then
      infoExclFieldNameExcl "excludedFieldNamePrefixes"
    else if
      nvsExists (nv, fn x => String.isSuffix x name)
        (!excludedFieldNameSuffixes)
    then
      infoExclFieldNameExcl "excludedFieldNameSuffixes"
    else ()
  end

fun isNonOptPointerField repo vers containerName fieldInfo =
  let
    val fieldName = getName fieldInfo
    val namespace = BaseInfo.getNamespace fieldInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
  in
    nvsExists (nv, fn x => x = (containerName, fieldName))
      (!nonOptionalPointerFields)
  end


(* Constant names *)

fun checkConstantName repo vers constantInfo =
  let
    val name = getName constantInfo
    val namespace = BaseInfo.getNamespace constantInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
    fun infoExclConstantName match =
      infoExcl (concat ["constant excluded by configuration (", match, ")"])
  in
    if nvsExists (nv, fn x => x = name) (!excludedConstantNames)
    then infoExclConstantName "excludedConstantNames"
    else if
      nvsExists (nv, fn x => String.isPrefix x name)
        (!excludedConstantNamePrefixes)
    then
      infoExclConstantName "excludedConstantNamePrefixes"
    else if
      nvsExists (nv, fn x => String.isSuffix x name)
        (!excludedConstantNameSuffixes)
    then
      infoExclConstantName "excludedConstantNameSuffixes"
    else ()
  end


(* Flags/enum value names *)

fun fixFlagsEnumValueName name =
  case List.find (fn (x, _) => x = name) (!newFlagsEnumValueNames) of
    SOME (_, name') => name'
  | NONE            => name
