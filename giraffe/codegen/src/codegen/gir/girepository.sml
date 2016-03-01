open GIRepository


type info_id = string * string option  (* info type and optional name *)

datatype info_excl =
  IEMsg of string
| IEGrp of info_excl_hier list

withtype info_excl_hier = info_id * info_excl

local
  open InfoType

  fun getName info =
    case BaseInfo.getName info of
      SOME name => SOME name
    | NONE      => SOME "(none)"

  fun getTypeTag typeInfo =
    SOME (TypeTag.toString (TypeInfo.getTag typeInfo))

  fun getId info =
    case getType info of
      INVALID        => ("(invalid)",    NONE)
    | FUNCTION info  => ("function",     getName info)
    | CALLBACK info  => ("callback",     getName info)
    | STRUCT info    => ("struct",       getName info)
    | BOXED info     => ("boxed",        getName info)
    | ENUM info      => ("enum",         getName info)
    | FLAGS info     => ("flags",        getName info)
    | OBJECT info    => ("object",       getName info)
    | INTERFACE info => ("interface",    getName info)
    | ALIAS info     => ("alias",        getName info)  (* GIR only *)
    | CONSTANT info  => ("constant",     getName info)
    | INVALID_0      => ("(invalid_0)",  NONE)
    | UNION info     => ("union",        getName info)
    | VALUE info     => ("value",        getName info)
    | SIGNAL info    => ("signals",      getName info)
    | VFUNC info     => ("vfunc",        getName info)
    | PROPERTY info  => ("property",     getName info)
    | FIELD info     => ("field",        getName info)
    | ARG info       => ("arg",          getName info)
    | TYPE info      => ("type",         getTypeTag info)
    | UNRESOLVED     => ("(unresolved)", NONE)
in
  fun mkInfoExclHier info ie : info_excl_hier = ((getId info), ie)
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
                  raise InfoExcl (IEGrp [mkInfoExclHier info' ie])
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
                  raise InfoExcl (IEGrp [mkInfoExclHier info' ie])
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
                  raise InfoExcl (IEGrp [mkInfoExclHier info' ie])
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
                  raise InfoExcl (IEGrp [mkInfoExclHier info' ie])
        in
          aux (xs', acc') n'
        end
  in
    aux (xs, acc) (getN info)
  end


fun revMapInfosWithExcls (getN : 'a -> LargeInt.int) getNth f (info, (xs, excls)) =
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
                | _ :: _ => mkInfoExclHier info' (IEGrp fExcls) :: excls
            in
              (x :: xs, excls')
            end
              handle
                InfoExcl ie =>
                  (xs, mkInfoExclHier info' ie :: excls)
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
                | _ :: _ => mkInfoExclHier info' (IEGrp fExcls) :: excls
            in
              (acc', excls')
            end
              handle
                InfoExcl ie =>
                  (acc, mkInfoExclHier info' ie :: excls)
        in
          aux (acc', excls') n'
        end
  in
    aux (acc, excls) (getN info)
  end

fun revFoldMapInfosWithExcls (getN : 'a -> LargeInt.int) getNth f (info, (xs, acc, excls)) =
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
                | _ :: _ => mkInfoExclHier info' (IEGrp fExcls) :: excls
            in
              (x :: xs, acc', excls')
            end
              handle
                InfoExcl ie =>
                  (xs, acc, mkInfoExclHier info' ie :: excls)
        in
          aux (xs', acc', excls') n'
        end
  in
    aux (xs, acc, excls) (getN info)
  end



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

fun checkDeprecated info =
  if BaseInfo.isDeprecated info
  then infoExcl "deprecated"
  else ()

fun checkNonClassStruct structInfo =
  if StructInfo.isGtypeStruct structInfo
  then infoExcl "class struct"
  else ()
