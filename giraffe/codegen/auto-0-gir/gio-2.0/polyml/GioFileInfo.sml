structure GioFileInfo :>
  GIO_FILE_INFO
    where type 'a class = 'a GioFileInfoClass.class
    where type file_attribute_type_t = GioFileAttributeType.t
    where type file_attribute_matcher_t = GioFileAttributeMatcherRecord.t
    where type file_attribute_status_t = GioFileAttributeStatus.t
    where type file_type_t = GioFileType.t
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_file_info_new") (cVoid --> GioFileInfoClass.PolyML.cPtr)
      val clearStatus_ = call (getSymbol "g_file_info_clear_status") (GioFileInfoClass.PolyML.cPtr --> cVoid)
      val copyInto_ = call (getSymbol "g_file_info_copy_into") (GioFileInfoClass.PolyML.cPtr &&> GioFileInfoClass.PolyML.cPtr --> cVoid)
      val dup_ = call (getSymbol "g_file_info_dup") (GioFileInfoClass.PolyML.cPtr --> GioFileInfoClass.PolyML.cPtr)
      val getAttributeAsString_ = call (getSymbol "g_file_info_get_attribute_as_string") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getAttributeBoolean_ = call (getSymbol "g_file_info_get_attribute_boolean") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val getAttributeByteString_ = call (getSymbol "g_file_info_get_attribute_byte_string") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getAttributeInt32_ = call (getSymbol "g_file_info_get_attribute_int32") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GInt32.PolyML.cVal)
      val getAttributeInt64_ = call (getSymbol "g_file_info_get_attribute_int64") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GInt64.PolyML.cVal)
      val getAttributeObject_ = call (getSymbol "g_file_info_get_attribute_object") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getAttributeStatus_ = call (getSymbol "g_file_info_get_attribute_status") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileAttributeStatus.PolyML.cVal)
      val getAttributeString_ = call (getSymbol "g_file_info_get_attribute_string") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getAttributeStringv_ = call (getSymbol "g_file_info_get_attribute_stringv") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8CVector.PolyML.cOutPtr)
      val getAttributeType_ = call (getSymbol "g_file_info_get_attribute_type") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileAttributeType.PolyML.cVal)
      val getAttributeUint32_ = call (getSymbol "g_file_info_get_attribute_uint32") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GUInt32.PolyML.cVal)
      val getAttributeUint64_ = call (getSymbol "g_file_info_get_attribute_uint64") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GUInt64.PolyML.cVal)
      val getContentType_ = call (getSymbol "g_file_info_get_content_type") (GioFileInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDeletionDate_ = call (getSymbol "g_file_info_get_deletion_date") (GioFileInfoClass.PolyML.cPtr --> GLibDateTimeRecord.PolyML.cPtr)
      val getDisplayName_ = call (getSymbol "g_file_info_get_display_name") (GioFileInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEditName_ = call (getSymbol "g_file_info_get_edit_name") (GioFileInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEtag_ = call (getSymbol "g_file_info_get_etag") (GioFileInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFileType_ = call (getSymbol "g_file_info_get_file_type") (GioFileInfoClass.PolyML.cPtr --> GioFileType.PolyML.cVal)
      val getIcon_ = call (getSymbol "g_file_info_get_icon") (GioFileInfoClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getIsBackup_ = call (getSymbol "g_file_info_get_is_backup") (GioFileInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsHidden_ = call (getSymbol "g_file_info_get_is_hidden") (GioFileInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsSymlink_ = call (getSymbol "g_file_info_get_is_symlink") (GioFileInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getModificationTime_ = call (getSymbol "g_file_info_get_modification_time") (GioFileInfoClass.PolyML.cPtr &&> GLibTimeValRecord.PolyML.cPtr --> cVoid)
      val getName_ = call (getSymbol "g_file_info_get_name") (GioFileInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSize_ = call (getSymbol "g_file_info_get_size") (GioFileInfoClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getSortOrder_ = call (getSymbol "g_file_info_get_sort_order") (GioFileInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getSymbolicIcon_ = call (getSymbol "g_file_info_get_symbolic_icon") (GioFileInfoClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getSymlinkTarget_ = call (getSymbol "g_file_info_get_symlink_target") (GioFileInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val hasAttribute_ = call (getSymbol "g_file_info_has_attribute") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hasNamespace_ = call (getSymbol "g_file_info_has_namespace") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val listAttributes_ = call (getSymbol "g_file_info_list_attributes") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> Utf8CVector.PolyML.cOutPtr)
      val removeAttribute_ = call (getSymbol "g_file_info_remove_attribute") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setAttributeBoolean_ =
        call (getSymbol "g_file_info_set_attribute_boolean")
          (
            GioFileInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setAttributeByteString_ =
        call (getSymbol "g_file_info_set_attribute_byte_string")
          (
            GioFileInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val setAttributeInt32_ =
        call (getSymbol "g_file_info_set_attribute_int32")
          (
            GioFileInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setAttributeInt64_ =
        call (getSymbol "g_file_info_set_attribute_int64")
          (
            GioFileInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             --> cVoid
          )
      val setAttributeMask_ = call (getSymbol "g_file_info_set_attribute_mask") (GioFileInfoClass.PolyML.cPtr &&> GioFileAttributeMatcherRecord.PolyML.cPtr --> cVoid)
      val setAttributeObject_ =
        call (getSymbol "g_file_info_set_attribute_object")
          (
            GioFileInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             --> cVoid
          )
      val setAttributeStatus_ =
        call (getSymbol "g_file_info_set_attribute_status")
          (
            GioFileInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioFileAttributeStatus.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setAttributeString_ =
        call (getSymbol "g_file_info_set_attribute_string")
          (
            GioFileInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val setAttributeUint32_ =
        call (getSymbol "g_file_info_set_attribute_uint32")
          (
            GioFileInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val setAttributeUint64_ =
        call (getSymbol "g_file_info_set_attribute_uint64")
          (
            GioFileInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> cVoid
          )
      val setContentType_ = call (getSymbol "g_file_info_set_content_type") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setDisplayName_ = call (getSymbol "g_file_info_set_display_name") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setEditName_ = call (getSymbol "g_file_info_set_edit_name") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setFileType_ = call (getSymbol "g_file_info_set_file_type") (GioFileInfoClass.PolyML.cPtr &&> GioFileType.PolyML.cVal --> cVoid)
      val setIcon_ = call (getSymbol "g_file_info_set_icon") (GioFileInfoClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> cVoid)
      val setIsHidden_ = call (getSymbol "g_file_info_set_is_hidden") (GioFileInfoClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setIsSymlink_ = call (getSymbol "g_file_info_set_is_symlink") (GioFileInfoClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setModificationTime_ = call (getSymbol "g_file_info_set_modification_time") (GioFileInfoClass.PolyML.cPtr &&> GLibTimeValRecord.PolyML.cPtr --> cVoid)
      val setName_ = call (getSymbol "g_file_info_set_name") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setSize_ = call (getSymbol "g_file_info_set_size") (GioFileInfoClass.PolyML.cPtr &&> GInt64.PolyML.cVal --> cVoid)
      val setSortOrder_ = call (getSymbol "g_file_info_set_sort_order") (GioFileInfoClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setSymbolicIcon_ = call (getSymbol "g_file_info_set_symbolic_icon") (GioFileInfoClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> cVoid)
      val setSymlinkTarget_ = call (getSymbol "g_file_info_set_symlink_target") (GioFileInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val unsetAttributeMask_ = call (getSymbol "g_file_info_unset_attribute_mask") (GioFileInfoClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GioFileInfoClass.class
    type file_attribute_type_t = GioFileAttributeType.t
    type file_attribute_matcher_t = GioFileAttributeMatcherRecord.t
    type file_attribute_status_t = GioFileAttributeStatus.t
    type file_type_t = GioFileType.t
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioFileInfoClass.FFI.fromPtr true) new_ ()
    fun clearStatus self = (GioFileInfoClass.FFI.withPtr ---> I) clearStatus_ self
    fun copyInto self destInfo = (GioFileInfoClass.FFI.withPtr &&&> GioFileInfoClass.FFI.withPtr ---> I) copyInto_ (self & destInfo)
    fun dup self = (GioFileInfoClass.FFI.withPtr ---> GioFileInfoClass.FFI.fromPtr true) dup_ self
    fun getAttributeAsString self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getAttributeAsString_ (self & attribute)
    fun getAttributeBoolean self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) getAttributeBoolean_ (self & attribute)
    fun getAttributeByteString self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getAttributeByteString_ (self & attribute)
    fun getAttributeInt32 self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GInt32.FFI.fromVal) getAttributeInt32_ (self & attribute)
    fun getAttributeInt64 self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GInt64.FFI.fromVal) getAttributeInt64_ (self & attribute)
    fun getAttributeObject self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr false) getAttributeObject_ (self & attribute)
    fun getAttributeStatus self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileAttributeStatus.FFI.fromVal) getAttributeStatus_ (self & attribute)
    fun getAttributeString self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getAttributeString_ (self & attribute)
    fun getAttributeStringv self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getAttributeStringv_ (self & attribute)
    fun getAttributeType self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileAttributeType.FFI.fromVal) getAttributeType_ (self & attribute)
    fun getAttributeUint32 self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GUInt32.FFI.fromVal) getAttributeUint32_ (self & attribute)
    fun getAttributeUint64 self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GUInt64.FFI.fromVal) getAttributeUint64_ (self & attribute)
    fun getContentType self = (GioFileInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getContentType_ self
    fun getDeletionDate self = (GioFileInfoClass.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) getDeletionDate_ self
    fun getDisplayName self = (GioFileInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDisplayName_ self
    fun getEditName self = (GioFileInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getEditName_ self
    fun getEtag self = (GioFileInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getEtag_ self
    fun getFileType self = (GioFileInfoClass.FFI.withPtr ---> GioFileType.FFI.fromVal) getFileType_ self
    fun getIcon self = (GioFileInfoClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) getIcon_ self
    fun getIsBackup self = (GioFileInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsBackup_ self
    fun getIsHidden self = (GioFileInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsHidden_ self
    fun getIsSymlink self = (GioFileInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsSymlink_ self
    fun getModificationTime self =
      let
        val result & () = (GioFileInfoClass.FFI.withPtr &&&> GLibTimeValRecord.FFI.withNewPtr ---> GLibTimeValRecord.FFI.fromPtr true && I) getModificationTime_ (self & ())
      in
        result
      end
    fun getName self = (GioFileInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getSize self = (GioFileInfoClass.FFI.withPtr ---> GInt64.FFI.fromVal) getSize_ self
    fun getSortOrder self = (GioFileInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getSortOrder_ self
    fun getSymbolicIcon self = (GioFileInfoClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) getSymbolicIcon_ self
    fun getSymlinkTarget self = (GioFileInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSymlinkTarget_ self
    fun hasAttribute self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasAttribute_ (self & attribute)
    fun hasNamespace self nameSpace = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasNamespace_ (self & nameSpace)
    fun listAttributes self nameSpace = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> Utf8CVector.FFI.fromPtr 2) listAttributes_ (self & nameSpace)
    fun removeAttribute self attribute = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) removeAttribute_ (self & attribute)
    fun setAttributeBoolean self (attribute, attrValue) =
      (
        GioFileInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        setAttributeBoolean_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeByteString self (attribute, attrValue) =
      (
        GioFileInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setAttributeByteString_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeInt32 self (attribute, attrValue) =
      (
        GioFileInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setAttributeInt32_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeInt64 self (attribute, attrValue) =
      (
        GioFileInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt64.FFI.withVal
         ---> I
      )
        setAttributeInt64_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeMask self mask = (GioFileInfoClass.FFI.withPtr &&&> GioFileAttributeMatcherRecord.FFI.withPtr ---> I) setAttributeMask_ (self & mask)
    fun setAttributeObject self (attribute, attrValue) =
      (
        GioFileInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withPtr
         ---> I
      )
        setAttributeObject_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeStatus self (attribute, status) =
      (
        GioFileInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioFileAttributeStatus.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setAttributeStatus_
        (
          self
           & attribute
           & status
        )
    fun setAttributeString self (attribute, attrValue) =
      (
        GioFileInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setAttributeString_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeUint32 self (attribute, attrValue) =
      (
        GioFileInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        setAttributeUint32_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeUint64 self (attribute, attrValue) =
      (
        GioFileInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         ---> I
      )
        setAttributeUint64_
        (
          self
           & attribute
           & attrValue
        )
    fun setContentType self contentType = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setContentType_ (self & contentType)
    fun setDisplayName self displayName = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setDisplayName_ (self & displayName)
    fun setEditName self editName = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setEditName_ (self & editName)
    fun setFileType self type' = (GioFileInfoClass.FFI.withPtr &&&> GioFileType.FFI.withVal ---> I) setFileType_ (self & type')
    fun setIcon self icon = (GioFileInfoClass.FFI.withPtr &&&> GioIconClass.FFI.withPtr ---> I) setIcon_ (self & icon)
    fun setIsHidden self isHidden = (GioFileInfoClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setIsHidden_ (self & isHidden)
    fun setIsSymlink self isSymlink = (GioFileInfoClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setIsSymlink_ (self & isSymlink)
    fun setModificationTime self mtime = (GioFileInfoClass.FFI.withPtr &&&> GLibTimeValRecord.FFI.withPtr ---> I) setModificationTime_ (self & mtime)
    fun setName self name = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setName_ (self & name)
    fun setSize self size = (GioFileInfoClass.FFI.withPtr &&&> GInt64.FFI.withVal ---> I) setSize_ (self & size)
    fun setSortOrder self sortOrder = (GioFileInfoClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setSortOrder_ (self & sortOrder)
    fun setSymbolicIcon self icon = (GioFileInfoClass.FFI.withPtr &&&> GioIconClass.FFI.withPtr ---> I) setSymbolicIcon_ (self & icon)
    fun setSymlinkTarget self symlinkTarget = (GioFileInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setSymlinkTarget_ (self & symlinkTarget)
    fun unsetAttributeMask self = (GioFileInfoClass.FFI.withPtr ---> I) unsetAttributeMask_ self
  end
