structure GioFileAttributeInfoList :>
  GIO_FILE_ATTRIBUTE_INFO_LIST
    where type t = GioFileAttributeInfoListRecord.t
    where type file_attribute_info_flags_t = GioFileAttributeInfoFlags.t
    where type file_attribute_type_t = GioFileAttributeType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_attribute_info_list_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_file_attribute_info_list_new") (cVoid --> GioFileAttributeInfoListRecord.PolyML.cPtr)
      val add_ =
        call (getSymbol "g_file_attribute_info_list_add")
          (
            GioFileAttributeInfoListRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioFileAttributeType.PolyML.cVal
             &&> GioFileAttributeInfoFlags.PolyML.cVal
             --> cVoid
          )
      val dup_ = call (getSymbol "g_file_attribute_info_list_dup") (GioFileAttributeInfoListRecord.PolyML.cPtr --> GioFileAttributeInfoListRecord.PolyML.cPtr)
    end
    type t = GioFileAttributeInfoListRecord.t
    type file_attribute_info_flags_t = GioFileAttributeInfoFlags.t
    type file_attribute_type_t = GioFileAttributeType.t
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
        GioFileAttributeInfoListRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
    fun dup self = (GioFileAttributeInfoListRecord.FFI.withPtr false ---> GioFileAttributeInfoListRecord.FFI.fromPtr true) dup_ self
  end
