structure GioFileAttributeInfoList :>
  GIO_FILE_ATTRIBUTE_INFO_LIST
    where type t = GioFileAttributeInfoListRecord.t
    where type file_attribute_info_flags_t = GioFileAttributeInfoFlags.t
    where type file_attribute_type_t = GioFileAttributeType.t
    where type file_attribute_info_t = GioFileAttributeInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_attribute_info_list_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_file_attribute_info_list_new") (PolyMLFFI.cVoid --> GioFileAttributeInfoListRecord.PolyML.cPtr)
      val add_ =
        call (getSymbol "g_file_attribute_info_list_add")
          (
            GioFileAttributeInfoListRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioFileAttributeType.PolyML.cVal
             &&> GioFileAttributeInfoFlags.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val dup_ = call (getSymbol "g_file_attribute_info_list_dup") (GioFileAttributeInfoListRecord.PolyML.cPtr --> GioFileAttributeInfoListRecord.PolyML.cPtr)
      val lookup_ = call (getSymbol "g_file_attribute_info_list_lookup") (GioFileAttributeInfoListRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileAttributeInfoRecord.PolyML.cPtr)
    end
    type t = GioFileAttributeInfoListRecord.t
    type file_attribute_info_flags_t = GioFileAttributeInfoFlags.t
    type file_attribute_type_t = GioFileAttributeType.t
    type file_attribute_info_t = GioFileAttributeInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioFileAttributeInfoListRecord.FFI.fromPtr true) new_ ()
    fun add self name type' flags =
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
