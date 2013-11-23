signature G_I_REPOSITORY_TYPE_INFO =
  sig
    type 'a class_t
    type typetag_t
    type arraytype_t
    type 'a baseinfoclass_t
    val isPointer : 'a class_t -> int option -> bool -> bool
    val addPtrDepth : 'a class_t -> int option -> int option
    val getTag : 'a class_t -> typetag_t
    val getParamType : 'a class_t -> LargeInt.int -> base class_t option
    val getInterface : 'a class_t -> base baseinfoclass_t option
    val getArrayLength : 'a class_t -> LargeInt.int
    val getArrayFixedSize : 'a class_t -> LargeInt.int
    val isZeroTerminated : 'a class_t -> bool
    val getArrayType : 'a class_t -> arraytype_t option
  end
