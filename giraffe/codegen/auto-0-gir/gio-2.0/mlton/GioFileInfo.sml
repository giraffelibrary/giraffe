structure GioFileInfo :>
  GIO_FILE_INFO
    where type 'a class = 'a GioFileInfoClass.class
    where type file_attribute_type_t = GioFileAttributeType.t
    where type file_attribute_matcher_t = GioFileAttributeMatcherRecord.t
    where type file_attribute_status_t = GioFileAttributeStatus.t
    where type file_type_t = GioFileType.t
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    val getType_ = _import "g_file_info_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_file_info_new" : unit -> GioFileInfoClass.C.notnull GioFileInfoClass.C.p;
    val clearStatus_ = _import "g_file_info_clear_status" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> unit;
    val copyInto_ = fn x1 & x2 => (_import "g_file_info_copy_into" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p * GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> unit;) (x1, x2)
    val dup_ = _import "g_file_info_dup" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> GioFileInfoClass.C.notnull GioFileInfoClass.C.p;
    val getAttributeAsString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_as_string" :
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeInt32_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_int32" :
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.UInt64.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getContentType_ = _import "g_file_info_get_content_type" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getDisplayName_ = _import "g_file_info_get_display_name" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getEditName_ = _import "g_file_info_get_edit_name" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getEtag_ = _import "g_file_info_get_etag" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getFileType_ = _import "g_file_info_get_file_type" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> GioFileType.C.val_;
    val getIcon_ = _import "g_file_info_get_icon" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> GioIconClass.C.notnull GioIconClass.C.p;
    val getIsBackup_ = _import "g_file_info_get_is_backup" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> FFI.Bool.C.val_;
    val getIsHidden_ = _import "g_file_info_get_is_hidden" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> FFI.Bool.C.val_;
    val getIsSymlink_ = _import "g_file_info_get_is_symlink" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> FFI.Bool.C.val_;
    val getModificationTime_ = fn x1 & x2 => (_import "g_file_info_get_modification_time" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p * GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p -> unit;) (x1, x2)
    val getName_ = _import "g_file_info_get_name" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getSize_ = _import "g_file_info_get_size" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> FFI.Int64.C.val_;
    val getSortOrder_ = _import "g_file_info_get_sort_order" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> FFI.Int32.C.val_;
    val getSymlinkTarget_ = _import "g_file_info_get_symlink_target" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val hasAttribute_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_has_attribute" :
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAttributeBoolean_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_file_info_set_attribute_boolean" :
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int64.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAttributeMask_ = fn x1 & x2 => (_import "g_file_info_set_attribute_mask" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p * GioFileAttributeMatcherRecord.C.notnull GioFileAttributeMatcherRecord.C.p -> unit;) (x1, x2)
    val setAttributeObject_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_file_info_set_attribute_object" :
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFileType_ = fn x1 & x2 => (_import "g_file_info_set_file_type" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p * GioFileType.C.val_ -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "g_file_info_set_icon" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p * GioIconClass.C.notnull GioIconClass.C.p -> unit;) (x1, x2)
    val setIsHidden_ = fn x1 & x2 => (_import "g_file_info_set_is_hidden" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setIsSymlink_ = fn x1 & x2 => (_import "g_file_info_set_is_symlink" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setModificationTime_ = fn x1 & x2 => (_import "g_file_info_set_modification_time" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p * GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p -> unit;) (x1, x2)
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_set_name" :
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSize_ = fn x1 & x2 => (_import "g_file_info_set_size" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p * FFI.Int64.C.val_ -> unit;) (x1, x2)
    val setSortOrder_ = fn x1 & x2 => (_import "g_file_info_set_sort_order" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setSymlinkTarget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_set_symlink_target" :
              GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unsetAttributeMask_ = _import "g_file_info_unset_attribute_mask" : GioFileInfoClass.C.notnull GioFileInfoClass.C.p -> unit;
    type 'a class = 'a GioFileInfoClass.class
    type file_attribute_type_t = GioFileAttributeType.t
    type file_attribute_matcher_t = GioFileAttributeMatcherRecord.t
    type file_attribute_status_t = GioFileAttributeStatus.t
    type file_type_t = GioFileType.t
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioFileInfoClass.C.fromPtr true) new_ ()
    fun clearStatus self = (GioFileInfoClass.C.withPtr ---> I) clearStatus_ self
    fun copyInto self destInfo = (GioFileInfoClass.C.withPtr &&&> GioFileInfoClass.C.withPtr ---> I) copyInto_ (self & destInfo)
    fun dup self = (GioFileInfoClass.C.withPtr ---> GioFileInfoClass.C.fromPtr true) dup_ self
    fun getAttributeAsString self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) getAttributeAsString_ (self & attribute)
    fun getAttributeBoolean self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) getAttributeBoolean_ (self & attribute)
    fun getAttributeByteString self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getAttributeByteString_ (self & attribute)
    fun getAttributeInt32 self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int32.C.fromVal) getAttributeInt32_ (self & attribute)
    fun getAttributeInt64 self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int64.C.fromVal) getAttributeInt64_ (self & attribute)
    fun getAttributeObject self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> GObjectObjectClass.C.fromPtr false) getAttributeObject_ (self & attribute)
    fun getAttributeStatus self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileAttributeStatus.C.fromVal) getAttributeStatus_ (self & attribute)
    fun getAttributeString self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getAttributeString_ (self & attribute)
    fun getAttributeType self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileAttributeType.C.fromVal) getAttributeType_ (self & attribute)
    fun getAttributeUint32 self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.UInt32.C.fromVal) getAttributeUint32_ (self & attribute)
    fun getAttributeUint64 self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.UInt64.C.fromVal) getAttributeUint64_ (self & attribute)
    fun getContentType self = (GioFileInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getContentType_ self
    fun getDisplayName self = (GioFileInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getDisplayName_ self
    fun getEditName self = (GioFileInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getEditName_ self
    fun getEtag self = (GioFileInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getEtag_ self
    fun getFileType self = (GioFileInfoClass.C.withPtr ---> GioFileType.C.fromVal) getFileType_ self
    fun getIcon self = (GioFileInfoClass.C.withPtr ---> GioIconClass.C.fromPtr false) getIcon_ self
    fun getIsBackup self = (GioFileInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsBackup_ self
    fun getIsHidden self = (GioFileInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsHidden_ self
    fun getIsSymlink self = (GioFileInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsSymlink_ self
    fun getModificationTime self result = (GioFileInfoClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> I) getModificationTime_ (self & result)
    fun getName self = (GioFileInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getSize self = (GioFileInfoClass.C.withPtr ---> FFI.Int64.C.fromVal) getSize_ self
    fun getSortOrder self = (GioFileInfoClass.C.withPtr ---> FFI.Int32.C.fromVal) getSortOrder_ self
    fun getSymlinkTarget self = (GioFileInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getSymlinkTarget_ self
    fun hasAttribute self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasAttribute_ (self & attribute)
    fun hasNamespace self nameSpace = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasNamespace_ (self & nameSpace)
    fun removeAttribute self attribute = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> I) removeAttribute_ (self & attribute)
    fun setAttributeBoolean self attribute attrValue =
      (
        GioFileInfoClass.C.withPtr
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
        GioFileInfoClass.C.withPtr
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
        GioFileInfoClass.C.withPtr
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
        GioFileInfoClass.C.withPtr
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
    fun setAttributeMask self mask = (GioFileInfoClass.C.withPtr &&&> GioFileAttributeMatcherRecord.C.withPtr ---> I) setAttributeMask_ (self & mask)
    fun setAttributeObject self attribute attrValue =
      (
        GioFileInfoClass.C.withPtr
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
        GioFileInfoClass.C.withPtr
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
        GioFileInfoClass.C.withPtr
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
        GioFileInfoClass.C.withPtr
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
        GioFileInfoClass.C.withPtr
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
        GioFileInfoClass.C.withPtr
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
    fun setContentType self contentType = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setContentType_ (self & contentType)
    fun setDisplayName self displayName = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDisplayName_ (self & displayName)
    fun setEditName self editName = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setEditName_ (self & editName)
    fun setFileType self type' = (GioFileInfoClass.C.withPtr &&&> GioFileType.C.withVal ---> I) setFileType_ (self & type')
    fun setIcon self icon = (GioFileInfoClass.C.withPtr &&&> GioIconClass.C.withPtr ---> I) setIcon_ (self & icon)
    fun setIsHidden self isHidden = (GioFileInfoClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIsHidden_ (self & isHidden)
    fun setIsSymlink self isSymlink = (GioFileInfoClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIsSymlink_ (self & isSymlink)
    fun setModificationTime self mtime = (GioFileInfoClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> I) setModificationTime_ (self & mtime)
    fun setName self name = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
    fun setSize self size = (GioFileInfoClass.C.withPtr &&&> FFI.Int64.C.withVal ---> I) setSize_ (self & size)
    fun setSortOrder self sortOrder = (GioFileInfoClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSortOrder_ (self & sortOrder)
    fun setSymlinkTarget self symlinkTarget = (GioFileInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setSymlinkTarget_ (self & symlinkTarget)
    fun unsetAttributeMask self = (GioFileInfoClass.C.withPtr ---> I) unsetAttributeMask_ self
  end
