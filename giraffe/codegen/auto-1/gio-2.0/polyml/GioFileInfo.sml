structure GioFileInfo :>
  GIO_FILE_INFO
    where type 'a class_t = 'a GioFileInfoClass.t
    where type fileattributetype_t = GioFileAttributeType.t
    where type fileattributematcherrecord_t = GioFileAttributeMatcherRecord.t
    where type fileattributestatus_t = GioFileAttributeStatus.t
    where type filetype_t = GioFileType.t
    where type 'a iconclass_t = 'a GioIconClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_info_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_file_info_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val clearStatus_ = call (load_sym libgio "g_file_info_clear_status") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val copyInto_ = call (load_sym libgio "g_file_info_copy_into") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val dup_ = call (load_sym libgio "g_file_info_dup") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getAttributeAsString_ = call (load_sym libgio "g_file_info_get_attribute_as_string") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val getAttributeBoolean_ = call (load_sym libgio "g_file_info_get_attribute_boolean") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val getAttributeByteString_ = call (load_sym libgio "g_file_info_get_attribute_byte_string") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val getAttributeData_ =
        call (load_sym libgio "g_file_info_get_attribute_data")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GioFileAttributeType.PolyML.REF
             &&> GioFileAttributeStatus.PolyML.REF
             --> FFI.PolyML.Bool.VAL
          )
      val getAttributeInt32_ = call (load_sym libgio "g_file_info_get_attribute_int32") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Int32.VAL)
      val getAttributeInt64_ = call (load_sym libgio "g_file_info_get_attribute_int64") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Int64.VAL)
      val getAttributeObject_ = call (load_sym libgio "g_file_info_get_attribute_object") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getAttributeStatus_ = call (load_sym libgio "g_file_info_get_attribute_status") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GioFileAttributeStatus.PolyML.VAL)
      val getAttributeString_ = call (load_sym libgio "g_file_info_get_attribute_string") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val getAttributeType_ = call (load_sym libgio "g_file_info_get_attribute_type") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GioFileAttributeType.PolyML.VAL)
      val getAttributeUint32_ = call (load_sym libgio "g_file_info_get_attribute_uint32") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Word32.VAL)
      val getAttributeUint64_ = call (load_sym libgio "g_file_info_get_attribute_uint64") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Word64.VAL)
      val getContentType_ = call (load_sym libgio "g_file_info_get_content_type") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getDisplayName_ = call (load_sym libgio "g_file_info_get_display_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getEditName_ = call (load_sym libgio "g_file_info_get_edit_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getEtag_ = call (load_sym libgio "g_file_info_get_etag") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getFileType_ = call (load_sym libgio "g_file_info_get_file_type") (GObjectObjectClass.PolyML.PTR --> GioFileType.PolyML.VAL)
      val getIcon_ = call (load_sym libgio "g_file_info_get_icon") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getIsBackup_ = call (load_sym libgio "g_file_info_get_is_backup") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getIsHidden_ = call (load_sym libgio "g_file_info_get_is_hidden") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getIsSymlink_ = call (load_sym libgio "g_file_info_get_is_symlink") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getModificationTime_ = call (load_sym libgio "g_file_info_get_modification_time") (GObjectObjectClass.PolyML.PTR &&> GLibTimeValRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getName_ = call (load_sym libgio "g_file_info_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getSize_ = call (load_sym libgio "g_file_info_get_size") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int64.VAL)
      val getSortOrder_ = call (load_sym libgio "g_file_info_get_sort_order") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getSymlinkTarget_ = call (load_sym libgio "g_file_info_get_symlink_target") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val hasAttribute_ = call (load_sym libgio "g_file_info_has_attribute") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val hasNamespace_ = call (load_sym libgio "g_file_info_has_namespace") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val removeAttribute_ = call (load_sym libgio "g_file_info_remove_attribute") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setAttribute_ =
        call (load_sym libgio "g_file_info_set_attribute")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GioFileAttributeType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setAttributeBoolean_ =
        call (load_sym libgio "g_file_info_set_attribute_boolean")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Bool.VAL
             --> FFI.PolyML.VOID
          )
      val setAttributeByteString_ =
        call (load_sym libgio "g_file_info_set_attribute_byte_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val setAttributeInt32_ =
        call (load_sym libgio "g_file_info_set_attribute_int32")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val setAttributeInt64_ =
        call (load_sym libgio "g_file_info_set_attribute_int64")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int64.VAL
             --> FFI.PolyML.VOID
          )
      val setAttributeMask_ = call (load_sym libgio "g_file_info_set_attribute_mask") (GObjectObjectClass.PolyML.PTR &&> GioFileAttributeMatcherRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setAttributeObject_ =
        call (load_sym libgio "g_file_info_set_attribute_object")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val setAttributeStatus_ =
        call (load_sym libgio "g_file_info_set_attribute_status")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GioFileAttributeStatus.PolyML.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val setAttributeString_ =
        call (load_sym libgio "g_file_info_set_attribute_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val setAttributeStringv_ =
        call (load_sym libgio "g_file_info_set_attribute_stringv")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val setAttributeUint32_ =
        call (load_sym libgio "g_file_info_set_attribute_uint32")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.VOID
          )
      val setAttributeUint64_ =
        call (load_sym libgio "g_file_info_set_attribute_uint64")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word64.VAL
             --> FFI.PolyML.VOID
          )
      val setContentType_ = call (load_sym libgio "g_file_info_set_content_type") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setDisplayName_ = call (load_sym libgio "g_file_info_set_display_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setEditName_ = call (load_sym libgio "g_file_info_set_edit_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setFileType_ = call (load_sym libgio "g_file_info_set_file_type") (GObjectObjectClass.PolyML.PTR &&> GioFileType.PolyML.VAL --> FFI.PolyML.VOID)
      val setIcon_ = call (load_sym libgio "g_file_info_set_icon") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setIsHidden_ = call (load_sym libgio "g_file_info_set_is_hidden") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setIsSymlink_ = call (load_sym libgio "g_file_info_set_is_symlink") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setModificationTime_ = call (load_sym libgio "g_file_info_set_modification_time") (GObjectObjectClass.PolyML.PTR &&> GLibTimeValRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setName_ = call (load_sym libgio "g_file_info_set_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setSize_ = call (load_sym libgio "g_file_info_set_size") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.VOID)
      val setSortOrder_ = call (load_sym libgio "g_file_info_set_sort_order") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setSymlinkTarget_ = call (load_sym libgio "g_file_info_set_symlink_target") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val unsetAttributeMask_ = call (load_sym libgio "g_file_info_unset_attribute_mask") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioFileInfoClass.t
    type fileattributetype_t = GioFileAttributeType.t
    type fileattributematcherrecord_t = GioFileAttributeMatcherRecord.t
    type fileattributestatus_t = GioFileAttributeStatus.t
    type filetype_t = GioFileType.t
    type 'a iconclass_t = 'a GioIconClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioFileInfoClass.C.fromPtr true) new_ ()
    fun clearStatus self = (GObjectObjectClass.C.withPtr ---> I) clearStatus_ self
    fun copyInto self destInfo = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) copyInto_ (self & destInfo)
    fun dup self = (GObjectObjectClass.C.withPtr ---> GioFileInfoClass.C.fromPtr true) dup_ self
    fun getAttributeAsString self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) getAttributeAsString_ (self & attribute)
    fun getAttributeBoolean self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) getAttributeBoolean_ (self & attribute)
    fun getAttributeByteString self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) getAttributeByteString_ (self & attribute)
    fun getAttributeData self attribute =
      let
        val type'
         & status
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.String.withConstPtr
             &&&> GioFileAttributeType.C.withRefVal
             &&&> GioFileAttributeStatus.C.withRefVal
             ---> GioFileAttributeType.C.fromVal
                   && GioFileAttributeStatus.C.fromVal
                   && FFI.Bool.fromVal
          )
            getAttributeData_
            (
              self
               & attribute
               & GioFileAttributeType.null
               & GioFileAttributeStatus.null
            )
      in
        if retVal then SOME (type', status) else NONE
      end
    fun getAttributeInt32 self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Int32.fromVal) getAttributeInt32_ (self & attribute)
    fun getAttributeInt64 self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Int64.fromVal) getAttributeInt64_ (self & attribute)
    fun getAttributeObject self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GObjectObjectClass.C.fromPtr false) getAttributeObject_ (self & attribute)
    fun getAttributeStatus self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GioFileAttributeStatus.C.fromVal) getAttributeStatus_ (self & attribute)
    fun getAttributeString self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) getAttributeString_ (self & attribute)
    fun getAttributeType self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GioFileAttributeType.C.fromVal) getAttributeType_ (self & attribute)
    fun getAttributeUint32 self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Word32.fromVal) getAttributeUint32_ (self & attribute)
    fun getAttributeUint64 self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Word64.fromVal) getAttributeUint64_ (self & attribute)
    fun getContentType self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getContentType_ self
    fun getDisplayName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getDisplayName_ self
    fun getEditName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getEditName_ self
    fun getEtag self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getEtag_ self
    fun getFileType self = (GObjectObjectClass.C.withPtr ---> GioFileType.C.fromVal) getFileType_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getIcon_ self
    fun getIsBackup self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsBackup_ self
    fun getIsHidden self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsHidden_ self
    fun getIsSymlink self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsSymlink_ self
    fun getModificationTime self result = (GObjectObjectClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> I) getModificationTime_ (self & result)
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getName_ self
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int64.fromVal) getSize_ self
    fun getSortOrder self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getSortOrder_ self
    fun getSymlinkTarget self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getSymlinkTarget_ self
    fun hasAttribute self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) hasAttribute_ (self & attribute)
    fun hasNamespace self nameSpace = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) hasNamespace_ (self & nameSpace)
    fun removeAttribute self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) removeAttribute_ (self & attribute)
    fun setAttribute self attribute type' =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GioFileAttributeType.C.withVal
         ---> I
      )
        setAttribute_
        (
          self
           & attribute
           & type'
        )
    fun setAttributeBoolean self attribute attrValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Bool.withVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int64.withVal
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
         &&&> FFI.String.withConstPtr
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
         &&&> FFI.String.withConstPtr
         &&&> GioFileAttributeStatus.C.withVal
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word32.withVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word64.withVal
         ---> I
      )
        setAttributeUint64_
        (
          self
           & attribute
           & attrValue
        )
    fun setContentType self contentType = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setContentType_ (self & contentType)
    fun setDisplayName self displayName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setDisplayName_ (self & displayName)
    fun setEditName self editName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setEditName_ (self & editName)
    fun setFileType self type' = (GObjectObjectClass.C.withPtr &&&> GioFileType.C.withVal ---> I) setFileType_ (self & type')
    fun setIcon self icon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setIcon_ (self & icon)
    fun setIsHidden self isHidden = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setIsHidden_ (self & isHidden)
    fun setIsSymlink self isSymlink = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setIsSymlink_ (self & isSymlink)
    fun setModificationTime self mtime = (GObjectObjectClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> I) setModificationTime_ (self & mtime)
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setName_ (self & name)
    fun setSize self size = (GObjectObjectClass.C.withPtr &&&> FFI.Int64.withVal ---> I) setSize_ (self & size)
    fun setSortOrder self sortOrder = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setSortOrder_ (self & sortOrder)
    fun setSymlinkTarget self symlinkTarget = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setSymlinkTarget_ (self & symlinkTarget)
    fun unsetAttributeMask self = (GObjectObjectClass.C.withPtr ---> I) unsetAttributeMask_ self
  end
