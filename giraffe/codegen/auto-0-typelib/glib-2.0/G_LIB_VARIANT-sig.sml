signature G_LIB_VARIANT =
  sig
    type t
    type variant_record_c_ptr_array_n_t
    type variant_class_t
    type bytes_t
    type variant_type_t
    val newArray : variant_type_t option * variant_record_c_ptr_array_n_t option -> t
    val newBoolean : bool -> t
    val newByte : Word8.word -> t
    val newBytestring : GUInt8CArray.t -> t
    val newBytestringArray : Utf8CPtrArrayN.t -> t
    val newDictEntry : t * t -> t
    val newDouble : real -> t
    val newFromBytes :
      variant_type_t
       * bytes_t
       * bool
       -> t
    val newHandle : LargeInt.int -> t
    val newInt16 : LargeInt.int -> t
    val newInt32 : LargeInt.int -> t
    val newInt64 : LargeInt.int -> t
    val newMaybe : variant_type_t option * t option -> t
    val newObjectPath : string -> t
    val newObjv : Utf8CPtrArrayN.t -> t
    val newSignature : string -> t
    val newString : string -> t
    val newStrv : Utf8CPtrArrayN.t -> t
    val newTuple : variant_record_c_ptr_array_n_t -> t
    val newUint16 : LargeInt.int -> t
    val newUint32 : LargeInt.int -> t
    val newUint64 : LargeInt.int -> t
    val newVariant : t -> t
    val byteswap : t -> t
    val checkFormatString :
      t
       -> string * bool
       -> bool
    val classify : t -> variant_class_t
    val compare :
      t
       -> t
       -> LargeInt.int
    val dupBytestring : t -> GUInt8CArrayN.t
    val dupBytestringArray : t -> Utf8CPtrArrayN.t
    val dupObjv : t -> Utf8CPtrArrayN.t
    val dupString : t -> string * LargeInt.int
    val dupStrv : t -> Utf8CPtrArrayN.t
    val equal :
      t
       -> t
       -> bool
    val getBoolean : t -> bool
    val getByte : t -> Word8.word
    val getBytestring : t -> GUInt8CArray.t
    val getBytestringArray : t -> Utf8CPtrArrayN.t
    val getChildValue :
      t
       -> LargeInt.int
       -> t
    val getDataAsBytes : t -> bytes_t
    val getDouble : t -> real
    val getHandle : t -> LargeInt.int
    val getInt16 : t -> LargeInt.int
    val getInt32 : t -> LargeInt.int
    val getInt64 : t -> LargeInt.int
    val getMaybe : t -> t option
    val getNormalForm : t -> t
    val getObjv : t -> Utf8CPtrArrayN.t
    val getSize : t -> LargeInt.int
    val getString : t -> string * LargeInt.int
    val getStrv : t -> Utf8CPtrArrayN.t
    val getType : t -> variant_type_t
    val getTypeString : t -> string
    val getUint16 : t -> LargeInt.int
    val getUint32 : t -> LargeInt.int
    val getUint64 : t -> LargeInt.int
    val getVariant : t -> t
    val hash : t -> LargeInt.int
    val isContainer : t -> bool
    val isFloating : t -> bool
    val isNormalForm : t -> bool
    val isOfType :
      t
       -> variant_type_t
       -> bool
    val lookupValue :
      t
       -> string * variant_type_t option
       -> t
    val nChildren : t -> LargeInt.int
    val print :
      t
       -> bool
       -> string
    val takeRef : t -> t
    val isObjectPath : string -> bool
    val isSignature : string -> bool
    val parse :
      variant_type_t option
       * string
       * string option
       * string option
       -> t
  end
