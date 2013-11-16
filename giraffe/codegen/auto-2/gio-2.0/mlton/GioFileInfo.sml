structure GioFileInfo :>
  GIO_FILE_INFO
    where type 'a class_t = 'a GioFileInfoClass.t
    where type fileattributetype_t = GioFileAttributeType.t
    where type fileattributematcherrecord_t = GioFileAttributeMatcherRecord.t
    where type fileattributestatus_t = GioFileAttributeStatus.t
    where type filetype_t = GioFileType.t
    where type 'a iconclass_t = 'a GioIconClass.t =
  struct
    val getType_ = _import "g_file_info_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_file_info_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val clearStatus_ = _import "g_file_info_clear_status" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val copyInto_ = fn x1 & x2 => (_import "g_file_info_copy_into" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val dup_ = _import "g_file_info_dup" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAttributeAsString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_as_string" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeBoolean_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_boolean" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeByteString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_byte_string" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeData_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_file_info_get_attribute_data" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GioFileAttributeType.C.ref_
               * GioFileAttributeStatus.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getAttributeInt32_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_int32" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Int32.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeInt64_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_int64" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Int64.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeObject_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_object" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeStatus_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_status" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GioFileAttributeStatus.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_string" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeType_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_type" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GioFileAttributeType.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeUint32_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_uint32" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.UInt32.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeUint64_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_uint64" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.UInt64.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getContentType_ = _import "g_file_info_get_content_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getDisplayName_ = _import "g_file_info_get_display_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getEditName_ = _import "g_file_info_get_edit_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getEtag_ = _import "g_file_info_get_etag" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getFileType_ = _import "g_file_info_get_file_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioFileType.C.val_;
    val getIcon_ = _import "g_file_info_get_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getIsBackup_ = _import "g_file_info_get_is_backup" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIsHidden_ = _import "g_file_info_get_is_hidden" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIsSymlink_ = _import "g_file_info_get_is_symlink" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getModificationTime_ = fn x1 & x2 => (_import "g_file_info_get_modification_time" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p -> unit;) (x1, x2)
    val getName_ = _import "g_file_info_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getSize_ = _import "g_file_info_get_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int64.C.val_;
    val getSortOrder_ = _import "g_file_info_get_sort_order" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getSymlinkTarget_ = _import "g_file_info_get_symlink_target" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val hasAttribute_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_has_attribute" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hasNamespace_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_has_namespace" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val removeAttribute_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_remove_attribute" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAttribute_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_file_info_set_attribute" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GioFileAttributeType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAttributeBoolean_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_file_info_set_attribute_boolean" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAttributeByteString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_file_info_set_attribute_byte_string" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setAttributeInt32_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_file_info_set_attribute_int32" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAttributeInt64_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_file_info_set_attribute_int64" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int64.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAttributeMask_ = fn x1 & x2 => (_import "g_file_info_set_attribute_mask" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioFileAttributeMatcherRecord.C.notnull GioFileAttributeMatcherRecord.C.p -> unit;) (x1, x2)
    val setAttributeObject_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_file_info_set_attribute_object" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAttributeStatus_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_file_info_set_attribute_status" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GioFileAttributeStatus.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAttributeString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_file_info_set_attribute_string" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setAttributeStringv_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_file_info_set_attribute_stringv" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setAttributeUint32_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_file_info_set_attribute_uint32" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.UInt32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAttributeUint64_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_file_info_set_attribute_uint64" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.UInt64.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setContentType_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_set_content_type" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDisplayName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_set_display_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setEditName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_set_edit_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFileType_ = fn x1 & x2 => (_import "g_file_info_set_file_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioFileType.C.val_ -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "g_file_info_set_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setIsHidden_ = fn x1 & x2 => (_import "g_file_info_set_is_hidden" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setIsSymlink_ = fn x1 & x2 => (_import "g_file_info_set_is_symlink" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setModificationTime_ = fn x1 & x2 => (_import "g_file_info_set_modification_time" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p -> unit;) (x1, x2)
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_set_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSize_ = fn x1 & x2 => (_import "g_file_info_set_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int64.C.val_ -> unit;) (x1, x2)
    val setSortOrder_ = fn x1 & x2 => (_import "g_file_info_set_sort_order" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setSymlinkTarget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_set_symlink_target" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unsetAttributeMask_ = _import "g_file_info_unset_attribute_mask" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
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
    fun getAttributeAsString self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) getAttributeAsString_ (self & attribute)
    fun getAttributeBoolean self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) getAttributeBoolean_ (self & attribute)
    fun getAttributeByteString self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getAttributeByteString_ (self & attribute)
    fun getAttributeData self attribute =
      let
        val type'
         & status
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.String.C.withConstPtr
             &&&> GioFileAttributeType.C.withRefVal
             &&&> GioFileAttributeStatus.C.withRefVal
             ---> GioFileAttributeType.C.fromVal
                   && GioFileAttributeStatus.C.fromVal
                   && FFI.Bool.C.fromVal
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
    fun getAttributeInt32 self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Int32.C.fromVal) getAttributeInt32_ (self & attribute)
    fun getAttributeInt64 self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Int64.C.fromVal) getAttributeInt64_ (self & attribute)
    fun getAttributeObject self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GObjectObjectClass.C.fromPtr false) getAttributeObject_ (self & attribute)
    fun getAttributeStatus self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioFileAttributeStatus.C.fromVal) getAttributeStatus_ (self & attribute)
    fun getAttributeString self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getAttributeString_ (self & attribute)
    fun getAttributeType self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioFileAttributeType.C.fromVal) getAttributeType_ (self & attribute)
    fun getAttributeUint32 self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.UInt32.C.fromVal) getAttributeUint32_ (self & attribute)
    fun getAttributeUint64 self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.UInt64.C.fromVal) getAttributeUint64_ (self & attribute)
    fun getContentType self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getContentType_ self
    fun getDisplayName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDisplayName_ self
    fun getEditName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getEditName_ self
    fun getEtag self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getEtag_ self
    fun getFileType self = (GObjectObjectClass.C.withPtr ---> GioFileType.C.fromVal) getFileType_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getIcon_ self
    fun getIsBackup self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsBackup_ self
    fun getIsHidden self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsHidden_ self
    fun getIsSymlink self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsSymlink_ self
    fun getModificationTime self result = (GObjectObjectClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> I) getModificationTime_ (self & result)
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int64.C.fromVal) getSize_ self
    fun getSortOrder self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSortOrder_ self
    fun getSymlinkTarget self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getSymlinkTarget_ self
    fun hasAttribute self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hasAttribute_ (self & attribute)
    fun hasNamespace self nameSpace = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hasNamespace_ (self & nameSpace)
    fun removeAttribute self attribute = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) removeAttribute_ (self & attribute)
    fun setAttribute self attribute type' =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt64.C.withVal
         ---> I
      )
        setAttributeUint64_
        (
          self
           & attribute
           & attrValue
        )
    fun setContentType self contentType = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setContentType_ (self & contentType)
    fun setDisplayName self displayName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setDisplayName_ (self & displayName)
    fun setEditName self editName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setEditName_ (self & editName)
    fun setFileType self type' = (GObjectObjectClass.C.withPtr &&&> GioFileType.C.withVal ---> I) setFileType_ (self & type')
    fun setIcon self icon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setIcon_ (self & icon)
    fun setIsHidden self isHidden = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIsHidden_ (self & isHidden)
    fun setIsSymlink self isSymlink = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIsSymlink_ (self & isSymlink)
    fun setModificationTime self mtime = (GObjectObjectClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> I) setModificationTime_ (self & mtime)
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setName_ (self & name)
    fun setSize self size = (GObjectObjectClass.C.withPtr &&&> FFI.Int64.C.withVal ---> I) setSize_ (self & size)
    fun setSortOrder self sortOrder = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSortOrder_ (self & sortOrder)
    fun setSymlinkTarget self symlinkTarget = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setSymlinkTarget_ (self & symlinkTarget)
    fun unsetAttributeMask self = (GObjectObjectClass.C.withPtr ---> I) unsetAttributeMask_ self
  end
