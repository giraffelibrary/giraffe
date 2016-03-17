structure GioFileInfo :>
  GIO_FILE_INFO
    where type 'a class = 'a GioFileInfoClass.class
    where type file_attribute_type_t = GioFileAttributeType.t
    where type file_attribute_matcher_t = GioFileAttributeMatcherRecord.t
    where type file_attribute_status_t = GioFileAttributeStatus.t
    where type file_type_t = GioFileType.t
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_info_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_file_info_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val clearStatus_ = call (load_sym libgio "g_file_info_clear_status") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val copyInto_ = call (load_sym libgio "g_file_info_copy_into") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val dup_ = call (load_sym libgio "g_file_info_dup") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getAttributeAsString_ = call (load_sym libgio "g_file_info_get_attribute_as_string") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getAttributeBoolean_ = call (load_sym libgio "g_file_info_get_attribute_boolean") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val getAttributeByteString_ = call (load_sym libgio "g_file_info_get_attribute_byte_string") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getAttributeInt32_ = call (load_sym libgio "g_file_info_get_attribute_int32") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Int32.PolyML.cVal)
      val getAttributeInt64_ = call (load_sym libgio "g_file_info_get_attribute_int64") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Int64.PolyML.cVal)
      val getAttributeObject_ = call (load_sym libgio "g_file_info_get_attribute_object") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getAttributeStatus_ = call (load_sym libgio "g_file_info_get_attribute_status") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileAttributeStatus.PolyML.cVal)
      val getAttributeString_ = call (load_sym libgio "g_file_info_get_attribute_string") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getAttributeType_ = call (load_sym libgio "g_file_info_get_attribute_type") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileAttributeType.PolyML.cVal)
      val getAttributeUint32_ = call (load_sym libgio "g_file_info_get_attribute_uint32") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.UInt32.PolyML.cVal)
      val getAttributeUint64_ = call (load_sym libgio "g_file_info_get_attribute_uint64") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.UInt64.PolyML.cVal)
      val getContentType_ = call (load_sym libgio "g_file_info_get_content_type") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDisplayName_ = call (load_sym libgio "g_file_info_get_display_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEditName_ = call (load_sym libgio "g_file_info_get_edit_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEtag_ = call (load_sym libgio "g_file_info_get_etag") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFileType_ = call (load_sym libgio "g_file_info_get_file_type") (GObjectObjectClass.PolyML.cPtr --> GioFileType.PolyML.cVal)
      val getIcon_ = call (load_sym libgio "g_file_info_get_icon") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getIsBackup_ = call (load_sym libgio "g_file_info_get_is_backup") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIsHidden_ = call (load_sym libgio "g_file_info_get_is_hidden") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIsSymlink_ = call (load_sym libgio "g_file_info_get_is_symlink") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getModificationTime_ = call (load_sym libgio "g_file_info_get_modification_time") (GObjectObjectClass.PolyML.cPtr &&> GLibTimeValRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getName_ = call (load_sym libgio "g_file_info_get_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSize_ = call (load_sym libgio "g_file_info_get_size") (GObjectObjectClass.PolyML.cPtr --> FFI.Int64.PolyML.cVal)
      val getSortOrder_ = call (load_sym libgio "g_file_info_get_sort_order") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getSymlinkTarget_ = call (load_sym libgio "g_file_info_get_symlink_target") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val hasAttribute_ = call (load_sym libgio "g_file_info_has_attribute") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val hasNamespace_ = call (load_sym libgio "g_file_info_has_namespace") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val removeAttribute_ = call (load_sym libgio "g_file_info_remove_attribute") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setAttributeBoolean_ =
        call (load_sym libgio "g_file_info_set_attribute_boolean")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setAttributeByteString_ =
        call (load_sym libgio "g_file_info_set_attribute_byte_string")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val setAttributeInt32_ =
        call (load_sym libgio "g_file_info_set_attribute_int32")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setAttributeInt64_ =
        call (load_sym libgio "g_file_info_set_attribute_int64")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int64.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setAttributeMask_ = call (load_sym libgio "g_file_info_set_attribute_mask") (GObjectObjectClass.PolyML.cPtr &&> GioFileAttributeMatcherRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setAttributeObject_ =
        call (load_sym libgio "g_file_info_set_attribute_object")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val setAttributeStatus_ =
        call (load_sym libgio "g_file_info_set_attribute_status")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioFileAttributeStatus.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val setAttributeString_ =
        call (load_sym libgio "g_file_info_set_attribute_string")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val setAttributeStringv_ =
        call (load_sym libgio "g_file_info_set_attribute_stringv")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val setAttributeUint32_ =
        call (load_sym libgio "g_file_info_set_attribute_uint32")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setAttributeUint64_ =
        call (load_sym libgio "g_file_info_set_attribute_uint64")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt64.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setContentType_ = call (load_sym libgio "g_file_info_set_content_type") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setDisplayName_ = call (load_sym libgio "g_file_info_set_display_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setEditName_ = call (load_sym libgio "g_file_info_set_edit_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setFileType_ = call (load_sym libgio "g_file_info_set_file_type") (GObjectObjectClass.PolyML.cPtr &&> GioFileType.PolyML.cVal --> FFI.PolyML.cVoid)
      val setIcon_ = call (load_sym libgio "g_file_info_set_icon") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setIsHidden_ = call (load_sym libgio "g_file_info_set_is_hidden") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setIsSymlink_ = call (load_sym libgio "g_file_info_set_is_symlink") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setModificationTime_ = call (load_sym libgio "g_file_info_set_modification_time") (GObjectObjectClass.PolyML.cPtr &&> GLibTimeValRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setName_ = call (load_sym libgio "g_file_info_set_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setSize_ = call (load_sym libgio "g_file_info_set_size") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int64.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSortOrder_ = call (load_sym libgio "g_file_info_set_sort_order") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSymlinkTarget_ = call (load_sym libgio "g_file_info_set_symlink_target") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val unsetAttributeMask_ = call (load_sym libgio "g_file_info_unset_attribute_mask") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioFileInfoClass.class
    type file_attribute_type_t = GioFileAttributeType.t
    type file_attribute_matcher_t = GioFileAttributeMatcherRecord.t
    type file_attribute_status_t = GioFileAttributeStatus.t
    type file_type_t = GioFileType.t
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioFileInfoClass.C.fromPtr true) new_ ()
    fun clearStatus self = (GObjectObjectClass.C.withPtr ---> I) clearStatus_ self
    fun copyInto self destInfo = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) copyInto_ (self & destInfo)
    fun dup self = (GObjectObjectClass.C.withPtr ---> GioFileInfoClass.C.fromPtr true) dup_ self
    fun getAttributeAsString self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) getAttributeAsString_ (self & attribute)
    fun getAttributeBoolean self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) getAttributeBoolean_ (self & attribute)
    fun getAttributeByteString self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getAttributeByteString_ (self & attribute)
    fun getAttributeInt32 self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int32.C.fromVal) getAttributeInt32_ (self & attribute)
    fun getAttributeInt64 self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int64.C.fromVal) getAttributeInt64_ (self & attribute)
    fun getAttributeObject self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GObjectObjectClass.C.fromPtr false) getAttributeObject_ (self & attribute)
    fun getAttributeStatus self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileAttributeStatus.C.fromVal) getAttributeStatus_ (self & attribute)
    fun getAttributeString self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getAttributeString_ (self & attribute)
    fun getAttributeType self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileAttributeType.C.fromVal) getAttributeType_ (self & attribute)
    fun getAttributeUint32 self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.UInt32.C.fromVal) getAttributeUint32_ (self & attribute)
    fun getAttributeUint64 self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.UInt64.C.fromVal) getAttributeUint64_ (self & attribute)
    fun getContentType self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getContentType_ self
    fun getDisplayName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDisplayName_ self
    fun getEditName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getEditName_ self
    fun getEtag self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getEtag_ self
    fun getFileType self = (GObjectObjectClass.C.withPtr ---> GioFileType.C.fromVal) getFileType_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getIcon_ self
    fun getIsBackup self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsBackup_ self
    fun getIsHidden self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsHidden_ self
    fun getIsSymlink self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsSymlink_ self
    fun getModificationTime self result = (GObjectObjectClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> I) getModificationTime_ (self & result)
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int64.C.fromVal) getSize_ self
    fun getSortOrder self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSortOrder_ self
    fun getSymlinkTarget self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getSymlinkTarget_ self
    fun hasAttribute self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasAttribute_ (self & attribute)
    fun hasNamespace self nameSpace = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasNamespace_ (self & nameSpace)
    fun removeAttribute self attribute = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) removeAttribute_ (self & attribute)
    fun setAttributeBoolean self attribute attrValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setAttributeBoolean_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeByteString self attribute attrValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        setAttributeByteString_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeInt32 self attribute attrValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setAttributeInt32_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeInt64 self attribute attrValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int64.C.withVal
         ---> I
      )
        setAttributeInt64_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeMask self mask = (GObjectObjectClass.C.withPtr &&&> GioFileAttributeMatcherRecord.C.withPtr ---> I) setAttributeMask_ (self & mask)
    fun setAttributeObject self attribute attrValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        setAttributeObject_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeStatus self attribute status =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioFileAttributeStatus.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        setAttributeStatus_
        (
          self
           & attribute
           & status
        )
    fun setAttributeString self attribute attrValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        setAttributeString_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeStringv self attribute attrValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        setAttributeStringv_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeUint32 self attribute attrValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        setAttributeUint32_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeUint64 self attribute attrValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt64.C.withVal
         ---> I
      )
        setAttributeUint64_
        (
          self
           & attribute
           & attrValue
        )
    fun setContentType self contentType = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setContentType_ (self & contentType)
    fun setDisplayName self displayName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDisplayName_ (self & displayName)
    fun setEditName self editName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setEditName_ (self & editName)
    fun setFileType self type' = (GObjectObjectClass.C.withPtr &&&> GioFileType.C.withVal ---> I) setFileType_ (self & type')
    fun setIcon self icon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setIcon_ (self & icon)
    fun setIsHidden self isHidden = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIsHidden_ (self & isHidden)
    fun setIsSymlink self isSymlink = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIsSymlink_ (self & isSymlink)
    fun setModificationTime self mtime = (GObjectObjectClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> I) setModificationTime_ (self & mtime)
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
    fun setSize self size = (GObjectObjectClass.C.withPtr &&&> FFI.Int64.C.withVal ---> I) setSize_ (self & size)
    fun setSortOrder self sortOrder = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSortOrder_ (self & sortOrder)
    fun setSymlinkTarget self symlinkTarget = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setSymlinkTarget_ (self & symlinkTarget)
    fun unsetAttributeMask self = (GObjectObjectClass.C.withPtr ---> I) unsetAttributeMask_ self
  end
