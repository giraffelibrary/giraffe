structure GioFileAttributeInfoListRecord :> GIO_FILE_ATTRIBUTE_INFO_LIST_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val dup_ = _import "g_file_attribute_info_list_dup" : notnull p -> notnull p;
    val free_ = _import "g_file_attribute_info_list_unref" : notnull p -> unit;
    val getType_ = _import "g_file_attribute_info_list_get_type" : unit -> GObjectType.FFI.val_;

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
