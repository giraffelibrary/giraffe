open GIRepository


datatype infoerror =
  IEMsg of string
| IEGrp of infoerrorhier list

withtype infoerrorhier = (LargeInt.int * InfoType.t) * infoerror

fun mkInfoError (n, info) ie : infoerrorhier =
  ((n, InfoType.getType info), ie)


exception InfoError of infoerror

fun infoError msg = raise InfoError (IEMsg msg)


fun revMapInfos getN getNth f (info, xs) =
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
                InfoError ie =>
                  raise InfoError (IEGrp [mkInfoError (n', info') ie])
        in
          aux xs' n'
        end
  in
    aux xs (getN info)
  end

fun revFoldInfos getN getNth f (info, acc) =
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
                InfoError ie =>
                  raise InfoError (IEGrp [mkInfoError (n', info') ie])
        in
          aux acc' n'
        end
  in
    aux acc (getN info)
  end

fun foldInfos getN getNth f (info, acc) =
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
                InfoError ie =>
                  raise InfoError (IEGrp [mkInfoError (n, info') ie])
          val n' = n + 1
        in
          aux acc' n'
        end
  in
    aux acc 0
  end

fun revFoldMapInfos getN getNth f (info, (xs, acc)) =
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
                InfoError ie =>
                  raise InfoError (IEGrp [mkInfoError (n', info') ie])
        in
          aux (xs', acc') n'
        end
  in
    aux (xs, acc) (getN info)
  end


fun revMapInfosWithErrs getN getNth f (info, (xs, errs)) =
  let
    fun aux (xs, errs) n =
      if n <= 0
      then (xs, errs : infoerrorhier list)
      else
        let
          val n' = n - 1
          val info' = getNth info n'
          val (xs', errs') =
            let
              val (x, fErrs) = f (info', [] : infoerrorhier list)
              val errs' =
                case fErrs of
                  []     => errs
                | _ :: _ => mkInfoError (n', info') (IEGrp fErrs) :: errs
            in
              (x :: xs, errs')
            end
              handle
                InfoError ie =>
                  (xs, mkInfoError (n', info') ie :: errs)
        in
          aux (xs', errs') n'
        end
  in
    aux (xs, errs) (getN info)
  end

fun revFoldInfosWithErrs getN getNth f (info, (acc, errs)) =
  let
    fun aux (acc, errs) n =
      if n <= 0
      then (acc, errs : infoerrorhier list)
      else
        let
          val n' = n - 1
          val info' = getNth info n'
          val (acc', errs') =
            let
              val (acc', fErrs) = f (info', (acc, [] : infoerrorhier list))
              val errs' =
                case fErrs of
                  []     => errs
                | _ :: _ => mkInfoError (n', info') (IEGrp fErrs) :: errs
            in
              (acc', errs')
            end
              handle
                InfoError ie =>
                  (acc, mkInfoError (n', info') ie :: errs)
        in
          aux (acc', errs') n'
        end
  in
    aux (acc, errs) (getN info)
  end

fun revFoldMapInfosWithErrs getN getNth f (info, (xs, acc, errs)) =
  let
    fun aux (xs, acc, errs) n =
      if n <= 0
      then (xs, acc, errs : infoerrorhier list)
      else
        let
          val n' = n - 1
          val info' = getNth info n'
          val (xs', acc', errs') =
            let
              val (x, (acc', fErrs)) = f (info', (acc, [] : infoerrorhier list))
              val errs' =
                case fErrs of
                  []     => errs
                | _ :: _ => mkInfoError (n', info') (IEGrp fErrs) :: errs
            in
              (x :: xs, acc', errs')
            end
              handle
                InfoError ie =>
                  (xs, acc, mkInfoError (n', info') ie :: errs)
        in
          aux (xs', acc', errs') n'
        end
  in
    aux (xs, acc, errs) (getN info)
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
      | []                 => infoError "no shared library"
    )
  | NONE               => infoError "no shared library"

(* On Darwin, the shared library file returned by `getSharedLibraryFile`
 * includes a path.  `getSharedLibraryFileName` returns just the file name,
 * i.e. removes the path.
 *)

fun getSharedLibraryFileName repo vers namespace =
  OS.Path.file (getSharedLibraryFile repo vers namespace)


fun getName info =
  case BaseInfo.getName info of
    SOME name => name
  | NONE      => infoError "no name"

fun getParent objectInfo =
  case ObjectInfo.getParent objectInfo of
    SOME parentObjectInfo => parentObjectInfo
  | NONE                  => infoError "no parent info"

fun getInterface typeInfo =
  case TypeInfo.getInterface typeInfo of
    SOME interfaceInfo => interfaceInfo
  | NONE               => infoError "no interface info"

fun checkDeprecated info =
  if BaseInfo.isDeprecated info
  then infoError "deprecated"
  else ()

fun checkNonClassStruct structInfo =
  if StructInfo.isGtypeStruct structInfo
  then infoError "class struct"
  else ()
