(*
 * Open file using the following command:
 *
 * LD_LIBRARY_PATH=/home/pclayton/SML/Giraffe/devel/giraffe/auto/polyml: xpp -f codegen.sml -c poly
 *)

PolyML.Compiler.reportUnreferencedIds := true;
OS.FileSys.chDir "../"; use "polyml.sml"; OS.FileSys.chDir "codegen/";
use "polyml-typelib.sml";




(* List utilities *)

fun genfoldmapl

  (g : 'b * 'd list -> 'd list)
  (f : 'a * 'c -> 'b * 'c)

: 'a list * 'c -> 'd list * 'c =
  let
    fun aux (xs, c) =
      case xs of
        x :: xs' =>
          let
            val (y, c') = f (x, c)
            val (ys, c') = aux (xs', c')
          in
            (g (y, ys), c')
          end
      | []       => ([], c)
  in
    aux
  end

fun foldmapl f = genfoldmapl (op ::) f

fun insert (x, xs) =
  if List.exists (fn x' => x = x') xs then xs else x :: xs

local
  fun find (e, xs) =
    let
      fun aux n =
        fn
          x :: xs =>
            if x = e
            then SOME n
            else aux (n + 1) xs
        | []      => NONE
    in
      aux 0 xs
    end

  fun splitAt (n, xs) =
    let
      fun aux n (ys, xs) =
        if n > 0
        then
          case xs of
            x :: xs => aux (n - 1) (x :: ys, xs)
          | []      => raise Subscript
        else if n = 0
        then (ys, xs)
        else raise Subscript
    in
      aux n ([], xs)
    end
in
  fun removeFirst (e, xs) =
    case find (e, xs) of
      SOME n =>
        let
          val (ys, xs) = splitAt (n, xs)
        in
          List.revAppend (ys, tl xs)
        end
    | NONE   => xs
end

fun revMapAppend f (xs, ys) = foldl (fn (x, ys) => f x :: ys) ys xs
fun revMap f xs = revMapAppend f (xs, [])

fun partitionRevAppendMap (f, g) =
  let
    fun aux (acc1, acc2) =
      fn
        x :: xs => (
          case f x of
            SOME y => aux (y :: acc1, acc2) xs
          | NONE   => aux (acc1, g x :: acc2) xs
        )
      | []      => (acc1, acc2)
  in
    aux
  end

fun partitionRevMap (f, g) = partitionRevAppendMap (f, g) ([], [])

fun sepWith sep =
  let
    fun aux acc =
      fn
        []      => rev acc
      | x :: xs => aux (x :: sep :: acc) xs
  in
    fn
      []      => []
    | x :: [] => [x]
    | x :: xs => aux [x] xs
  end


(* General purpose support for constructing concrete syntax
 *
 * This support embeds certain conventions:
 *   - a spec or dec in a list is not terminated by a semicolon
 *)


(* `toList1` is for convenience when constructing non-empty lists.
 * It is only intended to be applied to literal list expressions.
 *)

fun toList1 xs =
  case xs of
    x :: xs => (x, xs)
  | []      => raise Empty

fun getList1 (xs, x) =
  case xs of
    x :: xs => (x, xs)
  | []      => (x, [])

fun cons1 (x, xs1) = (x, op :: xs1)
fun map1 f (x, xs) = (f x, map f xs)

fun foldl1 f (x, xs) = foldl f x xs

fun unzip1 ((x, y), xys) =
  let
    val (xs, ys) = ListPair.unzip xys
  in
    ((x, xs), (y, ys))
  end


open PrettyPrint.CST
open NameFormat


(* `mkId s` converts a string `s` to an identifier, avoiding SML reserved
 * words by appending an apostrophe character.
 *)
val mkId : string -> id =
  fn
    "abstype"   => "abstype'"
  | "and"       => "and'"
  | "andalso"   => "andalso'"
  | "as"        => "as'"
  | "case"      => "case'"
  | "datatype"  => "datatype'"
  | "do"        => "do'"
  | "else"      => "else'"
  | "end"       => "end'"
  | "exception" => "exception'"
  | "fn"        => "fn'"
  | "fun"       => "fun'"
  | "handle"    => "handle'"
  | "if"        => "if'"
  | "in"        => "in'"
  | "infix"     => "infix'"
  | "infixr"    => "infixr'"
  | "let"       => "let'"
  | "local"     => "local'"
  | "nonfix"    => "nonfix'"
  | "of"        => "of'"
  | "op"        => "op'"
  | "open"      => "open'"
  | "orelse"    => "orelse'"
  | "raise"     => "raise'"
  | "rec"       => "rec'"
  | "then"      => "then'"
  | "type"      => "type'"
  | "val"       => "val'"
  | "with"      => "with'"
  | "withtype"  => "withtype'"
  | "while"     => "while'"
  | "eqtype"    => "eqtype'"
  | "functor"   => "functor'"
  | "include"   => "include'"
  | "sharing"   => "sharing'"
  | "sig"       => "sig'"
  | "signature" => "signature'"
  | "struct"    => "struct'"
  | "structure" => "structure'"
  | "where"     => "where'"
  | s           => s


fun mkLIdTy lid = TyRef ([], toList1 lid)
fun mkIdTy id = mkLIdTy [id]

val unitTy = mkIdTy "unit"

val mkProdTy = TyProd
fun mkProdTy1 (ty1, tys) =
  case tys of
    []         => ty1
  | ty2 :: tys => mkProdTy (ty1, (ty2, tys))
fun mkProdTy0 tys =
  case tys of
    []        => unitTy
  | ty :: tys => mkProdTy1 (ty, tys)

val destProdTy0 =
  fn
    TyProd (ty1, (ty2, tys)) => ty1 :: ty2 :: tys
  | TyRef ([], ("unit", [])) => []
  | ty                       => [ty]


fun mkIdLNameConst id : const = ConstLName (LNameId (toList1 [id]))

local
  fun mkXs xs = map (fn x => (x, false)) xs
in
  val mkSpecs   : spec   list -> specs   = mkXs
  val mkDecs    : dec    list -> decs    = mkXs
  val mkStrDecs : strdec list -> strdecs = mkXs
end

fun mkTypeDec (tyname, ty) = DecType (toList1 [(tyname, ty)])
fun mkTyExnDec (id, optTy) : dec = DecExn (toList1 [(id, ExnDecTypeOf optTy)])
fun mkEqExnDec (id, lid) : dec = DecExn (toList1 [(id, ExnDecTypeEq lid)])
(* See below for `mkIdValDec` that works around constructor names. *)


fun mkLIdLNameExp lid : exp = ExpLName (LNameId (toList1 lid))
fun mkIdLNameExp id : exp = mkLIdLNameExp [id]
fun mkOpLNameExp infixOp : exp = ExpLName (LNameOp infixOp)

fun mkIdPat id : pat = PatA (APatId id)
fun mkConstPat const : pat = PatA (APatConst const)

fun mkParenPat p = PatA (APatParen (toList1 [p]))
fun mkTuplePat1 ps1 =
  case ps1 of
    (p, []) => p
  | _       => PatA (APatParen ps1)
fun mkTuplePat2 ps2 = PatA (APatParen (cons1 ps2))

fun mkParenExp e = ExpParen (toList1 [e])
fun mkTupleExp1 es1 =
  case es1 of
    (e, []) => e
  | _       => ExpParen es1
fun mkTupleExp2 es2 = ExpParen (cons1 es2)

fun mkRevAppExp (e2, e1) = ExpApp (e1, e2)

(* `mkMLtonImportExp functionSymbol (parTys, retTy)` constructs a MLton
 * low-level function call expression as follows where N = `length parTys`:
 *
 *   _import "<getTypeSymbol>" : <parTy[1]> * ... * <parTy[N]> -> <retTy>;
 *
 *     if N >= 1
 *
 *
 *   _import "<getTypeSymbol>" : unit -> <retTy>;
 *
 *     if N = 0
 *)
fun mkMLtonImportExp functionSymbol (parTys, retTy) =
  ExpMLtonImport (functionSymbol, TyFun (mkProdTy0 parTys, retTy))

fun mkTypeSpec (id, optTy) = SpecType (false, toList1 [(id, optTy)])
fun mkEqTypeSpec (id, optTy) = SpecType (true, toList1 [(id, optTy)])
fun mkValSpec (id, ty) : spec = SpecVal (toList1 [(id, ty)])
fun mkExnSpec (id, optTy) : spec = SpecExn (toList1 [(id, optTy)])

fun mkSigSpec specs : sig1 = SigSpec (mkSpecs specs)
fun mkStructBody strDecs : struct1 = StructBody (mkStrDecs strDecs)
fun mkFunArgStrDec strDecs : funarg = FunArgStrDec (mkStrDecs strDecs)

fun mkModuleTopLevelDec module : topleveldec = TopLevelDecModule (module, false)




val boolTy = mkIdTy "bool"
fun optionTy ty =
  let
    val ty' =
      case ty of
        TyProd _ => TyParen ty
      | TyFun _  => TyParen ty
      | _        => ty
  in
    TyRef ([ty'], toList1 ["option"])
  end

val noneId : id = "NONE"
val someId : id = "SOME"
val noneExp : exp = mkIdLNameExp noneId
local
  val someIdExp : exp = mkIdLNameExp someId
in
  fun someExp (e : exp) : exp = ExpApp (someIdExp, e)
end





(* `mkIdValDec (id, exp)` constructs a single val binding that binds the
 * expression `exp` to the identifier `id` as follows:
 *
 *   val <id> = <exp>
 *
 * If `id` is the name of a constructor, the val binding will not rebind
 * `id` because <id> occurs in a pattern.  (In fact, the declaration is likely
 * to give either a parse error for a missing constructor argument or a type
 * error.)  When `id` is present in the list of known constructor names
 * `!constructorNames`, the following workaround is generated to ensure `id`
 * is bound:
 *
 *   local
 *     fun <id> () = <exp>
 *   in
 *     val <id> = <id> ()
 *   end
 *
 * Note that the following workaround could be used, where the local
 * declaration simply removes `id` from the constructor names in the local
 * scope:
 *
 *   local
 *     fun <id> () = ()
 *   in
 *     val <id> = <exp>
 *   end
 *
 * However, this workaround causes warnings to be generated by compilers that
 * check for unreferenced identifiers, so is not used.
 *)

val constructorNames = ref [] : string list ref

fun mkIdValDec (id, exp) : dec =
  let
    fun mkValDec exp = DecVal (toList1 [([], false, PatA (APatId id), exp)])
  in
    if List.exists (fn x => x = id) (!constructorNames)
    then
      let
        val unitExp = ExpConst ConstUnit
        val unitPat = APatConst ConstUnit
        val funDec =
          DecFun (
            [],
            toList1 [
              toList1 [(FunHeadPrefix (id, toList1 [unitPat]), NONE, exp)]
            ]
          )
        val funExp = mkIdLNameExp id
      in
        DecLocal (
          [(funDec, false)],
          [(mkValDec (ExpApp (funExp, unitExp)), false)]
        )
      end
    else
      mkValDec exp
  end








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





fun checkDeprecated info =
  if BaseInfo.isDeprecated info
  then infoError "deprecated"
  else ()

fun getCPrefix repo namespace =
  case Repository.getCPrefix repo namespace of
    SOME cPrefix => cPrefix
  | NONE         => infoError "no C prefix"

fun getSharedLibraryFile repo namespace =
  case Repository.getSharedLibrary repo namespace of
    SOME sharedLibrary => sharedLibrary
  | NONE               => infoError "no shared library"

local
  fun getLibId s =
    let
      (* take alphabetic characters until digit or full-stop *)
      fun take acc ss =
        case Substring.getc ss of
          SOME (c, ss') =>
            if Char.isDigit c orelse c = #"."
            then rev acc
            else if Char.isAlpha c
            then take (c :: acc) ss'
            else take acc ss'
        | NONE          => rev acc

      val cs = take [] (Substring.full s)
    in
      mkId (String.implode cs)
    end
in
  fun getSharedLibraryId repo = 
    getLibId o OS.Path.file o getSharedLibraryFile repo
end

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





























(* Reusable components *)

val iId : id = "I"
val iExp : exp = mkIdLNameExp iId

val falseId : id = "false"
val falseExp = mkIdLNameExp falseId

val bitFlagsName = "BitFlags"

val pairId : id = "pair"
fun pairTy (ty1, ty2) : ty = TyRef ([ty1, ty2], toList1 [pairId])

val valId : id = "val_"
val refId : id = "ref_"
val selfId = "self"
val flagsId : id = "flags"
val CId : id = "C"
val FFIId : id = "FFI"
val withValId : id = "withVal"
val withRefValId : id = "withRefVal"
val fromValId : id = "fromVal"

val valTyName : tyname = ([], valId)
val refTyName : tyname = ([], refId)

val valTy : ty = mkIdTy valId
val refTy : ty = mkIdTy refId
val flagsTy : ty = mkIdTy flagsId

val fId : id = "f"
val fExp : exp = mkIdLNameExp fId
val tId : id = "t"
fun tTy ty : ty = TyRef ([ty], toList1 [tId])
fun tTyName tyVar : tyname = ([tyVar], tId)
val tOptId : id = "tOpt"
val aId : id = "a"
val bId : id = "b"
val aTyVar = (false, aId)
val bTyVar = (false, bId)
val aVarTy : ty = TyVar aTyVar
val bVarTy : ty = TyVar bTyVar
val ptrId : id = "p"
val ptrLId : lid = toList1 [ptrId]
val notnullId : id = "notnull"
val cNotnullLId : lid = toList1 ["C", notnullId]
val notnullTyName : tyname = ([], notnullId)
val notnullTy : ty = mkIdTy notnullId
fun mkNotnullTy prefixIds = TyRef ([], toList1 (prefixIds @ [notnullId]))
fun ptrTyName (tyVar : tyvar) : tyname = ([tyVar], ptrId)
fun ptrTy (varTy : ty) : ty = TyRef ([varTy], ptrLId)
fun mkPtrTy isOpt prefixIds =
  TyRef (
    [if isOpt then unitTy else mkNotnullTy prefixIds],
    toList1 (prefixIds @ [ptrId])
  )
val withPtrId : id = "withPtr"
val withOptPtrId : id = "withOptPtr"
val fromPtrId : id = "fromPtr"
val fromOptPtrId : id = "fromOptPtr"
val baseId : id = "base"
val baseTy = mkIdTy baseId
val toBaseId : id = "toBase"
val objId : id = "obj"
val cPtrLId : lid = toList1 ["C", "p"]
val cOptptrLId : lid = toList1 ["C", "optptr"]

val errorId : id = "Error"
val exnErrorId : id = errorId
val handlerId : id = "handler"
val errorHandlerId : id = "error_handler"
val errorHandlerTyName : tyname = ([], errorHandlerId)
val errorHandlerTyLName : tylname = ([], toList1 [errorHandlerId])
val makeHandlerId : id = "makeHandler"

val getTypeId : id = "getType"
val getTypeUId : id = getTypeId ^ "_"
val getValueId : id = "getValue"
val getValueUId : id = getValueId ^ "_"
val getOptValueId : id = "getOptValue"
val getOptValueUId : id = getOptValueId ^ "_"
val setValueId : id = "setValue"
val setValueUId : id = setValueId ^ "_"
val setOptValueId : id = "setOptValue"
val setOptValueUId : id = setOptValueId ^ "_"

val signalId : id = "signal"
val signalLId : lid = toList1 ["Signal", "signal"]
fun signalTy (ty : ty) : ty = TyRef ([ty], signalLId)
val signalExp : exp = mkIdLNameExp signalId

val getId : id = "get"
val setId : id = "set"
val retId : id = "ret"
val getExp : exp = mkIdLNameExp getId
val setExp : exp = mkIdLNameExp setId
val retExp : exp = mkIdLNameExp retId

val voidId : id = "void"
val retVoidId : id = "ret_void"
val voidExp : exp = mkIdLNameExp voidId
val retVoidExp : exp = mkIdLNameExp retVoidId



(*
 *     structure C :
 *       sig
 *         <specs>
 *       end
 *)
fun mkCStructSpec specs : spec =
  SpecStruct (toList1 [("C", (mkSigSpec specs, []))])

(*
 *     structure C =
 *       struct
 *         <strDecs>
 *       end
 *)
fun mkCStructStrDec strDecs : strdec =
  StrDecStruct (toList1 [("C", NONE, mkStructBody strDecs)])



(* PolyML-specific reusable components *)

val callId : id = "call"
val loadSymId : id = "load_sym"

val PolyMLId : id = "PolyML"
val VALId : id = "VAL"
val PTRId : id = "PTR"
val REFId : id = "REF"
val OPTPTRId : id = "OPTPTR"

val VOIDId : id = "VOID"

val VOIDConvExp = mkLIdLNameExp [FFIId, PolyMLId, VOIDId]


val cValTy : ty = TyRef ([], toList1 [CId, valId])
val cRefTy : ty = TyRef ([], toList1 [CId, refId])

fun mkCInterfaceConvTy ty = TyRef ([ty], toList1 ["CInterface", "Conversion"])



(*
 *     structure PolyML :
 *       sig
 *         <specs>
 *       end
 *)
fun mkPolyMLStructSpec specs : spec =
  SpecStruct (toList1 [(PolyMLId, (mkSigSpec specs, []))])

(*
 *     structure PolyML =
 *       struct
 *         <strDecs>
 *       end
 *)
fun mkPolyMLStructStrDec strDecs : strdec =
  StrDecStruct (toList1 [(PolyMLId, NONE, mkStructBody strDecs)])





(* Support for structure identifiers *)

fun mkClassStrNameId name = toUCC name ^ "Class"
fun prefixClassStrNameId name ids = mkClassStrNameId name :: ids

fun mkRecordStrNameId name = toUCC name ^ "Record"
fun prefixRecordStrNameId name ids = mkRecordStrNameId name :: ids

fun mkStrNameId name = toUCC name
fun prefixStrNameId name ids = mkStrNameId name :: ids


(*
 *     <ObjectNamespace><ObjectName>Class
 *)
fun mkClassStrId namespace name = concat [toUCC namespace, toUCC name, "Class"]
fun prefixClassStrId namespace name ids = mkClassStrId namespace name :: ids

(*
 *     <StructNamespace><StructName>Record
 *)
fun mkRecordStrId namespace name =
  concat [toUCC namespace, toUCC name, "Record"]
fun prefixRecordStrId namespace name ids = mkRecordStrId namespace name :: ids

(*
 *     <XNamespace><XName>
 *)
fun mkStrId namespace name = concat [toUCC namespace, toUCC name]
fun prefixStrId namespace name ids = mkStrId namespace name :: ids


(*
 *     <ObjectNamespace>.<ObjectName>Class
 *)
fun prefixClassStrIds namespace name ids =
  toUCC namespace :: concat [toUCC name, "Class"] :: ids

(*
 *     <StructNamespace>.<StructName>Record
 *)
fun prefixRecordStrIds namespace name ids =
  toUCC namespace :: concat [toUCC name, "Record"] :: ids

(*
 *     <XNamespace>.<XName>
 *)
fun prefixStrIds namespace name ids = toUCC namespace :: toUCC name :: ids



(* Support for interface type references *)

datatype interfacetype =
  SIMPLE
| CLASS
| RECORD
| UNION


(* `interfacescope` describes the position of an interface reference
 * relative to where the interface type is declared.  The possible values are
 * as follows:
 *
 *   GLOBAL
 *     Referenced interface type is declared in another namespace.
 *
 *   LOCALNAMESPACE
 *     Referenced interface type is declared within this namespace and
 *     reference is at the namespace module level.
 *
 *   LOCALINTERFACEOTHER
 *     Referenced interface type is declared within this namespace and
 *     reference is at the interface module level where the interface
 *     module that references the interface type IS NOT the interface
 *     module that declares it.
 *
 *   LOCALINTERFACESELF
 *     Referenced interface type is declared within this namespace and
 *     reference is at the interface module level where the interface
 *     module that references the interface type IS the interface
 *     module that declares it.
 *
 * It is easiest to understand this by breaking down the names into the
 * following three concepts:
 *
 *   GLOBAL | LOCAL
 *     Indicates whether the reference to an interface type and the
 *     declaration of that interface type occur in different namespaces
 *     (GLOBAL) or in the same namespace (LOCAL).
 *
 *   NAMESPACE | INTERFACE
 *     Indicates whether the reference to an interface type is from a
 *     namespace module (NAMESPACE) or from an interface module (INTERFACE).
 *
 *   OTHER | SELF
 *     Indicates whether the reference to an interface type and the
 *     declaration of that interface type occur in different interface
 *     modules (OTHER) or in the same interface module (SELF).
 *
 *)

datatype interfacescope =
  GLOBAL
| LOCALNAMESPACE
| LOCALINTERFACEOTHER
| LOCALINTERFACESELF


type interfaceref = {
  namespace : string,
  cPrefix   : string,
  name      : string,
  scope     : interfacescope,
  ty        : interfacetype
}


fun makeLocalInterfaceOtherId ({name, ty, ...} : interfaceref) : id =
  concat [
    toLC name,
    case ty of
      SIMPLE => ""
    | CLASS  => "class"
    | RECORD => "record"
    | UNION  => "",
    "_t"
  ]


fun makeLocalInterfaceSelfId ({ty, ...} : interfaceref) : id =
  case ty of
    SIMPLE => "t"
  | CLASS  => "class_t"
  | RECORD => "record_t"
  | UNION  => "t"


fun makeLocalInterfaceId
  (iRef as {scope, ...} : interfaceref)
  : id =
  case scope of
    GLOBAL              => raise Fail "not local interface reference"
  | LOCALNAMESPACE      => raise Fail "not local interface reference"
  | LOCALINTERFACEOTHER => makeLocalInterfaceOtherId iRef
  | LOCALINTERFACESELF  => makeLocalInterfaceSelfId iRef


fun prefixLocalNamespaceIds ({name, ty, ...} : interfaceref) =
  case ty of
    SIMPLE => prefixStrNameId name
  | CLASS  => prefixClassStrNameId name
  | RECORD => prefixRecordStrNameId name
  | UNION  => prefixStrNameId name

fun makeLocalNamespaceIds iRef = prefixLocalNamespaceIds iRef [tId]


fun prefixGlobalIds ({namespace, name, ty, ...} : interfaceref) =
  case ty of
    SIMPLE => prefixStrIds namespace name
  | CLASS  => prefixClassStrIds namespace name
  | RECORD => prefixRecordStrIds namespace name
  | UNION  => prefixStrIds namespace name

fun makeGlobalIds iRef = prefixGlobalIds iRef [tId]


(* For `iRef as {namespace, name, scope, ty, ...} : interfaceref`,
 * `makeInterfaceRefTyLongId iRef` returns the long id `lid` and
 * `numInterfaceRefTyVars iRef` returns number of type parameters `n`
 * according to the following table:
 *
 *     scope                   ty       | n   lid
 *   ===================================+===================================
 *                             SIMPLE   | 0   t
 *                           -----------+-----------------------------------
 *                             CLASS    | 1   class_t
 *     LOCALINTERFACESELF    -----------+-----------------------------------
 *                             RECORD   | 0   record_t
 *                           -----------+-----------------------------------
 *                             UNION    | 1   t
 *   -----------------------------------+-----------------------------------
 *                             SIMPLE   | 0   <name>_t
 *                           -----------+-----------------------------------
 *                             CLASS    | 1   <name>class_t
 *     LOCALINTERFACEOTHER   -----------+-----------------------------------
 *                             RECORD   | 0   <name>record_t
 *                           -----------+-----------------------------------
 *                             UNION    | 1   <name>_t
 *   -----------------------------------+-----------------------------------
 *                             SIMPLE   | 0   <Name>.t
 *                           -----------+-----------------------------------
 *                             CLASS    | 1   <Name>Class.t
 *     LOCALNAMESPACE        -----------+-----------------------------------
 *                             RECORD   | 0   <Name>Record.t
 *                           -----------+-----------------------------------
 *                             UNION    | 1   <Name>.t
 *   -----------------------------------+-----------------------------------
 *                             SIMPLE   | 0   <Namespace>.<Name>.t
 *                           -----------+-----------------------------------
 *                             CLASS    | 1   <Namespace>.<Name>Class.t
 *     GLOBAL                -----------+-----------------------------------
 *                             RECORD   | 0   <Namespace>.<Name>Record.t
 *                           -----------+-----------------------------------
 *                             UNION    | 1   <Namespace>.<Name>.t
 *   -----------------------------------+-----------------------------------
 *
 * Note that `cPrefix` is not used by `makeInterfaceRefTyLongId`.
 *)

fun numInterfaceRefTyVars ({ty, ...} : interfaceref) =
  case ty of
    SIMPLE => 0
  | CLASS  => 1
  | RECORD => 0
  | UNION  => 1

fun makeInterfaceRefTyLongId
  (iRef as {scope, ...} : interfaceref)
  : lid =
  toList1 (
    case scope of
      GLOBAL              => makeGlobalIds iRef
    | LOCALNAMESPACE      => makeLocalNamespaceIds iRef
    | LOCALINTERFACEOTHER => [makeLocalInterfaceOtherId iRef]
    | LOCALINTERFACESELF  => [makeLocalInterfaceSelfId iRef]
  )

(*
fun test (namespace, name, scope, ty) =
  makeInterfaceRefTyLongId {
    namespace = namespace,
    cPrefix   = "CPrefix",
    name      = name,
    scope     = scope,
    ty        = ty
  };

test ("XNamespace", "XName", GLOBAL,              SIMPLE);
test ("XNamespace", "XName", GLOBAL,              CLASS);
test ("XNamespace", "XName", GLOBAL,              RECORD);
test ("XNamespace", "XName", GLOBAL,              UNION);

test ("XNamespace", "XName", LOCALNAMESPACE,      SIMPLE);
test ("XNamespace", "XName", LOCALNAMESPACE,      CLASS);
test ("XNamespace", "XName", LOCALNAMESPACE,      RECORD);
test ("XNamespace", "XName", LOCALNAMESPACE,      UNION);

test ("XNamespace", "XName", LOCALINTERFACEOTHER, SIMPLE);
test ("XNamespace", "XName", LOCALINTERFACEOTHER, CLASS);
test ("XNamespace", "XName", LOCALINTERFACEOTHER, RECORD);
test ("XNamespace", "XName", LOCALINTERFACEOTHER, UNION);

test ("XNamespace", "XName", LOCALINTERFACESELF,  SIMPLE);
test ("XNamespace", "XName", LOCALINTERFACESELF,  CLASS);
test ("XNamespace", "XName", LOCALINTERFACESELF,  RECORD);
test ("XNamespace", "XName", LOCALINTERFACESELF,  UNION);
*)





fun makeNamespaceStrId ({name, ty, ...} : interfaceref) =
  case ty of
    SIMPLE => mkStrNameId name
  | CLASS  => mkClassStrNameId name
  | RECORD => mkRecordStrNameId name
  | UNION  => mkStrNameId name


fun makeInterfaceOtherStrId ({namespace, name, ty, ...} : interfaceref) =
  case ty of
    SIMPLE => mkStrId namespace name
  | CLASS  => mkClassStrId namespace name
  | RECORD => mkRecordStrId namespace name
  | UNION  => mkStrId namespace name


(* For `iRef as {namespace, name, scope, ty, ...} : interfaceref`,
 * `prefixInterfaceStrId iRef id` returns the ids `ids` according to
 * the following table:
 *
 *     scope                   ty       | ids
 *   ===================================+===================================
 *                             SIMPLE   | <id>
 *                           -----------+-----------------------------------
 *                             CLASS    | <Namespace><Name>Class.<id>
 *     LOCALINTERFACESELF    -----------+-----------------------------------
 *                             RECORD   | <Namespace><Name>Record.<id>
 *                           -----------+-----------------------------------
 *                             UNION    | <Namespace><Name>.<id>
 *   -----------------------------------+-----------------------------------
 *                             SIMPLE   | <Namespace><Name>.<id>
 *                           -----------+-----------------------------------
 *                             CLASS    | <Namespace><Name>Class.<id>
 *     _                     -----------+-----------------------------------
 *                             RECORD   | <Namespace><Name>Record.<id>
 *                           -----------+-----------------------------------
 *                             UNION    | <Namespace><Name>.<id>
 *   -----------------------------------+-----------------------------------
 *
 * Note that, in the case of `LOCALINTERFACESELF`, prefixing occurs
 * for objects, structs and unions because these use a separate structure
 * to declare the type.
 *
 * Note that `cPrefix` is not used by `prefixInterfaceStrId`.
 *)

fun prefixInterfaceStrId
  (iRef as {namespace, name, scope, ty, ...} : interfaceref)
  (ids : id list)
    : id list =
  case scope of
    GLOBAL              => makeInterfaceOtherStrId iRef :: ids
  | LOCALNAMESPACE      => makeInterfaceOtherStrId iRef :: ids
  | LOCALINTERFACEOTHER => makeInterfaceOtherStrId iRef :: ids
  | LOCALINTERFACESELF  =>
      case ty of
        SIMPLE => ids
      | CLASS  => mkClassStrId namespace name :: ids
      | RECORD => mkRecordStrId namespace name :: ids
      | UNION  => mkStrId namespace name :: ids

(*
fun test (namespace, name, scope, ty) id =
  prefixInterfaceStrId {
    namespace = namespace,
    cPrefix   = "CPrefix",
    name      = name,
    scope     = scope,
    ty        = ty
  } id;

test ("XNamespace", "XName", GLOBAL,              SIMPLE) ["id"];
test ("XNamespace", "XName", GLOBAL,              CLASS)  ["id"];
test ("XNamespace", "XName", GLOBAL,              RECORD) ["id"];
test ("XNamespace", "XName", GLOBAL,              UNION)  ["id"];

test ("XNamespace", "XName", LOCALNAMESPACE,      SIMPLE) ["id"];
test ("XNamespace", "XName", LOCALNAMESPACE,      CLASS)  ["id"];
test ("XNamespace", "XName", LOCALNAMESPACE,      RECORD) ["id"];
test ("XNamespace", "XName", LOCALNAMESPACE,      UNION)  ["id"];

test ("XNamespace", "XName", LOCALINTERFACEOTHER, SIMPLE) ["id"];
test ("XNamespace", "XName", LOCALINTERFACEOTHER, CLASS)  ["id"];
test ("XNamespace", "XName", LOCALINTERFACEOTHER, RECORD) ["id"];
test ("XNamespace", "XName", LOCALINTERFACEOTHER, UNION)  ["id"];

test ("XNamespace", "XName", LOCALINTERFACESELF,  SIMPLE) ["id"];
test ("XNamespace", "XName", LOCALINTERFACESELF,  CLASS)  ["id"];
test ("XNamespace", "XName", LOCALINTERFACESELF,  RECORD) ["id"];
test ("XNamespace", "XName", LOCALINTERFACESELF,  UNION)  ["id"];
*)




fun makeErrorIRef namespace optName : interfaceref =
  let
    val errorNamespace = "GLib"
    val errorCPrefix = "G"
    val errorName = "Error"
    val errorScope =
      if namespace <> errorNamespace
      then GLOBAL
      else
        case optName of
          NONE      => LOCALNAMESPACE
        | SOME name =>
            if name = errorName
            then LOCALINTERFACESELF
            else LOCALINTERFACEOTHER
    val errorTy = RECORD
  in
    {
      namespace = errorNamespace,
      cPrefix   = errorCPrefix,
      name      = errorName,
      scope     = errorScope,
      ty        = errorTy
    }
  end

fun makeTypeIRef namespace optName : interfaceref =
  let
    val typeNamespace = "GObject"
    val typeCPrefix = "G"
    val typeName = "Type"
    val typeScope =
      if namespace <> typeNamespace
      then GLOBAL
      else
        case optName of
          NONE      => LOCALNAMESPACE
        | SOME name =>
            if name = typeName
            then LOCALINTERFACESELF
            else LOCALINTERFACEOTHER
    val typeTy = SIMPLE
  in
    {
      namespace = typeNamespace,
      cPrefix   = typeCPrefix,
      name      = typeName,
      scope     = typeScope,
      ty        = typeTy
    }
  end

fun makeValueIRef namespace optName : interfaceref =
  let
    val valueNamespace = "GObject"
    val valueCPrefix = "G"
    val valueName = "Value"
    val valueScope =
      if namespace <> valueNamespace
      then GLOBAL
      else
        case optName of
          NONE      => LOCALNAMESPACE
        | SOME name =>
            if name = valueName
            then LOCALINTERFACESELF
            else LOCALINTERFACEOTHER
    val valueTy = RECORD
  in
    {
      namespace = valueNamespace,
      cPrefix   = valueCPrefix,
      name      = valueName,
      scope     = valueScope,
      ty        = valueTy
    }
  end

fun makeObjectIRef namespace optName : interfaceref =
  let
    val objectNamespace = "GObject"
    val objectCPrefix = "G"
    val objectName = "Object"
    val objectScope =
      if namespace <> objectNamespace
      then GLOBAL
      else
        case optName of
          NONE      => LOCALNAMESPACE
        | SOME name =>
            if name = objectName
            then LOCALINTERFACESELF
            else LOCALINTERFACEOTHER
    val objectTy = CLASS
  in
    {
      namespace = objectNamespace,
      cPrefix   = objectCPrefix,
      name      = objectName,
      scope     = objectScope,
      ty        = objectTy
    }
  end

val makeInterfaceRootIRef = makeObjectIRef

fun getRootObjectIRef
  repo
  namespace
  optName
  (objectInfo, objectIRef : interfaceref) =
  case ObjectInfo.getParent objectInfo of
    NONE      => objectIRef
  | SOME info =>
      let
        (* In this branch, the root is the parent or ancestor of the parent,
         * so not the same interface module.  Consequently, `scope` is never
         * `LOCALINTERFACESELF`.
         *)
        val rootInfo = iterate ObjectInfo.getParent info
        val rootObjectName = getName rootInfo
        val rootObjectNamespace = BaseInfo.getNamespace rootInfo
        val rootObjectCPrefix = getCPrefix repo rootObjectNamespace
        val rootObjectScope =
          if rootObjectNamespace <> namespace
          then GLOBAL
          else
            case optName of
              NONE   => LOCALNAMESPACE
            | SOME _ => LOCALINTERFACEOTHER
        val rootObjectTy = CLASS
      in
        {
          namespace = rootObjectNamespace,
          cPrefix   = rootObjectCPrefix,
          name      = rootObjectName,
          scope     = rootObjectScope,
          ty        = rootObjectTy
        }
      end


fun getIRefTy info =
  case InfoType.getType info of
    InfoType.OBJECT _    => CLASS
  | InfoType.INTERFACE _ => CLASS  (* ??? *)
  | InfoType.STRUCT _    => RECORD
  | InfoType.UNION _     => UNION
  | _                    => SIMPLE



local
  val ordA = ord #"a"
  val ordZ = ord #"z"
  val l = ordZ - ordA + 1
in
  fun makeTyVar tyVarIdx : tyvar * int =
    let
      val n = tyVarIdx mod l
      val m = tyVarIdx div l
      val c = chr (ordA + n)
      val s =
        if m = 0
        then str c
        else concat [str c, Int.toString m]
      val tyVar = (false, s)
    in
      (tyVar, tyVarIdx + 1)
    end
end

fun makeVarTy tyVarIdx : ty * int =
  let
    val (tyVar, tyVarIdx') = makeTyVar tyVarIdx
  in
    (TyVar tyVar, tyVarIdx')
  end

fun makeBaseTy tyVarIdx : ty * int = (mkIdTy baseId, tyVarIdx)

fun makeTyList makeTy (nTys, tyVarIdx) =
  let
    fun aux (n, tys, tyVarIdx) =
      if n <= 0
      then (rev tys, tyVarIdx)
      else
        let
          val (ty, tyVarIdx') = makeTy tyVarIdx
        in
          aux (n - 1, ty :: tys, tyVarIdx')
        end
  in
    aux (nTys, [], tyVarIdx)
  end

(*
makeTyList makeTyVar (3, 0);
makeTyList makeTyVar (3, 52);

makeTyList makeVarTy (3, 0);
makeTyList makeVarTy (3, 52);

makeTyList makeBaseTy (3, 0);
*)


fun makeRefVarTy ((nTys, longId), tyVarIdx) =
  let
    val (tys, tyVarIdx') = makeTyList makeVarTy (nTys, tyVarIdx)
  in
    (TyRef (tys, longId), tyVarIdx')
  end

fun makeRefBaseTy ((nTys, longId), tyVarIdx) =
  let
    val (tys, tyVarIdx') = makeTyList makeBaseTy (nTys, tyVarIdx)
  in
    (TyRef (tys, longId), tyVarIdx')
  end






(* --------------------------------------------------------------------------
 * Function
 * -------------------------------------------------------------------------- *)

(* Function names to be skipped *)

(* Manually specified symbols
 *
 * Notes
 *
 *   1. Parameter selection_data is annotated with (out) but should probably
 *      be (inout).  (out) requires `withNewPtr` which cannot be implemented
 *      because size of GtkSelectionData is not known by C compiler.
 *
 *)
val excludedFunctionSymbols = [
  "pango_break",
  "pango_default_break",
  "pango_get_log_attrs",
  "pango_glyph_item_letter_space",
  "pango_shape",
  "pango_read_line",
  "pango_scan_int",
  "pango_scan_string",
  "pango_scan_word",
  "pango_attribute_init",
  "pango_attribute_destroy",
  "g_source_new",
  "g_source_set_callback_indirect",
  "g_source_add_poll",
  "g_source_remove_poll",
  "g_source_set_funcs",
  "g_source_remove_by_funcs_user_data",
  "g_source_remove_by_user_data",
  "g_closure_new_simple",
  "g_closure_new_object",
  "g_param_spec_pool_new",
  "g_param_value_convert",
  "g_param_value_defaults",
  "g_param_value_set_default",
  "g_param_value_validate",
  "g_param_values_cmp",
  "g_signal_accumulator_first_wins",
  "g_signal_accumulator_true_handled",
  "g_signal_chain_from_overridden",
  "g_signal_get_invocation_hint",
  "g_signal_has_handler_pending",
  "g_signal_name",
  "g_signal_query",
  "g_signal_remove_emission_hook",
  "g_signal_stop_emission",
  "g_signal_stop_emission_by_name",
  "g_source_set_closure",
  "g_source_set_dummy_callback",
  "g_strdup_value_contents",
  "g_type_check_instance",
  "g_type_check_value",
  "g_type_class_add_private",
  "g_type_default_interface_unref",
  "g_type_free_instance",
  "g_type_name_from_class",
  "g_type_name_from_instance",
  "g_dbus_error_register_error",
  "g_dbus_error_unregister_error",
  "gdk_pixbuf_error_quark",
  "gdk_add_option_entries_libgtk_only",
  "gtk_accel_map_load_scanner",
  "gtk_binding_entry_add_signal_from_string",
  "gtk_binding_entry_remove",
  "gtk_binding_set_find",
  "gtk_bindings_activate",
  "gtk_bindings_activate_event",
  "gtk_binding_entry_skip",
  "gtk_buildable_custom_tag_start",
  "gtk_distribute_natural_allocation",
  "gtk_rc_parse_color",  (* deprecated anyway? *)
  "gtk_rc_parse_color_full",  (* deprecated anyway? *)
  "gtk_rc_property_parse_color",
  "gtk_rc_property_parse_border",
  "gtk_rc_property_parse_enum",
  "gtk_rc_property_parse_flags",
  "gtk_rc_property_parse_requisition",
  "gtk_tree_drag_source_drag_data_get",  (* see note 1 *)
  "vte_pty_error_quark"
]

val excludedFunctionSymbolPrefixes = [
  "g_cclosure_marshal",
  "g_signal_connect",
  "g_signal_handler"
]

val excludedFunctionSymbolSuffixes = [
]

fun checkFunctionSymbol functionInfo =
  let
    val symbol = FunctionInfo.getSymbol functionInfo
  in
    if
      List.exists (fn x => x = symbol) excludedFunctionSymbols
       orelse
         List.exists (fn x => String.isPrefix x symbol)
           excludedFunctionSymbolPrefixes
       orelse
         List.exists (fn x => String.isSuffix x symbol)
           excludedFunctionSymbolSuffixes
    then infoError "manually excluded"
    else ()
  end

(* Systematically formed names that do not belong in the user API *)
val nonUserFunctionNames = [
  "ref",
  "ref_sink",
  "sink",
  "unref",
  "free",
  "false",
  "true",
  "quark",
  "error_quark"
]

fun checkFunctionName name =
  if List.exists (fn x => x = name) nonUserFunctionNames
  then infoError "non-user function"
  else ()


(* OUT/INOUT parameter and return values that are optional *)

val optRetFunNames = [
  ("Gtk", SOME "FileChooser", "get_filename"),
  ("Gtk", SOME "FileChooser", "get_current_folder"),
  ("Gtk", SOME "FileChooser", "get_uri"),
  ("Gtk", SOME "FileChooser", "get_current_folder_uri"),
  ("Gtk", SOME "FileChooser", "get_preview_widget"),
  ("Gtk", SOME "FileChooser", "get_preview_filename"),
  ("Gtk", SOME "FileChooser", "get_preview_uri"),
  ("Gtk", SOME "FileChooser", "get_extra_widget"),
  ("Gtk", SOME "FileChooser", "get_filter"),
  ("Gtk", SOME "FileChooser", "get_preview_file"),
  ("Gtk", SOME "Paned", "get_child1"),
  ("Gtk", SOME "Paned", "get_child2"),
  ("Gtk", SOME "Container", "get_focus_child")
]

val optArgNames = [
  ("Gtk", SOME "Container", "set-focus-child", "object")
]


(* Support for parameters and return values *)

val containerForUtf8 =
  "** ownership transfer CONTAINER for UTF8 not valid **"

val containerForFilename =
  "** ownership transfer CONTAINER for FILENAME not valid **"

val containerForInterface =
  "** ownership transfer CONTAINER for INTERFACE not valid **"

val everythingForNonPtrStruct =
  "** ownership transfer EVERYTHING for non-pointer STRUCT INTERFACE parameter \
  \not valid **"
  (* In fact this is used for a non-pointer GObject.Value out parameter where
   * the caller must call g_value_unset to free resources used by the
   * GObject.Value.  This appears to occur only for get_property functions, so
   * this is all pending property handling...
   *)

val everythingForNonPtrUnion =
  "** ownership transfer EVERYTHING for non-pointer UNION INTERFACE parameter \
  \not valid **"

val everythingForIn =
  "ownership transfer EVERYTHING for IN parameter not supported"

val everythingForInOut =
  "ownership transfer EVERYTHING for INOUT parameter not supported"

val nonPtrForObject =
  "non-pointer for OBJECT INTERFACE not supported"

val nonPtrForInterface =
  "non-pointer for INTERFACE INTERFACE not supported"

val nonPtrForInStruct =
  "non-pointer IN parameter for STRUCT INTERFACE not supported"

val nonPtrForInUnion =
  "non-pointer IN parameter for UNION INTERFACE not supported"

val nonPtrForRetStruct =
  "non-pointer return for STRUCT INTERFACE not supported"

val nonPtrForRetUnion =
  "non-pointer return for UNION INTERFACE not supported"

val ptrForFlags =
  "pointer for FLAGS INTERFACE not supported"

val ptrForEnum =
  "pointer for ENUM INTERFACE not supported"

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

fun isPointerForScalar fmt ty =
  concat ["pointer for scalar (", fmt ty, ") not supported"]


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
    STBOOLEAN => "BOOLEAN"
  | STINT8    => "INT8"
  | STUINT8   => "UINT8"
  | STINT16   => "INT16"
  | STUINT16  => "UINT16"
  | STINT32   => "INT32"
  | STUINT32  => "UINT32"
  | STINT64   => "INT64"
  | STUINT64  => "UINT64"
  | STFLOAT   => "FLOAT"
  | STDOUBLE  => "DOUBLE"
  | STUNICHAR => "CHAR"

val scalarStrId =
  fn
    STBOOLEAN => "Bool"
  | STINT8    => "Int8"
  | STUINT8   => "Word8"
  | STINT16   => "Int16"
  | STUINT16  => "Word16"
  | STINT32   => "Int32"
  | STUINT32  => "Word32"
  | STINT64   => "Int64"
  | STUINT64  => "Word64"
  | STFLOAT   => "Float"
  | STDOUBLE  => "Double"
  | STUNICHAR => "Char"

val scalarAccessorId =
  fn
    STBOOLEAN => "boolean"
  | STINT8    => "char"
  | STUINT8   => "uchar"
  | STINT16   => infoError "no corresponding GType for INT16"
  | STUINT16  => infoError "no corresponding GType for UINT16"
  | STINT32   => "int"
  | STUINT32  => "uint"
  | STINT64   => "long"
  | STUINT64  => "ulong"
  | STFLOAT   => "float"
  | STDOUBLE  => "double"
  | STUNICHAR => "char"

val scalarTyRef =
  fn
    STBOOLEAN => (0, toList1 ["bool"])
  | STINT8    => (0, toList1 ["LargeInt", "int"])
  | STUINT8   => (0, toList1 ["LargeInt", "int"])
  | STINT16   => (0, toList1 ["LargeInt", "int"])
  | STUINT16  => (0, toList1 ["LargeInt", "int"])
  | STINT32   => (0, toList1 ["LargeInt", "int"])
  | STUINT32  => (0, toList1 ["LargeInt", "int"])
  | STINT64   => (0, toList1 ["LargeInt", "int"])
  | STUINT64  => (0, toList1 ["LargeInt", "int"])
  | STFLOAT   => (0, toList1 ["real"])
  | STDOUBLE  => (0, toList1 ["real"])
  | STUNICHAR => (0, toList1 ["char"])

local
  (* Initial argument values for OUT parameters *)
  val int0Exp = ExpConst (ConstInt (0, NONE))
  val real0Exp = ExpConst (ConstReal (0, 0, NONE))
  val char0Exp = ExpConst (ConstChar #"\000")
in
  val initValExp =
    fn
      STBOOLEAN => falseExp
    | STINT8    => int0Exp
    | STUINT8   => int0Exp
    | STINT16   => int0Exp
    | STUINT16  => int0Exp
    | STINT32   => int0Exp
    | STUINT32  => int0Exp
    | STINT64   => int0Exp
    | STUINT64  => int0Exp
    | STFLOAT   => real0Exp
    | STDOUBLE  => real0Exp
    | STUNICHAR => char0Exp
end


val stringTyRef : int * lid = (0, toList1 ["string"])


type scalarinfo =
  {
    name  : id,
    ty    : scalartype
  }

type utf8info =
  {
    name    : id,
    isOpt   : bool,
    ownXfer : bool
  }

type interfaceinfo =
  {
    name       : id,
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


datatype dir =
  IN
| OUT of bool  (* flag indicates caller-allocated *)
| INOUT

datatype parinfo =
  PIVOID
| PISCALAR of dir * scalarinfo
| PIUTF8 of dir * utf8info
| PIINTERFACE of dir * interfaceinfo


datatype retinfo =
  RIVOID
| RISCALAR of scalarinfo
| RIUTF8 of utf8info
| RIINTERFACE of interfaceinfo


fun getParInfo repo functionNamespace optContainerName functionName argInfo =
  let
    val direction = ArgInfo.getDirection argInfo
    val mayBeNull = ArgInfo.mayBeNull argInfo

    val ownershipTransfer = ArgInfo.getOwnershipTransfer argInfo
    val isCallerAllocates = ArgInfo.isCallerAllocates argInfo

    val typeInfo = ArgInfo.getType argInfo
    val tag = TypeInfo.getTag typeInfo
    val isPointer = TypeInfo.isPointer typeInfo

    val argName = getName argInfo
    val argId = mkId (toLCC argName)

    val dir =
      case direction of
        Direction.IN    => IN
      | Direction.OUT   => OUT isCallerAllocates
      | Direction.INOUT => INOUT

    (* Currently, `mayBeNull` is valid only for IN parameters.  For OUT/INOUT
     * parameters, it indicates whether the C parameter is optional, not
     * whether the imported/exported value is optionally null, i.e. what
     * we would expect from `isOptional`.  Therefore we use the list of
     * function name-argument name pairs `optArgNames` to force parameters
     * to be optional. *)
    val forceOpt =
      let
        fun isArg x =
          x = (functionNamespace, optContainerName, functionName, argName)
      in
        List.exists isArg optArgNames
      end
    val isOpt =
      case dir of
        IN => mayBeNull orelse forceOpt
      | _  => forceOpt

    fun toScalarInfo ty =
      if isPointer
      then infoError (isPointerForScalar scalarToString ty)
      else
        {
          name  = argId,
          ty    = ty
        }

    open TypeTag
  in
    case tag of
      ERROR     => infoError "parameter type ERROR not expected"
    | GTYPE     => infoError "parameter type GTYPE not supported"
    | ARRAY     => infoError "parameter type ARRAY not supported"
    | GLIST     => infoError "parameter type GLIST not supported"
    | GSLIST    => infoError "parameter type GSLIST not supported"
    | GHASH     => infoError "parameter type GHASH not supported"
    | VOID      => PIVOID
    | BOOLEAN   => PISCALAR (dir, toScalarInfo STBOOLEAN)
    | INT8      => PISCALAR (dir, toScalarInfo STINT8)
    | UINT8     => PISCALAR (dir, toScalarInfo STUINT8)
    | INT16     => PISCALAR (dir, toScalarInfo STINT16)
    | UINT16    => PISCALAR (dir, toScalarInfo STUINT16)
    | INT32     => PISCALAR (dir, toScalarInfo STINT32)
    | UINT32    => PISCALAR (dir, toScalarInfo STUINT32)
    | INT64     => PISCALAR (dir, toScalarInfo STINT64)
    | UINT64    => PISCALAR (dir, toScalarInfo STUINT64)
    | FLOAT     => PISCALAR (dir, toScalarInfo STFLOAT)
    | DOUBLE    => PISCALAR (dir, toScalarInfo STDOUBLE)
    | FILENAME  =>
        let
          val utf8Info = {
            name    = argId,
            isOpt   = isOpt,
            ownXfer =
              case ownershipTransfer of
                Transfer.NOTHING    => false
              | Transfer.EVERYTHING => true
              | Transfer.CONTAINER  => infoError containerForFilename
          }
        in
          PIUTF8 (dir, utf8Info)
        end
    | UTF8      =>
        let
          val utf8Info = {
            name    = argId,
            isOpt   = isOpt,
            ownXfer =
              case ownershipTransfer of
                Transfer.NOTHING    => false
              | Transfer.EVERYTHING => true
              | Transfer.CONTAINER  => infoError containerForUtf8
          }
        in
          PIUTF8 (dir, utf8Info)
        end
    | UNICHAR   => PISCALAR (dir, toScalarInfo STUNICHAR)
    | INTERFACE =>
        let
          val interfaceInfo = getInterface typeInfo
          val interfaceName = getName interfaceInfo
          val interfaceNamespace = BaseInfo.getNamespace interfaceInfo
          val interfaceCPrefix = getCPrefix repo interfaceNamespace
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
          val interfaceTy = getIRefTy interfaceInfo

          val iRef = {
            namespace = interfaceNamespace,
            cPrefix   = interfaceCPrefix,
            name      = interfaceName,
            scope     = interfaceScope,
            ty        = interfaceTy
          }

          val infoType = InfoType.getType interfaceInfo

          local
            open Transfer

            fun ptrOwnXferObjectInterface nonPtrForX =
              if isPointer
              then
                case (dir, ownershipTransfer) of
                  (_,     NOTHING)    => SOME false
                | (OUT _, EVERYTHING) => SOME true
                | (IN,    EVERYTHING) => infoError everythingForIn
                | (INOUT, EVERYTHING) => infoError everythingForInOut
                | (_,     CONTAINER)  => infoError containerForInterface
              else
                infoError nonPtrForX
            val objectMsg = nonPtrForObject
            val interfaceMsg = nonPtrForInterface

            fun ptrOwnXferStructUnion (nonPtrForInX, everythingForNonPtrX) =
              case (dir, isPointer, ownershipTransfer) of
                (IN,    false, NOTHING)    => infoError nonPtrForInX
              | (_,     false, NOTHING)    => NONE
              | (_,     true,  NOTHING)    => SOME false
              | (OUT _, true,  EVERYTHING) => SOME true
              | (_,     false, EVERYTHING) => infoError everythingForNonPtrX
              | (IN,    true,  EVERYTHING) => infoError everythingForIn
              | (INOUT, true,  EVERYTHING) => infoError everythingForInOut
              | (_,     _,     CONTAINER)  => infoError containerForInterface
            val structMsg = (nonPtrForInStruct, everythingForNonPtrStruct)
            val unionMsg = (nonPtrForInUnion, everythingForNonPtrUnion)

            fun ptrOwnXferFlagsEnum ptrForX =
              if isPointer
              then infoError ptrForX
              else NONE
            val flagsMsg = ptrForFlags
            val enumMsg = ptrForEnum

            open InfoType
          in
            val (ptrOwnXfer, rootIRef) =
              case infoType of
                OBJECT objectInfo =>
                  (
                    ptrOwnXferObjectInterface objectMsg,
                    getRootObjectIRef repo functionNamespace optContainerName
                      (objectInfo, iRef)
                  )
              | INTERFACE _       =>
                  (
                    ptrOwnXferObjectInterface interfaceMsg,
                    makeInterfaceRootIRef functionNamespace optContainerName
                  )
              | STRUCT _          => (ptrOwnXferStructUnion structMsg, iRef)
              | UNION _           => (ptrOwnXferStructUnion unionMsg, iRef)
              | FLAGS _           => (ptrOwnXferFlagsEnum flagsMsg, iRef)
              | ENUM _            => (ptrOwnXferFlagsEnum enumMsg, iRef)
              | _                 => infoError (unsupportedInterface infoType)
          end

          val interfaceInfo = {
            name       = argId,
            rootIRef   = rootIRef,
            iRef       = iRef,
            infoType   = infoType,
            isOpt      = isOpt,
            ptrOwnXfer = ptrOwnXfer
          }
        in
          PIINTERFACE (dir, interfaceInfo)
        end
  end


fun getRetInfo repo functionNamespace optContainerName functionName callableInfo =
  let
    (* At present, CallableInfo.mayReturnNull does not indicate
     * whether the return value is optional.  Therefore we use the list
     * of function names `optRetFunNames` to determine whether a
     * return value is optional. *)
    val mayReturnNull =
      (* CallableInfo.mayReturnNull callableInfo *)
      let
        fun isFun x = x = (functionNamespace, optContainerName, functionName)
      in
        List.exists isFun optRetFunNames
      end

    val ownershipTransfer = CallableInfo.getCallerOwns callableInfo

    val typeInfo = CallableInfo.getReturnType callableInfo
    val isPointer = TypeInfo.isPointer typeInfo

    val argId = ""

    val isOpt = mayReturnNull

    fun toScalarInfo ty =
      if isPointer
      then infoError (isPointerForScalar scalarToString ty)
      else
        {
          name  = argId,
          ty    = ty
        }

    open TypeTag
  in
    case TypeInfo.getTag typeInfo of
      ERROR     => infoError "return type ERROR not expected"
    | GTYPE     => infoError "return type GTYPE not supported"
    | ARRAY     => infoError "return type ARRAY not supported"
    | GLIST     => infoError "return type GLIST not supported"
    | GSLIST    => infoError "return type GSLIST not supported"
    | GHASH     => infoError "return type GHASH not supported"
    | VOID      => RIVOID
    | BOOLEAN   => RISCALAR (toScalarInfo STBOOLEAN)
    | INT8      => RISCALAR (toScalarInfo STINT8)
    | UINT8     => RISCALAR (toScalarInfo STUINT8)
    | INT16     => RISCALAR (toScalarInfo STINT16)
    | UINT16    => RISCALAR (toScalarInfo STUINT16)
    | INT32     => RISCALAR (toScalarInfo STINT32)
    | UINT32    => RISCALAR (toScalarInfo STUINT32)
    | INT64     => RISCALAR (toScalarInfo STINT64)
    | UINT64    => RISCALAR (toScalarInfo STUINT64)
    | FLOAT     => RISCALAR (toScalarInfo STFLOAT)
    | DOUBLE    => RISCALAR (toScalarInfo STDOUBLE)
    | FILENAME  =>
        let
          open Transfer

          val utf8Info = {
            name    = argId,
            isOpt   = isOpt,
            ownXfer =
              case ownershipTransfer of
                NOTHING    => false
              | EVERYTHING => true
              | CONTAINER  => infoError containerForFilename
          }
        in
          RIUTF8 utf8Info
        end
    | UTF8      =>
        let
          open Transfer

          val utf8Info = {
            name    = argId,
            isOpt   = isOpt,
            ownXfer =
              case ownershipTransfer of
                NOTHING    => false
              | EVERYTHING => true
              | CONTAINER  => infoError containerForUtf8
          }
        in
          RIUTF8 utf8Info
        end
    | UNICHAR   => RISCALAR (toScalarInfo STUNICHAR)
    | INTERFACE =>
        let
          val interfaceInfo = getInterface typeInfo
          val interfaceName = getName interfaceInfo
          val interfaceNamespace = BaseInfo.getNamespace interfaceInfo
          val interfaceCPrefix = getCPrefix repo interfaceNamespace
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
          val interfaceTy = getIRefTy interfaceInfo

          val iRef = {
            namespace = interfaceNamespace,
            cPrefix   = interfaceCPrefix,
            name      = interfaceName,
            scope     = interfaceScope,
            ty        = interfaceTy
          }

          val infoType = InfoType.getType interfaceInfo

          local
            open Transfer

            fun ptrOwnXferObjectInterface nonPtrForX =
              if isPointer
              then
                case ownershipTransfer of
                  NOTHING    => SOME false
                | EVERYTHING => SOME true
                | CONTAINER  => infoError containerForInterface
              else
                infoError nonPtrForX
            val objectMsg = nonPtrForObject
            val interfaceMsg = nonPtrForInterface

            fun ptrOwnXferStructUnion nonPtrForRetX =
              case (isPointer, ownershipTransfer) of
                (false, _)          => infoError nonPtrForRetX
              | (_,     NOTHING)    => SOME false
              | (_,     EVERYTHING) => SOME true
              | (_,     CONTAINER)  => infoError containerForInterface
            val structMsg = nonPtrForRetStruct
            val unionMsg = nonPtrForRetUnion

            fun ptrOwnXferFlagsEnum ptrForX =
              if isPointer
              then infoError ptrForX
              else NONE
            val flagsMsg = ptrForFlags
            val enumMsg = ptrForEnum

            open InfoType
          in
            val (ptrOwnXfer, rootIRef) =
              case infoType of
                OBJECT objectInfo =>
                  (
                    ptrOwnXferObjectInterface objectMsg,
                    getRootObjectIRef repo functionNamespace optContainerName
                      (objectInfo, iRef)
                  )
              | INTERFACE _       =>
                  (
                    ptrOwnXferObjectInterface interfaceMsg,
                    makeInterfaceRootIRef functionNamespace optContainerName
                  )
              | STRUCT _          => (ptrOwnXferStructUnion structMsg, iRef)
              | UNION _           => (ptrOwnXferStructUnion unionMsg, iRef)
              | FLAGS _           => (ptrOwnXferFlagsEnum flagsMsg, iRef)
              | ENUM _            => (ptrOwnXferFlagsEnum enumMsg, iRef)
              | _                 => infoError (unsupportedInterface infoType)
          end

          val interfaceInfo = {
            name       = argId,
            rootIRef   = rootIRef,
            iRef       = iRef,
            infoType   = infoType,
            isOpt      = isOpt,
            ptrOwnXfer = ptrOwnXfer
          }
        in
          RIINTERFACE interfaceInfo
        end
  end


(* Specification *)

fun addSpecParInfo
  (makeInRefTy, makeOutRefTy)
  (parInfo, acc as (((inTys, outTys), tyVarIdx), iRefs)) =
  let
    fun mkOpt isOpt ty = if isOpt then optionTy ty else ty

    fun addInTy isOpt tyRef =
      let
        val (ty, tyVarIdx') = makeInRefTy (tyRef, tyVarIdx)
      in
        ((mkOpt isOpt ty :: inTys, outTys), tyVarIdx')
      end

    fun addInOutTy isOpt tyRef =
      let
        val (ty, tyVarIdx') = makeInRefTy (tyRef, tyVarIdx)
        val isRetCondInit = false
        val optTy = mkOpt isOpt ty
      in
        ((optTy :: inTys, (optTy, isRetCondInit) :: outTys), tyVarIdx')
      end

    fun addOutTy isOpt tyRef =
      let
        val (ty, tyVarIdx') = makeOutRefTy (tyRef, tyVarIdx)
        val isRetCondInit = true
      in
        ((inTys, (mkOpt isOpt ty, isRetCondInit) :: outTys), tyVarIdx')
      end

    fun addTy dir isOpt ifTyRef =
      case dir of
        IN    => addInTy isOpt ifTyRef
      | INOUT => addInOutTy isOpt ifTyRef
      | OUT _ => addOutTy isOpt ifTyRef
  in
    case parInfo of
      PIVOID                                      => acc
    | PISCALAR (dir, {ty, ...})                   =>
        (addTy dir false (scalarTyRef ty), iRefs)
    | PIUTF8 (dir, {isOpt, ...})                  =>
        (addTy dir isOpt stringTyRef, iRefs)
    | PIINTERFACE (dir, {iRef, isOpt, ...})       =>
        let
          val {scope, ...} = iRef
          val iRefs' =
            case scope of
              GLOBAL             => iRefs
            | LOCALINTERFACESELF => iRefs
            | _                  => insert (iRef, iRefs)

          val ifTyRef = (
            numInterfaceRefTyVars iRef,
            makeInterfaceRefTyLongId iRef
          )
        in
          (addTy dir isOpt ifTyRef, iRefs')
        end
end


fun addSpecRetInfo
  makeOutRefTy
  (optConstructorIRef)
  (retInfo, (tyVarIdx, iRefs)) =
  let
    fun mkOpt isOpt ty = if isOpt then optionTy ty else ty

    fun mkTy isOpt tyRef =
      let
        val (ty, tyVarIdx') = makeOutRefTy (tyRef, tyVarIdx)
      in
        (mkOpt isOpt ty, tyVarIdx')
      end
  in
    case retInfo of
      RIVOID              => ((unitTy, tyVarIdx), iRefs)
    | RISCALAR {ty, ...}  => (mkTy false (scalarTyRef ty), iRefs)
    | RIUTF8 {isOpt, ...} => (mkTy isOpt stringTyRef, iRefs)
    | RIINTERFACE {
        name,
        iRef,
        infoType,
        isOpt,
        ptrOwnXfer,
        ...
      }                   =>
        let
          val interfaceRetInfo = {
            name       = name,
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
          val {scope, ...} = iRef
          val iRefs' =
            case scope of
              GLOBAL             => iRefs
            | LOCALINTERFACESELF => iRefs
            | _                  => insert (iRef, iRefs)

          val ifTyRef = (
            numInterfaceRefTyVars iRef,
            makeInterfaceRefTyLongId iRef
          )
        in
          (mkTy isOpt ifTyRef, iRefs')
        end
  end


fun makeFunctionSpec
  repo
  (optContainerIRef : interfaceref option)
  (functionInfo, (iRefs, errs))
  : spec * (interfaceref list * infoerrorhier list) =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol functionInfo

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
        (getParInfo repo functionNamespace optContainerName functionName)
        (functionInfo, [])

    val retInfo =
      getRetInfo repo functionNamespace optContainerName functionName
        functionInfo

    (* For a method function, add an initial argument type for the interface
     * that contains this function. *)
    val tyVarIdx'0 = 0
    val (revInTys'1, tyVarIdx'1) =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.ISMETHOD)
      then
        case optContainerIRef of
          SOME containerIRef =>
            let
              val selfTyRef = (
                numInterfaceRefTyVars containerIRef,
                makeInterfaceRefTyLongId containerIRef
              )
              val (selfTy, tyVarIdx'1) = makeRefVarTy (selfTyRef, tyVarIdx'0)
            in
              ([selfTy], tyVarIdx'1)
            end
        | NONE               =>
            infoError "function outside interface has method flag set"
      else
        ([], tyVarIdx'0)
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
           (functionFlags, FunctionInfoFlags.ISCONSTRUCTOR)
      then
        case optContainerIRef of
          SOME _ => optContainerIRef
        | NONE   =>
            infoError "function outside interface has constructor flag set"
      else
        NONE
    val ((retValTy, _), iRefs'3) =
      addSpecRetInfo
        makeRefBaseTy
        optConstructorIRef
        (retInfo, (tyVarIdx'2, iRefs'2))

    (* Handle case L = 0 and ISMETHOD not set in FunctionFlags. *)
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
            fun getCondTy (ty, isCond) = if isCond then SOME ty else NONE

            val (outParamTysCond, outParamTysUncond) =
              partitionRevMap (getCondTy, getTy) revOutTys'2

            val retTys =
              case (retInfo, outParamTysCond) of
                (RIVOID,                         [])        => outParamTysUncond

              | (_,                              [])        =>
                  retValTy :: outParamTysUncond

              | (RISCALAR {ty = STBOOLEAN, ...}, ty :: tys) =>
                  optionTy (mkProdTy1 (ty, tys)) :: outParamTysUncond

              | (RIVOID,                         _ :: _)    =>
                  outParamTysCond @ outParamTysUncond

              | (_,                              _ :: _)    =>
                  retValTy :: (outParamTysCond @ outParamTysUncond)

               (*
                * In future, when conditional outs can be identifed
                * the last two cases will be:
                *
              | (_,                              _ :: _)    =>
                  infoError "non-BOOLEAN return type with \
                            \conditional out parameters"
                *)
          in
            mkProdTy0 retTys  (* `length retTys > 0` so result not unit type *)
          end

    val functionTy = foldl TyFun retTy revInTys'3
  in
    (mkValSpec (functionNameId, functionTy), (iRefs'3, errs))
  end

(*
 *     val getType : unit -> <typeIRef>
 *)
fun getTypeSpec typeIRef =
  let
    val iRef = typeIRef
    val ifTyRef = (
      numInterfaceRefTyVars iRef,
      makeInterfaceRefTyLongId iRef
    )
    val (typeRefTy, _) = makeRefBaseTy (ifTyRef, 0)
  in
    mkValSpec (getTypeId, TyFun (unitTy, typeRefTy))
  end


(* High-level *)

(* `addParInfo` accumulates high-level function components in the parameter
 *
 *   `(js, ks, ls, iRefs)`
 *
 * The lists `js`, `ks` and `ls` accumulate the components of the vectors of
 * sizes J, K and L, respectively, in the CODEGEN for HighLevelFunction.
 *
 * `js`, `ks` and `ls` are built up in reverse.  After iterating over all
 * `parInfo` values, the final values are as follows:
 *
 *
 *   the j<th> element of `js` contains
 *
 *     (<withFun[j]>, <argVal[j]>)
 *
 *
 *   the k<th> element of `ks` contains
 *
 *     (<fromFun[k]>, <outParamName[k]>, <isCondOut[k]>)
 *
 *
 *   the l<th> element of `ls` contains
 *
 *     <inParamName[l]>
 *
 *
 * `iRefs` accumulates the references to interfaces for generating type
 * declarations as required by the signature and the corresponding where
 * clauses on the signature ascription in the structure.
 *)

local
  fun withFunExp prefixIds {isRef, isDup, isNew, isCon, isOpt, isPtr} =
    let
      val refStr = if isRef then "Ref" else ""
      val dupStr = if isDup then "Dup" else ""
      val newStr = if isNew then "New" else ""
      val conStr = if isCon then "Const" else ""
      val optStr = if isOpt then "Opt" else ""
      val ptrStr = if isPtr then "Ptr" else "Val"

      val withFunId =
        concat ["with", refStr, dupStr, newStr, conStr, optStr, ptrStr]
    in
      mkLIdLNameExp (prefixIds @ [withFunId])
    end

  fun fromFunExp prefixIds {isOpt, ptrOwnXfer} =
    let
      val optStr = if isOpt then "Opt" else ""
      val ptrStr = if isSome ptrOwnXfer then "Ptr" else "Val"

      val fromFunId = concat ["from", optStr, ptrStr]
      val funExp = mkLIdLNameExp (prefixIds @ [fromFunId])
    in
      case ptrOwnXfer of
        NONE   => funExp
      | SOME b => ExpApp (funExp, mkIdLNameExp (Bool.toString b))
    end

  fun withFunScalar (dir, {ty, ...} : scalarinfo) =
    withFunExp ["FFI", scalarStrId ty] {
      isRef = dir <> IN,
      isDup = false,
      isNew =
        case dir of
          OUT isCallerAllocates => isCallerAllocates
        | _                     => false,
      isCon = false,
      isOpt = false,
      isPtr = false
    }

  fun withFunUtf8 (dir, {isOpt, ...} : utf8info) =
    withFunExp ["FFI", "String"] {
      isRef = dir <> IN,
      isDup = false,
      isNew = false,
      isCon = true,
      isOpt = isOpt orelse case dir of OUT _ => true | _ => false,
      isPtr = true
    }

  fun withFunInterface
    (dir, {rootIRef, infoType, ptrOwnXfer, isOpt, ...} : interfaceinfo) =
    let
(*
      val {isSelf, ...} = rootIRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId rootIRef ["C"]
        | INTERFACE _ => prefixInterfaceStrId rootIRef ["C"]
        | STRUCT _    => prefixInterfaceStrId rootIRef ["C"]
        | _           =>
            if isSelf
            then ["C"]
            else prefixInterfaceStrId rootIRef ["C"]

 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId rootIRef ["C"]

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
          case dir of
            OUT isCallerAllocates => isCallerAllocates
          | _                     => false,
        isCon = false,
        isOpt =
          case dir of
            IN    => isOpt
          | OUT _ => isSome ptrOwnXfer
          | INOUT => false,
        isPtr =
          case infoType of
            STRUCT _ => true
          | _        => isSome ptrOwnXfer
      }
    end

  fun fromFunScalar ({ty, ...} : scalarinfo) =
    fromFunExp ["FFI", scalarStrId ty] {
      isOpt      = false,
      ptrOwnXfer = NONE
    }

  fun fromFunUtf8 (_, {ownXfer, isOpt, ...} : utf8info) =
    fromFunExp ["FFI", "String"] {
      isOpt      = isOpt,
      ptrOwnXfer = SOME ownXfer
    }

  fun fromFunInterface
    (isInOut, {iRef, infoType, ptrOwnXfer, isOpt, ...} : interfaceinfo) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef ["C"]
        | INTERFACE _ => prefixInterfaceStrId iRef ["C"]
        | STRUCT _    => prefixInterfaceStrId iRef ["C"]
        | _           =>
            if isSelf
            then ["C"]
            else prefixInterfaceStrId iRef ["C"]

 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef ["C"]

      open InfoType
    in
      fromFunExp prefixIds {
        isOpt      = isOpt,
        ptrOwnXfer =
          case (infoType, isInOut, ptrOwnXfer) of
            (OBJECT _,    true,  _)    => SOME true
          | (INTERFACE _, true,  _)    => SOME true
          | (STRUCT _,    false, NONE) => SOME true
          | (STRUCT _,    true,  _)    => SOME true
          | _                          => ptrOwnXfer
      }
    end

  fun argValScalar (dir, {ty, name, ...} : scalarinfo) =
    case dir of
      OUT _ => initValExp ty
    | _     => mkIdLNameExp name

  fun argValUtf8 (dir, {name, ...} : utf8info) =
    case dir of
      OUT _ => noneExp
    | _     => mkIdLNameExp name

  fun argValInterface
    (dir, {iRef, infoType, ptrOwnXfer, name, ...} : interfaceinfo) =
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
              infoError "initVal for unidentified INTERFACE not supported"
        end
    | _     => mkIdLNameExp name

  fun parNameScalar ({name, ...} : scalarinfo) = name

  fun parNameUtf8 ({name, ...} : utf8info) = name

  fun parNameInterface ({name, ...} : interfaceinfo) = name
in
  fun addParInfo (parInfo, acc as (js, ks, ls, iRefs)) =
    case parInfo of
      PIVOID => acc
    | PISCALAR (dir, scalarParInfo) =>
        let
          val withFunExp = withFunScalar (dir, scalarParInfo)
          val argValExp = argValScalar (dir, scalarParInfo)
          val js' = (withFunExp, argValExp) :: js

          val parName = parNameScalar scalarParInfo
          fun makeK isRetCondInit = (
            fromFunScalar scalarParInfo,
            (parName, isRetCondInit)
          )
          val l = APatId parName
          val (ks', ls') =
            case dir of
              OUT _ => (makeK true :: ks,  ls)
            | INOUT => (makeK false :: ks, l :: ls)
            | IN    => (ks,                l :: ls)
        in
          (js', ks', ls', iRefs)
        end
    | PIUTF8 (dir, utf8ParInfo) =>
        let
          val withFunExp = withFunUtf8 (dir, utf8ParInfo)
          val argValExp = argValUtf8 (dir, utf8ParInfo)
          val js' = (withFunExp, argValExp) :: js

          val parName = parNameUtf8 utf8ParInfo
          fun makeK isRetCondInit = (
            fromFunUtf8 (dir = INOUT, utf8ParInfo),
            (parName, isRetCondInit)
          )
          val l = APatId parName
          val (ks', ls') =
            case dir of
              OUT _ => (makeK true :: ks,  ls)
            | INOUT => (makeK false :: ks, l :: ls)
            | IN    => (ks,                l :: ls)
        in
          (js', ks', ls', iRefs)
        end
    | PIINTERFACE (dir, interfaceParInfo as {iRef, ...}) =>
        let
          val withFunExp = withFunInterface (dir, interfaceParInfo)
          val argValExp = argValInterface (dir, interfaceParInfo)
          val js' = (withFunExp, argValExp) :: js

          val parName = parNameInterface interfaceParInfo
          fun makeK isRetCondInit = (
            fromFunInterface (dir = INOUT, interfaceParInfo),
            (parName, isRetCondInit)
          )
          val l = APatId parName
          val (ks', ls') =
            case dir of
              OUT _ => (makeK true :: ks,  ls)
            | INOUT => (makeK false :: ks, l :: ls)
            | IN    => (ks,                l :: ls)

          val {scope, ...} = iRef
          val iRefs' =
            case scope of
              GLOBAL             => iRefs
            | LOCALINTERFACESELF => iRefs
            | _                  => insert (iRef, iRefs)
        in
          (js', ks', ls', iRefs')
        end

  fun addRetInfo optConstructorIRef (retInfo, iRefs) =
    case retInfo of
      RIVOID                 => (mkIdLNameExp "I", iRefs)
    | RISCALAR scalarRetInfo => (fromFunScalar scalarRetInfo, iRefs)
    | RIUTF8 utf8RetInfo     => (fromFunUtf8 (false, utf8RetInfo), iRefs)
    | RIINTERFACE {
        name,
        rootIRef,
        iRef,
        infoType,
        isOpt,
        ptrOwnXfer
      }                      =>
        let
          val interfaceRetInfo = {
            name       = name,
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
          val {iRef, ...} = interfaceRetInfo
          val {scope, ...} = iRef
          val iRefs' =
            case scope of
              GLOBAL             => iRefs
            | LOCALINTERFACESELF => iRefs
            | _                  => insert (iRef, iRefs)
        in
          (fromFunInterface (false, interfaceRetInfo), iRefs')
        end
end


fun withFunErr namespace optName =
  mkLIdLNameExp (
    prefixInterfaceStrId (makeErrorIRef namespace optName) ["C", "handleError"]
  )

fun argValErr (_ : lid list) =
  ExpList []


val retValId : id = "retVal"
val retValPat : pat = PatA (APatId retValId)
val retValExp : exp = mkIdLNameExp retValId

val retVal =
  fn
    RIVOID => (PatA (APatConst ConstUnit), ExpConst ConstUnit)
  | _      => (retValPat, retValExp)


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
  (optRootContainerIRef : (interfaceref * interfaceref) option)
  (functionInfo, (iRefs, errs))
  : strdec * (interfaceref list * infoerrorhier list) =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameLCC = toLCC functionName
    val functionNameUId = functionNameLCC ^ "_"
    val functionNameId = mkId functionNameLCC
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val (optRootIRef, optContainerIRef) =
      case optRootContainerIRef of
        SOME (rootIRef, containerIRef) => (SOME rootIRef, SOME containerIRef)
      | NONE                           => (NONE, NONE)
    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo repo functionNamespace optContainerName functionName)
        (functionInfo, [])

    val retInfo =
      getRetInfo repo functionNamespace optContainerName functionName
        functionInfo

    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val (revJs'1, revLs'1) =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.ISMETHOD)
      then
        case optRootIRef of
          SOME rootIRef =>
            let
              val withFun =
                mkLIdLNameExp (
                  prefixInterfaceStrId rootIRef ["C", withPtrId]
                )
              val argVal = mkIdLNameExp selfId
              val inParamAPat = APatId selfId
            in
              ([(withFun, argVal)], [inParamAPat])
            end
        | NONE          =>
            infoError "function outside interface has method flag set"
      else
        ([], [])
    val revKs'1 = []
    val iRefs'1 = iRefs

    (* Construct J, K, L vectors in forward pass over parameter infos.
     * As for a function spec, `iRefs` should be generated in a forwards
     * pass over the parameter infos so types appear in order of first
     * appearance. *)
    val (revJs'2, revKs'2, revLs'2, iRefs'2) =
      foldl addParInfo (revJs'1, revKs'1, revLs'1, iRefs'1) parInfos

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
           (functionFlags, FunctionInfoFlags.ISCONSTRUCTOR)
      then
        case optContainerIRef of
          SOME _ => optContainerIRef
        | NONE   =>
            infoError "function outside interface has constructor flag set"
      else
        NONE
    val (retFromFun, iRefs'3) =
      addRetInfo optConstructorIRef (retInfo, iRefs'2)

    (* Derive non-empty lists `revWithFuns1` and `revArgVals1` from `revJs'3`
     * and non-empty list `inParamNames1` from `revLs'2`.  When
     *
     *   J = 0 and not anySet (functionFlags, flags [ISMETHOD, THROWS])
     *
     * `revJs'3` is empty and when L = 0, `revLs'2` is empty.  The cases when
     * `revJs'3` and `revLs'2` are empty are handled as follows:
     *
     * `inParamNames1 : apat list1` is
     *
     *   ()
     *     if revLs'2 = []
     *)
    val inParamNames1 : apat list1 = getList1 (rev revLs'2, APatConst ConstUnit)

    (* `revWithFuns1 : exp list1` is
     *
     *   I
     *     if revJs'3 = []
     *
     * and `revArgVals1 : exp list1` is
     *
     *   ()
     *     if revJs'3 = []
     *)
    val (revWithFuns1 : exp list1, revArgVals1 : exp list1) =
      unzip1 (getList1 (revJs'3, (iExp, ExpConst ConstUnit)))

    (* No need to handle K = 0 here: lists `revFromFuns` and `revOutParams` may
     * be empty.  `revOutParams` contains out parameter names associated with
     * the conditional output flag for each out parameter.
     *)
    val (revFromFuns, revOutParams) = ListPair.unzip revKs'2

    (* Construct
     *
     *   <fromFun[1]> && ... && <fromFun[K]> && <retFromFun>
     *)
    val fromFunsExp = foldl mkAAExp retFromFun revFromFuns

    (*
     *   <withFun[1]> &&&> ... &&&> <withFun[J]>
     *)
    val withFunsExp = foldl1 mkAAARExp revWithFuns1

    (*
     *   <argVal[1]> & ... & <argVal[J]>
     *)
    val argValsExp = foldl1 mkAExp revArgVals1

    (*
     *   (<withFun[1]> &&&> ... &&&> <withFun[J]>
     *     ---> <fromFun[1]> && ... && <fromFun[K]> && <retFromFun>)
     *     <functionName>_
     *     (<argVal[1]> & ... & <argVal[J]>)
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
     *     val <outParamName[1]> & ... & <outParamName[K]> & <retVal> =
     *       <functionCoreExp>
     *   in
     *     <retExp>
     *   end
     *     if K > 0
     *
     *
     *   <functionCoreExp>
     *     otherwise
     *)
    val functionExp =
      case revOutParams of
        []     => functionCoreExp
      | _ :: _ =>
          let
            fun getNamePat (id, _) = PatA (APatId id)
            fun getNameExp (id, _) = mkIdLNameExp id
            fun getCondNameExp (id, isCond) =
              if isCond then SOME (mkIdLNameExp id) else NONE

            val (outParamExpsCond, outParamExpsUncond) =
              partitionRevMap (getCondNameExp, getNameExp) revOutParams

            val (retValPat, retValExp) = retVal retInfo
            val retExps =
              case (retInfo, outParamExpsCond) of
                (RIVOID,                         [])      => outParamExpsUncond

              | (_,                              [])      =>
                  retValExp :: outParamExpsUncond

              | (RISCALAR {ty = STBOOLEAN, ...}, e :: es) =>
                  retValCondExp retValExp (e, es) :: outParamExpsUncond

              | (RIVOID,                         _ :: _)  =>
                  outParamExpsCond @ outParamExpsUncond

              | (_,                              _ :: _)  =>
                  retValExp :: (outParamExpsCond @ outParamExpsUncond)
               (*
                * In future, when conditional outs can be identifed
                * the last two cases will be:
                *
                  infoError "non-BOOLEAN return type with \
                            \conditional out parameters"
                *)
            val retExp =
              case retExps of
                []      => ExpConst ConstUnit  (* unreachable *)
              | e :: [] => e
              | e :: es => ExpParen (e, es)

            val revOutParamPats = map getNamePat revOutParams
            val pat = foldl mkAPat retValPat revOutParamPats
            val dec = DecVal (toList1 [([], false, pat, functionCoreExp)])
          in
            ExpLet (mkDecs [dec], toList1 [retExp])
          end
  in
    (
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (functionNameId, inParamNames1),
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

(*
 *     val getType = (I ---> GObjectType.C.fromVal) getType_
 *)
val getTypeStrDecHighLevel =
  StrDecDec (
    mkIdValDec (
      getTypeId,
      ExpApp (
        mkParenExp (
          mkDDDRExp (iExp, mkLIdLNameExp ["GObjectType", "C", fromValId])
        ),
        mkIdLNameExp getTypeUId
      )
    )
  )



(* Low-level - Poly/ML *)

(* `callPolyMLFFIExp libId functionSymbol (parConvs, retConv)` constructs
 * a Poly/ML low-level function call expression as follows:
 *
 *   call
 *     (load_sym <libId> "<functionSymbol>")
 *     (<parConvs> --> <retConv>)
 *)
fun callPolyMLFFIExp libId functionSymbol (parConvs, retConv) =
  ExpApp (
    ExpApp (
      mkIdLNameExp callId,
      mkParenExp (
        ExpApp (
          ExpApp (
            mkIdLNameExp loadSymId,
            mkIdLNameExp libId
          ),
          ExpConst (ConstString functionSymbol)
        )
      )
    ),
    mkParenExp (mkDDRExp (parConvs, retConv))
  )


local
  datatype conv =
    VAL
  | PTR of {optIsRet : bool option, isOpt : bool}
  | REF of {optInIsOpt : bool option, optOutIsOpt : bool option}

  fun convExp prefixIds conv =
    let
      val convId =
        case conv of
          VAL                           => "VAL"
        | PTR {optIsRet, isOpt}         =>
            let
              val inRetStr =
               case optIsRet of
                  NONE       => ""
                | SOME false => "IN"
                | SOME true  => "RET"
              val optStr = if isOpt then "OPT" else ""
            in
              concat [inRetStr, optStr, "PTR"]
            end
        | REF {optInIsOpt, optOutIsOpt} =>
            let
              val inStr =
                case optInIsOpt of
                  NONE       => ""
                | SOME false => "IN"
                | SOME true  => "INOPT"
              val outStr =
                case optOutIsOpt of
                  NONE       => ""
                | SOME false => "OUT"
                | SOME true  => "OUTOPT"
            in
              concat [inStr, outStr, "REF"]
            end
    in
      mkLIdLNameExp (prefixIds @ [convId])
    end

  fun parScalarConv (dir, {ty, ...} : scalarinfo) =
    convExp ["FFI", PolyMLId, scalarStrId ty] (
      if dir <> IN
      then
        REF {
          optInIsOpt  = NONE,
          optOutIsOpt = NONE
        }
      else
        VAL
    )

  val retVoidConv = VOIDConvExp

  fun retScalarConv ({ty, ...} : scalarinfo) =
    convExp ["FFI", PolyMLId, scalarStrId ty] VAL

  fun parUtf8Conv (dir, {isOpt, ...} : utf8info) =
    convExp ["FFI", PolyMLId, "String"] (
      if dir <> IN
      then
        REF {
          optInIsOpt  = if dir = INOUT then SOME false else NONE,
          optOutIsOpt = SOME false
        }
      else
        PTR {
          optIsRet = SOME false,
          isOpt    = isOpt
        }
    )

  fun retUtf8Conv ({isOpt, ...} : utf8info) =
    convExp ["FFI", PolyMLId, "String"] (
      PTR {
          optIsRet = SOME true,
          isOpt    = isOpt
      }
    )

  fun parInterfaceConv
    (dir, {rootIRef, infoType, ptrOwnXfer, isOpt, ...} : interfaceinfo) =
    let
(*
      val {isSelf, ...} = rootIRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId rootIRef [PolyMLId]
        | INTERFACE _ => prefixInterfaceStrId rootIRef [PolyMLId]
        | STRUCT _    => prefixInterfaceStrId rootIRef [PolyMLId]
        | _           =>
            if isSelf
            then [PolyMLId]
            else prefixInterfaceStrId rootIRef [PolyMLId]
 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId rootIRef [PolyMLId]

      open InfoType
    in
      convExp prefixIds (
        if dir <> IN andalso isSome ptrOwnXfer
        then
          REF {
            optInIsOpt  = if dir = INOUT then SOME false else NONE,
            optOutIsOpt = SOME false
          }
        else if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          if dir <> IN
          then
            REF {optInIsOpt = NONE, optOutIsOpt = NONE}
          else
            VAL
        else
          PTR {
            optIsRet = NONE,
            isOpt    = isOpt andalso isSome ptrOwnXfer
          }
      )
    end

  fun retInterfaceConv
    ({rootIRef, infoType, isOpt, ...} : interfaceinfo) =
    let
(*
      val {isSelf, ...} = rootIRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId rootIRef [PolyMLId]
        | INTERFACE _ => prefixInterfaceStrId rootIRef [PolyMLId]
        | STRUCT _    => prefixInterfaceStrId rootIRef [PolyMLId]
        | _           =>
            if isSelf
            then [PolyMLId]
            else prefixInterfaceStrId rootIRef [PolyMLId]

 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId rootIRef [PolyMLId]

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
            optIsRet = NONE,
            isOpt    = isOpt
          }
      )
    end
in
  fun addParInfo (parInfo, acc) =
    case parInfo of
      PIVOID => acc
    | PISCALAR (dir, scalarParInfo) =>
        let
          val convExp = parScalarConv (dir, scalarParInfo)
        in
          convExp :: acc
        end
    | PIUTF8 (dir, utf8ParInfo) =>
        let
          val convExp = parUtf8Conv (dir, utf8ParInfo)
        in
          convExp :: acc
        end
    | PIINTERFACE (dir, interfaceParInfo) =>
        let
          val convExp = parInterfaceConv (dir, interfaceParInfo)
        in
          convExp :: acc
        end

  fun addRetInfo retInfo =
    case retInfo of
      RIVOID                       => retVoidConv
    | RISCALAR scalarRetInfo       => retScalarConv scalarRetInfo
    | RIUTF8 utf8RetInfo           => retUtf8Conv utf8RetInfo
    | RIINTERFACE interfaceRetInfo => retInterfaceConv interfaceRetInfo

  fun parErrConv namespace optName =
    convExp
      (prefixInterfaceStrId (makeErrorIRef namespace optName) [PolyMLId])
      (
        REF {
          optInIsOpt  = NONE,
          optOutIsOpt = SOME true
        }
      )
end


fun makeFunctionStrDecLowLevelPolyML
  repo
  libId
  (optRootContainerIRef : (interfaceref * interfaceref) option)
  (functionInfo, errs)
  : strdec * infoerrorhier list =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameId = toLCC functionName ^ "_"
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val (optRootIRef, optContainerName) =
      case optRootContainerIRef of
        SOME (rootIRef, {name, ...}) => (SOME rootIRef, SOME name)
      | NONE                         => (NONE, NONE)

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo repo functionNamespace optContainerName functionName)
        (functionInfo, [])

    val retInfo =
      getRetInfo repo functionNamespace optContainerName functionName
        functionInfo

    val functionSymbolStr = FunctionInfo.getSymbol functionInfo

    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val revParConvs'1 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.ISMETHOD)
      then
        case optRootIRef of
          SOME rootIRef =>
            [mkLIdLNameExp (prefixInterfaceStrId rootIRef [PolyMLId, PTRId])]
        | NONE          =>
            infoError "function outside interface has method flag set"
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
     *   FFI.PolyML.VOID
     *     if J = 0 and not anySet (FunctionFlags, THROWS)
     *)
    val revParConvs1 : exp list1 = getList1 (revParConvs'3, VOIDConvExp)

    val parConvs = foldl1 mkAARExp revParConvs1

    (* Construct the function body with the form:
     *
     *   call
     *     (load_sym lib<functionnamespace> "<function_symbol>")
     *     (<parConvs> --> <retConv>)
     *)
    val functionExp =
      callPolyMLFFIExp
        libId
        functionSymbolStr
        (parConvs, retConv)
  in
    (
      StrDecDec (mkIdValDec (functionNameId, functionExp)),
      errs
    )
  end

(*
 *     val getType_ =
 *       call
 *         (load_sym <libId> "<getTypeSymbol>")
 *         (FFI.PolyML.VOID --> GObjectType.PolyML.VAL);
 *)
fun getTypeStrDecLowLevelPolyML libId getTypeSymbol =
  let
    val parConvs = mkLIdLNameExp [FFIId, PolyMLId, VOIDId]
    val retConv = mkLIdLNameExp ["GObjectType", PolyMLId, VALId]
  in
    StrDecDec (
      mkIdValDec (
        getTypeUId,
        callPolyMLFFIExp libId getTypeSymbol (parConvs, retConv)
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
          val pats' = PatA (APatId id) :: pats
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
   * <A>.val_
   * <A>.ref_
   *
   * <opt> <A>.p
   * (<inopt>, <outopt>) <A>.r
   *
   * <opt> <A>.in_p
   * <opt> <A>.out_p
   * (<inopt>, <outopt>) <A>.inout_r
   *)
  datatype spec =
    VAL
  | PTR of {optIsRet : bool option, isOpt : bool}
  | REF of {isInOpt : bool, isOutOpt : bool} option

  (* `cstring * unit CPointer.t ref` *)
  val utf8PtrTy =
    mkProdTy0 [
      mkIdTy "cstring",
      TyRef ([unitTy], toList1 ["CPointer", "t"])
    ]

  (* `cstring * unit CPointer.t ref` *)
  val utf8RefTy =
    mkProdTy0 [
      mkIdTy "cstring",
      TyRef ([TyRef ([unitTy], toList1 ["CPointer", "t"])], toList1 ["ref"])
    ]

  fun typeTy isUtf8 prefixIds spec =
    let
      val ty =
        case spec of
          VAL                            => mkLIdTy (prefixIds @ ["val_"])
        | PTR {optIsRet, isOpt}          =>
            if isUtf8
            then
              utf8PtrTy
            else
              let
                val inRetStr =
                  case optIsRet of
                    NONE       => ""
                  | SOME false => "in_"
                  | SOME true  => "out_"
                val ty = if isOpt then unitTy else mkNotnullTy prefixIds
              in
                TyRef ([ty], toList1 (prefixIds @ [concat [inRetStr, "p"]]))
              end
        | REF NONE                       => mkLIdTy (prefixIds @ ["ref_"])
        | REF (SOME {isInOpt, isOutOpt}) =>
            if isUtf8
            then
              utf8RefTy
            else
              let
                val tys'0 = []
                val tys'1 =
                  case isOutOpt of
                    false => mkNotnullTy prefixIds :: tys'0
                  | true  => unitTy :: tys'0
                val tys'2 =
                  case isInOpt of
                    false => mkNotnullTy prefixIds :: tys'1
                  | true  => unitTy :: tys'1
              in
                TyRef (tys'2, toList1 (prefixIds @ ["r"]))
              end
    in
      ty
    end

  val retVoidType = unitTy

  fun parScalarType (dir, {ty, ...} : scalarinfo) =
    typeTy false ["FFI", scalarStrId ty] (
      if dir <> IN
      then
        REF NONE
      else
        VAL
    )

  fun retScalarType ({ty, ...} : scalarinfo) =
    typeTy false ["FFI", scalarStrId ty] VAL

  fun parUtf8Type (dir, {isOpt, ...} : utf8info) =
    typeTy true ["FFI", "String"] (
      if dir <> IN
      then
        REF (
          SOME {
            isInOpt  = dir <> INOUT,
            isOutOpt = false
          }
        )
      else
        PTR {
          optIsRet = SOME false,
          isOpt    = isOpt
        }
    )

  fun retUtf8Type ({isOpt, ...} : utf8info) =
    typeTy false ["FFI", "String"] (
      PTR {
          optIsRet = SOME true,
          isOpt    = isOpt
      }
    )

  fun parInterfaceType
    (dir, {rootIRef, infoType, ptrOwnXfer, isOpt, ...} : interfaceinfo) =
    let
(*
      val {isSelf, ...} = rootIRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId rootIRef [CId]
        | INTERFACE _ => prefixInterfaceStrId rootIRef [CId]
        | STRUCT _    => prefixInterfaceStrId rootIRef [CId]
        | _           =>
            if isSelf
            then [CId]
            else prefixInterfaceStrId rootIRef [CId]
 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId rootIRef [CId]

      open InfoType
    in
      typeTy false prefixIds (
        if dir <> IN andalso isSome ptrOwnXfer
        then
          REF (
            SOME {
              isInOpt  = dir <> INOUT,
              isOutOpt = false
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
            optIsRet = NONE,
            isOpt    = isOpt andalso isSome ptrOwnXfer
          }
      )
    end

  fun retInterfaceType
    ({rootIRef, infoType, isOpt, ...} : interfaceinfo) =
    let
(*
      val {isSelf, ...} = rootIRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId rootIRef [CId]
        | INTERFACE _ => prefixInterfaceStrId rootIRef [CId]
        | STRUCT _    => prefixInterfaceStrId rootIRef [CId]
        | _           =>
            if isSelf
            then [CId]
            else prefixInterfaceStrId rootIRef [CId]
 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId rootIRef [CId]

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
            optIsRet = NONE,
            isOpt    = isOpt
          }
      )
    end
in
  fun addParInfo (parInfo, acc) =
    case parInfo of
      PIVOID                              => acc
    | PISCALAR (dir, scalarParInfo)       =>
        let
          val typeTy = parScalarType (dir, scalarParInfo)
        in
          typeTy :: acc
        end
    | PIUTF8 (dir, utf8ParInfo)           =>
        let
          val typeTy = parUtf8Type (dir, utf8ParInfo)
        in
          typeTy :: acc
        end
    | PIINTERFACE (dir, interfaceParInfo) =>
        let
          val typeTy = parInterfaceType (dir, interfaceParInfo)
        in
          typeTy :: acc
        end

  fun addRetInfo retInfo =
    case retInfo of
      RIVOID                       => retVoidType
    | RISCALAR scalarRetInfo       => retScalarType scalarRetInfo
    | RIUTF8 utf8RetInfo           => retUtf8Type utf8RetInfo
    | RIINTERFACE interfaceRetInfo => retInterfaceType interfaceRetInfo

  fun parErrType namespace optName =
    typeTy
      false
      (prefixInterfaceStrId (makeErrorIRef namespace optName) [CId])
      (
        REF (
          SOME {
            isInOpt  = true,
            isOutOpt = true
          }
        )
      )
end


fun makeFunctionStrDecLowLevelMLton
  repo
  (optRootContainerIRef : (interfaceref * interfaceref) option)
  (functionInfo, errs)
  : strdec * infoerrorhier list =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameId = toLCC functionName ^ "_"
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val (optRootIRef, optContainerName) =
      case optRootContainerIRef of
        SOME (rootIRef, {name, ...}) => (SOME rootIRef, SOME name)
      | NONE                         => (NONE, NONE)

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo repo functionNamespace optContainerName functionName)
        (functionInfo, [])

    val retInfo =
      getRetInfo repo functionNamespace optContainerName functionName
        functionInfo

    val functionSymbolStr = FunctionInfo.getSymbol functionInfo

    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val revParTypes'1 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.ISMETHOD)
      then
        case optRootIRef of
          SOME rootIRef =>
            [mkPtrTy false (prefixInterfaceStrId rootIRef [CId])]
        | NONE          =>
            infoError "function outside interface has method flag set"
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
      errs
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
      callMLtonFFIExp getTypeSymbol ([], mkLIdTy ["GObjectType", "C", valId])
    )
  )


(* Low-level - common *)

fun mkPolyMLFFILocalStrDec strDecs =
  StrDecLocal (
    mkStrDecs [
      StrDecDec (DecOpen (toList1 [toList1 ["PolyMLFFI"]]))
    ],
    mkStrDecs strDecs
  )

fun addFunctionStrDecsLowLevel
  (getNMethods, getMethod)
  isPolyML
  repo
  libId
  addInitStrDecs
  optRootContainerIRef =
  if isPolyML
  then
    fn (containerInfo, (strDecs, errs)) =>
      let
        val acc'1 =
          revMapInfosWithErrs
            getNMethods
            getMethod
            (makeFunctionStrDecLowLevelPolyML repo libId optRootContainerIRef)
            (containerInfo, ([], errs))
        val (localStrDecs'2, errs'2) = addInitStrDecs isPolyML acc'1
      in
        case localStrDecs'2 of
          _ :: _ => (mkPolyMLFFILocalStrDec localStrDecs'2 :: strDecs, errs'2)
        | _      => (strDecs, errs'2)
      end
  else
    addInitStrDecs isPolyML o
      revMapInfosWithErrs
        getNMethods
        getMethod
        (makeFunctionStrDecLowLevelMLton repo optRootContainerIRef)



(* --------------------------------------------------------------------------
 * Signal
 * -------------------------------------------------------------------------- *)

(* For signals, variants of `getParInfo` and `getRetInfo` must be used due
 * to <https://bugzilla.gnome.org/show_bug.cgi?id=646080>.  These variants,
 * `getParInfoX` and `getRetInfoX` respectively, ignore the value from
 * `TypeInfo.isPointer`, and assume `true`, for OBJECT, INTERFACE
 * and STUCT interface types.
 *)

fun getParInfoX repo functionNamespace optContainerName functionName argInfo =
  let
    val direction = ArgInfo.getDirection argInfo
    val mayBeNull = ArgInfo.mayBeNull argInfo

    val ownershipTransfer = ArgInfo.getOwnershipTransfer argInfo
    val isCallerAllocates = ArgInfo.isCallerAllocates argInfo

    val typeInfo = ArgInfo.getType argInfo
    val tag = TypeInfo.getTag typeInfo
    val isPointer = TypeInfo.isPointer typeInfo

    val argName = getName argInfo
    val argId = mkId (toLCC argName)

    val dir =
      case direction of
        Direction.IN    => IN
      | Direction.OUT   => OUT isCallerAllocates
      | Direction.INOUT => INOUT

    (* Currently, `mayBeNull` is valid only for IN parameters.  For OUT/INOUT
     * parameters, it indicates whether the C parameter is optional, not
     * whether the imported/exported value is optionally null, i.e. what
     * we would expect from `isOptional`.  Therefore we use the list of
     * function name-argument name pairs `optArgNames` to force parameters
     * to be optional. *)
    val forceOpt =
      let
        fun isArg x =
          x = (functionNamespace, optContainerName, functionName, argName)
      in
        List.exists isArg optArgNames
      end
    val isOpt =
      case dir of
        IN => mayBeNull orelse forceOpt
      | _  => forceOpt

    fun toScalarInfo ty =
      if isPointer
      then infoError (isPointerForScalar scalarToString ty)
      else
        {
          name  = argId,
          ty    = ty
        }

    open TypeTag
  in
    case tag of
      ERROR     => infoError "parameter type ERROR not expected"
    | GTYPE     => infoError "parameter type GTYPE not supported"
    | ARRAY     => infoError "parameter type ARRAY not supported"
    | GLIST     => infoError "parameter type GLIST not supported"
    | GSLIST    => infoError "parameter type GSLIST not supported"
    | GHASH     => infoError "parameter type GHASH not supported"
    | VOID      => PIVOID
    | BOOLEAN   => PISCALAR (dir, toScalarInfo STBOOLEAN)
    | INT8      => PISCALAR (dir, toScalarInfo STINT8)
    | UINT8     => PISCALAR (dir, toScalarInfo STUINT8)
    | INT16     => PISCALAR (dir, toScalarInfo STINT16)
    | UINT16    => PISCALAR (dir, toScalarInfo STUINT16)
    | INT32     => PISCALAR (dir, toScalarInfo STINT32)
    | UINT32    => PISCALAR (dir, toScalarInfo STUINT32)
    | INT64     => PISCALAR (dir, toScalarInfo STINT64)
    | UINT64    => PISCALAR (dir, toScalarInfo STUINT64)
    | FLOAT     => PISCALAR (dir, toScalarInfo STFLOAT)
    | DOUBLE    => PISCALAR (dir, toScalarInfo STDOUBLE)
    | FILENAME  =>
        let
          val utf8Info = {
            name    = argId,
            isOpt   = isOpt,
            ownXfer =
              case ownershipTransfer of
                Transfer.NOTHING    => false
              | Transfer.EVERYTHING => true
              | Transfer.CONTAINER  => infoError containerForFilename
          }
        in
          PIUTF8 (dir, utf8Info)
        end
    | UTF8      =>
        let
          val utf8Info = {
            name    = argId,
            isOpt   = isOpt,
            ownXfer =
              case ownershipTransfer of
                Transfer.NOTHING    => false
              | Transfer.EVERYTHING => true
              | Transfer.CONTAINER  => infoError containerForUtf8
          }
        in
          PIUTF8 (dir, utf8Info)
        end
    | UNICHAR   => PISCALAR (dir, toScalarInfo STUNICHAR)
    | INTERFACE =>
        let
          val interfaceInfo = getInterface typeInfo
          val interfaceName = getName interfaceInfo
          val interfaceNamespace = BaseInfo.getNamespace interfaceInfo
          val interfaceCPrefix = getCPrefix repo interfaceNamespace
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
          val interfaceTy = getIRefTy interfaceInfo

          val iRef = {
            namespace = interfaceNamespace,
            cPrefix   = interfaceCPrefix,
            name      = interfaceName,
            scope     = interfaceScope,
            ty        = interfaceTy
          }

          val infoType = InfoType.getType interfaceInfo

          local
            open Transfer

            fun ptrOwnXferObjectInterface nonPtrForX =
              if true (* isPointer *)
              then
                case (dir, ownershipTransfer) of
                  (_,     NOTHING)    => SOME false
                | (OUT _, EVERYTHING) => SOME true
                | (IN,    EVERYTHING) => infoError everythingForIn
                | (INOUT, EVERYTHING) => infoError everythingForInOut
                | (_,     CONTAINER)  => infoError containerForInterface
              else
                infoError nonPtrForX
            val objectMsg = nonPtrForObject
            val interfaceMsg = nonPtrForInterface

            fun ptrOwnXferStructUnion (nonPtrForInX, everythingForNonPtrX) =
              case (dir, true (* isPointer *), ownershipTransfer) of
                (IN,    false, NOTHING)    => infoError nonPtrForInX
              | (_,     false, NOTHING)    => NONE
              | (_,     true,  NOTHING)    => SOME false
              | (OUT _, true,  EVERYTHING) => SOME true
              | (_,     false, EVERYTHING) => infoError everythingForNonPtrX
              | (IN,    true,  EVERYTHING) => infoError everythingForIn
              | (INOUT, true,  EVERYTHING) => infoError everythingForInOut
              | (_,     _,     CONTAINER)  => infoError containerForInterface
            val structMsg = (nonPtrForInStruct, everythingForNonPtrStruct)
            val unionMsg = (nonPtrForInUnion, everythingForNonPtrUnion)

            fun ptrOwnXferFlagsEnum ptrForX =
              if isPointer
              then infoError ptrForX
              else NONE
            val flagsMsg = ptrForFlags
            val enumMsg = ptrForEnum

            open InfoType
          in
            val (ptrOwnXfer, rootIRef) =
              case infoType of
                OBJECT objectInfo =>
                  (
                    ptrOwnXferObjectInterface objectMsg,
                    getRootObjectIRef repo functionNamespace optContainerName
                      (objectInfo, iRef)
                  )
              | INTERFACE _       =>
                  (
                    ptrOwnXferObjectInterface interfaceMsg,
                    makeInterfaceRootIRef functionNamespace optContainerName
                  )
              | STRUCT _          => (ptrOwnXferStructUnion structMsg, iRef)
              | UNION _           => (ptrOwnXferStructUnion unionMsg, iRef)
              | FLAGS _           => (ptrOwnXferFlagsEnum flagsMsg, iRef)
              | ENUM _            => (ptrOwnXferFlagsEnum enumMsg, iRef)
              | _                 => infoError (unsupportedInterface infoType)
          end

          val interfaceInfo = {
            name       = argId,
            rootIRef   = rootIRef,
            iRef       = iRef,
            infoType   = infoType,
            isOpt      = isOpt,
            ptrOwnXfer = ptrOwnXfer
          }
        in
          PIINTERFACE (dir, interfaceInfo)
        end
  end


fun getRetInfoX repo functionNamespace optContainerName functionName callableInfo =
  let
    (* At present, CallableInfo.mayReturnNull does not indicate
     * whether the return value is optional.  Therefore we use the list
     * of function names `optRetFunNames` to determine whether a
     * return value is optional. *)
    val mayReturnNull =
      (* CallableInfo.mayReturnNull callableInfo *)
      let
        fun isFun x = x = (functionNamespace, optContainerName, functionName)
      in
        List.exists isFun optRetFunNames
      end

    val ownershipTransfer = CallableInfo.getCallerOwns callableInfo

    val typeInfo = CallableInfo.getReturnType callableInfo
    val isPointer = TypeInfo.isPointer typeInfo

    val argId = ""

    val isOpt = mayReturnNull

    fun toScalarInfo ty =
      if isPointer
      then infoError (isPointerForScalar scalarToString ty)
      else
        {
          name  = argId,
          ty    = ty
        }

    open TypeTag
  in
    case TypeInfo.getTag typeInfo of
      ERROR     => infoError "return type ERROR not expected"
    | GTYPE     => infoError "return type GTYPE not supported"
    | ARRAY     => infoError "return type ARRAY not supported"
    | GLIST     => infoError "return type GLIST not supported"
    | GSLIST    => infoError "return type GSLIST not supported"
    | GHASH     => infoError "return type GHASH not supported"
    | VOID      => RIVOID
    | BOOLEAN   => RISCALAR (toScalarInfo STBOOLEAN)
    | INT8      => RISCALAR (toScalarInfo STINT8)
    | UINT8     => RISCALAR (toScalarInfo STUINT8)
    | INT16     => RISCALAR (toScalarInfo STINT16)
    | UINT16    => RISCALAR (toScalarInfo STUINT16)
    | INT32     => RISCALAR (toScalarInfo STINT32)
    | UINT32    => RISCALAR (toScalarInfo STUINT32)
    | INT64     => RISCALAR (toScalarInfo STINT64)
    | UINT64    => RISCALAR (toScalarInfo STUINT64)
    | FLOAT     => RISCALAR (toScalarInfo STFLOAT)
    | DOUBLE    => RISCALAR (toScalarInfo STDOUBLE)
    | FILENAME  =>
        let
          open Transfer

          val utf8Info = {
            name    = argId,
            isOpt   = isOpt,
            ownXfer =
              case ownershipTransfer of
                NOTHING    => false
              | EVERYTHING => true
              | CONTAINER  => infoError containerForFilename
          }
        in
          RIUTF8 utf8Info
        end
    | UTF8      =>
        let
          open Transfer

          val utf8Info = {
            name    = argId,
            isOpt   = isOpt,
            ownXfer =
              case ownershipTransfer of
                NOTHING    => false
              | EVERYTHING => true
              | CONTAINER  => infoError containerForUtf8
          }
        in
          RIUTF8 utf8Info
        end
    | UNICHAR   => RISCALAR (toScalarInfo STUNICHAR)
    | INTERFACE =>
        let
          val interfaceInfo = getInterface typeInfo
          val interfaceName = getName interfaceInfo
          val interfaceNamespace = BaseInfo.getNamespace interfaceInfo
          val interfaceCPrefix = getCPrefix repo interfaceNamespace
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
          val interfaceTy = getIRefTy interfaceInfo

          val iRef = {
            namespace = interfaceNamespace,
            cPrefix   = interfaceCPrefix,
            name      = interfaceName,
            scope     = interfaceScope,
            ty        = interfaceTy
          }

          val infoType = InfoType.getType interfaceInfo

          local
            open Transfer

            fun ptrOwnXferObjectInterface nonPtrForX =
              if true (* isPointer *)
              then
                case ownershipTransfer of
                  NOTHING    => SOME false
                | EVERYTHING => SOME true
                | CONTAINER  => infoError containerForInterface
              else
                infoError nonPtrForX
            val objectMsg = nonPtrForObject
            val interfaceMsg = nonPtrForInterface

            fun ptrOwnXferStructUnion nonPtrForRetX =
              case (true (* isPointer *), ownershipTransfer) of
                (false, _)          => infoError nonPtrForRetX
              | (_,     NOTHING)    => SOME false
              | (_,     EVERYTHING) => SOME true
              | (_,     CONTAINER)  => infoError containerForInterface
            val structMsg = nonPtrForRetStruct
            val unionMsg = nonPtrForRetUnion

            fun ptrOwnXferFlagsEnum ptrForX =
              if isPointer
              then infoError ptrForX
              else NONE
            val flagsMsg = ptrForFlags
            val enumMsg = ptrForEnum

            open InfoType
          in
            val (ptrOwnXfer, rootIRef) =
              case infoType of
                OBJECT objectInfo =>
                  (
                    ptrOwnXferObjectInterface objectMsg,
                    getRootObjectIRef repo functionNamespace optContainerName
                      (objectInfo, iRef)
                  )
              | INTERFACE _       =>
                  (
                    ptrOwnXferObjectInterface interfaceMsg,
                    makeInterfaceRootIRef functionNamespace optContainerName
                  )
              | STRUCT _          => (ptrOwnXferStructUnion structMsg, iRef)
              | UNION _           => (ptrOwnXferStructUnion unionMsg, iRef)
              | FLAGS _           => (ptrOwnXferFlagsEnum flagsMsg, iRef)
              | ENUM _            => (ptrOwnXferFlagsEnum enumMsg, iRef)
              | _                 => infoError (unsupportedInterface infoType)
          end

          val interfaceInfo = {
            name       = argId,
            rootIRef   = rootIRef,
            iRef       = iRef,
            infoType   = infoType,
            isOpt      = isOpt,
            ptrOwnXfer = ptrOwnXfer
          }
        in
          RIINTERFACE interfaceInfo
        end
  end


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
    val signalFlags = SignalInfo.getFlags signalInfo

    (* Ignore deprecated signals - is this needed?  Does above check suffice? *)
    (* requires glib >= 2.32
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
        (getParInfoX repo signalNamespace (SOME containerName) signalName)
        (signalInfo, [])

    val retInfo =
      getRetInfoX repo signalNamespace (SOME containerName) signalName
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
    val containerTyRef = (
      numInterfaceRefTyVars containerIRef,
      makeInterfaceRefTyLongId containerIRef
    )
    val (containerTy, _) = makeRefVarTy (containerTyRef, tyVarIdx'3)
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
    val signalFlags = SignalInfo.getFlags signalInfo

    (* Ignore deprecated signals - is this needed?  Does above check suffice? *)
    (* requires glib >= 2.32
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
        (getParInfoX repo signalNamespace (SOME containerName) signalName)
        (signalInfo, [])

    val retInfo =
      getRetInfoX repo signalNamespace (SOME containerName) signalName
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
              getList1 (map mkIdPat revInParamNames, mkConstPat ConstUnit)
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
              case revMap mkIdPat revOutParamNames of
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
                FunHeadPrefix (signalNameId, toList1 [APatId fId]),
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


fun getParamInfo repo (containerIRef : interfaceref) propertyInfo =
  let
    val ownershipTransfer = PropertyInfo.getOwnershipTransfer propertyInfo

    val typeInfo = PropertyInfo.getType propertyInfo
    val tag = TypeInfo.getTag typeInfo
    val isPointer = TypeInfo.isPointer typeInfo

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

    fun toScalarInfo ty =
      if isPointer
      then infoError (isPointerForScalar scalarToString ty)
      else
        {
          ty = ty
        }

    open TypeTag
  in
    case tag of
      ERROR     => infoError "type ERROR not expected"
    | INT8      => infoError "type INT8 not expected: no corresponding GType"
    | UINT8     => infoError "type UINT8 not expected: no corresponding GType"
    | INT16     => infoError "type INT16 not expected: no corresponding GType"
    | UINT16    => infoError "type UINT16 not expected: no corresponding GType"
    | GTYPE     => infoError "type GTYPE not supported"
    | ARRAY     => infoError "type ARRAY not supported"
    | GLIST     => infoError "type GLIST not supported"
    | GSLIST    => infoError "type GSLIST not supported"
    | GHASH     => infoError "type GHASH not supported"
    | VOID      => infoError "type VOID not expected"
    | BOOLEAN   => PISCALAR (mode, toScalarInfo STBOOLEAN)
    | INT32     => PISCALAR (mode, toScalarInfo STINT32)
    | UINT32    => PISCALAR (mode, toScalarInfo STUINT32)
    | INT64     => PISCALAR (mode, toScalarInfo STINT64)
    | UINT64    => PISCALAR (mode, toScalarInfo STUINT64)
    | FLOAT     => PISCALAR (mode, toScalarInfo STFLOAT)
    | DOUBLE    => PISCALAR (mode, toScalarInfo STDOUBLE)
    | FILENAME  =>
        let
          open Transfer

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
    | UTF8      =>
        let
          open Transfer

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
    | UNICHAR   => PISCALAR (mode, toScalarInfo STUNICHAR)
    | INTERFACE =>
        let
          val {
            name      = containerName,
            namespace = containerNamespace,
            ...
          } = containerIRef

          val interfaceInfo = getInterface typeInfo
          val interfaceName = getName interfaceInfo
          val interfaceNamespace = BaseInfo.getNamespace interfaceInfo
          val interfaceCPrefix = getCPrefix repo interfaceNamespace
          val interfaceScope =
            if interfaceNamespace <> containerNamespace
            then GLOBAL
            else
              if interfaceName = containerName
              then LOCALINTERFACESELF
              else LOCALINTERFACEOTHER
          val interfaceTy = getIRefTy interfaceInfo

          val iRef = {
            namespace = interfaceNamespace,
            cPrefix   = interfaceCPrefix,
            name      = interfaceName,
            scope     = interfaceScope,
            ty        = interfaceTy
          }

          val infoType = InfoType.getType interfaceInfo

          (* There are no introspection annotation to determine whether a
           * property is an optional value, though almost all (pointer)
           * values can be null.
           *)
          val isOpt =
            case infoType of
              InfoType.OBJECT _    => true
            | InfoType.INTERFACE _ => true
            | InfoType.STRUCT _    => true
            | InfoType.UNION _     => true
            | _                    => false

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


    val containerTyRef = (
      numInterfaceRefTyVars containerIRef,
      makeInterfaceRefTyLongId containerIRef
    )
    val tyVarIdx'0 = 0
    val (containerTy, tyVarIdx'1) = makeRefVarTy (containerTyRef, tyVarIdx'0)

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
          (mkTy mode isOpt (stringTyRef, tyVarIdx'1), iRefs)
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
        val pat = PatA (APatId xId)
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



(* --------------------------------------------------------------------------
 * Constant
 * -------------------------------------------------------------------------- *)

(* For constant names, we must preserve the case from the GIR file beacause
 * the names of upper- and lowercase variants of a Gdk key constant are
 * usually distinguished only by case.  For example, "KEY_A" and "KEY_a".
 *)
fun mkConstantNameId constantName = mkId constantName


(* Specification *)

fun makeConstantSpec
  (constantInfo, (iRefs, errs))
  : spec * (interfaceref list * infoerrorhier list) =
  let
    val () = checkDeprecated constantInfo

    val constantName = getName constantInfo
    val constantNameId = mkConstantNameId constantName

    val value = ConstantInfo.getValue constantInfo
    open Argument
    val constantTy = TyRef (
      case value of
        BOOLEAN _   => ([], toList1 ["bool"])
      | INT8 _      => ([], toList1 ["LargeInt", "int"])
      | UINT8 _     => ([], toList1 ["LargeInt", "int"])
      | INT16 _     => ([], toList1 ["LargeInt", "int"])
      | UINT16 _    => ([], toList1 ["LargeInt", "int"])
      | INT32 _     => ([], toList1 ["LargeInt", "int"])
      | UINT32 _    => ([], toList1 ["LargeInt", "int"])
      | INT64 _     => ([], toList1 ["LargeInt", "int"])
      | UINT64 _    => ([], toList1 ["LargeInt", "int"])
      | FLOAT _     => ([], toList1 ["real"])
      | DOUBLE _    => ([], toList1 ["real"])
      | STRING _    => ([], toList1 ["string"])
      | VOID        => infoError "constant type VOID not supported"
      | GTYPE       => infoError "constant type GTYPE not supported"
      | ARRAY       => infoError "constant type ARRAY not supported"
      | INTERFACE   => infoError "constant type INTERFACE not supported"
      | GLIST       => infoError "constant type GLIST not supported"
      | GSLIST      => infoError "constant type GSLIST not supported"
      | GHASH       => infoError "constant type GHASH not supported"
      | ERROR       => infoError "constant type ERROR not supported"
      | UNICHAR     => infoError "constant type UNICHAR not supported"
    )

    val iRefs'1 = iRefs
  in
    (mkValSpec (constantNameId, constantTy), (iRefs'1, errs))
  end


(* Declaration *)

fun makeConstantStrDec
  (constantInfo, (iRefs, errs))
  : strdec * (interfaceref list * infoerrorhier list) =
  let
    val () = checkDeprecated constantInfo

    val constantName = getName constantInfo
    val constantNameId = mkConstantNameId constantName

    fun makeRealConst x =
      let
        val {sign, digits, exp, ...} = Real.toDecimal x
        val numDigits = length digits

        (* `m` is integer with digits `digits` *)
        fun addDigit (d, a) = a * 10 + d
        val m =
          case digits of
            []            => 0
          | op :: digits1 => foldl1 addDigit digits1

        (* Use e-notation when `exp` is greater than `numDigits`, i.e. if
         * there would be a zero digit to the left of the decimal point
         * without e-notation.  With e-notation, always have one non-zero
         * digit before the decimal point. *)
        val (p, optE) =
          if exp <= numDigits
          then (numDigits - exp, NONE)
          else (numDigits - 1,   SOME (exp - 1))
      in
        ConstReal (if sign then ~ m else m, p, optE)
      end

    val value = ConstantInfo.getValue constantInfo
    open Argument
    val constantExp =
      case value of
        BOOLEAN b   => mkIdLNameExp (Bool.toString b)
      | INT8 n      => ExpConst (ConstInt (n, NONE))
      | UINT8 n     => ExpConst (ConstInt (n, NONE))
      | INT16 n     => ExpConst (ConstInt (n, NONE))
      | UINT16 n    => ExpConst (ConstInt (n, NONE))
      | INT32 n     => ExpConst (ConstInt (n, NONE))
      | UINT32 n    => ExpConst (ConstInt (n, NONE))
      | INT64 n     => ExpConst (ConstInt (n, NONE))
      | UINT64 n    => ExpConst (ConstInt (n, NONE))
      | FLOAT x     => ExpConst (makeRealConst x)
      | DOUBLE x    => ExpConst (makeRealConst x)
      | STRING s    => ExpConst (ConstString s)
      | VOID        => infoError "constant type VOID not supported"
      | GTYPE       => infoError "constant type GTYPE not supported"
      | ARRAY       => infoError "constant type ARRAY not supported"
      | INTERFACE   => infoError "constant type INTERFACE not supported"
      | GLIST       => infoError "constant type GLIST not supported"
      | GSLIST      => infoError "constant type GSLIST not supported"
      | GHASH       => infoError "constant type GHASH not supported"
      | ERROR       => infoError "constant type ERROR not supported"
      | UNICHAR     => infoError "constant type UNICHAR not supported"

    val iRefs'1 = iRefs
  in
    (
      StrDecDec (mkIdValDec (constantNameId, constantExp)),
      (iRefs'1, errs)
    )
  end



(* --------------------------------------------------------------------------
 * Interface conversion (as<InterfaceName> functions)
 * -------------------------------------------------------------------------- *)

fun mkInterfaceConvId interfaceName = "as" ^ toUCC interfaceName


(* Specification *)

fun makeInterfaceConvSpec
  repo
  (containerIRef as {namespace = containerNamespace, ...} : interfaceref)
  (interfaceInfo, (iRefs, errs))
  : spec * (interfaceref list * infoerrorhier list) =
  let
    val () = checkDeprecated interfaceInfo

    val interfaceNamespace = BaseInfo.getNamespace interfaceInfo
    val interfaceCPrefix = getCPrefix repo interfaceNamespace
    val interfaceName = getName interfaceInfo
    val interfaceScope =
      if interfaceNamespace <> containerNamespace
      then GLOBAL
      else LOCALINTERFACEOTHER
    val interfaceTy = CLASS

    val interfaceIRef = {
      namespace = interfaceNamespace,
      cPrefix   = interfaceCPrefix,
      name      = interfaceName,
      scope     = interfaceScope,
      ty        = interfaceTy
    }

    val interfaceConvId = mkInterfaceConvId interfaceName

    val iRefs'1 =
      case interfaceScope of
        GLOBAL             => iRefs
   (* | LOCALINTERFACESELF => iRefs *) (* unreachable *)
      | _                  => insert (interfaceIRef, iRefs)

    (*
     * <containerTy> -> <interfaceTy>
     *)
    val containerTyRef = (
      numInterfaceRefTyVars containerIRef,
      makeInterfaceRefTyLongId containerIRef
    )
    val interfaceTyRef = (
      numInterfaceRefTyVars interfaceIRef,
      makeInterfaceRefTyLongId interfaceIRef
    )
    val tyVarIdx'0 = 0
    val (containerTy, tyVarIdx'1) = makeRefVarTy (containerTyRef, tyVarIdx'0)
    val (interfaceTy, _) = makeRefBaseTy (interfaceTyRef, tyVarIdx'1)
    val interfaceConvTy = TyFun (containerTy, interfaceTy)
  in
    (mkValSpec (interfaceConvId, interfaceConvTy), (iRefs'1, errs))
  end


(* Declaration *)

fun makeInterfaceConvStrDec
  repo
  rootObjectIRef
  ({namespace = containerNamespace, ...} : interfaceref)
  (interfaceInfo, (iRefs, errs))
  : strdec * (interfaceref list * infoerrorhier list) =
  let
    val () = checkDeprecated interfaceInfo

    val interfaceNamespace = BaseInfo.getNamespace interfaceInfo
    val interfaceCPrefix = getCPrefix repo interfaceNamespace
    val interfaceName = getName interfaceInfo
    val interfaceScope =
      if interfaceNamespace <> containerNamespace
      then GLOBAL
      else LOCALINTERFACEOTHER
    val interfaceTy = CLASS

    val interfaceIRef = {
      namespace = interfaceNamespace,
      cPrefix   = interfaceCPrefix,
      name      = interfaceName,
      scope     = interfaceScope,
      ty        = interfaceTy
    }

    val interfaceConvId = mkInterfaceConvId interfaceName

    val iRefs'1 =
      case interfaceScope of
        GLOBAL             => iRefs
   (* | LOCALINTERFACESELF => iRefs *) (* unreachable *)
      | _                  => insert (interfaceIRef, iRefs)

    (*
     *   <RootObjectNamespace><RootObjectName>Class.C.withPtr
     *)
    val withFunExp =
      mkLIdLNameExp (prefixInterfaceStrId rootObjectIRef ["C", withPtrId])

    (*
     *   <InterfaceNamespace><InterfaceName>Class.C.fromPtr false
     *)
    val fromFunExp =
      ExpApp (
        mkLIdLNameExp (prefixInterfaceStrId interfaceIRef ["C", fromPtrId]),
        falseExp
      )

    (*
     *   (<RootObjectNamespace><RootObjectName>Class.C.withPtr
     *     ---> <InterfaceNamespace><InterfaceName>Class.C.fromPtr false)
     *     I
     *     self
     *)
    val functionExp =
      ExpApp (
        ExpApp (
          mkParenExp (mkDDDRExp (withFunExp, fromFunExp)),
          mkIdLNameExp iId
        ),
        mkIdLNameExp selfId
      )
  in
    (
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (interfaceConvId, toList1 [APatId selfId]),
                NONE,
                functionExp
              )
            ]
          ]
        )
      ),
      (iRefs'1, errs)
    )
  end



(* --------------------------------------------------------------------------
 * Common functions
 * -------------------------------------------------------------------------- *)

fun addGetTypeFunctionSpec (typeIRef : interfaceref) (specs, iRefs, errs) =
  let
    val specs' = getTypeSpec typeIRef :: specs

    val iRef as {scope, ...} = typeIRef
    val iRefs' =
      case scope of
        GLOBAL             => iRefs
      | LOCALINTERFACESELF => iRefs
      | _                  => insert (iRef, iRefs)
  in
    (specs', iRefs', errs)
  end

fun addGetTypeFunctionStrDecHighLevel
  (typeIRef : interfaceref)
  (strDecs, iRefs, errs) =
  let
    val strDecs' = getTypeStrDecHighLevel :: strDecs

    val iRef as {scope, ...} = typeIRef
    val iRefs' =
      case scope of
        GLOBAL             => iRefs
      | LOCALINTERFACESELF => iRefs
      | _                  => insert (iRef, iRefs)
  in
    (strDecs', iRefs', errs)
  end

fun addGetTypeFunctionStrDecLowLevel
  repo
  libId
  namespace
  getTypeSymbol
  isPolyML
  (strDecs, errs) =
  let
    val getTypeLibId =
      if namespace = "GLib"
      then getSharedLibraryId repo "GObject"
      else libId

    val strDecs' =
      (
        if isPolyML
        then getTypeStrDecLowLevelPolyML getTypeLibId getTypeSymbol
        else getTypeStrDecLowLevelMLton getTypeSymbol
      ) :: strDecs
  in
    (strDecs', errs)
  end


fun makeIRefLocalTypeSpec iRef =
  let
    val tyId = makeLocalInterfaceId iRef
    val nTys = numInterfaceRefTyVars iRef
    val (tyVars, _) = makeTyList makeTyVar (nTys, 0)
  in
    mkTypeSpec ((tyVars, tyId), NONE)
  end

type localtype = {
  tyVars    : (bool * id) list,
  tyId      : id,
  varTys    : ty list,
  tyStrLId  : lid,
  tyNameLId : lid
}

fun makeIRefLocalType iRef : localtype =
  let
    val nTys = numInterfaceRefTyVars iRef
    val (tyVars, _) = makeTyList makeTyVar (nTys, 0)
  in
    {
      tyVars    = tyVars,
      tyId      = makeLocalInterfaceId iRef,
      varTys    = map TyVar tyVars,
      tyStrLId  = toList1 [makeInterfaceOtherStrId iRef, tId],
      tyNameLId = toList1 [makeNamespaceStrId iRef, tId]
    }
  end

fun makeLocalTypeSpec ({tyVars, tyId, ...} : localtype) : spec =
  SpecType (false, toList1 [((tyVars, tyId), NONE)])

fun makeLocalTypeStrDec ({tyVars, tyId, varTys, tyStrLId, ...} : localtype) =
  StrDecDec (DecType (toList1 [((tyVars, tyId), TyRef (varTys, tyStrLId))]))

fun makeLocalTypeStrModuleQual ({tyVars, tyId, varTys, tyStrLId, ...} : localtype) =
  toList1 [((tyVars, toList1 [tyId]), TyRef (varTys, tyStrLId))]

fun makeLocalTypeStrSpecQual ({tyVars, tyId, varTys, tyNameLId, ...} : localtype) =
  toList1 [((tyVars, toList1 [tyId]), TyRef (varTys, tyNameLId))]





fun mkLocalId (_, strName, id) = concat [toLC strName, "_", id]

fun mkLocalStrModuleLId (strNamespace, strName, id) =
  toList1 [toUCC strNamespace ^ toUCC strName, id]

fun mkLocalStrSpecLId (name as (strNamespace, strName, id)) =
  case strNamespace of
    "" => toList1 [mkLocalId name] (* not present in namespace, use local *)
  | _  => toList1 [toUCC strName, id]

fun mkGlobalLId (strNamespace, strName, id) =
  toList1 [toUCC strNamespace, toUCC strName, id]

fun toSpec (tyVars, name) = mkTypeSpec ((tyVars, mkLocalId name), NONE)
fun toLocalType (tyVars, name) =
  let
  in
    {
      tyVars    = tyVars,
      tyId      = mkLocalId name,
      varTys    = map TyVar tyVars,
      tyStrLId  = mkLocalStrModuleLId name,
      tyNameLId = mkLocalStrSpecLId name
    }
  end


local
  val objectTyVar = (false, "object")
  val propertyTemplates = [
    ([objectTyVar, aTyVar], ("", "Property", "readonly")),
    ([objectTyVar, aTyVar], ("", "Property", "writeonly")),
    ([objectTyVar, aTyVar, bTyVar], ("", "Property", "readwrite"))
  ]
  val revPropertySpecs = revMap toSpec propertyTemplates
  val revPropertyLocalTypes = revMap toLocalType propertyTemplates
in
  (*
   * `addPropertySpecs namespace numProps specs` adds
   *
   *                                                             -.
   *     type ('object, 'a) property_readonly                     | isGObject
   *     type ('object, 'a) property_writeonly                    |  and P > 0
   *     type ('object, 'a, 'b) property_readwrite                |
   *                                                             -'
   *
   * to `specs`.
   *)
  fun addPropertySpecs namespace numProps specs =
    let
      val isGObject = namespace = "GObject"
    in
      if isGObject andalso numProps > 0
      then List.revAppend (revPropertySpecs, specs)
      else specs
    end

  (*
   * `makePropertyLocalTypes isGObject numProps` returns `revLocalTypes` such
   * that `revMap makeLocalTypeStrDec revLocalTypes` produces strdec values
   * as follows:
   *
   *                                                             -.
   *     type ('object, 'a) property_readonly =                   |
   *       ('object, 'a) Property.readonly                        |
   *     type ('object, 'a) property_writeonly =                  | isGObject
   *       ('object, 'a) Property.writeonly                       |  and P > 0
   *     type ('object, 'a, 'b) property_readwrite =              |
   *       ('object, 'a) Property.readwrite                       |
   *                                                             -'
   *
   * and `revMap makeLocalTypeStrModuleQual revLocalTypes` produces qual
   * values as follows:
   *
   *                                                             -.
   *     where type ('object, 'a) property_readonly =             |
   *       ('object, 'a) Property.readonly                        |
   *     where type ('object, 'a) property_writeonly =            | isGObject
   *       ('object, 'a) Property.writeonly                       |  and P > 0
   *     where type ('object, 'a, 'b) property_readwrite =        |
   *       ('object, 'a) Property.readwrite                       |
   *                                                             -'
   *)
  fun makePropertyLocalTypes isGObject numProps =
    if isGObject andalso numProps > 0
    then revPropertyLocalTypes
    else []
end


local
  val accessorName = ("GObject", "Value", "accessor")
  val accessorTemplate = ([aTyVar, bTyVar], accessorName)

  val accessorGlobalLId : lid = mkGlobalLId accessorName
  val accessorLocalId : id = mkLocalId accessorName
  val accessorLocalLId : lid = toList1 [accessorLocalId]
  val accessorSpec = toSpec accessorTemplate
  val accessorLocalType = toLocalType accessorTemplate
in
  (*
   * `addAccessorSpecs namespace info (readTy, writeTy) isPtr specs` adds
   *
   *                                                     -.
   *     type ('a, 'b) value_accessor                     |
   *     val t : (base t, 'a t) value_accessor            |
   *                                        -.            | isGObject
   *     val tOpt :                          |            |
   *      (base t option, 'a t option)       | isPtr      |
   *        value_accessor                   |            |
   *                                        -'           -'
   *                                                     -.
   *     val t : (base t, 'a t) GObject.Value.accessor    |
   *                                        -.            |
   *     val tOpt :                          |            | not isGObject
   *       (base t option, 'a t option)      | isPtr      |
   *         GObject.Value.accessor          |            |
   *                                        -'           -'
   *
   * to `specs`.
   *)
  fun addAccessorSpecs namespace info (readTy, writeTy) isPtr specs =
    case RegisteredTypeInfo.getTypeInit info of
      SOME _ =>
        let
          val isGObject = namespace = "GObject"

          val accessorTys = [readTy, writeTy]
          fun addValSpecs accessorLId specs =
            mkValSpec (tId, TyRef (accessorTys, accessorLId))
             :: (
              if isPtr
              then
                mkValSpec (tOptId, TyRef (map optionTy accessorTys, accessorLId))
                 :: specs
              else
                specs
            )
        in
          if isGObject
          then accessorSpec :: addValSpecs accessorLocalLId specs
          else addValSpecs accessorGlobalLId specs
        end
    | NONE   => specs

  (*
   * `makeAccessorLocalTypes isGObject` returns `revLocalTypes` such
   * that `revMap makeLocalTypeStrDec revLocalTypes` produces strdec values
   * as follows:
   *
   *                                                 -.
   *     type ('a, 'b) value_accessor =               | isGObject
   *       ('a, 'b) GObjectValue.accessor             |
   *                                                 -'
   *
   * and `revMap makeLocalTypeStrModuleQual revLocalTypes` produces qual
   * values as follows:
   *
   *                                                 -.
   *     where                                        |
   *       type ('a, 'b) value_accessor =             | isGObject
   *         ('a, 'b) GObjectValue.accessor           |
   *                                                 -'
   *)
  fun makeAccessorLocalTypes isGObject =
    if isGObject
    then [accessorLocalType]
    else []
end

(*
 * `addAccessorRootStrDecs repo libId namespace info` returns
 * `(add, revLocalTypes)` where `add (valueType, isPtr) isPolyML strDecs`
 * prepends the following to `strDecs` when `info` is a registered GType,
 * i.e.
 *
 *   RegisteredTypeInfo.getTypeInit info
 *
 * returns is `SOME _`.
 *
 *                                                           -.
 *     local                                                  |
 *       open PolyMLFFI                                       |
 *     in                                                     |
 *       val getType_ =                                       |
 *         call                                               |
 *           (load_sym <libId> "<getTypeSymbol>")             |
 *           (FFI.PolyML.VOID --> GObjectType.PolyML.VAL);    |
 *                                                            |
 *       val getValue_ =                                      |
 *         call                                               |
 *           (load_sym <valueLibId> "g_value_get_<valueType>")|
 *           (GObjectValue.PolyML.PTR --> <retConv>);         |
 *                                                            |
 *                                             -.             |
 *       val getOptValue_ =                     | isPtr       |
 *         call                                 |             | Poly/ML only
 *           (load_sym <valueLibId> "g_value_get_<valueType>")|
 *           (GObjectValue.PolyML.PTR --> <retOptConv>);      |
 *                                             -'             |
 *                                                            |
 *       val setValue_ =                                      |
 *         call                                               |
 *           (load_sym <valueLibId> "g_value_set_<valueType>")|
 *           (GObjectValue.PolyML.PTR &&> <parConv> --> FFI.PolyML.VOID);
 *                                                            |
 *                                             -.             |
 *       val setOptValue_ =                     | isPtr       |
 *         call                                 |             |
 *           (load_sym <valueLibId> "g_value_set_<valueType>")|
 *           (GObjectValue.PolyML.PTR &&> <parOptConv> --> FFI.PolyML.VOID);
 *                                             -'             |
 *     end                                                    |
 *                                                           -'
 *                                                           -.
 *     val getType_ =                                         |
 *       _import "<getTypeSymbol>" : unit -> GObjectType.C.val_;
 *                                                            |
 *     val getValue_ =                                        |
 *       _import "g_value_get_<valueType>" :                  |
 *         GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> <retType>;
 *                                                            |
 *                                           -.               |
 *     val getOptValue_ =                     |               |
 *       _import "g_value_get_<valueType>" :  | isPtr         |
 *         GObjectValueRecord.C.notnull GObjectValueRecord.C.p
 *          -> <retOptType>;                  |               | MLton only
 *                                           -'               |
 *                                                            |
 *     val setValue_ =                                        |
 *       fn x1 & x2 =>                                        |
 *         (_import "g_value_set_<valueType>" :               |
 *            GObjectValueRecord.C.notnull GObjectValueRecord.C.p
 *             * <parType>                                    |
 *             -> unit;)                                      |
 *         (x1, x2)                                           |
 *                                                            |
 *                                           -.               |
 *     val setOptValue_ =                     | isPtr         |
 *       fn x1 & x2 =>                        |               |
 *         (_import "g_value_set_<valueType>" :               |
 *            GObjectValueRecord.C.notnull GObjectValueRecord.C.p
 *             * <parOptType>                 |               |
 *             -> unit;)                      |               |
 *         (x1, x2)                           |               |
 *                                           -'              -'
 *                                                           -.
 *     type ('a, 'b) value_accessor =                         | isGObject
 *       ('a, 'b) GObjectValue.accessor                       |
 *                                                           -'
 *     val t =
 *       GObjectValue.C.createAccessor {
 *         getType  = (I ---> GObjectType.C.fromVal) getType_,
 *         getValue = (I ---> <fromFun>) getValue_,
 *         setValue = (I &&&> <withFun> ---> I) setValue_
 *       }
 *
 *                                           -.
 *     val tOpt =                             | isPtr
 *       GObjectValue.C.createAccessor {      |
 *         getType  = (I ---> GObjectType.C.fromVal) getType_,
 *         getValue = (I ---> <fromOptFun>) getOptValue_,
 *         setValue = (I &&&> <withOptFun> ---> I) setOptValue_
 *       }                                    |
 *                                           -'
 *
 * where
 *
 *
 *   ObjectNamespace
 *     is defined as
 *
 *         GObject
 *           if namespace = "GLib"
 *
 *         EnumNamespace
 *           otherwise
 *
 *
 *   parType and retType
 *     are defined as
 *
 *         C.notnull C.p
 *           if isPtr
 *
 *         C.val_
 *           otherwise
 *
 *
 *   parConv and retConv
 *     are defined as
 *
 *         PolyML.PTR
 *           if isPtr
 *
 *         PolyML.VAL
 *           otherwise
 *
 *
 *   fromFun
 *     is defined as
 *
 *         C.fromPtr false
 *           if isPtr
 *
 *         C.fromVal
 *           otherwise
 *
 *
 *   withFun
 *     is defined as
 *
 *         C.withPtr
 *           if isPtr
 *
 *         C.withVal
 *           otherwise
 *
 *
 *   valueLibId
 *     is `getSharedLibraryId repo "GObject"`
 *
 *)
local
  (*
   *     val t<Opt> =
   *       GObjectValue.C.createAccessor {
   *         getType  = (I ---> GObjectType.C.fromVal) getType_,
   *         getValue = (I ---> <from<Opt>Fun>) get<Opt>Value_,
   *         setValue = (I &&&> <with<Opt>Fun> ---> I) set<Opt>Value_
   *       }
   *)
  val getTypeExp =
    ExpApp (
      mkParenExp (
        mkDDDRExp (iExp, mkLIdLNameExp ["GObjectType", "C", fromValId])
      ),
      mkIdLNameExp getTypeUId
    )
  fun getValueExp ptrOpt =
    let
      val fromFunExp =
        case ptrOpt of
          NONE       => mkLIdLNameExp ["C", fromValId]
        | SOME isOpt =>
            ExpApp (
              mkLIdLNameExp ["C", if isOpt then fromOptPtrId else fromPtrId],
              mkIdLNameExp "false"
          )
    in
      ExpApp (
        mkParenExp (mkDDDRExp (iExp, fromFunExp)),
        mkIdLNameExp (
          case ptrOpt of
            SOME true => getOptValueUId
          | _         => getValueUId
        )
      )
    end
  fun setValueExp ptrOpt =
    let
      val withFunExp =
        case ptrOpt of
          NONE       => mkLIdLNameExp ["C", withValId]
        | SOME false => mkLIdLNameExp ["C", withPtrId]
        | SOME true  => mkLIdLNameExp ["C", withOptPtrId]
    in
      ExpApp (
        mkParenExp (mkDDDRExp (mkAAARExp (iExp, withFunExp), iExp)),
        mkIdLNameExp (
          case ptrOpt of
            SOME true => setOptValueUId
          | _         => setValueUId
        )
      )
    end
  fun tStrDec ptrOpt =
    StrDecDec (
      mkIdValDec (
        case ptrOpt of SOME true => tOptId | _ => tId,
        ExpApp (
          mkLIdLNameExp ["GObjectValue", "C", "createAccessor"],
          ExpRec [
            (getTypeId, getTypeExp),
            (getValueId, getValueExp ptrOpt),
            (setValueId, setValueExp ptrOpt)
          ]
        )
      )
    )


  (* Low-level MLton *)

  (*
   *     val getValue_ =
   *       _import "g_value_get_<valueType>" :
   *         GObjectValueRecord.C.notnull GObjectValueRecord.C.p
   *          -> <retType>;
   *)
  fun getValueStrDecLowLevelMLton (valueIRef, valueType) ptrOpt =
    let
      val retTy =
        case ptrOpt of
          NONE       => mkLIdTy ["C", valId]
        | SOME isOpt => mkPtrTy isOpt [CId]
    in
      StrDecDec (
        mkIdValDec (
          getValueUId,
          callMLtonFFIExp ("g_value_get_" ^ valueType) (
            [
              mkPtrTy false
                (prefixInterfaceStrId valueIRef [CId])
            ],
            retTy
          )
        )
      )
    end

  (*
   *     val setValue_ =
   *       _import "g_value_set_<valueType>" :
   *         GObjectValueRecord.C.notnull GObjectValueRecord.C.p * <parType>
   *          -> unit;
   *)
  fun setValueStrDecLowLevelMLton (valueIRef, valueType) ptrOpt =
    let
      val parTy =
        case ptrOpt of
          NONE       => mkLIdTy [CId, valId]
        | SOME isOpt => mkPtrTy isOpt [CId]
    in
      StrDecDec (
        mkIdValDec (
          setValueUId,
          callMLtonFFIExp ("g_value_set_" ^ valueType) (
            [
              mkPtrTy false
                (prefixInterfaceStrId valueIRef [CId]),
              parTy
            ],
            unitTy
          )
        )
      )
    end

  fun addStrDecsLowLevelMLton
    namespace
    getTypeSymbol
    valueType
    isPtr
    strDecs =
    let
      val valueIRef = makeValueIRef namespace (SOME "")
    in
      if isPtr
      then
        getTypeStrDecLowLevelMLton getTypeSymbol
         :: getValueStrDecLowLevelMLton (valueIRef, valueType) (SOME false)
         :: getValueStrDecLowLevelMLton (valueIRef, valueType) (SOME true)
         :: setValueStrDecLowLevelMLton (valueIRef, valueType) (SOME false)
         :: setValueStrDecLowLevelMLton (valueIRef, valueType) (SOME true)
         :: strDecs
      else
        getTypeStrDecLowLevelMLton getTypeSymbol
         :: getValueStrDecLowLevelMLton (valueIRef, valueType) NONE
         :: setValueStrDecLowLevelMLton (valueIRef, valueType) NONE
         :: strDecs
    end


  (* Low-level Poly/ML *)

  (*
   *     val getValue_ =
   *       call
   *         (load_sym <valueLibId> "g_value_get_<valueType>")
   *         (GObjectValueRecord.PolyML.PTR --> <retConv>);
   *)
  fun getValueStrDecLowLevelPolyML (valueLibId, valueIRef, valueType) ptrOpt =
    let
      val parConvs =
        mkLIdLNameExp (prefixInterfaceStrId valueIRef [PolyMLId, PTRId])
      val convId =
        case ptrOpt of
          NONE       => VALId
        | SOME false => PTRId
        | SOME true  => OPTPTRId
      val retConv = mkLIdLNameExp [PolyMLId, convId]
      val getTypeSymbol = "g_value_get_" ^ valueType
    in
      StrDecDec (
        mkIdValDec (
          getValueUId,
          callPolyMLFFIExp valueLibId getTypeSymbol (parConvs, retConv)
        )
      )
    end

  (*
   *     val setValue_ =
   *       call
   *         (load_sym <valueLibId> "g_value_set_<valueType>")
   *         (GObjectValueRecord.PolyML.PTR &&> <parConv> --> FFI.PolyML.VOID);
   *)
  fun setValueStrDecLowLevelPolyML (valueLibId, valueIRef, valueType) ptrOpt =
    let
      val convId =
        case ptrOpt of
          NONE       => VALId
        | SOME false => PTRId
        | SOME true  => OPTPTRId
      val parConv = mkLIdLNameExp [PolyMLId, convId]
      val parConvs =
        mkAARExp (
          mkLIdLNameExp (
            prefixInterfaceStrId valueIRef [PolyMLId, PTRId]
          ),
          parConv
        )
      val retConv = mkLIdLNameExp [FFIId, PolyMLId, VOIDId]
      val getTypeSymbol = "g_value_set_" ^ valueType
    in
      StrDecDec (
        mkIdValDec (
          setValueUId,
          callPolyMLFFIExp valueLibId getTypeSymbol (parConvs, retConv)
        )
      )
    end

  fun addStrDecsLowLevelPolyML
    repo
    libId
    namespace
    getTypeSymbol
    valueType
    isPtr
    strDecs =
    let
      val valueIRef = makeValueIRef namespace (SOME "")
      val gobjectLibId = getSharedLibraryId repo "GObject"
      val getTypeLibId =
        if namespace = "GLib"
        then gobjectLibId
        else libId
      val valueArgs = (gobjectLibId, valueIRef, valueType)
      val localStrDecs =
        if isPtr
        then
          [
            getTypeStrDecLowLevelPolyML getTypeLibId getTypeSymbol,
            getValueStrDecLowLevelPolyML valueArgs (SOME false),
            getValueStrDecLowLevelPolyML valueArgs (SOME true),
            setValueStrDecLowLevelPolyML valueArgs (SOME false),
            setValueStrDecLowLevelPolyML valueArgs (SOME true)
          ]
        else
          [
            getTypeStrDecLowLevelPolyML getTypeLibId getTypeSymbol,
            getValueStrDecLowLevelPolyML valueArgs NONE,
            setValueStrDecLowLevelPolyML valueArgs NONE
          ]
    in
      mkPolyMLFFILocalStrDec localStrDecs :: strDecs
    end
in
  fun addAccessorRootStrDecs
    repo
    libId
    namespace
    info =
    case RegisteredTypeInfo.getTypeInit info of
      SOME getTypeSymbol =>
        let
          val isGObject = namespace = "GObject"
          val revLocalTypes = makeAccessorLocalTypes isGObject

          fun addStrDecsLowLevel (valueType, isPtr) isPolyML strDecs =
            let
              val strDecs'1 =
                if isPtr
                then tStrDec (SOME false) :: tStrDec (SOME true) :: strDecs
                else tStrDec NONE :: strDecs
              val strDecs'2 =
                revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'1)

              val strDecs'3 = (
                if isPolyML
                then addStrDecsLowLevelPolyML repo libId
                else addStrDecsLowLevelMLton
              )
                namespace getTypeSymbol valueType isPtr strDecs'2
            in
              strDecs'3
            end
        in
          (addStrDecsLowLevel, revLocalTypes)
        end
    | NONE               => (K (K I), [])
end



(* --------------------------------------------------------------------------
 * Object - root class stubbed with empty file for now
 * -------------------------------------------------------------------------- *)

datatype program =
  Portable of module list
| Specific of {mlton : module list, polyml : module list}

val isPortable =
  fn
    Portable _ => true
  | Specific _ => false


(* Class signature *)

local
  (*
   *     val toBase : 'a t -> base t
   *)
  val toBaseValSpec = mkValSpec (toBaseId, TyFun (tTy aVarTy, tTy baseTy))

  (*
   *     structure C :
   *       sig
   *         type notnull
   *         type 'a p
   *         val fromPtr : bool -> notnull p -> 'a t
   *         val fromOptPtr : bool -> unit p -> 'a t option
   *       end
   *)
  val structCSpecs = [
    mkTypeSpec (notnullTyName, NONE),
    mkTypeSpec (ptrTyName aTyVar, NONE),
    mkValSpec (
      fromPtrId,
      TyFun (boolTy, TyFun (ptrTy notnullTy, tTy aVarTy))
    ),
    mkValSpec (
      fromOptPtrId,
      TyFun (boolTy, TyFun (ptrTy unitTy, optionTy (tTy aVarTy)))
    )
  ]
  val structCSpec = mkCStructSpec structCSpecs

  val specs'1 = [structCSpec]
in
  fun makeObjectDerivedClassSig
    (repo             : 'a RepositoryClass.t)
    (objectCPrefix    : string)
    (objectNamespace  : string)
    (parentObjectInfo : 'b ObjectInfoClass.t)
    (objectInfo       : 'c ObjectInfoClass.t)
    : id * program =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo
      val objectNameTypeId = toLC objectName

      val parentObjectNamespace = BaseInfo.getNamespace parentObjectInfo
      val parentObjectCPrefix = getCPrefix repo parentObjectNamespace
      val parentObjectName = getName parentObjectInfo
      val parentObjectScope =
        if parentObjectNamespace <> objectNamespace
        then GLOBAL
        else LOCALINTERFACEOTHER
      val parentObjectTy = CLASS

      val parentObjectIRef = {
        namespace = parentObjectNamespace,
        cPrefix   = parentObjectCPrefix,
        name      = parentObjectName,
        scope     = parentObjectScope,
        ty        = parentObjectTy
      }

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val specs'2 =
        addAccessorSpecs
          objectNamespace
          objectInfo
          (tTy baseTy, tTy aVarTy)
          true
          specs'1
      val specs'3 = toBaseValSpec :: specs'2

      (*
       *     type 'a <objectname>
       *                                           -.
       *     type 'a <parentobjectname>class_t      | isParentNamespace
       *     type 'a t = 'a <objectname> <parentobjectname>class_t
       *                                           -'
       *                                           -.
       *     type 'a t =                            | not isParentNamespace
       *       'a <objectname>                      |
       *         <ParentObjectNamespace>.<ParentObjectName>Class.t
       *                                           -'
       *)
      val parentClassTypeLId = makeInterfaceRefTyLongId parentObjectIRef
      val tTySpec =
        mkTypeSpec (
          tTyName aTyVar,
          SOME (
            TyRef (
              [TyRef ([aVarTy], toList1 [objectNameTypeId])],
              parentClassTypeLId
            )
          )
        )
      (* parentClassTypeLId is (_, [])
       *  <=> parentObjectNamespace = objectNamespace
       *  <=> isParentNamespace *)
      val specs'4 =
        case parentClassTypeLId of
          (id, []) => mkTypeSpec (([aTyVar], id), NONE) :: tTySpec :: specs'3
        | _        => tTySpec :: specs'3
      val specs'5 = mkTypeSpec (([aTyVar], objectNameTypeId), NONE) :: specs'4

      val sig1 = mkSigSpec specs'5
      val qSig : qsig = (sig1, [])
      val sigDec = toList1 [(objectClassSigId, qSig)]
      val program = [ModuleDecSig sigDec]
    in
      (objectClassSigId, Portable program)
    end

  fun makeObjectRootClassSig
    (objectCPrefix   : string)
    (objectNamespace : string)
    (objectInfo      : 'a ObjectInfoClass.t)
    : id * program =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val program = []
    in
      (objectClassSigId, Portable program)
    end

  fun makeObjectClassSig
    (repo            : 'a RepositoryClass.t)
    (objectCPrefix   : string)
    (objectNamespace : string)
    (objectInfo      : 'b ObjectInfoClass.t)
    : id * program =
    case ObjectInfo.getParent objectInfo of
      SOME parentObjectInfo =>
        makeObjectDerivedClassSig
          repo
          objectCPrefix
          objectNamespace
          parentObjectInfo
          objectInfo
    | NONE                  =>
        makeObjectRootClassSig objectCPrefix objectNamespace objectInfo
end


(* Class structure *)

local
  (*
   *     fun toBase obj = obj
   *)
  val toBaseFunDec =
    DecFun (
      [],
      toList1 [
        toList1 [
          (
            FunHeadPrefix (toBaseId, toList1 [APatId objId]),
            NONE,
            mkIdLNameExp objId
          )
        ]
      ]
    )
in
  fun makeObjectDerivedClassStr
    (repo             : 'a RepositoryClass.t)
    (objectCPrefix    : string)
    (objectNamespace  : string)
    (parentObjectInfo : 'b ObjectInfoClass.t)
    (objectInfo       : 'c ObjectInfoClass.t)
    : id * (spec list * strdec list) * program * interfaceref list =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo
      val objectNameTypeId = toLC objectName

      val parentObjectNamespace = BaseInfo.getNamespace parentObjectInfo
      val parentObjectCPrefix = getCPrefix repo parentObjectNamespace
      val parentObjectName = getName parentObjectInfo
      val parentObjectScope =
        if parentObjectNamespace <> objectNamespace
        then GLOBAL
        else LOCALINTERFACEOTHER
      val parentObjectTy = CLASS

      val parentObjectIRef = {
        namespace = parentObjectNamespace,
        cPrefix   = parentObjectCPrefix,
        name      = parentObjectName,
        scope     = parentObjectScope,
        ty        = parentObjectTy
      }

      (* <ParentObjectNamespace><ParentObjectName>Class *)
      val parentClassStrId = makeInterfaceOtherStrId parentObjectIRef

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val objectClassStrNameId = mkClassStrNameId objectName

      val iRefs'1 =
        case parentObjectScope of
          GLOBAL             => []
     (* | LOCALINTERFACESELF => [] *) (* unreachable *)
        | _                  => [parentObjectIRef]

      val isParentNamespace = parentObjectScope <> GLOBAL
      val isGObject = objectNamespace = "GObject"

      (* module *)
      (*
       *     structure C = <ParentObjectNamespace><ParentObjectName>Class.C
       *)
      val cStrDec =
        StrDecStruct (
          toList1 [
            (
              "C",
              NONE,
              StructName (toList1 [parentClassStrId, "C"])
            )
          ]
        )
      val strDecs'1 = [cStrDec]

      (*
       *                                                 -.
       *     type ('a, 'b) value_accessor =               | isGObject
       *       ('a, 'b) GObjectValue.accessor             |
       *                                                 -'
       *     val t = <ParentObjectNamespace><ParentObjectName>Class.t
       *     val tOpt = <ParentObjectNamespace><ParentObjectName>Class.tOpt
       *)
      val tValDec = mkIdValDec (tId, mkLIdLNameExp [parentClassStrId, tId])
      val tOptValDec =
        mkIdValDec (tOptId, mkLIdLNameExp [parentClassStrId, tOptId])
      val revAccessorLocalTypes = makeAccessorLocalTypes isGObject
      val strDecs'2 =
        revMapAppend makeLocalTypeStrDec
          (
            revAccessorLocalTypes,
            StrDecDec tValDec :: StrDecDec tOptValDec :: strDecs'1
          )
      val strDecs'3 = StrDecDec toBaseFunDec :: strDecs'2

      (*
       *     type 'a <objectname> = unit
       *                                           -.
       *     type 'a <parentobjectname>class_t =    | isParentNamespace
       *       'a <ParentObjectNamespace><ParentObjectName>Class.t
       *     type 'a t = 'a <objectname> <parentobjectname>class_t
       *                                           -'
       *                                           -.
       *     type 'a t =                            | not isParentNamespace
       *       'a <objectname> <ParentObjectNamespace><ParentObjectName>Class.t
       *                                           -'
       *)
      val parentClassTypeLId =
        toList1 (
          if isParentNamespace
          then [makeLocalInterfaceOtherId parentObjectIRef]
          else [parentClassStrId, tId]
        )
      val tTyStrDec =
        StrDecDec (
          mkTypeDec (
            tTyName aTyVar,
            I (
              TyRef (
                [TyRef ([aVarTy], toList1 [objectNameTypeId])],
                parentClassTypeLId
              )
            )
          )
        )
      val (strDecs'4, revParentClassLocalTypes) =
        if isParentNamespace
        then
          let
            val localType = makeIRefLocalType parentObjectIRef
          in
            (
              makeLocalTypeStrDec localType :: tTyStrDec :: strDecs'3,
              [localType]
            )
          end
        else (tTyStrDec :: strDecs'3, [])
      val strDecs'5 =
        StrDecDec (mkTypeDec (([aTyVar], objectNameTypeId), unitTy))
         :: strDecs'4

      val struct1 = mkStructBody strDecs'5

      (* sig *)
      val sig1 = SigName objectClassSigId
      (*
       *                                                 -.
       *     where                                        |
       *       type 'a <parentobjectname>class_t =        | isParentNamespace
       *         'a <ParentObjectNamespace><ParentObjectName>Class.t
       *                                                 -'
       *                                                 -.
       *     where type ('a, 'b) value_accessor =         | isGObject
       *       ('a, 'b) GObjectValue.accessor             |
       *                                                 -'
       *     where type C.notnull =
       *       <ParentObjectNamespace><ParentObjectName>Class.C.notnull
       *     where type 'a C.p =
       *       'a <ParentObjectNamespace><ParentObjectName>Class.C.p
       *)
      val cNotnullQual =
        toList1 [
          (([], cNotnullLId), TyRef ([], cons1 (parentClassStrId, cNotnullLId)))
        ]
      val cPtrQual =
        toList1 [
          (
            ([aTyVar], cPtrLId),
            TyRef ([aVarTy], cons1 (parentClassStrId, cPtrLId))
          )
        ]

      val sigQual'1 : qual list = [cNotnullQual, cPtrQual]
      val sigQual'2 =
        revMapAppend makeLocalTypeStrModuleQual (revAccessorLocalTypes, sigQual'1)
      val sigQual'3 =
        revMapAppend makeLocalTypeStrModuleQual
          (revParentClassLocalTypes, sigQual'2)
      val qSig : qsig = (sig1, sigQual'3)

      (* strdec *)
      val structDec =
        toList1 [(objectClassStrId, SOME (true, qSig), struct1)]
      val strDec = StrDecStruct structDec

      val program = [ModuleDecStr strDec]

      (* namespace spec *)
      val objectClassSpec =
        let
          (* sig *)
          val sig1 = SigName objectClassSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revAccessorLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrSpecQual
              (revParentClassLocalTypes, sigQual'1)
          val qSig : qsig = (sig1, sigQual'2)
        in
          (* spec *)
          SpecStruct (toList1 [(objectClassStrNameId, qSig)])
        end
      val objectClassSpecs = [objectClassSpec]

      (* namespace strdec *)
      val objectClassStrDec =
        StrDecStruct (
          toList1 [
            (objectClassStrNameId, NONE, StructName (toList1 [objectClassStrId]))
          ]
        )
      val objectClassStrDecs = [objectClassStrDec]
    in
      (
        objectClassStrId,
        (objectClassSpecs, objectClassStrDecs),
        Specific {mlton = program, polyml = program},
        iRefs'1
      )
    end

  fun makeObjectRootClassStr
    (_               : 'a RepositoryClass.t)
    (objectCPrefix   : string)
    (objectNamespace : string)
    (objectInfo      : 'b ObjectInfoClass.t)
    : id * (spec list * strdec list) * program * interfaceref list =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val objectClassStrNameId = mkClassStrNameId objectName

      val isGObject = objectNamespace = "GObject"

      (* module *)
      val revAccessorLocalTypes = makeAccessorLocalTypes isGObject
      val programMLton = []
      val programPolyML = []

      (* namespace spec *)
      val objectClassSpec =
        let
          (* sig *)
          val sig1 = SigName objectClassSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revAccessorLocalTypes
          val qSig : qsig = (sig1, sigQual'1)
        in
          (* spec *)
          SpecStruct (toList1 [(objectClassStrNameId, qSig)])
        end
      val objectClassSpecs = [objectClassSpec]

      (* namespace strdec *)
      val objectClassStrDec =
        StrDecStruct (
          toList1 [
            (objectClassStrNameId, NONE, StructName (toList1 [objectClassStrId]))
          ]
        )
      val objectClassStrDecs = [objectClassStrDec]
    in
      (
        objectClassStrId,
        (objectClassSpecs, objectClassStrDecs),
        Specific {mlton = programMLton, polyml = programPolyML},
        []
      )
    end

  fun makeObjectClassStr
    (repo            : 'a RepositoryClass.t)
    (objectCPrefix   : string)
    (objectNamespace : string)
    (objectInfo      : 'b ObjectInfoClass.t)
    : id * (spec list * strdec list) * program * interfaceref list =
    case ObjectInfo.getParent objectInfo of
      SOME parentObjectInfo =>
        makeObjectDerivedClassStr
          repo
          objectCPrefix
          objectNamespace
          parentObjectInfo
          objectInfo
    | NONE                  =>
        makeObjectRootClassStr
          repo
          objectCPrefix
          objectNamespace
          objectInfo
end


(* Object signature *)

fun addObjectInterfaceConvSpecs repo objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNInterfaces
    ObjectInfo.getInterface
    (makeInterfaceConvSpec repo objectIRef)

fun addObjectConstantSpecs x =
  revFoldMapInfosWithErrs
    ObjectInfo.getNConstants
    ObjectInfo.getConstant
    makeConstantSpec
    x

fun addObjectMethodSpecs repo objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNMethods
    ObjectInfo.getMethod
    (makeFunctionSpec repo (SOME objectIRef))

fun addObjectSignalSpecs repo objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNSignals
    ObjectInfo.getSignal
    (makeSignalSpec repo objectIRef)

fun addObjectPropertySpecs repo objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNProperties
    ObjectInfo.getProperty
    (makePropertySpec repo objectIRef)

fun makeObjectSig
  (repo            : 'a RepositoryClass.t)
  (objectCPrefix   : string)
  (objectNamespace : string)
  (objectInfo      : 'a ObjectInfoClass.t)
  (errs'0          : infoerrorhier list)
  : id * program * infoerrorhier list =
  let
    val () = checkDeprecated objectInfo

    val objectName = getName objectInfo
    val objectIRef = {
      namespace = objectNamespace,
      cPrefix   = objectCPrefix,
      name      = objectName,
      scope     = LOCALINTERFACESELF,
      ty        = CLASS
    }

    val objectStrId = mkStrId objectNamespace objectName
    val objectSigId = toUCU objectStrId

    val typeIRef = makeTypeIRef objectNamespace (SOME objectName)

    val acc'0
      : spec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 = addObjectPropertySpecs repo objectIRef (objectInfo, acc'0)
    val acc'2 = addObjectSignalSpecs repo objectIRef (objectInfo, acc'1)
    val acc'3 = addObjectMethodSpecs repo objectIRef (objectInfo, acc'2)
    val acc'4 = addGetTypeFunctionSpec typeIRef acc'3
    val acc'5 = addObjectConstantSpecs (objectInfo, acc'4)
    val acc'6 = addObjectInterfaceConvSpecs repo objectIRef (objectInfo, acc'5)
    val (specs'6, iRefs'6, errs'6) = acc'6

    val numProps = ObjectInfo.getNProperties objectInfo
    val specs'7 = addPropertySpecs objectNamespace numProps specs'6

    (*
     *     type <varlist[1]> <typename[1]>_t
     *
     *     ...
     *
     *     type <varlist[N]> <typename[N]>_t
     *)
    val specs'8 = revMapAppend makeIRefLocalTypeSpec (iRefs'6, specs'7)

    (*
     *     type 'a class_t
     *)
    val specs'9 = makeIRefLocalTypeSpec objectIRef :: specs'8

    val sig1 = mkSigSpec specs'9
    val qSig : qsig = (sig1, [])
    val sigDec = toList1 [(objectSigId, qSig)]
    val program = [ModuleDecSig sigDec]
  in
    (objectSigId, Portable program, errs'6)
  end


(* Object structure *)

fun addObjectInterfaceConvStrDecs repo rootObjectIRef objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNInterfaces
    ObjectInfo.getInterface
    (makeInterfaceConvStrDec repo rootObjectIRef objectIRef)

fun addObjectConstantStrDecs x =
  revFoldMapInfosWithErrs
    ObjectInfo.getNConstants
    ObjectInfo.getConstant
    makeConstantStrDec
    x

fun addObjectMethodStrDecsLowLevel
  isPolyML
  repo
  libId
  addInitStrDecs
  rootObjectIRef
  objectIRef =
  addFunctionStrDecsLowLevel
    (ObjectInfo.getNMethods, ObjectInfo.getMethod)
    isPolyML
    repo
    libId
    addInitStrDecs
    (SOME (rootObjectIRef, objectIRef))

fun addObjectMethodStrDecsHighLevel repo rootObjectIRef objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNMethods
    ObjectInfo.getMethod
    (makeFunctionStrDecHighLevel repo (SOME (rootObjectIRef, objectIRef)))

fun addObjectSignalStrDecs repo objectIRef =
  fn (objectInfo, (strDecs, iRefs, errs)) =>
    let
      val (localStrDecs, iRefs', errs') =
        revFoldMapInfosWithErrs
          ObjectInfo.getNSignals
          ObjectInfo.getSignal
          (makeSignalStrDec repo objectIRef)
          (objectInfo, ([], iRefs, errs))
    in
      case localStrDecs of
        _ :: _ =>
          let
            val strDec =
              StrDecLocal (
                mkStrDecs [
                  StrDecDec (
                    DecOpen (
                      toList1 [
                        toList1 ["ClosureMarshal"],
                        toList1 ["Signal"]
                      ]
                    )
                  )
                ],
                mkStrDecs localStrDecs
              )
          in
            (strDec :: strDecs, iRefs', errs')
          end
      | _      => (strDecs, iRefs', errs')
    end

fun addObjectPropertyStrDecs repo objectIRef =
  fn (objectInfo, (strDecs, iRefs, errs)) =>
    let
      val (localStrDecs, iRefs', errs') =
        revFoldMapInfosWithErrs
          ObjectInfo.getNProperties
          ObjectInfo.getProperty
          (makePropertyStrDec repo objectIRef)
          (objectInfo, ([], iRefs, errs))
    in
      case localStrDecs of
        _ :: _ =>
          let
            val strDec =
              StrDecLocal (
                mkStrDecs [
                  StrDecDec (
                    DecOpen (
                      toList1 [
                        toList1 ["Property"]
                      ]
                    )
                  )
                ],
                mkStrDecs localStrDecs
              )
          in
            (strDec :: strDecs, iRefs', errs')
          end
      | _      => (strDecs, iRefs', errs')
    end

fun makeObjectStr
  (repo            : 'a RepositoryClass.t)
  (libId           : id)
  (objectCPrefix   : string)
  (objectNamespace : string)
  (objectInfo      : 'a ObjectInfoClass.t)
  (errs'0          : infoerrorhier list)
  : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
  let
    val () = checkDeprecated objectInfo

    val getTypeSymbol = ObjectInfo.getTypeInit objectInfo

    val objectName = getName objectInfo
    val objectIRef = {
      namespace = objectNamespace,
      cPrefix   = objectCPrefix,
      name      = objectName,
      scope     = LOCALINTERFACESELF,
      ty        = CLASS
    }

    val objectStrId = mkStrId objectNamespace objectName
    val objectSigId = toUCU objectStrId

    val objectStrNameId = mkStrNameId objectName

    val typeIRef = makeTypeIRef objectNamespace (SOME objectName)
    val rootObjectIRef =
      getRootObjectIRef repo objectNamespace (SOME objectName)
        (objectInfo, objectIRef)

    val isGObject = objectNamespace = "GObject"

    (* module *)
    val acc'0
      : strdec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 = addObjectPropertyStrDecs repo objectIRef (objectInfo, acc'0)
    val acc'2 = addObjectSignalStrDecs repo objectIRef (objectInfo, acc'1)
    val acc'3 =
      addObjectMethodStrDecsHighLevel
        repo
        rootObjectIRef
        objectIRef
        (objectInfo, acc'2)
    val acc'4 = addGetTypeFunctionStrDecHighLevel typeIRef acc'3
    val acc'5 = addObjectConstantStrDecs (objectInfo, acc'4)
    val acc'6 =
      addObjectInterfaceConvStrDecs
        repo
        rootObjectIRef
        objectIRef
        (objectInfo, acc'5)
    val (strDecs'6, iRefs'6, errs'6) = acc'6

    val numProps = ObjectInfo.getNProperties objectInfo
    val revPropLocalTypes = makePropertyLocalTypes isGObject numProps
    val strDecs'7 =
      revMapAppend makeLocalTypeStrDec (revPropLocalTypes, strDecs'6)

    val strIRefs =
      objectIRef :: iRefs'6  (* `objectIRef` for class structure dependence *)

    val revLocalTypes = revMap makeIRefLocalType strIRefs
    val strDecs'8 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'7)

    fun mkModule isPolyML =
      let
        val (strDecs, _) =
          addObjectMethodStrDecsLowLevel
            isPolyML
            repo
            libId
            (
              addGetTypeFunctionStrDecLowLevel
                repo
                libId
                objectNamespace
                getTypeSymbol
            )
            rootObjectIRef
            objectIRef
            (objectInfo, (strDecs'8, errs'6))

        val struct1 = mkStructBody strDecs

        (* sig *)
        val sig1 = SigName objectSigId
        val sigQual'1 = revMap makeLocalTypeStrModuleQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrModuleQual (revLocalTypes, sigQual'1)
        val qSig : qsig = (sig1, sigQual'2)

        (* strdec *)
        val structDec = toList1 [(objectStrId, SOME (true, qSig), struct1)]
        val strDec = StrDecStruct structDec
      in
        [ModuleDecStr strDec]
      end

    val programMLton = mkModule false
    val programPolyML = mkModule true

    (* namespace spec *)
    val objectSpec =
      let
        (* sig *)
        val sig1 = SigName objectSigId
        val sigQual'1 = revMap makeLocalTypeStrSpecQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrSpecQual (revLocalTypes, sigQual'1)
        val qSig : qsig = (sig1, sigQual'2)
      in
        (* spec *)
        SpecStruct (toList1 [(objectStrNameId, qSig)])
      end

    (* namespace strdec *)
    val objectStrDec =
      StrDecStruct (
        toList1 [
          (objectStrNameId, NONE, StructName (toList1 [objectStrId]))
        ]
      )
  in
    (
      objectStrId,
      ([objectSpec], [objectStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      strIRefs,
      errs'6
    )
  end



(* --------------------------------------------------------------------------
 * Interface
 * -------------------------------------------------------------------------- *)

(* Class signature *)

local
  (*
   *     val toBase : 'a t -> base t
   *)
  val toBaseValSpec = mkValSpec (toBaseId, TyFun (tTy aVarTy, tTy baseTy))

  (*
   *     structure C :
   *       sig
   *         type notnull
   *         type 'a p
   *         val fromPtr : bool -> notnull p -> 'a t
   *         val fromOptPtr : bool -> unit p -> 'a t option
   *       end
   *)
  val structCSpecs = [
    mkTypeSpec (notnullTyName, NONE),
    mkTypeSpec (ptrTyName aTyVar, NONE),
    mkValSpec (
      fromPtrId,
      TyFun (boolTy, TyFun (ptrTy notnullTy, tTy aVarTy))
    ),
    mkValSpec (
      fromOptPtrId,
      TyFun (boolTy, TyFun (ptrTy unitTy, optionTy (tTy aVarTy)))
    )
  ]
  val structCSpec = mkCStructSpec structCSpecs

  val specs'1 = [structCSpec]
in
  fun makeInterfaceClassSig
    (_                  : 'a RepositoryClass.t)
    (interfaceCPrefix   : string)
    (interfaceNamespace : string)
    (interfaceInfo      : 'b InterfaceInfoClass.t)
    : id * program =
    let
      val () = checkDeprecated interfaceInfo

      val interfaceName = getName interfaceInfo
      val interfaceNameTypeId = toLC interfaceName

      val parentObjectIRef =
        makeInterfaceRootIRef interfaceNamespace (SOME interfaceName)

      val interfaceClassStrId = mkClassStrId interfaceNamespace interfaceName
      val interfaceClassSigId = toUCU interfaceClassStrId

      val specs'2 =
        addAccessorSpecs
          interfaceNamespace
          interfaceInfo
          (tTy baseTy, tTy aVarTy)
          true
          specs'1
      val specs'3 = toBaseValSpec :: specs'2

      (*
       *     type 'a <interfacename>
       *                                           -.
       *     type 'a objectclass_t                  | isGObject
       *     type 'a t = 'a <interfacename> objectclass_t
       *                                           -'
       *                                           -.
       *     type 'a t =                            | not isGObject
       *       'a <interfacename> GObject.ObjectClass.t
       *                                           -'
       *)
      val parentClassTypeLId = makeInterfaceRefTyLongId parentObjectIRef
      val tTySpec =
        mkTypeSpec (
          tTyName aTyVar,
          SOME (
            TyRef (
              [TyRef ([aVarTy], toList1 [interfaceNameTypeId])],
              parentClassTypeLId
            )
          )
        )
      (* parentClassTypeLId is (_, [])
       *  <=> parentObjectNamespace = objectNamespace
       *  <=> isParentNamespace *)
      val specs'4 =
        case parentClassTypeLId of
          (id, []) => mkTypeSpec (([aTyVar], id), NONE) :: tTySpec :: specs'3
        | _        => tTySpec :: specs'3
      val specs'5 = mkTypeSpec (([aTyVar], interfaceNameTypeId), NONE) :: specs'4

      val sig1 = mkSigSpec specs'5
      val qSig : qsig = (sig1, [])
      val sigDec = toList1 [(interfaceClassSigId, qSig)]
      val program = [ModuleDecSig sigDec]
    in
      (interfaceClassSigId, Portable program)
    end
end


(* Class structure *)

local
  (*
   *     fun toBase obj = obj
   *)
  val toBaseFunDec =
    DecFun (
      [],
      toList1 [
        toList1 [
          (
            FunHeadPrefix (toBaseId, toList1 [APatId objId]),
            NONE,
            mkIdLNameExp objId
          )
        ]
      ]
    )
in
  fun makeInterfaceClassStr
    (_                  : 'a RepositoryClass.t)
    (interfaceCPrefix   : string)
    (interfaceNamespace : string)
    (interfaceInfo      : 'c InterfaceInfoClass.t)
    : id * (spec list * strdec list) * program * interfaceref list =
    let
      val () = checkDeprecated interfaceInfo

      val interfaceName = getName interfaceInfo
      val interfaceNameTypeId = toLC interfaceName

      val parentObjectIRef as {scope = parentObjectScope, ...} =
        makeInterfaceRootIRef interfaceNamespace (SOME interfaceName)

      (* <ParentObjectNamespace><ParentObjectName>Class *)
      val parentClassStrId = makeInterfaceOtherStrId parentObjectIRef

      val interfaceClassStrId = mkClassStrId interfaceNamespace interfaceName
      val interfaceClassSigId = toUCU interfaceClassStrId

      val interfaceClassStrNameId = mkClassStrNameId interfaceName

      val iRefs'1 =
        case parentObjectScope of
          GLOBAL             => []
     (* | LOCALINTERFACESELF => [] *) (* unreachable *)
        | _                  => [parentObjectIRef]

      val isParentNamespace = parentObjectScope <> GLOBAL
      val isGObject = interfaceNamespace = "GObject"
      val () =
        if isParentNamespace = isGObject
        then ()
        else raise Fail "makeInterfaceClassStr: assertion failed"

      (* module *)
      (*
       *     structure C = <ParentObjectNamespace><ParentObjectName>Class.C
       *)
      val cStrDec =
        StrDecStruct (
          toList1 [
            (
              "C",
              NONE,
              StructName (toList1 [parentClassStrId, "C"])
            )
          ]
        )
      val strDecs'1 = [cStrDec]

      (*
       *                                                 -.
       *     type ('a, 'b) value_accessor =               | isGObject
       *       ('a, 'b) GObjectValue.accessor             |
       *                                                 -'
       *     val t = <ParentObjectNamespace><ParentObjectName>Class.t
       *     val tOpt = <ParentObjectNamespace><ParentObjectName>Class.tOpt
       *)
      val tValDec = mkIdValDec (tId, mkLIdLNameExp [parentClassStrId, tId])
      val tOptValDec =
        mkIdValDec (tOptId, mkLIdLNameExp [parentClassStrId, tOptId])
      val revAccessorLocalTypes = makeAccessorLocalTypes isGObject
      val strDecs'2 =
        revMapAppend makeLocalTypeStrDec
          (
            revAccessorLocalTypes,
            StrDecDec tValDec :: StrDecDec tOptValDec :: strDecs'1
          )
      val strDecs'3 = StrDecDec toBaseFunDec :: strDecs'2

      (*
       *     type 'a <interfacename> = unit
       *                                           -.
       *     type 'a objectclass_t =                | isParentNamespace
       *       'a GObjectObjecClass.t               |
       *     type 'a t = 'a <interfacename> objectclass_t
       *                                           -'
       *                                           -.
       *     type 'a t =                            | not isParentNamespace
       *       'a <interfacename> GObjectObjectClass.t
       *                                           -'
       *)
      val parentClassTypeLId =
        toList1 (
          if isParentNamespace
          then [makeLocalInterfaceOtherId parentObjectIRef]
          else [parentClassStrId, tId]
        )
      val tTyStrDec =
        StrDecDec (
          mkTypeDec (
            tTyName aTyVar,
            I (
              TyRef (
                [TyRef ([aVarTy], toList1 [interfaceNameTypeId])],
                parentClassTypeLId
              )
            )
          )
        )
      val (strDecs'4, revParentClassLocalTypes) =
        if isParentNamespace
        then
          let
            val localType = makeIRefLocalType parentObjectIRef
          in
            (
              makeLocalTypeStrDec localType :: tTyStrDec :: strDecs'3,
              [localType]
            )
          end
        else (tTyStrDec :: strDecs'3, [])
      val strDecs'5 =
        StrDecDec (mkTypeDec (([aTyVar], interfaceNameTypeId), unitTy))
         :: strDecs'4

      val struct1 = mkStructBody strDecs'5

      (* sig *)
      val sig1 = SigName interfaceClassSigId
      (*
       *                                                 -.
       *     where                                        |
       *       type 'a objectclass_t =                    | isParentNamespace
       *         'a GObjectObjectClass.t                  |
       *                                                 -'
       *                                                 -.
       *     where type ('a, 'b) value_accessor =         | isGObject
       *       ('a, 'b) GObjectValue.accessor             |
       *                                                 -'
       *     where type C.notnull =
       *       <ParentObjectNamespace><ParentObjectName>Class.C.notnull
       *     where type 'a C.p =
       *       'a <ParentObjectNamespace><ParentObjectName>Class.C.p
       *)
      val cNotnullQual =
        toList1 [
          (([], cNotnullLId), TyRef ([], cons1 (parentClassStrId, cNotnullLId)))
        ]
      val cPtrQual =
        toList1 [
          (
            ([aTyVar], cPtrLId),
            TyRef ([aVarTy], cons1 (parentClassStrId, cPtrLId))
          )
        ]

      val sigQual'1 : qual list = [cNotnullQual, cPtrQual]
      val sigQual'2 =
        revMapAppend makeLocalTypeStrModuleQual (revAccessorLocalTypes, sigQual'1)
      val sigQual'3 =
        revMapAppend makeLocalTypeStrModuleQual
          (revParentClassLocalTypes, sigQual'2)
      val qSig : qsig = (sig1, sigQual'3)

      (* strdec *)
      val structDec =
        toList1 [(interfaceClassStrId, SOME (true, qSig), struct1)]
      val strDec = StrDecStruct structDec

      val program = [ModuleDecStr strDec]

      (* namespace spec *)
      val interfaceClassSpec =
        let
          (* sig *)
          val sig1 = SigName interfaceClassSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revAccessorLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrSpecQual
              (revParentClassLocalTypes, sigQual'1)
          val qSig : qsig = (sig1, sigQual'2)
        in
          (* spec *)
          SpecStruct (toList1 [(interfaceClassStrNameId, qSig)])
        end
      val interfaceClassSpecs = [interfaceClassSpec]

      (* namespace strdec *)
      val interfaceClassStrDec =
        StrDecStruct (
          toList1 [
            (
              interfaceClassStrNameId,
              NONE,
              StructName (toList1 [interfaceClassStrId])
            )
          ]
        )
      val interfaceClassStrDecs = [interfaceClassStrDec]
    in
      (
        interfaceClassStrId,
        (interfaceClassSpecs, interfaceClassStrDecs),
        Specific {mlton = program, polyml = program},
        iRefs'1
      )
    end
end


(* Interface signature *)

fun addInterfaceConstantSpecs x =
  revFoldMapInfosWithErrs
    InterfaceInfo.getNConstants
    InterfaceInfo.getConstant
    makeConstantSpec
    x

fun addInterfaceMethodSpecs repo interfaceIRef =
  revFoldMapInfosWithErrs
    InterfaceInfo.getNMethods
    InterfaceInfo.getMethod
    (makeFunctionSpec repo (SOME interfaceIRef))

fun addInterfaceSignalSpecs repo interfaceIRef =
  revFoldMapInfosWithErrs
    InterfaceInfo.getNSignals
    InterfaceInfo.getSignal
    (makeSignalSpec repo interfaceIRef)

fun addInterfacePropertySpecs repo interfaceIRef =
  revFoldMapInfosWithErrs
    InterfaceInfo.getNProperties
    InterfaceInfo.getProperty
    (makePropertySpec repo interfaceIRef)

fun makeInterfaceSig
  (repo               : 'a RepositoryClass.t)
  (interfaceCPrefix   : string)
  (interfaceNamespace : string)
  (interfaceInfo      : 'a InterfaceInfoClass.t)
  (errs'0             : infoerrorhier list)
  : id * program * infoerrorhier list =
  let
    val () = checkDeprecated interfaceInfo

    val interfaceName = getName interfaceInfo
    val interfaceIRef = {
      namespace = interfaceNamespace,
      cPrefix   = interfaceCPrefix,
      name      = interfaceName,
      scope     = LOCALINTERFACESELF,
      ty        = CLASS
    }

    val interfaceStrId = mkStrId interfaceNamespace interfaceName
    val interfaceSigId = toUCU interfaceStrId

    val typeIRef = makeTypeIRef interfaceNamespace (SOME interfaceName)

    val acc'0
      : spec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 =
      addInterfacePropertySpecs repo interfaceIRef (interfaceInfo, acc'0)
    val acc'2 =
      addInterfaceSignalSpecs repo interfaceIRef (interfaceInfo, acc'1)
    val acc'3 =
      addInterfaceMethodSpecs repo interfaceIRef (interfaceInfo, acc'2)
    val acc'4 = addGetTypeFunctionSpec typeIRef acc'3
    val acc'5 = addInterfaceConstantSpecs (interfaceInfo, acc'4)
    val acc'6 = acc'5
    val (specs'6, iRefs'6, errs'6) = acc'6

    val numProps = InterfaceInfo.getNProperties interfaceInfo
    val specs'7 = addPropertySpecs interfaceNamespace numProps specs'6

    (*
     *     type <varlist[1]> <typename[1]>_t
     *
     *     ...
     *
     *     type <varlist[N]> <typename[N]>_t
     *)
    val specs'8 = revMapAppend makeIRefLocalTypeSpec (iRefs'6, specs'7)

    (*
     *     type 'a class_t
     *)
    val specs'9 = makeIRefLocalTypeSpec interfaceIRef :: specs'8

    val sig1 = mkSigSpec specs'9
    val qSig : qsig = (sig1, [])
    val sigDec = toList1 [(interfaceSigId, qSig)]
    val program = [ModuleDecSig sigDec]
  in
    (interfaceSigId, Portable program, errs'6)
  end


(* Interface structure *)

fun addInterfaceConstantStrDecs x =
  revFoldMapInfosWithErrs
    InterfaceInfo.getNConstants
    InterfaceInfo.getConstant
    makeConstantStrDec
    x

fun addInterfaceMethodStrDecsLowLevel
  isPolyML
  repo
  libId
  addInitStrDecs
  interfaceRootIRef
  interfaceIRef =
  addFunctionStrDecsLowLevel
    (InterfaceInfo.getNMethods, InterfaceInfo.getMethod)
    isPolyML
    repo
    libId
    addInitStrDecs
    (SOME (interfaceRootIRef, interfaceIRef))

fun addInterfaceMethodStrDecsHighLevel repo interfaceRootIRef interfaceIRef =
  revFoldMapInfosWithErrs
    InterfaceInfo.getNMethods
    InterfaceInfo.getMethod
    (makeFunctionStrDecHighLevel repo (SOME (interfaceRootIRef, interfaceIRef)))

fun addInterfaceSignalStrDecs repo interfaceIRef =
  fn (interfaceInfo, (strDecs, iRefs, errs)) =>
    let
      val (localStrDecs, iRefs', errs') =
        revFoldMapInfosWithErrs
          InterfaceInfo.getNSignals
          InterfaceInfo.getSignal
          (makeSignalStrDec repo interfaceIRef)
          (interfaceInfo, ([], iRefs, errs))
    in
      case localStrDecs of
        _ :: _ =>
          let
            val strDec =
              StrDecLocal (
                mkStrDecs [
                  StrDecDec (
                    DecOpen (
                      toList1 [
                        toList1 ["ClosureMarshal"],
                        toList1 ["Signal"]
                      ]
                    )
                  )
                ],
                mkStrDecs localStrDecs
              )
          in
            (strDec :: strDecs, iRefs', errs')
          end
      | _      => (strDecs, iRefs', errs')
    end

fun addInterfacePropertyStrDecs repo interfaceIRef =
  fn (interfaceInfo, (strDecs, iRefs, errs)) =>
    let
      val (localStrDecs, iRefs', errs') =
        revFoldMapInfosWithErrs
          InterfaceInfo.getNProperties
          InterfaceInfo.getProperty
          (makePropertyStrDec repo interfaceIRef)
          (interfaceInfo, ([], iRefs, errs))
    in
      case localStrDecs of
        _ :: _ =>
          let
            val strDec =
              StrDecLocal (
                mkStrDecs [
                  StrDecDec (
                    DecOpen (
                      toList1 [
                        toList1 ["Property"]
                      ]
                    )
                  )
                ],
                mkStrDecs localStrDecs
              )
          in
            (strDec :: strDecs, iRefs', errs')
          end
      | _      => (strDecs, iRefs', errs')
    end

fun makeInterfaceStr
  (repo               : 'a RepositoryClass.t)
  (libId              : id)
  (interfaceCPrefix   : string)
  (interfaceNamespace : string)
  (interfaceInfo      : 'a InterfaceInfoClass.t)
  (errs'0             : infoerrorhier list)
  : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
  let
    val () = checkDeprecated interfaceInfo

    val getTypeSymbol =
      case RegisteredTypeInfo.getTypeInit interfaceInfo of
        SOME getTypeSymbol => getTypeSymbol
      | NONE               => raise Fail "no GType for interface"

    val interfaceName = getName interfaceInfo
    val interfaceIRef = {
      namespace = interfaceNamespace,
      cPrefix   = interfaceCPrefix,
      name      = interfaceName,
      scope     = LOCALINTERFACESELF,
      ty        = CLASS
    }

    val interfaceStrId = mkStrId interfaceNamespace interfaceName
    val interfaceSigId = toUCU interfaceStrId

    val interfaceStrNameId = mkStrNameId interfaceName

    val typeIRef = makeTypeIRef interfaceNamespace (SOME interfaceName)
    val interfaceRootIRef =
      makeInterfaceRootIRef interfaceNamespace (SOME interfaceName)

    val isGObject = interfaceNamespace = "GObject"

    (* module *)
    val acc'0
      : strdec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 =
      addInterfacePropertyStrDecs repo interfaceIRef (interfaceInfo, acc'0)
    val acc'2 =
      addInterfaceSignalStrDecs repo interfaceIRef (interfaceInfo, acc'1)
    val acc'3 =
      addInterfaceMethodStrDecsHighLevel
        repo
        interfaceRootIRef
        interfaceIRef
        (interfaceInfo, acc'2)
    val acc'4 = addGetTypeFunctionStrDecHighLevel typeIRef acc'3
    val acc'5 = addInterfaceConstantStrDecs (interfaceInfo, acc'4)
    val acc'6 = acc'5
    val (strDecs'6, iRefs'6, errs'6) = acc'6

    val numProps = InterfaceInfo.getNProperties interfaceInfo
    val revPropLocalTypes = makePropertyLocalTypes isGObject numProps
    val strDecs'7 =
      revMapAppend makeLocalTypeStrDec (revPropLocalTypes, strDecs'6)

    val strIRefs =
      interfaceIRef :: iRefs'6
      (* `interfaceIRef` for class structure dependence *)

    val revLocalTypes = revMap makeIRefLocalType strIRefs
    val strDecs'8 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'7)

    fun mkModule isPolyML =
      let
        val (strDecs, _) =
          addInterfaceMethodStrDecsLowLevel
            isPolyML
            repo
            libId
            (
              addGetTypeFunctionStrDecLowLevel
                repo
                libId
                interfaceNamespace
                getTypeSymbol
            )
            interfaceRootIRef
            interfaceIRef
            (interfaceInfo, (strDecs'8, errs'6))

        val struct1 = mkStructBody strDecs

        (* sig *)
        val sig1 = SigName interfaceSigId
        val sigQual'1 = revMap makeLocalTypeStrModuleQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrModuleQual (revLocalTypes, sigQual'1)
        val qSig : qsig = (sig1, sigQual'2)

        (* strdec *)
        val structDec = toList1 [(interfaceStrId, SOME (true, qSig), struct1)]
        val strDec = StrDecStruct structDec
      in
        [ModuleDecStr strDec]
      end

    val programMLton = mkModule false
    val programPolyML = mkModule true

    (* namespace spec *)
    val interfaceSpec =
      let
        (* sig *)
        val sig1 = SigName interfaceSigId
        val sigQual'1 = revMap makeLocalTypeStrSpecQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrSpecQual (revLocalTypes, sigQual'1)
        val qSig : qsig = (sig1, sigQual'2)
      in
        (* spec *)
        SpecStruct (toList1 [(interfaceStrNameId, qSig)])
      end

    (* namespace strdec *)
    val interfaceStrDec =
      StrDecStruct (
        toList1 [
          (interfaceStrNameId, NONE, StructName (toList1 [interfaceStrId]))
        ]
      )
  in
    (
      interfaceStrId,
      ([interfaceSpec], [interfaceStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      strIRefs,
      errs'6
    )
  end



(* --------------------------------------------------------------------------
 * Struct - record modules stubbed with empty file for now
 * -------------------------------------------------------------------------- *)

(* Record signature *)

local
in
  fun makeStructRecordSig
    (_               : 'a RepositoryClass.t)
    (structCPrefix   : string)
    (structNamespace : string)
    (structInfo      : 'b StructInfoClass.t)
    : id * program =
    let
      val () = checkDeprecated structInfo

      val structName = getName structInfo

      val structRecordStrId = mkRecordStrId structNamespace structName
      val structRecordSigId = toUCU structRecordStrId

      val program = []
    in
      (structRecordSigId, Portable program)
    end
end


(* Record structure *)

local
in
  fun makeStructRecordStr
    (_               : 'a RepositoryClass.t)
    (structCPrefix   : string)
    (structNamespace : string)
    (structInfo      : 'b StructInfoClass.t)
    : id * (spec list * strdec list) * program * interfaceref list =
    let
      val () = checkDeprecated structInfo

      val structName = getName structInfo

      val structRecordStrId = mkRecordStrId structNamespace structName
      val structRecordSigId = toUCU structRecordStrId

      val structRecordStrNameId = mkRecordStrNameId structName

      val isGObject = structNamespace = "GObject"

      (* module *)
      val revAccessorLocalTypes = makeAccessorLocalTypes isGObject
      val programMLton = []
      val programPolyML = []

      (* namespace spec *)
      val structRecordSpec =
        let
          (* sig *)
          val sig1 = SigName structRecordSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revAccessorLocalTypes
          val qSig : qsig = (sig1, sigQual'1)
        in
          (* spec *)
          SpecStruct (toList1 [(structRecordStrNameId, qSig)])
        end
      val structRecordSpecs = [structRecordSpec]

      (* namespace strdec *)
      val structRecordStrDec =
        StrDecStruct (
          toList1 [
            (
              structRecordStrNameId,
              NONE,
              StructName (toList1 [structRecordStrId])
            )
          ]
        )
      val structRecordStrDecs = [structRecordStrDec]
    in
      (
        structRecordStrId,
        (structRecordSpecs, structRecordStrDecs),
        Specific {mlton = programMLton, polyml = programPolyML},
        []
      )
    end
end


(* Struct signature *)

fun addStructMethodSpecs repo structIRef =
  revFoldMapInfosWithErrs
    StructInfo.getNMethods
    StructInfo.getMethod
    (makeFunctionSpec repo (SOME structIRef))

fun makeStructSig
  (repo            : 'a RepositoryClass.t)
  (structCPrefix   : string)
  (structNamespace : string)
  (structInfo      : 'a StructInfoClass.t)
  (errs'0          : infoerrorhier list)
  : id * program * infoerrorhier list =
  let
    val () = checkDeprecated structInfo

    val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit structInfo

    val structName = getName structInfo
    val structIRef = {
      namespace = structNamespace,
      cPrefix   = structCPrefix,
      name      = structName,
      scope     = LOCALINTERFACESELF,
      ty        = RECORD
    }

    val structStrId = mkStrId structNamespace structName
    val structSigId = toUCU structStrId

    val typeIRef = makeTypeIRef structNamespace (SOME structName)

    val acc'0
      : spec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 = addStructMethodSpecs repo structIRef (structInfo, acc'0)
    val acc'2 =
      case optGetTypeSymbol of
        SOME _ => addGetTypeFunctionSpec typeIRef acc'1
      | NONE   => acc'1

    val (specs'2, iRefs'2, errs'2) = acc'2
    val specs'3 = revMapAppend makeIRefLocalTypeSpec (iRefs'2, specs'2)
    val specs'4 = makeIRefLocalTypeSpec structIRef :: specs'3

    val sig1 = mkSigSpec specs'4
    val qSig : qsig = (sig1, [])
    val sigDec = toList1 [(structSigId, qSig)]
    val program = [ModuleDecSig sigDec]
  in
    (structSigId, Portable program, errs'2)
  end


(* Struct structure *)

fun addStructMethodStrDecsLowLevel
  isPolyML
  repo
  libId
  addInitStrDecs
  structIRef =
  addFunctionStrDecsLowLevel
    (StructInfo.getNMethods, StructInfo.getMethod)
    isPolyML
    repo
    libId
    addInitStrDecs
    (SOME (structIRef, structIRef))

fun addStructMethodStrDecsHighLevel repo structIRef =
  revFoldMapInfosWithErrs
    StructInfo.getNMethods
    StructInfo.getMethod
    (makeFunctionStrDecHighLevel repo (SOME (structIRef, structIRef)))

fun makeStructStr
  (repo            : 'a RepositoryClass.t)
  (libId           : id)
  (structCPrefix   : string)
  (structNamespace : string)
  (structInfo      : 'a StructInfoClass.t)
  (errs'0          : infoerrorhier list)
  : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
  let
    val () = checkDeprecated structInfo

    val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit structInfo

    val structName = getName structInfo
    val structIRef = {
      namespace = structNamespace,
      cPrefix   = structCPrefix,
      name      = structName,
      scope     = LOCALINTERFACESELF,
      ty        = RECORD
    }

    val structStrId = mkStrId structNamespace structName
    val structSigId = toUCU structStrId

    val structStrNameId = mkStrNameId structName

    val typeIRef = makeTypeIRef structNamespace (SOME structName)

    val addStructGetTypeFunctionStrDecLowLevel =
      case optGetTypeSymbol of
        SOME getTypeSymbol =>
          addGetTypeFunctionStrDecLowLevel
            repo
            libId
            structNamespace
            getTypeSymbol 
      | NONE               => K I

    (* module *)
    val acc'0
      : strdec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 =
      addStructMethodStrDecsHighLevel repo structIRef (structInfo, acc'0)
    val acc'2 =
      case optGetTypeSymbol of
        SOME _ => addGetTypeFunctionStrDecHighLevel typeIRef acc'1
      | NONE   => acc'1
    val (strDecs'2, iRefs'2, errs'2) = acc'2

    val strIRefs =
      structIRef :: iRefs'2  (* `structIRef` for record structure dependence *)

    val revLocalTypes = revMap makeIRefLocalType strIRefs
    val strDecs'3 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'2)

    fun mkModule isPolyML =
      let
        val (strDecs, _) =
          addStructMethodStrDecsLowLevel
            isPolyML
            repo
            libId
            addStructGetTypeFunctionStrDecLowLevel
            structIRef
            (structInfo, (strDecs'3, errs'2))

        val struct1 = mkStructBody strDecs

        (* sig *)
        val sig1 = SigName structSigId
        val sigQual = revMap makeLocalTypeStrModuleQual revLocalTypes
        val qSig : qsig = (sig1, sigQual)

        (* strdec *)
        val structDec = toList1 [(structStrId, SOME (true, qSig), struct1)]
        val strDec = StrDecStruct structDec
      in
        [ModuleDecStr strDec]
      end

    val programMLton = mkModule false
    val programPolyML = mkModule true

    (* namespace spec *)
    val structSpec =
      let
        (* sig *)
        val sig1 = SigName structSigId
        val sigQual = revMap makeLocalTypeStrSpecQual revLocalTypes
        val qSig : qsig = (sig1, sigQual)
      in
        (* spec *)
        SpecStruct (toList1 [(structStrNameId, qSig)])
      end

    (* namespace strdec *)
    val structStrDec =
      StrDecStruct (
        toList1 [
          (structStrNameId, NONE, StructName (toList1 [structStrId]))
        ]
      )
  in
    (
      structStrId,
      ([structSpec], [structStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      strIRefs,
      errs'2
    )
  end



(* --------------------------------------------------------------------------
 * Union - stubbed with empty file for now
 * -------------------------------------------------------------------------- *)

(* Union signature *)

fun makeUnionSig
  (_              : 'a RepositoryClass.t)
  (unionCPrefix   : string)
  (unionNamespace : string)
  (unionInfo      : 'a UnionInfoClass.t)
  (errs'0         : infoerrorhier list)
  : id * program * infoerrorhier list =
  let
    val () = checkDeprecated unionInfo

    val unionName = getName unionInfo
(*
    val unionIRef = {
      namespace = unionNamespace,
      cPrefix   = unionCPrefix,
      name      = unionName,
      scope     = LOCALINTERFACESELF,
      ty        = UNION
    }
 *)

    val unionStrId = mkStrId unionNamespace unionName
    val unionSigId = toUCU unionStrId

    (* module *)
    val program = []
  in
    (unionSigId, Portable program, errs'0)
  end


(* Union structure *)

fun makeUnionStr
  (_              : 'a RepositoryClass.t)
  (unionCPrefix   : string)
  (unionNamespace : string)
  (unionInfo      : 'a UnionInfoClass.t)
  (errs'0         : infoerrorhier list)
  : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
  let
    val () = checkDeprecated unionInfo

    val unionName = getName unionInfo
(*
    val unionIRef = {
      namespace = unionNamespace,
      cPrefix   = unionCPrefix,
      name      = unionName,
      scope     = LOCALINTERFACESELF,
      ty        = UNION
    }
 *)

    val unionStrId = mkStrId unionNamespace unionName
    val unionSigId = toUCU unionStrId

    val unionStrNameId = mkStrNameId unionName

    (* module *)
    val revLocalTypes = []
    val programMLton = []
    val programPolyML = []

    (* namespace spec *)
    val unionSpec =
      let
        (* sig *)
        val sig1 = SigName unionSigId
        val sigQual = revMap makeLocalTypeStrSpecQual revLocalTypes
        val qSig : qsig = (sig1, sigQual)
      in
        (* spec *)
        SpecStruct (toList1 [(unionStrNameId, qSig)])
      end

    (* namespace strdec *)
    val unionStrDec =
      StrDecStruct (
        toList1 [
          (unionStrNameId, NONE, StructName (toList1 [unionStrId]))
        ]
      )
  in
    (
      unionStrId,
      ([unionSpec], [unionStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      [],
      errs'0
    )
  end



(* --------------------------------------------------------------------------
 * Flags/Enum common functions
 * -------------------------------------------------------------------------- *)

val tTy : ty = mkIdTy tId
val tTyName : tyname = ([], tId)

fun getValueWordConst valueInfo =
  let
    val w = ValueInfo.getValueWord valueInfo
  in
    ConstWord (IntInf.fromLarge w, NONE)
  end

fun getValueIntConst valueInfo =
  let
    val n = ValueInfo.getValueInt valueInfo
  in
    ConstInt (IntInf.fromLarge n, NONE)
  end

fun getValueNameId valueInfo = toUC (getName valueInfo)

(*
 *     [
 *       <VALUENAME[1]>,
 *       ...,
 *       <VALUENAME[V]>
 *     ]
 *)
fun makeFlagsEnumValueNameListExp enumInfo =
  let
    fun makeExp valueInfo = mkIdLNameExp (getValueNameId valueInfo)
  in
    ExpList (
      revMapInfos
        EnumInfo.getNValues
        EnumInfo.getValue
        makeExp
        (enumInfo, [])
    )
  end

fun addFlagsEnumMethodSpecs repo enumIRef =
  revFoldMapInfosWithErrs
    EnumInfo.getNMethods
    EnumInfo.getMethod
    (makeFunctionSpec repo (SOME enumIRef))

fun addFlagsEnumMethodStrDecsLowLevel
  isPolyML
  repo
  libId
  addInitStrDecs
  enumIRef =
  addFunctionStrDecsLowLevel
    (EnumInfo.getNMethods, EnumInfo.getMethod)
    isPolyML
    repo
    libId
    addInitStrDecs
    (SOME (enumIRef, enumIRef))

fun addFlagsEnumMethodStrDecsHighLevel repo enumIRef =
  revFoldMapInfosWithErrs
    EnumInfo.getNMethods
    EnumInfo.getMethod
    (makeFunctionStrDecHighLevel repo (SOME (enumIRef, enumIRef)))

(*
 *     structure PolyML :                          -.
 *       sig                                        |
 *         val VAL : C.val_ CInterface.Conversion   | Poly/ML only
 *         val REF : C.ref_ CInterface.Conversion   |
 *       end                                       -'
 *)
val structPolyMLSpec =
  mkPolyMLStructSpec [
    SpecVal (toList1 [(VALId, mkCInterfaceConvTy cValTy)]),
    SpecVal (toList1 [(REFId, mkCInterfaceConvTy cRefTy)])
  ]



(* --------------------------------------------------------------------------
 * Flags
 * -------------------------------------------------------------------------- *)

val FlagsId = "Flags"
val allFlagsId = "allFlags"
val allFlagsExp = mkIdLNameExp allFlagsId

(*
 *     val <VALUENAME[i]> : t
 *)
fun makeFlagsValueNameSpec (valueInfo : 'a ValueInfoClass.t) : spec =
  mkValSpec (getValueNameId valueInfo, tTy)

(*
 *     val <VALUENAME[i]> = <valueValue[i]>
 *)
fun makeFlagsValueNameDec (valueInfo : 'a ValueInfoClass.t) : dec =
  mkIdValDec (
    getValueNameId valueInfo,
    ExpConst (getValueWordConst valueInfo)
  )

(*
 *     val <VALUENAME[1]> : t
 *     ...
 *     val <VALUENAME[V]> : t
 *     <specs>
 *)
fun addFlagsValueSpecs (enumInfo, specs) : spec list =
  revMapInfos
    EnumInfo.getNValues
    EnumInfo.getValue
    makeFlagsValueNameSpec
    (enumInfo, specs)

(*
 *     val <VALUENAME[1]> = <valueValue[1]>
 *     ...
 *     val <VALUENAME[V]> = <valueValue[V]>
 *     val allFlags = [
 *       <VALUENAME[1]>,
 *       ...,
 *       <VALUENAME[V]>
 *     ]
 *     <strDecs>
 *)
fun addFlagsValueStrDecs (enumInfo, strDecs) : strdec list =
  let
    val allFlagsStrDec =
      StrDecDec (
        mkIdValDec (allFlagsId, makeFlagsEnumValueNameListExp enumInfo)
      )
  in
    revMapInfos
      EnumInfo.getNValues
      EnumInfo.getValue
      (StrDecDec o makeFlagsValueNameDec)
      (enumInfo, allFlagsStrDec :: strDecs)
  end


(* Signature *)

local
  val flagsTyLName : tylname = ([], toList1 [flagsId])

  (*
   *     include BIT_FLAGS where type flags = t
   *)
  val tTypeSpec = SpecType (true, toList1 [(tTyName, NONE)])

  (*
   *     include BIT_FLAGS where type flags = t
   *)
  val bitFlagsInclSpec =
    SpecIncl (
      SigName (toUCU bitFlagsName),
      [toList1 [(flagsTyLName, tTy)]]
    )

  (*
   *     structure C :
   *       sig
   *         type val_
   *         type ref_
   *         val withVal : (val_ -> 'a) -> t -> 'a
   *         val withRefVal : (ref_ -> 'a) -> t -> (val_, 'a) pair
   *         val fromVal : val_ -> t
   *       endz
   *)
  val structCSpecs = [
    mkTypeSpec (valTyName, NONE),
    mkTypeSpec (refTyName, NONE),
    mkValSpec (
      withValId,
      TyFun (TyParen (TyFun (valTy, aVarTy)), TyFun (tTy, aVarTy))
    ),
    mkValSpec (
      withRefValId,
      TyFun (
        TyParen (TyFun (refTy, aVarTy)),
        TyFun (tTy, pairTy (valTy, aVarTy))
      )
    ),
    mkValSpec (fromValId, TyFun (valTy, tTy))
  ]
  val structCSpec = mkCStructSpec structCSpecs

  val specs'0 = [structCSpec]
in
  fun makeFlagsSig
    (repo        : 'a RepositoryClass.t)
    (enumCPrefix : string)
    (enumNamespace : string)
    (enumInfo    : 'a EnumInfoClass.t)
    (errs'0      : infoerrorhier list)
    : id * program * infoerrorhier list =
    let
      val () = checkDeprecated enumInfo

      val enumName = getName enumInfo
      val enumIRef = {
        namespace = enumNamespace,
        cPrefix   = enumCPrefix,
        name      = enumName,
        scope     = LOCALINTERFACESELF,
        ty        = SIMPLE
      }

      val enumStrId = mkStrId enumNamespace enumName
      val enumSigId = toUCU enumStrId

      val typeIRef = makeTypeIRef enumNamespace (SOME enumName)
      val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit enumInfo

      val acc'0 = (specs'0, [], errs'0)
      val acc'1 = addFlagsEnumMethodSpecs repo enumIRef (enumInfo, acc'0)
      val acc'2 =
        case optGetTypeSymbol of
          SOME _ => addGetTypeFunctionSpec typeIRef acc'1
        | NONE   => acc'1

      val (specs'2, iRefs'2, errs'2) = acc'2
      val specs'3 = revMapAppend makeIRefLocalTypeSpec (iRefs'2, specs'2)
      val specs'4 =
        addAccessorSpecs enumNamespace enumInfo (tTy, tTy) false specs'3
      val specs'5 = addFlagsValueSpecs (enumInfo, specs'4)
      val specs'6 = tTypeSpec :: bitFlagsInclSpec :: specs'5

      val sig1 = mkSigSpec specs'6
      val qSig : qsig = (sig1, [])
      val sigDec = toList1 [(enumSigId, qSig)]
      val program = [ModuleDecSig sigDec]
    in
      (enumSigId, Portable program, errs'2)
    end
end


(* Structure *)

local
  val wId = "w"
  val bitFlagsIdUCC = toUCC bitFlagsName

  (*
   *     structure BitFlags = Word32BitFlags (val allFlags = allFlags)
   *)
  val structBitFlagsStrDec =
    StrDecStruct (
      toList1 [
        (
          bitFlagsIdUCC,
          NONE,
          StructInst (
            "Word32BitFlags",
            mkFunArgStrDec [
              StrDecDec (mkIdValDec (allFlagsId, allFlagsExp))
            ]
          )
        )
      ]
    )

  (*
   *     open BitFlags
   *)
  val openBitFlagsStrDec =
    StrDecDec (DecOpen (toList1 [toList1 [bitFlagsIdUCC]]))

  (*
   *     type t = flags
   *)
  val tTypeStrDec = StrDecDec (DecType (toList1 [(tTyName, flagsTy)]))

  (*
   *     structure PolyML =                          -.
   *       struct                                     |
   *         val VAL = FFI.PolyML.Flags.VAL           | Poly/ML only
   *         val REF = FFI.PolyML.Flags.REF           |
   *       end                                       -'
   *)
  val structPolyMLStrDec =
    mkPolyMLStructStrDec [
      StrDecDec (
        mkIdValDec (
          VALId,
          mkLIdLNameExp [FFIId, PolyMLId, FlagsId, VALId]
        )
      ),
      StrDecDec (
        mkIdValDec (
          REFId,
          mkLIdLNameExp [FFIId, PolyMLId, FlagsId, REFId]
        )
      )
    ]

  (*
   *     structure C =
   *       struct
   *         type val_ = FFI.Flags.val_
   *         type ref_ = FFI.Flags.ref_
   *         fun withVal f = f
   *         fun withRefVal f = withVal (FFI.Flags.withRef f)
   *         fun fromVal w = w
   *       end
   *)
  val structCStrDec =
    mkCStructStrDec [
      StrDecDec (mkTypeDec (valTyName, mkLIdTy [FFIId, FlagsId, valId])),
      StrDecDec (mkTypeDec (refTyName, mkLIdTy [FFIId, FlagsId, refId])),
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (withValId, toList1 [APatId fId]),
                NONE,
                mkIdLNameExp fId
              )
            ]
          ]
        )
      ),
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (withRefValId, toList1 [APatId fId]),
                NONE,
                ExpApp (
                  mkIdLNameExp withValId,
                  mkParenExp (
                    ExpApp (
                      mkLIdLNameExp [FFIId, FlagsId, "withRef"],
                      mkIdLNameExp fId
                    )
                  )
                )
              )
            ]
          ]
        )
      ),
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (fromValId, toList1 [APatId wId]),
                NONE,
                mkIdLNameExp wId
              )
            ]
          ]
        )
      )
    ]
in
  fun makeFlagsStr
    (repo          : 'a RepositoryClass.t)
    (libId         : id)
    (enumCPrefix   : string)
    (enumNamespace : string)
    (enumInfo      : 'a EnumInfoClass.t)
    (errs'0        : infoerrorhier list)
    : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
    let
      val () = checkDeprecated enumInfo

      val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit enumInfo

      val enumName = getName enumInfo
      val enumIRef = {
        namespace = enumNamespace,
        cPrefix   = enumCPrefix,
        name      = enumName,
        scope     = LOCALINTERFACESELF,
        ty        = SIMPLE
      }

      val enumStrId = mkStrId enumNamespace enumName
      val enumSigId = toUCU enumStrId

      val enumStrNameId = mkStrNameId enumName

      val typeIRef = makeTypeIRef enumNamespace (SOME enumName)

      (* module *)
      val acc'0
        : strdec list
           * interfaceref list
           * infoerrorhier list =
        ([], [], errs'0)
      val acc'1 =
        addFlagsEnumMethodStrDecsHighLevel repo enumIRef (enumInfo, acc'0)
      val acc'2 =
        case optGetTypeSymbol of
          SOME _ => addGetTypeFunctionStrDecHighLevel typeIRef acc'1
        | NONE   => acc'1
      val (strDecs'2, iRefs'2, errs'2) = acc'2

      val revLocalTypes = revMap makeIRefLocalType iRefs'2
      val strDecs'3 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'2)

      val (addAccessorStrDecs, revAccessorLocalTypes) =
        addAccessorRootStrDecs repo libId enumNamespace enumInfo

      fun mkModule isPolyML =
        let
          val (strDecs'4, _) =
            addFlagsEnumMethodStrDecsLowLevel
              isPolyML
              repo
              libId
              (K I)
              enumIRef
              (enumInfo, (strDecs'3, errs'2))

          val strDecs'5 = addAccessorStrDecs ("flags", false) isPolyML strDecs'4

          val strDecs'6 =
            if isPolyML
            then structPolyMLStrDec :: strDecs'5
            else strDecs'5
          val strDecs'7 = structCStrDec :: strDecs'6
          val strDecs'8 =
            [structBitFlagsStrDec, openBitFlagsStrDec, tTypeStrDec]
             @ strDecs'7
          val strDecs'9 = addFlagsValueStrDecs (enumInfo, strDecs'8)
          val struct1 = mkStructBody strDecs'9

          (* sig *)
          val sig1 = SigName enumSigId
          val sigQual'1 = revMap makeLocalTypeStrModuleQual revLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrModuleQual
              (revAccessorLocalTypes, sigQual'1)
          val qSig : qsig = (sig1, sigQual'2)

          val sigSpecs'1 =
            if isPolyML
            then [structPolyMLSpec]
            else []
          val sigSpecs'2 = SpecIncl qSig :: sigSpecs'1
          val sig1 = mkSigSpec sigSpecs'2
          val qSig : qsig = (sig1, [])

          (* strdec *)
          val structDec = toList1 [(enumStrId, SOME (true, qSig), struct1)]
          val strDec = StrDecStruct structDec
        in
          [ModuleDecStr strDec]
        end

      val programMLton = mkModule false
      val programPolyML = mkModule true

      (* namespace spec *)
      val enumSpec =
        let
          (* sig *)
          val sig1 = SigName enumSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrSpecQual
              (revAccessorLocalTypes, sigQual'1)
          val qSig : qsig = (sig1, sigQual'2)
        in
          (* spec *)
          SpecStruct (toList1 [(enumStrNameId, qSig)])
        end
      val enumSpecs = [enumSpec]

      (* namespace strdec *)
      val enumStrDec =
        StrDecStruct (
          toList1 [
            (enumStrNameId, NONE, StructName (toList1 [enumStrId]))
          ]
        )
      val enumStrDecs = [enumStrDec]
    in
      (
        enumStrId,
        (enumSpecs, enumStrDecs),
        Specific {mlton = programMLton, polyml = programPolyML},
        iRefs'2,
        errs'2
      )
    end
end



(* --------------------------------------------------------------------------
 * Enum
 * -------------------------------------------------------------------------- *)

val EnumId : id = "Enum"
val enumValTy : ty = mkLIdTy [FFIId, EnumId, valId]
val enumRefTy : ty = mkLIdTy [FFIId, EnumId, refId]
val nullId : id = "null"
val valueId : id = "Value"

(*
 *     datatype t =
 *       <VALUENAME[1]>
 *     | ...
 *     | <VALUENAME[V]>
 *)
fun mkEnumDatatypeDec (enumInfo : 'a EnumInfoClass.t) : datatypedec =
  let
    fun mkDatatypeClause valueInfo = (getValueNameId valueInfo, NONE)
  in
    (
      toList1 [
        (
          ([], tId),
          toList1 (
            revMapInfos
              EnumInfo.getNValues
              EnumInfo.getValue
              mkDatatypeClause
              (enumInfo, [])
          ) handle
              Empty => infoError "no values"
        )
      ],
      NONE
    )
  end

val mkEnumDatatypeSpec : 'a EnumInfoClass.t -> datatypespec = mkEnumDatatypeDec


local
  val handlerName = ("GLib", "ErrorRecord", "handler")
  val handlerTemplate = ([], handlerName)

  val handlerGlobalLId : lid = mkGlobalLId handlerName
  val handlerLocalId : id = mkLocalId handlerName
  val handlerLocalLId : lid = toList1 [handlerLocalId]
  val handlerSpec = toSpec handlerTemplate
  val handlerLocalType = toLocalType handlerTemplate

(*
  val tTy : ty = mkIdTy tId
*)
  val errorExnSpec = mkExnSpec (exnErrorId, SOME tTy)
  val errorExnStrDec = StrDecDec (mkTyExnDec (exnErrorId, SOME tTy))
  val handlerTyStrDec = makeLocalTypeStrDec handlerLocalType
in
  (*
   *                                                      -.
   *     exception Error of t                              |
   *                                     -.                |
   *     type error_handler               | isGLib         |
   *     val handler : error_handler      |                | optErrorDomain
   *                                     -'                |  is SOME _
   *                                     -.                |
   *     val handler : GLib.ErrorRecord.handler            |
   *                                      | not isGLib     |
   *                                     -'               -'
   *
   * Note that `addErrorSpecs` does not implement the outer condition
   * 'optErrorDomain is SOME _'.
   *)
  fun addErrorSpecs namespace specs =
    let
      val isGLib = namespace = "GLib"
      val handlerTys = []
    in
      errorExnSpec :: (
        if isGLib
        then
          handlerSpec
           :: mkValSpec (handlerId, TyRef (handlerTys, handlerLocalLId))
           :: specs
        else
          mkValSpec (handlerId, TyRef (handlerTys, handlerGlobalLId))
           :: specs
      )
    end

  (*
   *                                                 -.
   *     exception Error of t                         |
   *                                -.                | optErrorDomain is
   *                                 | isGLib         |  SOME errorDomain
   *     type error_handler = GLibErrorRecord.handler |
   *                                -'                |
   *     val handler =                                |
   *       GLibErrorRecord.makeHandler ("<errorDomain>", C.fromVal, Error)
   *                                                 -'
   *
   * Note that `addErrorStrDecs` does not implement the outer condition
   * 'optErrorDomain is SOME errorDomain'.
   *)
  fun addErrorStrDecs namespace errorDomain =
    let
      val errorIRef = makeErrorIRef namespace (SOME "")
      val isGLib = namespace = "GLib"

      val errorMakeHandlerExp =
        mkLIdLNameExp (prefixInterfaceStrId errorIRef [makeHandlerId])

      val handlerStrDec =
        StrDecDec (
          mkIdValDec (
            handlerId,
            ExpApp (
              errorMakeHandlerExp,
              ExpParen (
                toList1 [
                  ExpConst (ConstString errorDomain),
                  mkLIdLNameExp ["C", fromValId],
                  mkIdLNameExp exnErrorId
                ]
              )
            )
          )    
        )

      fun addStrDecs strDecs =
        if isGLib
        then errorExnStrDec :: handlerTyStrDec :: handlerStrDec :: strDecs
        else errorExnStrDec :: handlerStrDec :: strDecs

      val revLocalTypes = if isGLib then [handlerLocalType] else []
    in
      (addStrDecs, revLocalTypes)
    end
end


(* Signature *)

local
  (*
   *                                                      -.
   *     val null : t                                      | optErrorDomain
   *                                                      -'  is NONE
   *)
  val nullSpec = mkValSpec (nullId, tTy)

  (*
   *     structure C :
   *       sig
   *         type val_
   *         type ref_
   *         val withVal : (val_ -> 'a) -> t -> 'a
   *         val withRefVal : (ref_ -> 'a) -> t -> (val_, 'a) pair
   *         val fromVal : val_ -> t
   *         exception Value of FFI.Enum.val_
   *       end
   *)
  val structCSpecs = [
    mkTypeSpec (valTyName, NONE),
    mkTypeSpec (refTyName, NONE),
    mkValSpec (
      withValId,
      TyFun (TyParen (TyFun (valTy, aVarTy)), TyFun (tTy, aVarTy))
    ),
    mkValSpec (
      withRefValId,
      TyFun (
        TyParen (TyFun (refTy, aVarTy)),
        TyFun (tTy, pairTy (valTy, aVarTy))
      )
    ),
    mkValSpec (fromValId, TyFun (valTy, tTy)),
    mkExnSpec (valueId, SOME enumValTy)
  ]
  val structCSpec = mkCStructSpec structCSpecs

  val specs'0 = [structCSpec]
in
  fun makeEnumSig
    (repo          : 'a RepositoryClass.t)
    (enumCPrefix   : string)
    (enumNamespace : string)
    (enumInfo      : 'a EnumInfoClass.t)
    (errs'0        : infoerrorhier list)
    : id * program * infoerrorhier list =
    let
      val () = checkDeprecated enumInfo

      val optErrorDomain = EnumInfo.getErrorDomain enumInfo
      val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit enumInfo

      val enumName = getName enumInfo
      val enumIRef = {
        namespace = enumNamespace,
        cPrefix   = enumCPrefix,
        name      = enumName,
        scope     = LOCALINTERFACESELF,
        ty        = SIMPLE
      }

      val enumStrId = mkStrId enumNamespace enumName
      val enumSigId = toUCU enumStrId

      val typeIRef = makeTypeIRef enumNamespace (SOME enumName)

      val acc'0 = (specs'0, [], errs'0)
      val acc'1 = addFlagsEnumMethodSpecs repo enumIRef (enumInfo, acc'0)
      val acc'2 =
        case optGetTypeSymbol of
          SOME _ => addGetTypeFunctionSpec typeIRef acc'1
        | NONE   => acc'1

      val (specs'2, iRefs'2, errs'2) = acc'2
      val specs'3 = revMapAppend makeIRefLocalTypeSpec (iRefs'2, specs'2)
      val specs'4 =
        addAccessorSpecs enumNamespace enumInfo (tTy, tTy) false specs'3
      val specs'5 =
        case optErrorDomain of
          SOME _ => addErrorSpecs enumNamespace specs'4
        | NONE   => nullSpec :: specs'4
      val specs'6 = SpecDatatype (mkEnumDatatypeSpec enumInfo) :: specs'5

      val sig1 = mkSigSpec specs'6
      val qSig : qsig = (sig1, [])
      val sigDec = toList1 [(enumSigId, qSig)]
      val program = [ModuleDecSig sigDec]
    in
      (enumSigId, Portable program, errs'2)
    end
end


(* Structure *)

local
  val nId : id = "n"

  (*
   *           | <VALUENAME[i]> => f <valueValue[i]>
   *)
  fun withValMatchClause (valueInfo : 'a ValueInfoClass.t) : pat * exp =
    (
      PatA (APatConst (mkIdLNameConst (getValueNameId valueInfo))),
      ExpApp (mkIdLNameExp fId, ExpConst (getValueIntConst valueInfo))
    )

  (*
   *           | <valueValue[i]> => <VALUENAME[i]>
   *)
  fun fromValMatchClause (valueInfo : 'a ValueInfoClass.t) : pat * exp =
    (
      PatA (APatConst (getValueIntConst valueInfo)),
      mkIdLNameExp (getValueNameId valueInfo)
    )

  (*
   *           fn
   *             <VALUENAME[1]> => f <valueValue[1]>
   *           | ...
   *           | <VALUENAME[V]> => f <valueValue[V]>
   *)
  fun withValMatchExp enumInfo =
    toList1 (
      revMapInfos
        EnumInfo.getNValues
        EnumInfo.getValue
        withValMatchClause
        (enumInfo, [])
    ) handle
        Empty => infoError "no values"

  (*
   *           fn
   *             <valueValue[1]> => <VALUENAME[1]>
   *           | ...
   *           | <valueValue[V]> => <VALUENAME[V]>
   *           | n               => raise Value n
   *)
  val raiseValueNExp =
    ExpRaise (ExpApp (mkIdLNameExp valueId, mkIdLNameExp nId))
  fun fromValMatchExp enumInfo =
    toList1 (
      revMapInfos
        EnumInfo.getNValues
        EnumInfo.getValue
        fromValMatchClause
        (enumInfo, [(PatA (APatId nId), raiseValueNExp)])
    ) handle
        Empty => infoError "no values"

  (*
   *     structure C =
   *       struct
   *         type val_ = FFI.Enum.val_
   *         type ref_ = FFI.Enum.ref_
   *         exception Value of FFI.Enum.val_
   *
   *         fun withVal f =
   *           fn
   *             <VALUENAME[1]> => f <valueValue[1]>
   *           | ...
   *           | <VALUENAME[V]> => f <valueValue[V]>
   *
   *         fun withRefVal f = withVal (FFI.Enum.withRef f)
   *
   *         val fromVal =
   *           fn
   *             <valueValue[1]> => <VALUENAME[1]>
   *           | ...
   *           | <valueValue[V]> => <VALUENAME[V]>
   *           | n               => raise Value n
   *
   *       end
   *)
  fun structCStrDec enumInfo =
    mkCStructStrDec [
      StrDecDec (mkTypeDec (valTyName, enumValTy)),
      StrDecDec (mkTypeDec (refTyName, enumRefTy)),
      StrDecDec (mkTyExnDec (valueId, SOME enumValTy)),
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (withValId, toList1 [APatId fId]),
                NONE,
                ExpFn (withValMatchExp enumInfo)
              )
            ]
          ]
        )
      ),
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (withRefValId, toList1 [APatId fId]),
                NONE,
                ExpApp (
                  mkIdLNameExp withValId,
                  mkParenExp (
                    ExpApp (
                      mkLIdLNameExp [FFIId, EnumId, "withRef"],
                      mkIdLNameExp fId
                    )
                  )
                )
              )
            ]
          ]
        )
      ),
      StrDecDec (
        mkIdValDec (
          fromValId,
          ExpFn (fromValMatchExp enumInfo)
        )
      )
    ]

  (*
   *     structure PolyML =                          -.
   *       struct                                     |
   *         val VAL = FFI.PolyML.Enum.VAL            | Poly/ML only
   *         val REF = FFI.PolyML.Enum.REF            |
   *       end                                       -'
   *)
  val structPolyMLStrDec =
    mkPolyMLStructStrDec [
      StrDecDec (
        mkIdValDec (
          VALId,
          mkLIdLNameExp [FFIId, PolyMLId, EnumId, VALId]
        )
      ),
      StrDecDec (
        mkIdValDec (
          REFId,
          mkLIdLNameExp [FFIId, PolyMLId, EnumId, REFId]
        )
      )
    ]

  (*
   *                                                 -.
   *     val null = <VALUENAME[1]>                    | optErrorDomain is NONE
   *                                                 -'
   *
   * Note that `nullStrDec` does not implement the outer condition
   * 'optErrorDomain is NONE'.
   *)
  fun nullStrDec enumInfo =
    if EnumInfo.getNValues enumInfo > 0
    then
      StrDecDec (
        mkIdValDec (
          nullId,
          mkIdLNameExp (getValueNameId (EnumInfo.getValue enumInfo 0))
        )
      )
    else infoError "no values"

  (*
   *                                                 -.
   * exception <EnumNamespace><EnumName> = <EnumNamespace><EnumName>.Error
   *                                                  | when optErrorDomain
   *                                                 -' is SOME _
   *)
  fun exnModule strId : module =
    let
      val dec = mkEqExnDec (strId, toList1 [strId, exnErrorId])
    in
      ModuleDecStr (StrDecDec dec)
    end
in
  fun makeEnumStr
    (repo          : 'a RepositoryClass.t)
    (libId         : id)
    (enumCPrefix   : string)
    (enumNamespace : string)
    (enumInfo      : 'a EnumInfoClass.t)
    (errs'0        : infoerrorhier list)
    : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
    let
      val () = checkDeprecated enumInfo

      val optErrorDomain = EnumInfo.getErrorDomain enumInfo
      val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit enumInfo

      val enumName = getName enumInfo
      val enumIRef = {
        namespace = enumNamespace,
        cPrefix   = enumCPrefix,
        name      = enumName,
        scope     = LOCALINTERFACESELF,
        ty        = SIMPLE
      }

      val enumStrId = mkStrId enumNamespace enumName
      val enumSigId = toUCU enumStrId

      val enumStrNameId = mkStrNameId enumName

      val typeIRef = makeTypeIRef enumNamespace (SOME enumName)
      val errorIRef = makeErrorIRef enumNamespace (SOME enumName)
      val isGLib = enumNamespace = "GLib"

      (* module *)
      val acc'0
        : strdec list
           * interfaceref list
           * infoerrorhier list =
        ([], [], errs'0)
      val acc'1 =
        addFlagsEnumMethodStrDecsHighLevel repo enumIRef (enumInfo, acc'0)
      val acc'2 =
        case optGetTypeSymbol of
          SOME _ => addGetTypeFunctionStrDecHighLevel typeIRef acc'1
        | NONE   => acc'1
      val (strDecs'2, iRefs'2, errs'2) = acc'2

      val revLocalTypes = revMap makeIRefLocalType iRefs'2
      val strDecs'3 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'2)

      val (addAccessorStrDecs, revAccessorLocalTypes) =
        addAccessorRootStrDecs repo libId enumNamespace enumInfo

      fun addNullStrDec strDecs = nullStrDec enumInfo :: strDecs

      val (addErrorNullStrDecs, revErrorLocalTypes) =
        case optErrorDomain of
          SOME errorDomain => addErrorStrDecs enumNamespace errorDomain
        | NONE             => (addNullStrDec, [])

      fun mkModule isPolyML =
        let
          val (strDecs'4, _) =
            addFlagsEnumMethodStrDecsLowLevel
              isPolyML
              repo
              libId
              (K I)
              enumIRef
              (enumInfo, (strDecs'3, errs'2))

          val strDecs'5 = addErrorNullStrDecs strDecs'4
          val strDecs'6 = addAccessorStrDecs ("enum", false) isPolyML strDecs'5
          val strDecs'7 =
            if isPolyML
            then structPolyMLStrDec :: strDecs'6
            else strDecs'6
          val strDecs'8 = structCStrDec enumInfo :: strDecs'7
          val strDecs'9 =
            StrDecDec (DecDatatype (mkEnumDatatypeDec enumInfo)) :: strDecs'8
          val struct1 = mkStructBody strDecs'9

          (* sig *)
          val sig1 = SigName enumSigId
          val sigQual'1 = revMap makeLocalTypeStrModuleQual revErrorLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrModuleQual (revLocalTypes, sigQual'1)
          val sigQual'3 =
            revMapAppend makeLocalTypeStrModuleQual
              (revAccessorLocalTypes, sigQual'2)
          val qSig : qsig = (sig1, sigQual'3)

          val sigSpecs'1 =
            if isPolyML
            then [structPolyMLSpec]
            else []
          val sigSpecs'2 = SpecIncl qSig :: sigSpecs'1
          val sig1 = mkSigSpec sigSpecs'2
          val qSig : qsig = (sig1, [])

          (* strdec *)
          val structDec = toList1 [(enumStrId, SOME (true, qSig), struct1)]
          val strDec = StrDecStruct structDec
        in
          ModuleDecStr strDec :: (
            case optErrorDomain of
              SOME _ => [exnModule enumStrId]
            | NONE   => []
          )
        end

      val programMLton = mkModule false
      val programPolyML = mkModule true

      (* namespace spec *)
      val enumSpec =
        let
          (* sig *)
          val sig1 = SigName enumSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revErrorLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrSpecQual (revLocalTypes, sigQual'1)
          val sigQual'3 =
            revMapAppend makeLocalTypeStrSpecQual
              (revAccessorLocalTypes, sigQual'2)
          val qSig : qsig = (sig1, sigQual'3)
        in
          (* spec *)
          SpecStruct (toList1 [(enumStrNameId, qSig)])
        end
      val enumSpecs'1 = [enumSpec]
      val enumSpecs'2 =
        case optErrorDomain of
          SOME _ =>
            let
              val spec =
                mkExnSpec (
                  enumStrNameId,
                  SOME (TyRef ([], toList1 [enumStrNameId, tId]))
                )
            in
              spec :: enumSpecs'1
            end
        | NONE   => enumSpecs'1

      (* namespace strdec *)
      val enumStrDec =
        StrDecStruct (
          toList1 [
            (enumStrNameId, NONE, StructName (toList1 [enumStrId]))
          ]
        )
      val enumStrDecs'1 = [enumStrDec]
      val enumStrDecs'2 =
        case optErrorDomain of
          SOME _ =>
            let
              val strDec =
                StrDecDec (
                  DecExn (
                    toList1 [
                      (enumStrNameId, ExnDecTypeEq (toList1 [enumStrId]))
                    ]
                  )
                )
            in
              strDec :: enumStrDecs'1
            end
        | NONE   => enumStrDecs'1

      (* Error ENUM in GLib requires GLib.ErrorRecord structure dependence *)
      val strIRefs =
        if isGLib
        then
          case optErrorDomain of  
            SOME _ => errorIRef :: iRefs'2
          | NONE   => iRefs'2
        else
          iRefs'2
    in
      (
        enumStrId,
        (enumSpecs'2, enumStrDecs'2),
        Specific {mlton = programMLton, polyml = programPolyML},
        strIRefs,
        errs'2
      )
    end
end






(* --------------------------------------------------------------------------
 * Namespace
 * -------------------------------------------------------------------------- *)

(* Lists of STRUCT names and UNION names to include.
 *
 * A STRUCT that is a field of an included UNION is not in the STRUCT list.
 *)

val structNames = [
  ("GLib", "Error"),
  ("GLib", "IOChannel"),
  ("GLib", "KeyFile"),
  ("GLib", "MainContext"),
  ("GLib", "MatchInfo"),
  ("GLib", "Regex"),
  ("GLib", "Source"),
  ("GLib", "TimeVal"),
  ("GObject", "Closure"),
  ("Gdk", "Atom"),
  ("Gdk", "Color"),
  ("Gdk", "Geometry"),
  ("Gdk", "KeymapKey"),
  ("Gdk", "RGBA"),
  ("Gdk", "WindowAttr"),
  ("GdkPixbuf", "PixbufFormat"),
  ("Gtk", "AccelKey"),
  ("Gtk", "Border"),
  ("Gtk", "FileFilterInfo"),
  ("Gtk", "IconInfo"),
  ("Gtk", "IconSet"),
  ("Gtk", "IconSource"),
  ("Gtk", "PaperSize"),
  ("Gtk", "RecentData"),
  ("Gtk", "RecentFilterInfo"),
  ("Gtk", "RecentInfo"),
  ("Gtk", "Requisition"),
  ("Gtk", "SelectionData"),
  ("Gtk", "SettingsValue"),
  ("Gtk", "StockItem"),
  ("Gtk", "SymbolicColor"),
  ("Gtk", "TargetEntry"),
  ("Gtk", "TargetList"),
  ("Gtk", "TextAttributes"),
  ("Gtk", "TextIter"),
  ("Gtk", "TreeIter"),
  ("Gtk", "TreePath"),
  ("Gtk", "WidgetPath"),
  ("cairo", "Context"),
  ("cairo", "FontOptions"),
  ("cairo", "Pattern"),
  ("cairo", "RectangleInt"),
  ("cairo", "Region"),
  ("cairo", "ScaledFont"),
  ("cairo", "Surface"),
  ("Pango", "Attribute"),
  ("Pango", "AttrList"),
  ("Pango", "FontDescription"),
  ("Pango", "FontMetrics"),
  ("Pango", "GlyphItem"),
  ("Pango", "GlyphString"),
  ("Pango", "Language"),
  ("Pango", "LayoutLine"),
  ("Pango", "Matrix"),
  ("Pango", "Rectangle"),
  ("Pango", "TabArray")
]

val unionNames = [
  ("Gdk", "Event")
]



fun dupSig _ = raise Fail "duplicate signature"
fun dupStr _ = raise Fail "duplicate structure"
fun dupFile _ = raise Fail "duplicate file"
fun insertNew f x = ListDict.insert f x
fun insertNewList f (xs, m) = List.foldr (insertNew f) m xs

fun translateInfo
  repo
  libId 
  cPrefix
  namespace
  (
    baseInfo,
    acc as (
      (
        modules'0 as (
          files'0 : program ListDict.t,
          sigs'0 : bool ListDict.t,
          strs'0 : ((bool * (spec list * strdec list)) * id list) ListDict.t
        ),
        constants'0,
        functions'0
      ),
      errs'0
    )
  ) =
  case InfoType.getType baseInfo of
    InfoType.OBJECT objectInfo       =>
      let
        val (classSigId, classSigProgram) =
          makeObjectClassSig repo cPrefix namespace objectInfo

        val (
          classStrId,
          classStrSpecDec,
          classStrProgram,
          classStrIRefs
        ) =
          makeObjectClassStr repo cPrefix namespace objectInfo

        val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
          makeObjectStr repo libId cPrefix namespace objectInfo errs'0

        val (sigId, sigProgram, errs'2) =
          makeObjectSig repo cPrefix namespace objectInfo errs'1

        val classStrDeps = map makeInterfaceOtherStrId classStrIRefs
        val strDeps = map makeInterfaceOtherStrId strIRefs

        val isClassSigPortable = isPortable classSigProgram
        val isClassStrPortable = isPortable classStrProgram
        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val sigs'1 =
          insertNewList dupSig (
            [
              (classSigId, isClassSigPortable),
              (sigId, isSigPortable)
           ],
           sigs'0
        )
        val strs'1 =
          insertNewList dupStr (
            [
              (classStrId, ((isClassStrPortable, classStrSpecDec), classStrDeps)),
              (strId, ((isStrPortable, strSpecDec), strDeps))
            ],
            strs'0
          )
        val files'1 =
          insertNewList dupFile (
            [
              (classSigId, classSigProgram), (sigId, sigProgram),
              (classStrId, classStrProgram), (strId, strProgram)
            ],
            files'0
          )
        val modules'1 = (files'1, sigs'1, strs'1)
      in
        ((modules'1, constants'0, functions'0), errs'2)
      end
  | InfoType.INTERFACE interfaceInfo =>
      let
        (* just class for now *)
        val (classSigId, classSigProgram) =
          makeInterfaceClassSig repo cPrefix namespace interfaceInfo

        val (
          classStrId,
          classStrSpecDec,
          classStrProgram,
          classStrIRefs
        ) =
          makeInterfaceClassStr repo cPrefix namespace interfaceInfo

        val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
          makeInterfaceStr repo libId cPrefix namespace interfaceInfo errs'0

        val (sigId, sigProgram, errs'2) =
          makeInterfaceSig repo cPrefix namespace interfaceInfo errs'1

        val classStrDeps = map makeInterfaceOtherStrId classStrIRefs
        val strDeps = map makeInterfaceOtherStrId strIRefs

        val isClassSigPortable = isPortable classSigProgram
        val isClassStrPortable = isPortable classStrProgram
        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val sigs'1 =
          insertNewList dupSig (
            [
              (classSigId, isClassSigPortable),
              (sigId, isSigPortable)
            ],
            sigs'0
          )
        val strs'1 =
          insertNewList dupStr (
            [
              (classStrId, ((isClassStrPortable, classStrSpecDec), classStrDeps)),
              (strId, ((isStrPortable, strSpecDec), strDeps))
            ],
            strs'0
          )
        val files'1 =
          insertNewList dupFile (
            [
              (classSigId, classSigProgram), (sigId, sigProgram),
              (classStrId, classStrProgram), (strId, strProgram)
            ],
            files'0
          )
        val modules'1 = (files'1, sigs'1, strs'1)
      in
        ((modules'1, constants'0, functions'0), errs'2)
      end
  | InfoType.STRUCT structInfo       =>
      if
        let
          val structName = getName structInfo
          val structNamespace = namespace
          fun isName x = x = (structNamespace, structName)
        in
          List.exists isName structNames
        end
      then
        let
          val (recordSigId, recordSigProgram) =
            makeStructRecordSig repo cPrefix namespace structInfo

          val (
            recordStrId,
            recordStrSpecDec,
            recordStrProgram,
            recordStrIRefs
          ) =
            makeStructRecordStr repo cPrefix namespace structInfo

          val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
            makeStructStr repo libId cPrefix namespace structInfo errs'0

          val (sigId, sigProgram, errs'2) =
            makeStructSig repo cPrefix namespace structInfo errs'1

          val recordStrDeps = map makeInterfaceOtherStrId recordStrIRefs
          val strDeps = map makeInterfaceOtherStrId strIRefs

          val isRecordSigPortable = isPortable recordSigProgram
          val isRecordStrPortable = isPortable recordStrProgram
          val isSigPortable = isPortable sigProgram
          val isStrPortable = isPortable strProgram

          val sigs'1 =
            insertNewList dupSig (
              [
                (recordSigId, isRecordSigPortable),
                (sigId, isSigPortable)
              ],
              sigs'0
            )
          val strs'1 =
            insertNewList dupStr (
              [
                (recordStrId, ((isRecordStrPortable, recordStrSpecDec), recordStrDeps)),
                (strId, ((isStrPortable, strSpecDec), strDeps))
              ],
              strs'0
            )
          val files'1 =
            insertNewList dupFile (
              [
                (recordSigId, recordSigProgram), (sigId, sigProgram),
                (recordStrId, recordStrProgram), (strId, strProgram)
              ],
              files'0
            )
          val modules'1 = (files'1, sigs'1, strs'1)
        in
          ((modules'1, constants'0, functions'0), errs'2)
        end
      else
        acc
  | InfoType.UNION unionInfo         =>
      if
        let
          val unionName = getName unionInfo
          val unionNamespace = namespace
          fun isName x = x = (unionNamespace, unionName)
        in
          List.exists isName unionNames
        end
      then
        let
          val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
            makeUnionStr repo cPrefix namespace unionInfo errs'0

          val (sigId, sigProgram, errs'2) =
            makeUnionSig repo cPrefix namespace unionInfo errs'1

          val strDeps = map makeInterfaceOtherStrId strIRefs

          val isSigPortable = isPortable sigProgram
          val isStrPortable = isPortable strProgram

          val sigs'1 =
            insertNewList dupSig ([(sigId, isSigPortable)], sigs'0)
          val strs'1 =
            insertNewList dupStr (
              [(strId, ((isStrPortable, strSpecDec), strDeps))],
              strs'0
            )
          val files'1 =
            insertNewList dupFile (
              [
                (sigId, sigProgram),
                (strId, strProgram)
              ],
              files'0
            )
          val modules'1 = (files'1, sigs'1, strs'1)
        in
          ((modules'1, constants'0, functions'0), errs'2)
        end
      else
        acc
  | InfoType.FLAGS enumInfo          =>
      let
        val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
          makeFlagsStr repo libId cPrefix namespace enumInfo errs'0

        val (sigId, sigProgram, errs'2) =
          makeFlagsSig repo cPrefix namespace enumInfo errs'1

        val strDeps = map makeInterfaceOtherStrId strIRefs

        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val sigs'1 = insertNew dupSig ((sigId, isSigPortable), sigs'0)
        val strs'1 =
          insertNewList dupStr (
            [(strId, ((isStrPortable, strSpecDec), strDeps))],
            strs'0
          )
        val files'1 =
          insertNewList dupFile (
            [
              (sigId, sigProgram),
              (strId, strProgram)
            ],
            files'0
          )
        val modules'1 = (files'1, sigs'1, strs'1)
      in
        ((modules'1, constants'0, functions'0), errs'2)
      end
  | InfoType.ENUM enumInfo           =>
      let
        val (strId, strSpecDec, strProgram, strIRefs, errs'1) =
          makeEnumStr repo libId cPrefix namespace enumInfo errs'0

        val (sigId, sigProgram, errs'2) =
          makeEnumSig repo cPrefix namespace enumInfo errs'1

        val strDeps = map makeInterfaceOtherStrId strIRefs

        val isSigPortable = isPortable sigProgram
        val isStrPortable = isPortable strProgram

        val sigs'1 = insertNew dupSig ((sigId, isSigPortable), sigs'0)
        val strs'1 =
          insertNewList dupStr (
            [(strId, ((isStrPortable, strSpecDec), strDeps))],
            strs'0
          )
        val files'1 =
          insertNewList dupFile (
            [
              (sigId, sigProgram),
              (strId, strProgram)
            ],
            files'0
          )
        val modules'1 = (files'1, sigs'1, strs'1)
      in
        ((modules'1, constants'0, functions'0), errs'2)
      end
  | InfoType.CONSTANT constantInfo   =>
      let
        val (spec, (_, errs'1)) =
          makeConstantSpec (constantInfo, ([], errs'0))

        val (strDec, (_, errs'2)) =
          makeConstantStrDec (constantInfo, ([], errs'1))

        val (specs'0, strDecs'0) = constants'0
        val constants'1 = (spec :: specs'0, strDec :: strDecs'0)
      in
        ((modules'0, constants'1, functions'0), errs'2)
      end
  | InfoType.FUNCTION functionInfo   =>
      let
        val (spec, (_, errs'1)) =
          makeFunctionSpec repo NONE (functionInfo, ([], errs'0))

        val (strDecHighLevel, (_, errs'2)) =
          makeFunctionStrDecHighLevel repo NONE
            (functionInfo, ([], errs'1))

        val (strDecLowLevelPolyML, errs'3) =
          makeFunctionStrDecLowLevelPolyML repo libId NONE
            (functionInfo, errs'2)

        val (strDecLowLevelMLton, errs'4) =
          makeFunctionStrDecLowLevelMLton repo NONE
            (functionInfo, errs'3)

        val (
          specs'0,
          strDecsHighLevel'0,
          strDecsLowLevelMLton'0,
          strDecsLowLevelPolyML'0
        ) = functions'0
        val functions'1 = (
          spec :: specs'0,
          strDecHighLevel :: strDecsHighLevel'0,
          strDecLowLevelMLton :: strDecsLowLevelMLton'0,
          strDecLowLevelPolyML :: strDecsLowLevelPolyML'0
        )
      in
        ((modules'0, constants'0, functions'1), errs'4)
      end
  | _                                => acc


fun translateLoadedNamespace repo namespace =
  let
    val libId = getSharedLibraryId repo namespace
    val cPrefix = getCPrefix repo namespace

    val modules'0 = (ListDict.empty, ListDict.empty, ListDict.empty)
    val constants'0 = ([], [])
    val functions'0 = ([], [], [], [])
    val errs'0 = []
  in
    revFoldInfosWithErrs
      (Repository.getNInfos repo)
      (Repository.getInfo repo)
      (translateInfo repo libId cPrefix namespace)
      (namespace, ((modules'0, constants'0, functions'0), errs'0))
  end




fun loadNamespace repo (namespace, version) =
  let
    val tylib =
      Repository.require
        repo
        namespace
        version
        (RepositoryLoadFlags.flags [])

    val namespace_ =
      Repository.loadTypelib
        repo
        tylib
        (RepositoryLoadFlags.flags [])

    (* a sanity check... *)
    val () =
      if namespace = namespace_
      then ()
      else
        raise
          Fail (
            concat [
              "namespace mismatch: \"",
              namespace,
              "\" <> \"",
              namespace_,
              "\""
            ]
          )
  in
    ()
  end







datatype target =
  MLton
| PolyML

val targetString =
  fn
    MLton  => "mlton"
  | PolyML => "polyml"

fun mkTargetDir dir c = OS.Path.joinDirFile {dir = dir, file = targetString c}

fun mkFile id ext = OS.Path.joinBaseExt {base = id, ext = SOME ext}

fun mkTargetFile c id ext =
  OS.Path.joinDirFile {dir = targetString c, file = mkFile id ext}

val sml = "sml"
val mlb = "mlb"



fun mkBaseVersion base ver = String.concat [base, "-", ver]



fun listRemoveFirst ys xs = foldl removeFirst xs ys

infix **
fun (f ** g) (x, y) = (f x, g y)


fun getNext (m : (id * ('a * id list)) list) =
  let
    val (next, m'1) =
      partitionRevMap
        (fn (id, (x, [])) => SOME (id, x) | _ => NONE, I)
        m

    val ids = map #1 next
    val m'2 = revMap (I ** (I ** listRemoveFirst ids)) m'1
  in
    case next of
      _ :: _ => ()
    | []     =>
        let
          fun quote s = ["\"", String.toString s, "\""]
          fun fmt (id, (_, deps)) = (
            app (app print) [quote id, [" ("]];
            app (app print) (sepWith [", "] (map quote deps));
            print ")\n"
          )
        in
          print "**** Excluding from basis for missing\
                       \ or cyclic dependencies ****\n";
          app fmt m
        end;
    (next, m'2)
  end


fun sort m =  (* result is reverse order *)
  let
    fun aux acc l =
      case l of
        _ :: _ =>
          let
            val (next, l') = getNext l
          in
            case next of
              _ :: _ => aux (next @ acc) l'
            | []     => acc
          end
      | []     => acc
  in
    aux [] (ListDict.toList m)
  end



fun mkProgramFile isPolyML (id, isPortable) =
  if isPortable
  then mkFile id sml
  else mkTargetFile (if isPolyML then PolyML else MLton) id sml


fun mkMLBBasDec (root, dir, base) =
  OS.Path.joinDirFile {
    dir  = root,
    file = OS.Path.joinDirFile {dir  = dir, file = mkFile base mlb}
  }

val mltonBasDecs = [
  mkMLBBasDec ("$(SML_LIB)", "basis", "basis"),
  mkMLBBasDec ("$(SML_LIB)", "basis", "mlton")
]
val giraffeBasDecs = [
  mkMLBBasDec ("$(GIRAFFE_SML_LIB)", "general", "mlton"),
  mkMLBBasDec ("$(GIRAFFE_SML_LIB)", "ffi", "mlton")
]

fun mkNamespaceBasDec namespaceDep =
  let
    val dir = String.map Char.toLower namespaceDep
    val baseMLton = targetString MLton
  in
    mkMLBBasDec ("..", dir, baseMLton)
  end


fun fmtNamespaceBasisMLton namespaceDeps (revSigs, revStrs) : VTextTree.t =
  let
    val mkMLtonFile = mkProgramFile false
    val basDecs'1 = revMap mkMLtonFile revStrs
    val basDecs'2 = revMapAppend mkMLtonFile (revSigs, basDecs'1)
    val basDecs'3 = revMapAppend mkNamespaceBasDec (namespaceDeps, basDecs'2)

    open HVTextTree
    val indent = V.indentWith (H.str "  ") true
  in
    V.seq [
      V.str "local",
      indent (
        V.seq (map V.str (mltonBasDecs @ giraffeBasDecs))
      ),
      V.str "in",
      indent (
        V.seq (map V.str basDecs'3)
      ),
      V.str "end"
    ]
  end


local
  fun mkUseTopLevelDec e = TopLevelDecExp (ExpApp (mkIdLNameExp "use", e))
  val useSigExp = mkUseTopLevelDec o ExpConst o ConstString o mkProgramFile true
  val useStrExp = mkUseTopLevelDec o ExpConst o ConstString o mkProgramFile true
in
  fun fmtNamespaceBasisPolyML (revSigs, revStrs) : VTextTree.t =
    let
      val useTopLevelDecs'1 = revMap useStrExp revStrs
      val useTopLevelDecs'2 = revMapAppend useSigExp (revSigs, useTopLevelDecs'1)
    in
      PrettyPrint.fmtProgram useTopLevelDecs'2
    end
end




fun writeFile dir file v =
  let
    val file = OS.Path.joinDirFile {dir = dir, file = file}

    val ostream = TextIO.openOut file
    val writer = (
      fn () => TextIO.output1 (ostream, #"\n"),
      fn s => TextIO.output (ostream, s)
    )
  in
    HVTextTree.V.app writer v
      handle
        e => (TextIO.closeOut ostream; raise e);
    TextIO.closeOut ostream
  end

fun fmtModules ms = PrettyPrint.fmtProgram (map mkModuleTopLevelDec ms)

fun writeProgramFileMLton dir (id, ms) =
  writeFile dir (mkTargetFile MLton id sml) (fmtModules ms)
fun writeProgramFilePolyML dir (id, ms) =
  writeFile dir (mkTargetFile PolyML id sml) (fmtModules ms)
fun writeProgramFile dir (id, program) =
  case program of
    Portable ms              => writeFile dir (mkFile id sml) (fmtModules ms)
  | Specific {mlton, polyml} => (
      writeProgramFileMLton dir (id, mlton);
      writeProgramFilePolyML dir (id, polyml)
    )

fun writeBasisFileMLton namespaceDir namespaceDeps (revSigs, revStrs) =
  writeFile namespaceDir
    (mkFile (targetString MLton) mlb)
    (fmtNamespaceBasisMLton namespaceDeps (revSigs, revStrs))

fun writeBasisFilePolyML namespaceDir (revSigs, revStrs) =
  writeFile namespaceDir
    (mkFile (targetString PolyML) sml)
    (fmtNamespaceBasisPolyML (revSigs, revStrs))

fun writeBasisFile dir namespaceDeps (revSigs, revStrs) =
  let
  in
    writeBasisFileMLton dir namespaceDeps (revSigs, revStrs);
    writeBasisFilePolyML dir (revSigs, revStrs)
  end


(* `createNamespaceDir (namespace, version)` creates the directory hierarchy
 * into which generated files for the namespace given by `namespace` and
 * `version` are placed.  The directory is created relative to the current
 * directory.  The directory name is returned.  The function fails if the
 * namespace directory already exists.
 *)

fun createNamespaceDir (namespace, version) =
  let
    val namespaceDir = String.map Char.toLower (mkBaseVersion namespace version)
  in
    OS.FileSys.mkDir namespaceDir;
    OS.FileSys.mkDir (mkTargetDir namespaceDir MLton);
    OS.FileSys.mkDir (mkTargetDir namespaceDir PolyML);
    namespaceDir
  end




fun makeNamespaceSigStr
  namespace
  (revStrs, constants, functions) =
  let
    val namespaceStrId = toUCC namespace
    val namespaceSigId = toUCU namespace

    val isGObject = namespace = "GObject"

    fun noSemi x = (x, false)
    fun addModuleSpecs ((revSpecs, _), specs) =
      revMapAppend noSemi (revSpecs, specs)
    fun addModuleStrDecs ((_, revStrDecs), strDecs) =
      revMapAppend noSemi (revStrDecs, strDecs)

    val (constantSpecs, constantStrDecs) = constants
    val (
      functionSpecs,
      functionStrDecsHighLevel,
      functionStrDecsLowLevelMLton,
      functionLocalStrDecsLowLevelPolyML
    ) = functions

    val functionStrDecsLowLevelPolyML =
      case functionLocalStrDecsLowLevelPolyML of
          _ :: _ => [mkPolyMLFFILocalStrDec functionLocalStrDecsLowLevelPolyML]
        | _      => []

    val numProps = 1  (* any non-zero value *)
    val revPropLocalTypes = makePropertyLocalTypes isGObject numProps

    (* spec *)
    val specs'1 = mkSpecs functionSpecs
    val specs'2 = mkSpecs constantSpecs @ specs'1
    val specs'3 = foldl addModuleSpecs specs'2 revStrs
    val specs'4 =
      revMapAppend (noSemi o makeLocalTypeSpec) (revPropLocalTypes, specs'3)
    val namespaceSigProgram = [
      ModuleDecSig (
        toList1 [
          (namespaceSigId, (SigSpec specs'4, []))
        ]
      )
    ]

    (* strdec *)
    val strDecs'1 = mkStrDecs functionStrDecsHighLevel
    val strDecs'2 = mkStrDecs constantStrDecs @ strDecs'1
    val strDecs'3 = foldl addModuleStrDecs strDecs'2 revStrs 
    val strDecs'4 =
      revMapAppend (noSemi o makeLocalTypeStrDec) (revPropLocalTypes, strDecs'3)
    fun mkModule functionStrDecsLowLevel =
      let
        val strDecs'5 = mkStrDecs functionStrDecsLowLevel @ strDecs'4
        val sigQual'1 = revMap makeLocalTypeStrModuleQual revPropLocalTypes
        val namespaceQSig = (SigName namespaceSigId, sigQual'1)
      in
        [
          ModuleDecStr (
            StrDecStruct (
              toList1 [
                (
                  namespaceStrId,
                  SOME (false, namespaceQSig),
                  StructBody strDecs'5
                )
              ]
            )
          )
        ]
      end

    val namespaceStrProgramPolyML = mkModule functionStrDecsLowLevelPolyML
    val namespaceStrProgramMLton = mkModule functionStrDecsLowLevelMLton
  in
    (
      (namespaceSigId, Portable namespaceSigProgram),
      (
         namespaceStrId,
         Specific {
           mlton  = namespaceStrProgramMLton,
           polyml = namespaceStrProgramPolyML
         }
      )
    )
  end


fun insertSig x = ListDict.insert dupSig x
fun insertSigs (xs, m) = List.foldr insertSig m xs

fun addDeps ((_, extraDeps), (x, deps)) = (x, List.foldl insert deps extraDeps)
fun insertStr x = ListDict.insert addDeps x
fun insertStrs (xs, m) = List.foldr insertStr m xs

fun generate dir repo (namespace, version) (extraSigFiles, extraStrs) =
  let
    val () = loadNamespace repo (namespace, version)
    val curDir = OS.FileSys.getDir ()
    val () = OS.FileSys.chDir dir
  in
    let
      (* `createNamespaceDir` fails if directory already exists *)
      val namespaceDir = createNamespaceDir (namespace, version)

      val namespaceDeps =
        getOpt (Repository.getDependencies repo namespace, [])

      (* generate code for the entire namespace *)
      val ((modules, constants, functions), errs) =
        translateLoadedNamespace repo namespace

      val (files'1, sigFiles'1, strs'1) = modules

      (* Perform the following steps:
       *
       *   1. Extend `strs'1` with `extraStrs` and sort the result to
       *      satisfy dependencies, giving `strs'2`.  This is split into
       *      two lists:
       *        `strFiles'2`, each structure name with a portability flag;
       *        `strSpecsDecs'2`, the entries for modules in the namespace
       *          signature and structure.
       *
       *   2. Generate the signature and structure for the namespace module,
       *      giving `namespaceSig` and `namespaceStr` respectively, using
       *      `strSpecsDecs'2` from step 1, `constants` and `functions`.
       *
       *   3. Extend `sigFiles'1` with `extraSigFiles` and `namespaceSigId`
       *      from step 2 to give `sigFiles'2`.  `namespaceSigId` must occur
       *      last.
       *
       *   4. Extend `strFiles'2` with `namespaceStrId` to give `strFiles'3`.
       *      `namespaceStrId` must occur last.
       *
       *   5. Write basis/load files using extended sorted `strFiles'3` from
       *      step 4 and extended `sigFiles'2` from step 3.
       *
       *   6. Extend `files'1` with namespace signature and structure
       *      modules from step 2, giving `files'2`.
       *
       *   7. Write module files `files'2` from step 6.
       *)

      (* Step 1 *)
      val strDeps'2 = insertStrs (extraStrs, strs'1)
      val revStrs'2 : (id * (bool * (spec list * strdec list))) list =
        sort strDeps'2

      local
        fun f ((x, (y, z)), (xys, zs)) = ((x, y) :: xys, z :: zs)
      in  
        val (revStrFiles'2, revStrSpecsDecs'2) = foldr f ([], []) revStrs'2
      end

      (* Step 2 *)
      val (
        namespaceSig as (namespaceSigId, namespaceSigProgram),
        namespaceStr as (namespaceStrId, namespaceStrProgram)
      ) =
        makeNamespaceSigStr namespace
          (revStrSpecsDecs'2, constants, functions)

      (* Step 3 *)
      val revSigFiles'2 =
        let
          val sigFiles = insertSigs (extraSigFiles, sigFiles'1)
          val revSigFiles = rev (ListDict.toList sigFiles)
        in
          (namespaceSigId, isPortable namespaceSigProgram) :: revSigFiles
        end

      (* Step 4 *)
      val revStrFiles'3 =
        (namespaceStrId, isPortable namespaceStrProgram) :: revStrFiles'2

      (* Step 5 *)
      val () =
        writeBasisFile namespaceDir namespaceDeps (revSigFiles'2, revStrFiles'3)

      (* Step 6 *)
      val files'2 =
        insertNewList dupFile ([namespaceSig, namespaceStr], files'1)
    in
      (* Step 7 *)
      ListDict.appi (writeProgramFile namespaceDir) files'2;

      OS.FileSys.chDir curDir;
      errs
    end
      handle
        e => (OS.FileSys.chDir curDir; raise e)
  end

;



(* test *)

PolyML.print_depth 1000;

Gtk.init (CommandLine.name () :: CommandLine.arguments ());

val repo = Repository.getDefault ();

constructorNames :=
  [
    "NONE",
    "SOME",
    "EQUAL",
    "LESS",
    "GREATER"
  ];


val outDir = "/tmp/test1";



fun mkStructSpec (strId, qSig) = SpecStruct (toList1 [(strId, qSig)])
fun mkStructStrDec (strId, sigId) =
  StrDecStruct (toList1 [(strId, NONE, StructName (toList1 [sigId]))]);

fun makeSig nameId = (nameId, true)

fun makeStr (namespaceId, nameId, sigId) localTypes =
  let
    val strId = namespaceId ^ nameId

    val quals = map makeLocalTypeStrSpecQual localTypes
    val strDeps = map (#1 o #tyStrLId) localTypes

    val isPortable = false
  in
    (
      strId,
      (
        (
          isPortable,
          (
            [mkStructSpec (nameId, (SigName sigId, quals))],
            [mkStructStrDec (nameId, strId)]
          )
        ),
        strDeps
      )
    )
  end

fun addDep (namespaceId, nameId) (localTypes : localtype list) =
  let
    val strId = namespaceId ^ nameId

    val strDeps = map (#1 o #tyStrLId) localTypes

    val isPortable = false
  in
    (
      strId,
      (
        (
          isPortable,
          (
            [],
            []
          )
        ),
        strDeps
      )
    )
  end

;



(* Common *)

val aTyVar : tyvar = (false, "a")


(* GLib *)

val quarkLocalType = toLocalType ([], ("GLib", "Quark", "t"))
val ioChannelRecordLocalType = toLocalType ([], ("GLib", "IOChannelRecord", "t"))
val ioConditionLocalType = toLocalType ([], ("GLib", "IOCondition", "t"))


(* Gdk *)

val eventLocalType = toLocalType ([aTyVar], ("Gdk", "Event", "t"))
val windowClassLocalType = toLocalType ([aTyVar], ("Gdk", "WindowClass", "t"))
val modifierTypeLocalType = toLocalType ([], ("Gdk", "ModifierType", "t"))

;



(*
 * Generate output for each namespace
 *)

generate outDir repo ("Atk", "1.0") ([], []);
generate outDir repo ("GLib", "2.0")
  (
    [
      makeSig "G_LIB_QUARK",
      makeSig "G_LIB_SOURCE_FUNC",
      makeSig "G_LIB_CHILD_WATCH_FUNC",
      makeSig "G_LIB_SPAWN_CHILD_SETUP_FUNC",
      makeSig "G_LIB_I_O_FUNC"
    ],
    [
      makeStr ("GLib", "Quark", "G_LIB_QUARK") [],
      makeStr ("GLib", "SourceFunc", "G_LIB_SOURCE_FUNC") [],
      makeStr ("GLib", "ChildWatchFunc", "G_LIB_CHILD_WATCH_FUNC") [],
      makeStr ("GLib", "SpawnChildSetupFunc", "G_LIB_SPAWN_CHILD_SETUP_FUNC") [],
      makeStr ("GLib", "IOFunc", "G_LIB_I_O_FUNC")
        [ioChannelRecordLocalType, ioConditionLocalType],
      addDep ("GLib", "ErrorRecord") [quarkLocalType]
    ]
  );
generate outDir repo ("GObject", "2.0")
  (
    [
      makeSig "CLOSURE_MARSHAL",
      makeSig "SIGNAL",
      makeSig "PROPERTY",
      makeSig "G_OBJECT_TYPE",
      makeSig "G_OBJECT_VALUE_RECORD",
      makeSig "G_OBJECT_VALUE"
    ],
    [
      (* ClosureMarshal, Signal and Property are special supporting
       * structures outside the Gtk structure.  Therefore their spec and
       * strdec lists are empty but dependencies are included to ensure
       * that they are loaded before the modules that require them. *)
      (
        "ClosureMarshal",
        (
          (false, ([], [])),
          ["GObjectValueRecord", "GObjectValue"]
        )
      ),
      (
        "Signal",
        (
          (false, ([], [])),
          ["GObjectObjectClass", "GObjectClosureRecord", "GObjectClosure"]
        )
      ),
      (
        "Property",
        (
          (false, ([], [])),
          ["GObjectObjectClass", "GObjectValueRecord", "GObjectValue"]
        )
      ),

      (* GObjectType, GObjectValueRecord and GObjectValue are manually
       * generated modules so we must provide spec and strdec values
       * to be inserted into the namespace module. *)
      (
        "GObjectType",
        (
          (
            false,
            (
              [mkStructSpec ("Type", (SigName "G_OBJECT_TYPE", []))],
              [mkStructStrDec ("Type", "GObjectType")]
            )
          ),
          []
        )
      ),
      (
        "GObjectValueRecord",
        (
          (
            false,
            (
              [mkStructSpec ("ValueRecord", (SigName "G_OBJECT_VALUE_RECORD", []))],
              [mkStructStrDec ("ValueRecord", "GObjectValueRecord")]
            )
          ),
          []
        )
      ),
      (
        "GObjectValue",
        (
          (
            false,
            (
              [
                mkStructSpec (
                  "Value",
                  (
                    SigName "G_OBJECT_VALUE",
                    [
                      toList1 [
                        (
                          ([], toList1 ["record_t"]),
                          TyRef ([], toList1 ["ValueRecord", "t"])
                        )
                      ],
                      toList1 [
                        (
                          ([], toList1 ["type_t"]),
                          TyRef ([], toList1 ["Type", "t"])
                        )
                      ]
                    ]
                  )
                )
              ],
              [mkStructStrDec ("Value", "GObjectValue")]
            )
          ),
          ["GObjectType", "GObjectValueRecord"]
        )
      ),

      (* GObjectClosureRecord, GObjectClosure, GObjectObjectClass and
       * GObjectParamSpecClass are partially automatically generated.
       * Addition dependencies are required for the manual fixes to the
       * automatic translation. *)
      (
        "GObjectClosureRecord",
        (
          (false, ([], [])),
          ["GObjectType", "GObjectValueRecord", "GObjectValue"]
        )
      ),
      (
        "GObjectClosure",
        ((false, ([], [])), ["ClosureMarshal", "GObjectClosureRecord"])
      ),

      (
        "GObjectObjectClass",
        (
          (false, ([], [])),
          ["GObjectType", "GObjectValueRecord", "GObjectValue"]
        )
      ),
      (
        "GObjectParamSpecClass",
        (
          (false, ([], [])),
          ["GObjectType", "GObjectValueRecord", "GObjectValue"]
        )
      )
    ]
  );
generate outDir repo ("Gio", "2.0") ([], []);
generate outDir repo ("GdkPixbuf", "2.0") ([], []);
generate outDir repo ("Pango", "1.0") ([], []);
generate outDir repo ("cairo", "1.0") ([], []);
generate outDir repo ("Gdk", "3.0")
  (
    [
      makeSig "GDK_EVENT_ANY_RECORD",
      makeSig "GDK_EVENT_BUTTON_RECORD",
      makeSig "GDK_EVENT_CONFIGURE_RECORD",
      makeSig "GDK_EVENT_CROSSING_RECORD",
      makeSig "GDK_EVENT_D_N_D_RECORD",
      makeSig "GDK_EVENT_EXPOSE_RECORD",
      makeSig "GDK_EVENT_FOCUS_RECORD",
      makeSig "GDK_EVENT_GRAB_BROKEN_RECORD",
      makeSig "GDK_EVENT_KEY_RECORD",
      makeSig "GDK_EVENT_MOTION_RECORD",
      makeSig "GDK_EVENT_OWNER_CHANGE_RECORD",
      makeSig "GDK_EVENT_PROPERTY_RECORD",
      makeSig "GDK_EVENT_PROXIMITY_RECORD",
      makeSig "GDK_EVENT_SCROLL_RECORD",
      makeSig "GDK_EVENT_SELECTION_RECORD",
      makeSig "GDK_EVENT_SETTING_RECORD",
      makeSig "GDK_EVENT_VISIBILITY_RECORD",
      makeSig "GDK_EVENT_WINDOW_STATE_RECORD",
      makeSig "CLASSIFY_EVENT"
    ],
    let
    in
      [
        makeStr
          ("Gdk", "EventAnyRecord", "GDK_EVENT_ANY_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventButtonRecord", "GDK_EVENT_BUTTON_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventConfigureRecord", "GDK_EVENT_CONFIGURE_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventCrossingRecord", "GDK_EVENT_CROSSING_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventDNDRecord", "GDK_EVENT_D_N_D_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventExposeRecord", "GDK_EVENT_EXPOSE_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventFocusRecord", "GDK_EVENT_FOCUS_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventGrabBrokenRecord", "GDK_EVENT_GRAB_BROKEN_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventKeyRecord", "GDK_EVENT_KEY_RECORD")
          [eventLocalType, windowClassLocalType, modifierTypeLocalType],
        makeStr
          ("Gdk", "EventMotionRecord", "GDK_EVENT_MOTION_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventOwnerChangeRecord", "GDK_EVENT_OWNER_CHANGE_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventPropertyRecord", "GDK_EVENT_PROPERTY_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventProximityRecord", "GDK_EVENT_PROXIMITY_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventScrollRecord", "GDK_EVENT_SCROLL_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventSelectionRecord", "GDK_EVENT_SELECTION_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventSettingRecord", "GDK_EVENT_SETTING_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventVisibilityRecord", "GDK_EVENT_VISIBILITY_RECORD")
          [eventLocalType],
        makeStr
          ("Gdk", "EventWindowStateRecord", "GDK_EVENT_WINDOW_STATE_RECORD")
          [eventLocalType],
(*
      "GdkEventAnyRecord",
      "GdkEventButtonRecord",
      "GdkEventConfigureRecord",
      "GdkEventCrossingRecord",
      "GdkEventDNDRecord",
      "GdkEventExposeRecord",
      "GdkEventFocusRecord",
      "GdkEventGrabBrokenRecord",
      "GdkEventKeyRecord",
      "GdkEventMotionRecord",
      "GdkEventOwnerChangeRecord",
      "GdkEventPropertyRecord",
      "GdkEventProximityRecord",
      "GdkEventScrollRecord",
      "GdkEventSelectionRecord",
      "GdkEventSettingRecord",
      "GdkEventVisibilityRecord",
      "GdkEventWindowStateRecord"
*)
      (
        "ClassifyEvent",
        (
          (false, ([], [])),
          [
            "GdkEventAnyRecord",
            "GdkEventButtonRecord",
            "GdkEventConfigureRecord",
            "GdkEventCrossingRecord",
            "GdkEventDNDRecord",
            "GdkEventExposeRecord",
            "GdkEventFocusRecord",
            "GdkEventGrabBrokenRecord",
            "GdkEventKeyRecord",
            "GdkEventMotionRecord",
            "GdkEventOwnerChangeRecord",
            "GdkEventPropertyRecord",
            "GdkEventProximityRecord",
            "GdkEventScrollRecord",
            "GdkEventSelectionRecord",
            "GdkEventSettingRecord",
            "GdkEventVisibilityRecord",
            "GdkEventWindowStateRecord"
          ]
        )
      )
      ]
    end
  );
generate outDir repo ("Gtk", "3.0")
  (
    [
      makeSig "CHILD_SIGNAL",
      makeSig "STYLE_PROPERTY",
      makeSig "GTK_ACTION_ENTRY"
    ],
    [
      ("ChildSignal", ((false, ([], [])), ["GtkWidgetClass", "GtkWidget"])),
      ("StyleProperty", ((false, ([], [])), ["GtkWidgetClass"])),
      ("GtkScrolledWindow", ((false, ([], [])), ["StyleProperty"])),
      makeStr ("Gtk", "ActionEntry", "GTK_ACTION_ENTRY") [],
      ("GtkActionGroup", ((false, ([], [])), ["GtkActionEntry", "GtkAction"]))
    ]
  );
generate outDir repo ("Vte", "2.90") ([], []);


generate outDir repo ("GModule", "2.0") ([], []);
generate outDir repo ("xlib", "2.0") ([], []);
generate outDir repo ("PangoCairo", "1.0") ([], []);
generate outDir repo ("GIRepository", "2.0") ([], []);
generate outDir repo ("GtkSource", "3.0") ([], []);

