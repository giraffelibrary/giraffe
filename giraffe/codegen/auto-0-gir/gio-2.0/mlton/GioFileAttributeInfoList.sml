structure GioFileAttributeInfoList :>
  GIO_FILE_ATTRIBUTE_INFO_LIST
    where type t = GioFileAttributeInfoListRecord.t
    where type file_attribute_info_flags_t = GioFileAttributeInfoFlags.t
    where type file_attribute_type_t = GioFileAttributeType.t
    where type file_attribute_info_t = GioFileAttributeInfoRecord.t =
  struct
    val getType_ = _import "g_file_attribute_info_list_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_file_attribute_info_list_new" : unit -> GioFileAttributeInfoListRecord.FFI.notnull GioFileAttributeInfoListRecord.FFI.p;
    val add_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_file_attribute_info_list_add" :
              GioFileAttributeInfoListRecord.FFI.notnull GioFileAttributeInfoListRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioFileAttributeType.FFI.val_
               * GioFileAttributeInfoFlags.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val dup_ = _import "g_file_attribute_info_list_dup" : GioFileAttributeInfoListRecord.FFI.notnull GioFileAttributeInfoListRecord.FFI.p -> GioFileAttributeInfoListRecord.FFI.notnull GioFileAttributeInfoListRecord.FFI.p;
    val lookup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_attribute_info_list_lookup" :
              GioFileAttributeInfoListRecord.FFI.notnull GioFileAttributeInfoListRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioFileAttributeInfoRecord.FFI.notnull GioFileAttributeInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GioFileAttributeInfoListRecord.t
    type file_attribute_info_flags_t = GioFileAttributeInfoFlags.t
    type file_attribute_type_t = GioFileAttributeType.t
    type file_attribute_info_t = GioFileAttributeInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioFileAttributeInfoListRecord.FFI.fromPtr true) new_ ()
    fun add
      self
      (
        name,
        type',
        flags
      ) =
      (
        GioFileAttributeInfoListRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioFileAttributeType.FFI.withVal
         &&&> GioFileAttributeInfoFlags.FFI.withVal
         ---> I
      )
        add_
        (
          self
           & name
           & type'
           & flags
        )
    fun dup self = (GioFileAttributeInfoListRecord.FFI.withPtr ---> GioFileAttributeInfoListRecord.FFI.fromPtr true) dup_ self
    fun lookup self name = (GioFileAttributeInfoListRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileAttributeInfoRecord.FFI.fromPtr false) lookup_ (self & name)
  end
