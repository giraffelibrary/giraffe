structure GLibVariant :>
  G_LIB_VARIANT
    where type t = GLibVariantRecord.t
    where type variant_record_c_ptr_array_n_t = GLibVariantRecordCPtrArrayN.t
    where type variant_class_t = GLibVariantClass.t
    where type bytes_t = GLibBytesRecord.t
    where type variant_type_t = GLibVariantTypeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val newArray_ =
        call (getSymbol "g_variant_new_array")
          (
            GLibVariantTypeRecord.PolyML.cOptPtr
             &&> GLibVariantRecordCPtrArrayN.PolyML.cInOptPtr
             &&> GUInt64.PolyML.cVal
             --> GLibVariantRecord.PolyML.cPtr
          )
      val newBoolean_ = call (getSymbol "g_variant_new_boolean") (GBool.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newByte_ = call (getSymbol "g_variant_new_byte") (GUInt8.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newBytestring_ = call (getSymbol "g_variant_new_bytestring") (GUInt8CArray.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val newBytestringArray_ = call (getSymbol "g_variant_new_bytestring_array") (Utf8CPtrArrayN.PolyML.cInPtr &&> GInt64.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newDictEntry_ = call (getSymbol "g_variant_new_dict_entry") (GLibVariantRecord.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val newDouble_ = call (getSymbol "g_variant_new_double") (GDouble.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newFromBytes_ =
        call (getSymbol "g_variant_new_from_bytes")
          (
            GLibVariantTypeRecord.PolyML.cPtr
             &&> GLibBytesRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> GLibVariantRecord.PolyML.cPtr
          )
      val newHandle_ = call (getSymbol "g_variant_new_handle") (GInt32.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newInt16_ = call (getSymbol "g_variant_new_int16") (GInt16.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newInt32_ = call (getSymbol "g_variant_new_int32") (GInt32.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newInt64_ = call (getSymbol "g_variant_new_int64") (GInt64.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newMaybe_ = call (getSymbol "g_variant_new_maybe") (GLibVariantTypeRecord.PolyML.cOptPtr &&> GLibVariantRecord.PolyML.cOptPtr --> GLibVariantRecord.PolyML.cPtr)
      val newObjectPath_ = call (getSymbol "g_variant_new_object_path") (Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val newObjv_ = call (getSymbol "g_variant_new_objv") (Utf8CPtrArrayN.PolyML.cInPtr &&> GInt64.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newSignature_ = call (getSymbol "g_variant_new_signature") (Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val newString_ = call (getSymbol "g_variant_new_string") (Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val newStrv_ = call (getSymbol "g_variant_new_strv") (Utf8CPtrArrayN.PolyML.cInPtr &&> GInt64.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newTuple_ = call (getSymbol "g_variant_new_tuple") (GLibVariantRecordCPtrArrayN.PolyML.cInPtr &&> GUInt64.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newUint16_ = call (getSymbol "g_variant_new_uint16") (GUInt16.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newUint32_ = call (getSymbol "g_variant_new_uint32") (GUInt32.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newUint64_ = call (getSymbol "g_variant_new_uint64") (GUInt64.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val newVariant_ = call (getSymbol "g_variant_new_variant") (GLibVariantRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val byteswap_ = call (getSymbol "g_variant_byteswap") (GLibVariantRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val checkFormatString_ =
        call (getSymbol "g_variant_check_format_string")
          (
            GLibVariantRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val classify_ = call (getSymbol "g_variant_classify") (GLibVariantRecord.PolyML.cPtr --> GLibVariantClass.PolyML.cVal)
      val compare_ = call (getSymbol "g_variant_compare") (GLibVariantRecord.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val dupBytestring_ = call (getSymbol "g_variant_dup_bytestring") (GLibVariantRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> GUInt8CArrayN.PolyML.cOutPtr)
      val dupBytestringArray_ = call (getSymbol "g_variant_dup_bytestring_array") (GLibVariantRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> Utf8CPtrArrayN.PolyML.cOutPtr)
      val dupObjv_ = call (getSymbol "g_variant_dup_objv") (GLibVariantRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> Utf8CPtrArrayN.PolyML.cOutPtr)
      val dupString_ = call (getSymbol "g_variant_dup_string") (GLibVariantRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> Utf8.PolyML.cOutPtr)
      val dupStrv_ = call (getSymbol "g_variant_dup_strv") (GLibVariantRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> Utf8CPtrArrayN.PolyML.cOutPtr)
      val equal_ = call (getSymbol "g_variant_equal") (GLibVariantRecord.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBoolean_ = call (getSymbol "g_variant_get_boolean") (GLibVariantRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getByte_ = call (getSymbol "g_variant_get_byte") (GLibVariantRecord.PolyML.cPtr --> GUInt8.PolyML.cVal)
      val getBytestring_ = call (getSymbol "g_variant_get_bytestring") (GLibVariantRecord.PolyML.cPtr --> GUInt8CArray.PolyML.cOutPtr)
      val getBytestringArray_ = call (getSymbol "g_variant_get_bytestring_array") (GLibVariantRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> Utf8CPtrArrayN.PolyML.cOutPtr)
      val getChildValue_ = call (getSymbol "g_variant_get_child_value") (GLibVariantRecord.PolyML.cPtr &&> GUInt64.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val getDataAsBytes_ = call (getSymbol "g_variant_get_data_as_bytes") (GLibVariantRecord.PolyML.cPtr --> GLibBytesRecord.PolyML.cPtr)
      val getDouble_ = call (getSymbol "g_variant_get_double") (GLibVariantRecord.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getHandle_ = call (getSymbol "g_variant_get_handle") (GLibVariantRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getInt16_ = call (getSymbol "g_variant_get_int16") (GLibVariantRecord.PolyML.cPtr --> GInt16.PolyML.cVal)
      val getInt32_ = call (getSymbol "g_variant_get_int32") (GLibVariantRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getInt64_ = call (getSymbol "g_variant_get_int64") (GLibVariantRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getMaybe_ = call (getSymbol "g_variant_get_maybe") (GLibVariantRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cOptPtr)
      val getNormalForm_ = call (getSymbol "g_variant_get_normal_form") (GLibVariantRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getObjv_ = call (getSymbol "g_variant_get_objv") (GLibVariantRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> Utf8CPtrArrayN.PolyML.cOutPtr)
      val getSize_ = call (getSymbol "g_variant_get_size") (GLibVariantRecord.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val getString_ = call (getSymbol "g_variant_get_string") (GLibVariantRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> Utf8.PolyML.cOutPtr)
      val getStrv_ = call (getSymbol "g_variant_get_strv") (GLibVariantRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> Utf8CPtrArrayN.PolyML.cOutPtr)
      val getType_ = call (getSymbol "g_variant_get_type") (GLibVariantRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val getTypeString_ = call (getSymbol "g_variant_get_type_string") (GLibVariantRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUint16_ = call (getSymbol "g_variant_get_uint16") (GLibVariantRecord.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getUint32_ = call (getSymbol "g_variant_get_uint32") (GLibVariantRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getUint64_ = call (getSymbol "g_variant_get_uint64") (GLibVariantRecord.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val getVariant_ = call (getSymbol "g_variant_get_variant") (GLibVariantRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val hash_ = call (getSymbol "g_variant_hash") (GLibVariantRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val isContainer_ = call (getSymbol "g_variant_is_container") (GLibVariantRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isFloating_ = call (getSymbol "g_variant_is_floating") (GLibVariantRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isNormalForm_ = call (getSymbol "g_variant_is_normal_form") (GLibVariantRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isOfType_ = call (getSymbol "g_variant_is_of_type") (GLibVariantRecord.PolyML.cPtr &&> GLibVariantTypeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val lookupValue_ =
        call (getSymbol "g_variant_lookup_value")
          (
            GLibVariantRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantTypeRecord.PolyML.cOptPtr
             --> GLibVariantRecord.PolyML.cPtr
          )
      val nChildren_ = call (getSymbol "g_variant_n_children") (GLibVariantRecord.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val print_ = call (getSymbol "g_variant_print") (GLibVariantRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val takeRef_ = call (getSymbol "g_variant_take_ref") (GLibVariantRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val isObjectPath_ = call (getSymbol "g_variant_is_object_path") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val isSignature_ = call (getSymbol "g_variant_is_signature") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val parse_ =
        call (getSymbol "g_variant_parse")
          (
            GLibVariantTypeRecord.PolyML.cOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
    end
    type t = GLibVariantRecord.t
    type variant_record_c_ptr_array_n_t = GLibVariantRecordCPtrArrayN.t
    type variant_class_t = GLibVariantClass.t
    type bytes_t = GLibBytesRecord.t
    type variant_type_t = GLibVariantTypeRecord.t
    fun newArray (childType, children) =
      let
        val nChildren =
          case children of
            SOME children => LargeInt.fromInt (GLibVariantRecordCPtrArrayN.length children)
          | NONE => GUInt64.null
        val retVal =
          (
            GLibVariantTypeRecord.FFI.withOptPtr
             &&&> GLibVariantRecordCPtrArrayN.FFI.withOptPtr
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
    fun newBytestring string = (GUInt8CArray.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newBytestring_ string
    fun newBytestringArray strv =
      let
        val length = LargeInt.fromInt (Utf8CPtrArrayN.length strv)
        val retVal = (Utf8CPtrArrayN.FFI.withPtr &&&> GInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newBytestringArray_ (strv & length)
      in
        retVal
      end
    fun newDictEntry (key, value) = (GLibVariantRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newDictEntry_ (key & value)
    fun newDouble value = (GDouble.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newDouble_ value
    fun newFromBytes
      (
        type',
        bytes,
        trusted
      ) =
      (
        GLibVariantTypeRecord.FFI.withPtr
         &&&> GLibBytesRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> GLibVariantRecord.FFI.fromPtr false
      )
        newFromBytes_
        (
          type'
           & bytes
           & trusted
        )
    fun newHandle value = (GInt32.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newHandle_ value
    fun newInt16 value = (GInt16.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newInt16_ value
    fun newInt32 value = (GInt32.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newInt32_ value
    fun newInt64 value = (GInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newInt64_ value
    fun newMaybe (childType, child) = (GLibVariantTypeRecord.FFI.withOptPtr &&&> GLibVariantRecord.FFI.withOptPtr ---> GLibVariantRecord.FFI.fromPtr false) newMaybe_ (childType & child)
    fun newObjectPath objectPath = (Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newObjectPath_ objectPath
    fun newObjv strv =
      let
        val length = LargeInt.fromInt (Utf8CPtrArrayN.length strv)
        val retVal = (Utf8CPtrArrayN.FFI.withPtr &&&> GInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newObjv_ (strv & length)
      in
        retVal
      end
    fun newSignature signature' = (Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newSignature_ signature'
    fun newString string = (Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newString_ string
    fun newStrv strv =
      let
        val length = LargeInt.fromInt (Utf8CPtrArrayN.length strv)
        val retVal = (Utf8CPtrArrayN.FFI.withPtr &&&> GInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newStrv_ (strv & length)
      in
        retVal
      end
    fun newTuple children =
      let
        val nChildren = LargeInt.fromInt (GLibVariantRecordCPtrArrayN.length children)
        val retVal = (GLibVariantRecordCPtrArrayN.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newTuple_ (children & nChildren)
      in
        retVal
      end
    fun newUint16 value = (GUInt16.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newUint16_ value
    fun newUint32 value = (GUInt32.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newUint32_ value
    fun newUint64 value = (GUInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newUint64_ value
    fun newVariant value = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newVariant_ value
    fun byteswap self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) byteswap_ self
    fun checkFormatString self (formatString, copyOnly) =
      (
        GLibVariantRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        checkFormatString_
        (
          self
           & formatString
           & copyOnly
        )
    fun classify self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantClass.FFI.fromVal) classify_ self
    fun compare self two = (GLibVariantRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> GInt32.FFI.fromVal) compare_ (self & two)
    fun dupBytestring self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr 1) dupBytestring_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun dupBytestringArray self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr 2) dupBytestringArray_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun dupObjv self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr 2) dupObjv_ (self & GUInt64.null)
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
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr 2) dupStrv_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun equal self two = (GLibVariantRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & two)
    fun getBoolean self = (GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) getBoolean_ self
    fun getByte self = (GLibVariantRecord.FFI.withPtr ---> GUInt8.FFI.fromVal) getByte_ self
    fun getBytestring self = (GLibVariantRecord.FFI.withPtr ---> GUInt8CArray.FFI.fromPtr 0) getBytestring_ self
    fun getBytestringArray self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr 1) getBytestringArray_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getChildValue self index = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr true) getChildValue_ (self & index)
    fun getDataAsBytes self = (GLibVariantRecord.FFI.withPtr ---> GLibBytesRecord.FFI.fromPtr true) getDataAsBytes_ self
    fun getDouble self = (GLibVariantRecord.FFI.withPtr ---> GDouble.FFI.fromVal) getDouble_ self
    fun getHandle self = (GLibVariantRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getHandle_ self
    fun getInt16 self = (GLibVariantRecord.FFI.withPtr ---> GInt16.FFI.fromVal) getInt16_ self
    fun getInt32 self = (GLibVariantRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getInt32_ self
    fun getInt64 self = (GLibVariantRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getInt64_ self
    fun getMaybe self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromOptPtr true) getMaybe_ self
    fun getNormalForm self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getNormalForm_ self
    fun getObjv self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr 1) getObjv_ (self & GUInt64.null)
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
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr 1) getStrv_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getType self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) getType_ self
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
        GLibVariantTypeRecord.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
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
