signature G_I_REPOSITORY_TYPE_INFO =
  sig
    type 'a class
    type typetag_t
    type arraytype_t
    type 'a baseinfo_class
    val isPointer : 'a class -> int option -> bool -> bool
    val addPtrDepth : 'a class -> int option -> int option    (* GIR only *)
    val getTag : 'a class -> typetag_t
    val getParamType : 'a class -> LargeInt.int -> base class option
    val getInterface : 'a class -> base baseinfo_class option
    val getArrayLength : 'a class -> LargeInt.int
    val getArrayFixedSize : 'a class -> LargeInt.int
    val isZeroTerminated : 'a class -> bool
    val getArrayType : 'a class -> arraytype_t option
    val getCType : 'a class -> string option    (* GIR only *)
  end
