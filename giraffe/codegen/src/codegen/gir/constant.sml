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
  repo
  vers
  (constantInfo, (iRefs, excls))
  : spec * ((interfaceref list * interfaceref list) * info_excl_hier list) =
  let
    val () = checkDeprecated constantInfo

    val () = checkConstantName repo vers constantInfo

    val constantName = getName constantInfo
    val constantNameId = mkConstantNameId constantName

    fun notExpected s = infoExcl ("type " ^ s ^ " not expected")
    fun notSupported s = infoExcl ("type " ^ s ^ " not supported")

    val boolRefTy = ([], toList1 ["bool"])
    val charRefTy = ([], toList1 ["char"])
    val largeIntRefTy = ([], toList1 ["LargeInt", "int"])
    val realRefTy = ([], toList1 ["real"])
    val stringRefTy = ([], toList1 ["string"])

    val value = ConstantInfo.getValue constantInfo
    open Argument
    val constantTy = TyRef (
      case value of
        BOOLEAN _    => boolRefTy
      | CHAR _       => charRefTy                   (* GIR only *)
      | UCHAR _      => charRefTy                   (* GIR only *)
      | INT _        => largeIntRefTy               (* GIR only *)
      | UINT _       => largeIntRefTy               (* GIR only *)
      | SHORT _      => largeIntRefTy               (* GIR only *)
      | USHORT _     => largeIntRefTy               (* GIR only *)
      | LONG _       => largeIntRefTy               (* GIR only *)
      | ULONG _      => largeIntRefTy               (* GIR only *)
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
      | SIZE _       => largeIntRefTy               (* GIR only *)
      | SSIZE _      => largeIntRefTy               (* GIR only *)
      | OFFSET       => notExpected "OFFSET"        (* GIR only *)
      | INTPTR       => notExpected "INTPTR"        (* GIR only *)
      | UINTPTR      => notExpected "UINTPTR"       (* GIR only *)
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
      | CHAR c       => ExpConst (ConstChar c)         (* GIR only *)
      | UCHAR c      => ExpConst (ConstChar c)         (* GIR only *)
      | INT n        => ExpConst (ConstInt (n, NONE))  (* GIR only *)
      | UINT n       => ExpConst (ConstInt (n, NONE))  (* GIR only *)
      | SHORT n      => ExpConst (ConstInt (n, NONE))  (* GIR only *)
      | USHORT n     => ExpConst (ConstInt (n, NONE))  (* GIR only *)
      | LONG n       => ExpConst (ConstInt (n, NONE))  (* GIR only *)
      | ULONG n      => ExpConst (ConstInt (n, NONE))  (* GIR only *)
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
      | SIZE n       => ExpConst (ConstInt (n, NONE))  (* GIR only *)
      | SSIZE n      => ExpConst (ConstInt (n, NONE))  (* GIR only *)
      | OFFSET       => notExpected "OFFSET"           (* GIR only *)
      | INTPTR       => notExpected "INTPTR"           (* GIR only *)
      | UINTPTR      => notExpected "UINTPTR"          (* GIR only *)
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
