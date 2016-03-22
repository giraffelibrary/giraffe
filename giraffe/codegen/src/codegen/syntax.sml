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
fun mkTyExnDec (name, optTy) : dec = DecExn (toList1 [(name, ExnDecTypeOf optTy)])
fun mkEqExnDec (name, lname) : dec = DecExn (toList1 [(name, ExnDecTypeEq lname)])
(* See below for `mkIdValDec` that works around constructor names. *)


fun mkLIdLNameExp lid : exp = ExpLName (LNameId (toList1 lid))
fun mkIdLNameExp id : exp = mkLIdLNameExp [id]
fun mkOpLNameExp infixOp : exp = ExpLName (LNameOp infixOp)

fun mkIdVarAPat id : apat = APatVar (NameId id)

fun mkIdVarPat id : pat = PatA (mkIdVarAPat id)
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





(* Shared library file names vary between systems.  The following formats are
 * expected for a library called <name> with an optional compatibility
 * version number <version>.  <version> is one or more digits.  <name> may
 * contain the characters '-' and '.', for example "gtk-3.0".
 *
 *                     with version                without version
 *
 *   Linux, BSD etc.   <name>.so.<version>         <name>.so
 *   Darwin            <name>.<version>.dylib      <name>.dylib
 *   MinGW             <name>-<version>.dll        <name>.dll
 *
 * For MinGW, see the file listing here:
 * http://www.tarnyko.net/repo/gtk3_build_system/tutorial/gtk3_tutorial.htm
 *)

(* `getSharedLibraryId repo vers namespace` returns an SML identifier for use
 * as a reference to the shared library name.
 *)
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
  fun getSharedLibraryId repo vers =
    getLibId o getSharedLibraryFileName repo vers
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
    fun mkValDec exp = DecVal (toList1 [([], false, mkIdVarPat id, exp)])
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
              toList1 [(FunHeadPrefix (NameId id, toList1 [unitPat]), NONE, exp)]
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
val nullId : id = "null"
val CId : id = "C"
val FFIId : id = "FFI"
val utf8StrId : id = "Utf8"
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
val classId : id = "class"
val tId : id = "t"
fun classTy ty : ty = TyRef ([ty], toList1 [classId])
fun tTy ty : ty = TyRef ([ty], toList1 [tId])
fun classTyName tyVar : tyname = ([tyVar], classId)
fun classTyLName tyVar : tylname = ([tyVar], toList1 [classId])
val tTyName : tyname = ([], tId)
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

val errorId : id = "error"
val errorStrId : id = "Error"
val errorExnId : id = errorStrId
val handleErrorId : id = "handleError"
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

val PolyMLFFIId : id = "PolyMLFFI"
val callId : id = "call"
val loadSymId : id = "load_sym"
val loadLibId : id = "load_lib"

val PolyMLId : id = "PolyML"
val cValId : id = "cVal"
val cRefId : id = "cRef"
val cVoidId : id = "cVoid"

val cVoidConv = mkLIdLNameExp [FFIId, PolyMLId, cVoidId]


val cValTy : ty = TyRef ([], toList1 [CId, valId])
val cRefTy : ty = TyRef ([], toList1 [CId, refId])

fun mkConversionTy ty = TyRef ([ty], toList1 [PolyMLFFIId, "conversion"])



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
