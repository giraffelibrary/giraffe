(* --------------------------------------------------------------------------
 * Flags/Enum common functions
 * -------------------------------------------------------------------------- *)

val tTy : ty = mkIdTy tId
val tTyName : tyname = ([], tId)

fun getFlagsWordConst valueInfo =
  let
    val w = LargeInt.mod (ValueInfo.getValueWord valueInfo, IntInf.pow (2, 32))
    (*
     * Would have used the following but Word32.fromLargeInt does not produce
     * the correct result for negative arguments.
    val w =
      Word32.toLargeInt (Word32.fromLargeInt (ValueInfo.getValueWord valueInfo))
     *)
  in
    ConstWord (IntInf.fromLarge w, NONE)
  end

fun getEnumIntConst valueInfo =
  let
    val n = ValueInfo.getValueInt valueInfo
  in
    ConstInt (IntInf.fromLarge n, NONE)
  end

fun getValueNameId valueInfo = toUCU (fixFlagsEnumValueName (getName valueInfo))

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

fun addFlagsEnumMethodSpecs repo vers enumIRef =
  revFoldMapInfosWithExcls
    EnumInfo.getNMethods
    EnumInfo.getMethod
    (makeFunctionSpec repo vers (SOME enumIRef))

fun addFlagsEnumMethodStrDecsLowLevel
  isPolyML
  repo
  vers
  addInitStrDecs
  enumIRef =
  addFunctionStrDecsLowLevel
    (EnumInfo.getNMethods, EnumInfo.getMethod)
    isPolyML
    repo
    vers
    addInitStrDecs
    (SOME enumIRef)

fun addFlagsEnumMethodStrDecsHighLevel repo vers (enumInfo, enumIRef) =
  revFoldMapInfosWithExcls
    EnumInfo.getNMethods
    EnumInfo.getMethod
    (makeFunctionStrDecHighLevel repo vers (SOME (enumInfo, enumIRef)))

(*
 *     structure PolyML :                            -.
 *       sig                                          |
 *         val cVal : FFI.val_ PolyMLFFI.conversion   | Poly/ML only
 *         val cRef : FFI.ref_ PolyMLFFI.conversion   |
 *       end                                         -'
 *)
val structPolyMLSpec =
  mkPolyMLStructSpec [
    SpecVal (toList1 [(cValId, mkConversionTy cValTy)]),
    SpecVal (toList1 [(cRefId, mkConversionTy cRefTy)])
  ]
