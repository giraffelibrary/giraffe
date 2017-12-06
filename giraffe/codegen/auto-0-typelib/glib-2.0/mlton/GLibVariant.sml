structure GLibVariant :>
  G_LIB_VARIANT
    where type t = GLibVariantRecord.t
    where type variant_class_t = GLibVariantClass.t
    where type variant_type_t = GLibVariantTypeRecord.t =
  struct
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    structure GUInt8CVectorType =
      CValueCVectorType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVector = CVector(GUInt8CVectorType)
    structure GLibVariantRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GLibVariantRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GLibVariantRecordCVectorN = CVectorN(GLibVariantRecordCVectorNType)
    val newArray_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_variant_new_array" :
              unit GLibVariantTypeRecord.FFI.p
               * GLibVariantRecordCVectorN.MLton.p1
               * unit GLibVariantRecordCVectorN.MLton.p2
               * GUInt64.FFI.val_
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newBoolean_ = _import "g_variant_new_boolean" : GBool.FFI.val_ -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newByte_ = _import "g_variant_new_byte" : GUInt8.FFI.val_ -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newBytestring_ = _import "mlton_g_variant_new_bytestring" : GUInt8CVector.MLton.p1 * GUInt8CVector.FFI.notnull GUInt8CVector.MLton.p2 -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newBytestringArray_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_variant_new_bytestring_array" :
              Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GInt64.FFI.val_
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newDictEntry_ = fn x1 & x2 => (_import "g_variant_new_dict_entry" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;) (x1, x2)
    val newDouble_ = _import "g_variant_new_double" : GDouble.FFI.val_ -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newHandle_ = _import "g_variant_new_handle" : GInt32.FFI.val_ -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newInt16_ = _import "g_variant_new_int16" : GInt16.FFI.val_ -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newInt32_ = _import "g_variant_new_int32" : GInt32.FFI.val_ -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newInt64_ = _import "g_variant_new_int64" : GInt64.FFI.val_ -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newMaybe_ = fn x1 & x2 => (_import "g_variant_new_maybe" : unit GLibVariantTypeRecord.FFI.p * unit GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;) (x1, x2)
    val newObjectPath_ = _import "mlton_g_variant_new_object_path" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newObjv_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_variant_new_objv" :
              Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GInt64.FFI.val_
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newSignature_ = _import "mlton_g_variant_new_signature" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newString_ = _import "mlton_g_variant_new_string" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newStrv_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_variant_new_strv" :
              Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GInt64.FFI.val_
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newTuple_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_variant_new_tuple" :
              GLibVariantRecordCVectorN.MLton.p1
               * GLibVariantRecordCVectorN.FFI.notnull GLibVariantRecordCVectorN.MLton.p2
               * GUInt64.FFI.val_
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newUint16_ = _import "g_variant_new_uint16" : GUInt16.FFI.val_ -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newUint32_ = _import "g_variant_new_uint32" : GUInt32.FFI.val_ -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newUint64_ = _import "g_variant_new_uint64" : GUInt64.FFI.val_ -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val newVariant_ = _import "g_variant_new_variant" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val byteswap_ = _import "g_variant_byteswap" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val classify_ = _import "g_variant_classify" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GLibVariantClass.FFI.val_;
    val compare_ = fn x1 & x2 => (_import "g_variant_compare" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val dupBytestring_ = fn x1 & x2 => (_import "g_variant_dup_bytestring" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> GUInt8CVectorN.FFI.notnull GUInt8CVectorN.FFI.out_p;) (x1, x2)
    val dupBytestringArray_ = fn x1 & x2 => (_import "g_variant_dup_bytestring_array" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CVectorN.FFI.notnull Utf8CVectorN.FFI.out_p;) (x1, x2)
    val dupObjv_ = fn x1 & x2 => (_import "g_variant_dup_objv" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CVectorN.FFI.notnull Utf8CVectorN.FFI.out_p;) (x1, x2)
    val dupString_ = fn x1 & x2 => (_import "g_variant_dup_string" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val dupStrv_ = fn x1 & x2 => (_import "g_variant_dup_strv" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CVectorN.FFI.notnull Utf8CVectorN.FFI.out_p;) (x1, x2)
    val equal_ = fn x1 & x2 => (_import "g_variant_equal" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getBoolean_ = _import "g_variant_get_boolean" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GBool.FFI.val_;
    val getByte_ = _import "g_variant_get_byte" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GUInt8.FFI.val_;
    val getBytestring_ = _import "g_variant_get_bytestring" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GUInt8CVector.FFI.notnull GUInt8CVector.FFI.out_p;
    val getBytestringArray_ = fn x1 & x2 => (_import "g_variant_get_bytestring_array" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CVectorN.FFI.notnull Utf8CVectorN.FFI.out_p;) (x1, x2)
    val getChildValue_ = fn x1 & x2 => (_import "g_variant_get_child_value" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GUInt64.FFI.val_ -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;) (x1, x2)
    val getDouble_ = _import "g_variant_get_double" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GDouble.FFI.val_;
    val getHandle_ = _import "g_variant_get_handle" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GInt32.FFI.val_;
    val getInt16_ = _import "g_variant_get_int16" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GInt16.FFI.val_;
    val getInt32_ = _import "g_variant_get_int32" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GInt32.FFI.val_;
    val getInt64_ = _import "g_variant_get_int64" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GInt64.FFI.val_;
    val getMaybe_ = _import "g_variant_get_maybe" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val getNormalForm_ = _import "g_variant_get_normal_form" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val getObjv_ = fn x1 & x2 => (_import "g_variant_get_objv" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CVectorN.FFI.notnull Utf8CVectorN.FFI.out_p;) (x1, x2)
    val getSize_ = _import "g_variant_get_size" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GUInt64.FFI.val_;
    val getString_ = fn x1 & x2 => (_import "g_variant_get_string" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val getStrv_ = fn x1 & x2 => (_import "g_variant_get_strv" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CVectorN.FFI.notnull Utf8CVectorN.FFI.out_p;) (x1, x2)
    val getTypeString_ = _import "g_variant_get_type_string" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUint16_ = _import "g_variant_get_uint16" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GUInt16.FFI.val_;
    val getUint32_ = _import "g_variant_get_uint32" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GUInt32.FFI.val_;
    val getUint64_ = _import "g_variant_get_uint64" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GUInt64.FFI.val_;
    val getVariant_ = _import "g_variant_get_variant" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val hash_ = _import "g_variant_hash" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GUInt32.FFI.val_;
    val isContainer_ = _import "g_variant_is_container" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GBool.FFI.val_;
    val isFloating_ = _import "g_variant_is_floating" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GBool.FFI.val_;
    val isNormalForm_ = _import "g_variant_is_normal_form" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GBool.FFI.val_;
    val isOfType_ = fn x1 & x2 => (_import "g_variant_is_of_type" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val lookupValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_variant_lookup_value" :
              GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantTypeRecord.FFI.p
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val nChildren_ = _import "g_variant_n_children" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GUInt64.FFI.val_;
    val print_ = fn x1 & x2 => (_import "g_variant_print" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GBool.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val takeRef_ = _import "g_variant_take_ref" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val isObjectPath_ = _import "mlton_g_variant_is_object_path" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val isSignature_ = _import "mlton_g_variant_is_signature" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val parse_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_variant_parse" :
              GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    type t = GLibVariantRecord.t
    type variant_class_t = GLibVariantClass.t
    type variant_type_t = GLibVariantTypeRecord.t
    fun newArray (childType, children) =
      let
        val nChildren =
          case children of
            SOME children => LargeInt.fromInt (GLibVariantRecordCVectorN.length children)
          | NONE => GUInt64.null
        val retVal =
          (
            GLibVariantTypeRecord.FFI.withOptPtr
             &&&> GLibVariantRecordCVectorN.FFI.withOptPtr
             &&&> GUInt64.FFI.withVal
             ---> GLibVariantRecord.FFI.fromPtr false
          )
            newArray_
            (
              childType
               & children
               & nChildren
            )
      in
        retVal
      end
    fun newBoolean value = (GBool.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newBoolean_ value
    fun newByte value = (GUInt8.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newByte_ value
    fun newBytestring string = (GUInt8CVector.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newBytestring_ string
    fun newBytestringArray strv =
      let
        val length = LargeInt.fromInt (Utf8CVectorN.length strv)
        val retVal = (Utf8CVectorN.FFI.withPtr &&&> GInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newBytestringArray_ (strv & length)
      in
        retVal
      end
    fun newDictEntry (key, value) = (GLibVariantRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newDictEntry_ (key & value)
    fun newDouble value = (GDouble.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newDouble_ value
    fun newHandle value = (GInt32.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newHandle_ value
    fun newInt16 value = (GInt16.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newInt16_ value
    fun newInt32 value = (GInt32.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newInt32_ value
    fun newInt64 value = (GInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newInt64_ value
    fun newMaybe (childType, child) = (GLibVariantTypeRecord.FFI.withOptPtr &&&> GLibVariantRecord.FFI.withOptPtr ---> GLibVariantRecord.FFI.fromPtr false) newMaybe_ (childType & child)
    fun newObjectPath objectPath = (Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newObjectPath_ objectPath
    fun newObjv strv =
      let
        val length = LargeInt.fromInt (Utf8CVectorN.length strv)
        val retVal = (Utf8CVectorN.FFI.withPtr &&&> GInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newObjv_ (strv & length)
      in
        retVal
      end
    fun newSignature signature' = (Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newSignature_ signature'
    fun newString string = (Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newString_ string
    fun newStrv strv =
      let
        val length = LargeInt.fromInt (Utf8CVectorN.length strv)
        val retVal = (Utf8CVectorN.FFI.withPtr &&&> GInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newStrv_ (strv & length)
      in
        retVal
      end
    fun newTuple children =
      let
        val nChildren = LargeInt.fromInt (GLibVariantRecordCVectorN.length children)
        val retVal = (GLibVariantRecordCVectorN.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newTuple_ (children & nChildren)
      in
        retVal
      end
    fun newUint16 value = (GUInt16.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newUint16_ value
    fun newUint32 value = (GUInt32.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newUint32_ value
    fun newUint64 value = (GUInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newUint64_ value
    fun newVariant value = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newVariant_ value
    fun byteswap self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) byteswap_ self
    fun classify self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantClass.FFI.fromVal) classify_ self
    fun compare self two = (GLibVariantRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> GInt32.FFI.fromVal) compare_ (self & two)
    fun dupBytestring self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && GUInt8CVectorN.FFI.fromPtr 1) dupBytestring_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun dupBytestringArray self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2) dupBytestringArray_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun dupObjv self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2) dupObjv_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun dupString self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8.FFI.fromPtr 1) dupString_ (self & GUInt64.null)
      in
        (retVal, length)
      end
    fun dupStrv self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2) dupStrv_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun equal self two = (GLibVariantRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & two)
    fun getBoolean self = (GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) getBoolean_ self
    fun getByte self = (GLibVariantRecord.FFI.withPtr ---> GUInt8.FFI.fromVal) getByte_ self
    fun getBytestring self = (GLibVariantRecord.FFI.withPtr ---> GUInt8CVector.FFI.fromPtr 0) getBytestring_ self
    fun getBytestringArray self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 1) getBytestringArray_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getChildValue self index = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr true) getChildValue_ (self & index)
    fun getDouble self = (GLibVariantRecord.FFI.withPtr ---> GDouble.FFI.fromVal) getDouble_ self
    fun getHandle self = (GLibVariantRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getHandle_ self
    fun getInt16 self = (GLibVariantRecord.FFI.withPtr ---> GInt16.FFI.fromVal) getInt16_ self
    fun getInt32 self = (GLibVariantRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getInt32_ self
    fun getInt64 self = (GLibVariantRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getInt64_ self
    fun getMaybe self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getMaybe_ self
    fun getNormalForm self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getNormalForm_ self
    fun getObjv self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 1) getObjv_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getSize self = (GLibVariantRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) getSize_ self
    fun getString self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8.FFI.fromPtr 0) getString_ (self & GUInt64.null)
      in
        (retVal, length)
      end
    fun getStrv self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 1) getStrv_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getTypeString self = (GLibVariantRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTypeString_ self
    fun getUint16 self = (GLibVariantRecord.FFI.withPtr ---> GUInt16.FFI.fromVal) getUint16_ self
    fun getUint32 self = (GLibVariantRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) getUint32_ self
    fun getUint64 self = (GLibVariantRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) getUint64_ self
    fun getVariant self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getVariant_ self
    fun hash self = (GLibVariantRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) hash_ self
    fun isContainer self = (GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) isContainer_ self
    fun isFloating self = (GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) isFloating_ self
    fun isNormalForm self = (GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) isNormalForm_ self
    fun isOfType self type' = (GLibVariantRecord.FFI.withPtr &&&> GLibVariantTypeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isOfType_ (self & type')
    fun lookupValue self (key, expectedType) =
      (
        GLibVariantRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantTypeRecord.FFI.withOptPtr
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        lookupValue_
        (
          self
           & key
           & expectedType
        )
    fun nChildren self = (GLibVariantRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) nChildren_ self
    fun print self typeAnnotate = (GLibVariantRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> Utf8.FFI.fromPtr 1) print_ (self & typeAnnotate)
    fun takeRef self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) takeRef_ self
    fun isObjectPath string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) isObjectPath_ string
    fun isSignature string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) isSignature_ string
    fun parse
      (
        type',
        text,
        limit,
        endptr
      ) =
      (
        GLibVariantTypeRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        parse_
        (
          type'
           & text
           & limit
           & endptr
           & []
        )
  end
