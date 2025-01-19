(* General purpose support for constructing concrete syntax
 *
 * This support embeds certain conventions:
 *   - a spec or dec in a list is not terminated by a semicolon
 *)


(* `toList1` and `toList2` are for convenience when constructing non-empty
 * lists.  They are intended to be applied only to literal list expressions.
 *)

fun toList1 xs =
  case xs of
    x :: xs => (x, xs)
  | []      => raise Empty

fun toList2 xs =
  case xs of
    x :: xs1 => (x, toList1 xs1)
  | []       => raise Empty

fun getList1 (xs, x) =
  case xs of
    x :: xs => (x, xs)
  | []      => (x, [])

fun hd1 (x, _) = x
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

fun mkIntConstExp n : exp = ExpConst (ConstInt (n, NONE))
fun mkWordConstExp n : exp = ExpConst (ConstWord (n, NONE))
fun mkStringConstExp s : exp = ExpConst (ConstString s)

fun mkIdVarAPat id : apat = APatVar (NameId id)

fun mkParenAPat p = APatParen (toList1 [p])
fun mkTupleAPat1 aps1 =
  case aps1 of
    (ap, []) => ap
  | _        => APatParen (map1 PatA aps1)

fun mkIdAsFPat id = FPatAs (id, NONE)

fun mkIdVarPat id : pat = PatA (mkIdVarAPat id)
fun mkConstPat const : pat = PatA (APatConst const)

fun mkParenPat p = PatA (mkParenAPat p)
fun mkTuplePat1 ps1 =
  case ps1 of
    (p, []) => p
  | _       => PatA (APatParen ps1)
fun mkTuplePat2 ps2 = PatA (APatParen (cons1 ps2))

val unitAPat = APatConst ConstUnit
val unitPat = PatA unitAPat

fun mkParenExp e = ExpParen (toList1 [e])
fun mkTupleExp1 es1 =
  case es1 of
    (e, []) => e
  | _       => ExpParen es1
fun mkTupleExp2 es2 = ExpParen (cons1 es2)

val unitExp = ExpConst ConstUnit

fun mkRevAppExp (e2, e1) = ExpApp (e1, e2)

(* `mkMLtonImportExp (functionSymbol, attrIds) (parTys, retTy)` constructs a
 * MLton low-level function call expression as follows:
 *
 *   _import "<functionSymbol>" <attrs[1]> ... <attrs[M]> : <ty>;
 *
 * where
 *
 *   M is `length attrIds`
 *
 *
 *   attrs[i], 0 < i <= M, is a variant that includes attrIds[i] only for
 *     releases in which it is available - see comments below for details
 *
 *
 *   N is `length parTys`
 *
 *
 *   ty is
 *
 *     <parTy[1]> * ... * <parTy[N]> -> <retTy>
 *
 *       if N >= 1
 *
 *
 *     unit -> <retTy>
 *
 *       if N = 0
 *)
fun mkMLtonImportExp (functionSymbol, attrIds) (parTys, retTy) =
  let
    fun attrVariant attrId =
      case attrId of

        (* other attributes are available in all supported releases *)
        _                  => Variant.default (SOME attrId)

    val attrs = map attrVariant attrIds
  in
    ExpMLtonImport (functionSymbol, attrs, TyFun (mkProdTy0 parTys, retTy))
  end

fun mkTypeSpec (id, optTy) = SpecType (false, toList1 [(id, optTy)])
fun mkEqTypeSpec (id, optTy) = SpecType (true, toList1 [(id, optTy)])
fun mkValSpec (id, ty) : spec = SpecVal (toList1 [(id, ty)])
fun mkExnSpec (id, optTy) : spec = SpecExn (toList1 [(id, optTy)])

fun mkSigSpec specs : sig1 = SigSpec (mkSpecs specs)
fun mkBodyStruct strDecs : struct1 = StructBody (mkStrDecs strDecs)
fun mkNameStruct ids : struct1 = StructName (toList1 ids)
fun mkInstStruct (id, struct1) : struct1 = StructInst (id, FunArgStruct struct1)

fun mkStrDecsFunArg strDecs : funarg = FunArgStrDec (mkStrDecs strDecs)
fun mkStructFunArg struct1 : funarg = FunArgStruct struct1

fun mkStructStrDec (id, struct1) = StrDecStruct (toList1 [(id, NONE, struct1)])

fun mkModuleTopLevelDec module : topleveldec = TopLevelDecModule (module, false)




val boolId : id = "bool"
val boolTy = mkIdTy boolId
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
fun listTy ty = TyRef ([ty], toList1 ["list"])
fun vectorTy ty = TyRef ([ty], toList1 ["vector"])

val noneId : id = "NONE"
val someId : id = "SOME"
val noneExp : exp = mkIdLNameExp noneId
local
  val someIdExp : exp = mkIdLNameExp someId
in
  fun someExp (e : exp) : exp =
    let
      val e' =
        case e of
          ExpApp _ => mkParenExp e
        | _        => e
    in
      ExpApp (someIdExp, e')
    end
end





(* `mkIdFunDec (id, apats, exp)` constructs a single fun binding that
 * as follows:
 *
 *   fun <id> <apat[1]> ... <apat[n]> = <exp>
 *)

fun mkIdFunDec (id, apats1, exp) =
  DecFun (
    [],
    toList1 [
      toList1 [(FunHeadPrefix (NameId id, apats1), NONE, exp)]
    ]
  )

(* `mkPatValDec (pat, exp)` constructs a single val binding that
 * as follows:
 *
 *   val <pat> = <exp>
 *)

fun mkPatValDec (pat, exp) = DecVal (toList1 [([], false, pat, exp)])

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
    fun mkValDec exp = mkPatValDec (mkIdVarPat id, exp)
  in
    if List.exists (fn x => x = id) (!constructorNames)
    then
      let
        val funDec = mkIdFunDec (id, toList1 [unitAPat], exp)
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
val idId : id = "id"
val fnStrId : id = "Fn"
val fnIdExp : exp = mkLIdLNameExp [fnStrId, idId]

val falseId : id = "false"
val falseExp = mkIdLNameExp falseId

val mapId : id = "map"
val mapIdExp : exp = mkIdLNameExp mapId

val oId : id = "o"

val flagsStrId = "Flags"

val optionStrId : id = "Option"

val pairId : id = "pair"
fun pairTy (ty1, ty2) : ty = TyRef ([ty1, ty2], toList1 [pairId])

val valId : id = "val_"
val refId : id = "ref_"
val selfId : id = "self"
val selfExp : exp = mkIdLNameExp selfId
val ignoreId : id = "ignore"
val flagsId : id = "flags"
val nullId : id = "null"
val cStrId : id = "C"
val gStrId : id = "G"
val nStrId : id = "N"
val ptrStrId : id = "Ptr"
val ffiStrId : id = "FFI"
val largeIntStrId : id = "LargeInt"
val wordStrId : id = "Word"
val word8StrId : id = "Word8"
val word8VectorStrId : id = "Word8Vector"
val toIntId : id = "toInt"
val fromIntId : id = "fromInt"
val fromLargeIntId : id = "fromLargeInt"
val lengthId : id = "length"
val utf8StrId : id = "Utf8"
val intId : id = "int"
val wordId : id = "word"
val charId : id = "char"
val realId : id = "real"
val vectorId : id = "vector"
val stringId : id = "string"
val arrayStrId : id = "Array"
val cArrayStrId : id = cStrId ^ arrayStrId
val cArrayNStrId : id = cArrayStrId ^ nStrId
val typeStrId : id = "Type"
val cValueStrId : id = "CValue"
val cPointerStrId : id = "CPointer"
val gMemoryStrId : id = "GMemory"
val valueTypeStrId : id = "ValueType"
val pointerTypeStrId : id = "PointerType"
val arrayTypeStrId : id = "ArrayType"
val vectorFFIArrayStrId : id = "VectorFFIArray"
val withValId : id = "withVal"
val withRefValId : id = "withRefVal"
val fromValId : id = "fromVal"
val callId : id = "call"
val callIdExp : exp = mkIdLNameExp callId
val convId : id = "conv"

val valTyName : tyname = ([], valId)
val refTyName : tyname = ([], refId)

val valTy : ty = mkIdTy valId
val refTy : ty = mkIdTy refId
val flagsTy : ty = mkIdTy flagsId

val fId : id = "f"
val fExp : exp = mkIdLNameExp fId
val classId : id = "class"
val unionId : id = "union"
val recordStrId : id = "Record"
val valueStrId : id = "Value"
val pointerStrId : id = "Pointer"
val tId : id = "t"
fun classTy ty : ty = TyRef ([ty], toList1 [classId])
fun tTy ty : ty = TyRef ([ty], toList1 [tId])
fun classTyName tyVar : tyname = ([tyVar], classId)
fun classTyLName tyVar : tylname = ([tyVar], toList1 [classId])
val tTyName : tyname = ([], tId)
val tTyLName : tylname = ([], toList1 [tId])
val tOptId : id = "tOpt"
val aId : id = "a"
val bId : id = "b"
val aTyVar : tyvar = (false, aId)
val bTyVar : tyvar = (false, bId)
val aVarTy : ty = TyVar aTyVar
val bVarTy : ty = TyVar bTyVar
val ptrId : id = "p"
val ptrLId : lid = toList1 [ptrId]
val optId : id = "opt"
val optStrId : id = "Opt"
val nonOptId : id = "non_opt"
val cOptLId : lid = toList1 ["C", optId]
val cNonOptLId : lid = toList1 ["C", nonOptId]
val optTyName : tyname = ([], optId)
val nonOptTyName : tyname = ([], nonOptId)
val optTy : ty = mkIdTy optId
val nonOptTy : ty = mkIdTy nonOptId
fun prefixOptTy prefixIds = TyRef ([], toList1 (prefixIds @ [optId]))
fun prefixNonOptTy prefixIds = TyRef ([], toList1 (prefixIds @ [nonOptId]))
fun ptrTyName (tyVar : tyvar) : tyname = ([tyVar], ptrId)
fun ptrTy (varTy : ty) : ty = TyRef ([varTy], ptrLId)
fun prefixPtrTy prefixIds (varTy : ty) = TyRef ([varTy], toList1 (prefixIds @ [ptrId]))
val withPtrId : id = "withPtr"
val withOptPtrId : id = "withOptPtr"
val fromPtrId : id = "fromPtr"
val fromOptPtrId : id = "fromOptPtr"
val touchPtrId : id = "touchPtr"
val beforeId : id = "before"
val baseId : id = "base"
val baseTy = mkIdTy baseId
val toBaseId : id = "toBase"
val objId : id = "obj"
val cPtrLId : lid = toList1 ["C", "p"]
val cOptptrLId : lid = toList1 ["C", "optptr"]

val retValId : id = "retVal"
val retValIdPat : pat = mkIdVarPat retValId
val retValIdExp : exp = mkIdLNameExp retValId

val errorId : id = "error"
val errorStrId : id = "Error"
val errorExnId : id = errorStrId
val handleErrorId : id = "handleError"
val handlerId : id = "handler"
val errorHandlerId : id = "error_handler"
val errorHandlerTyName : tyname = ([], errorHandlerId)
val errorHandlerTyLName : tylname = ([], toList1 [errorHandlerId])
val makeHandlerId : id = "makeHandler"

val giraffeId : id = "giraffe"
val newId : id = "new"
val newUId : id = newId ^ "_"
val memcpyId = "memcpy"
val memcpyUId = memcpyId ^ "_"
val copyId : id = "copy"
val copyUId : id = copyId ^ "_"
val dupId : id = "dup"
val dupUId : id = dupId ^ "_"
val takeId : id = "take"
val takeUId : id = takeId ^ "_"
val clearId : id = "clear"
val clearUId : id = clearId ^ "_"
val freeId : id = "free"
val freeUId : id = freeId ^ "_"
val sizeId : id = "size"
val sizeUId : id = sizeId ^ "_"

val getTypeId : id = "getType"
val getTypeUId : id = getTypeId ^ "_"
val getTypeNameId : id = "getTypeName"
val getTypeNameUId : id = getTypeNameId ^ "_"
val getValueId : id = "getValue"
val getValueUId : id = getValueId ^ "_"
val getOptValueId : id = "getOptValue"
val getOptValueUId : id = getOptValueId ^ "_"
val setValueId : id = "setValue"
val setValueUId : id = setValueId ^ "_"
val setOptValueId : id = "setOptValue"
val setOptValueUId : id = setOptValueId ^ "_"

val signalId : id = "signal"
val signalExp : exp = mkIdLNameExp signalId

val marshallerId : id = "marshaller"
val marshallerIdExp : exp = mkIdLNameExp marshallerId
val hConvId : id = "hConv"
val hConvIdExp : exp = mkIdLNameExp hConvId
val eConvId : id = "eConv"
val eConvIdExp : exp = mkIdLNameExp eConvId
val makeCallbackId : id = "makeCallback"
val makeCallbackIdExp : exp = mkIdLNameExp makeCallbackId

(* Construct signal marshaller with the form:
 *
 *   fn () =>
 *     {
 *       h = makeCallback marshaller o hConv,
 *       e = eConv o call marshaller
 *     }
 *)
val signalMarshallerExp =
  let
    val hExp =
      ExpInfixApp (
        ExpApp (makeCallbackIdExp, marshallerIdExp),
        "o",
        hConvIdExp
      )
    val eExp =
      ExpInfixApp (
        eConvIdExp,
        "o",
        ExpApp (callIdExp, marshallerIdExp)
      )
    val recordExp =
      ExpRec [
        ("h", hExp),
        ("e", eExp)
      ]
  in
    ExpFn (toList1 [(unitPat, recordExp)])
  end

val parInstId : id = "parInst"
val parInId : id = "parIn"
val parOutId : id = "parOut"
val parInstIdExp : exp = mkIdLNameExp parInstId
val parInIdExp : exp = mkIdLNameExp parInId
val parOutIdExp : exp = mkIdLNameExp parOutId

val voidId : id = "void"
val retId : id = "ret"
val retVoidId : id = "retVoid"
val voidIdExp : exp = mkIdLNameExp voidId
val retIdExp : exp = mkIdLNameExp retId
val retVoidIdExp : exp = mkIdLNameExp retVoidId

val fieldStrId : id = "Field"
val fieldTypeStrId : id = "FieldType"
val containerStrId : id = "Container"
val valueFieldTypeStrId : id = "ValueFieldType"
val pointerFieldTypeStrId : id = "PointerFieldType"
val pointerNFieldTypeStrId : id = "PointerNFieldType"
val offsetId : id = "offset"

val propertyId : id = "property"
val propertyStrId : id = "Property"
val valueAccessorStrId : id = "ValueAccessor"
val gtypeId : id = "gtype"
val getId : id = "get"
val setId : id = "set"
val cGtypeExp : exp = mkLIdLNameExp [cStrId, gtypeId]
val cGetExp : exp = mkLIdLNameExp [cStrId, getId]
val cSetExp : exp = mkLIdLNameExp [cStrId, setId]
val nameId : id = "name"
val initId : id = "init"



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
  StrDecStruct (toList1 [("C", NONE, mkBodyStruct strDecs)])



(* PolyML-specific reusable components *)

val polyMLFFIStrId : id = "PolyMLFFI"
val getSymbolId : id = "getSymbol"
val externalFunctionSymbolId : id = "externalFunctionSymbol"

val polyMLStrId : id = "PolyML"
val cValId : id = "cVal"
val cRefId : id = "cRef"
val cPtrId : id = "cPtr"
val cVoidId : id = "cVoid"

val cVoidConv = mkIdLNameExp cVoidId


val cValTy : ty = TyRef ([], toList1 [ffiStrId, valId])
val cRefTy : ty = TyRef ([], toList1 [ffiStrId, refId])

fun mkConversionTy ty = TyRef ([ty], toList1 [polyMLFFIStrId, "conversion"])



(*
 *     structure PolyML :
 *       sig
 *         <specs>
 *       end
 *)
fun mkPolyMLStructSpec specs : spec =
  SpecStruct (toList1 [(polyMLStrId, (mkSigSpec specs, []))])

(*
 *     structure PolyML =
 *       struct
 *         <strDecs>
 *       end
 *)
fun mkPolyMLStructStrDec strDecs : strdec =
  StrDecStruct (toList1 [(polyMLStrId, NONE, mkBodyStruct strDecs)])
