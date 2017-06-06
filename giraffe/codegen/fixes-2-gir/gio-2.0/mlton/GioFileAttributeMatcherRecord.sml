structure GioFileAttributeMatcherRecord :> GIO_FILE_ATTRIBUTE_MATCHER_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val dup_ = _import "g_file_attribute_matcher_ref" : notnull p -> notnull p;
    val free_ = _import "g_file_attribute_matcher_unref" : notnull p -> unit;
    val getType_ = _import "g_file_attribute_matcher_get_type" : unit -> GObjectType.FFI.val_;

    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
      )
    open Record

    structure Type =
      BoxedType(
        structure Record = Record
        type t = t
        val getType_ = getType_
      )
    open Type
  end
