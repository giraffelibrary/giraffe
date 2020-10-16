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
    | ALIAS info     => ("alias",        getName optParentInfo info)  (* GIR only *)
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
