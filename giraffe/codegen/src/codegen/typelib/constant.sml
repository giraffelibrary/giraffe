(* --------------------------------------------------------------------------
 * Constant
 * -------------------------------------------------------------------------- *)

(* Constant names to be skipped *)

(* Manually specified names *)
val excludedConstantNames : string list nvs_list ref = ref []
val excludedConstantNamePrefixes : string list nvs_list ref = ref []
val excludedConstantNameSuffixes : string list nvs_list ref = ref []

fun checkConstantName repo vers constantInfo =
  let
    val name = getName constantInfo
    val namespace = BaseInfo.getNamespace constantInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
    fun check p =
      List.exists (
        fn (nvs, xs) =>
          List.exists (fn x => x = nv) nvs andalso List.exists p xs
      )
    fun infoExclConstantName match =
      infoExcl (concat ["constant excluded by configuration (", match, ")"])
  in
    if check (fn x => x = name) (!excludedConstantNames)
    then infoExclConstantName "excludedConstantNames"
    else if
      check (fn x => String.isPrefix x name)
        (!excludedConstantNamePrefixes)
    then
      infoExclConstantName "excludedConstantNamePrefixes"
    else if
      check (fn x => String.isSuffix x name)
        (!excludedConstantNameSuffixes)
    then
      infoExclConstantName "excludedConstantNameSuffixes"
    else ()
  end


(* For constant names, we must preserve the case from the GIR file beacause
 * the names of upper- and lowercase variants of a Gdk key constant are
 * usually distinguished only by case.  For example, "KEY_A" and "KEY_a".
 *)
fun mkConstantNameId constantName = mkId constantName


(* Specification *)

fun makeConstantSpec
  repo
  vers
  (constantInfo, (iRefs, excls))
  : spec * (interfaceref list * info_excl_hier list) =
  let
    val () = checkDeprecated constantInfo

    val () = checkConstantName repo vers constantInfo

    val constantName = getName constantInfo
    val constantNameId = mkConstantNameId constantName

    fun notExpected s = infoExcl ("type " ^ s ^ " not expected")
    fun notSupported s = infoExcl ("type " ^ s ^ " not supported")

    val boolRefTy = ([], toList1 ["bool"])
    val largeIntRefTy = ([], toList1 ["LargeInt", "int"])
    val realRefTy = ([], toList1 ["real"])
    val stringRefTy = ([], toList1 ["string"])

    val value = ConstantInfo.getValue constantInfo
    open Argument
    val constantTy = TyRef (
      case value of
        BOOLEAN _    => boolRefTy
      | INT8 _       => largeIntRefTy
      | UINT8 _      => largeIntRefTy
      | INT16 _      => largeIntRefTy
      | UINT16 _     => largeIntRefTy
      | INT32 _      => largeIntRefTy
      | UINT32 _     => largeIntRefTy
      | INT64 _      => largeIntRefTy
      | UINT64 _     => largeIntRefTy
      | FLOAT _      => realRefTy
      | DOUBLE _     => realRefTy
      | UTF8 _       => stringRefTy
      | FILENAME _   => stringRefTy
      | VOID         => notExpected "VOID"
      | GTYPE        => notExpected "GTYPE"
      | ARRAY        => notSupported "ARRAY"
      | INTERFACE    => notExpected "INTERFACE"
      | GLIST        => notSupported "GLIST"
      | GSLIST       => notSupported "GSLIST"
      | GHASH        => notExpected "GHASH"
      | ERROR        => notExpected "ERROR"
      | UNICHAR      => notSupported "UNICHAR"
    )

    val iRefs'1 = iRefs
  in
    (mkValSpec (constantNameId, constantTy), (iRefs'1, excls))
  end


(* Declaration *)

fun makeConstantStrDec
  repo
  vers
  (constantInfo, ((iRefs, structs), excls))
  : strdec * ((interfaceref list * struct1 ListDict.t) * info_excl_hier list) =
  let
    val () = checkDeprecated constantInfo

    val () = checkConstantName repo vers constantInfo

    val constantName = getName constantInfo
    val constantNameId = mkConstantNameId constantName

    fun notExpected s = infoExcl ("constant type " ^ s ^ " not expected")
    fun notSupported s = infoExcl ("constant type " ^ s ^ " not supported")

    val value = ConstantInfo.getValue constantInfo
    open Argument
    val constantExp =
      case value of
        BOOLEAN b    => mkIdLNameExp (Bool.toString b)
      | INT8 n       => ExpConst (ConstInt (n, NONE))
      | UINT8 n      => ExpConst (ConstInt (n, NONE))
      | INT16 n      => ExpConst (ConstInt (n, NONE))
      | UINT16 n     => ExpConst (ConstInt (n, NONE))
      | INT32 n      => ExpConst (ConstInt (n, NONE))
      | UINT32 n     => ExpConst (ConstInt (n, NONE))
      | INT64 n      => ExpConst (ConstInt (n, NONE))
      | UINT64 n     => ExpConst (ConstInt (n, NONE))
      | FLOAT x      => ExpConst (ConstReal x)
      | DOUBLE x     => ExpConst (ConstReal x)
      | UTF8 s       => ExpConst (ConstString s)
      | FILENAME s   => ExpConst (ConstString s)
      | VOID         => notExpected "VOID"
      | GTYPE        => notExpected "GTYPE"
      | ARRAY        => notSupported "ARRAY"
      | INTERFACE    => notExpected "INTERFACE"
      | GLIST        => notSupported "GLIST"
      | GSLIST       => notSupported "GSLIST"
      | GHASH        => notExpected "GHASH"
      | ERROR        => notExpected "ERROR"
      | UNICHAR      => notSupported "UNICHAR"

    val iRefs'1 = iRefs
  in
    (
      StrDecDec (mkIdValDec (constantNameId, constantExp)),
      ((iRefs'1, structs), excls)
    )
  end
