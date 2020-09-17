structure GioFileInfo :>
  GIO_FILE_INFO
    where type 'a class = 'a GioFileInfoClass.class
    where type file_attribute_type_t = GioFileAttributeType.t
    where type file_attribute_matcher_t = GioFileAttributeMatcherRecord.t
    where type file_attribute_status_t = GioFileAttributeStatus.t
    where type file_type_t = GioFileType.t
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    val getType_ = _import "g_file_info_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_file_info_new" : unit -> GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p;
    val clearStatus_ = _import "g_file_info_clear_status" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> unit;
    val copyInto_ = fn x1 & x2 => (_import "g_file_info_copy_into" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p * GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> unit;) (x1, x2)
    val dup_ = _import "g_file_info_dup" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p;
    val getAttributeAsString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_as_string" :
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GInt32.FFI.val_;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GInt64.FFI.val_;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioFileAttributeStatus.FFI.val_;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeStringv_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_get_attribute_stringv" :
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioFileAttributeType.FFI.val_;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GUInt32.FFI.val_;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GUInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getContentType_ = _import "g_file_info_get_content_type" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getDeletionDate_ = _import "g_file_info_get_deletion_date" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> GLibDateTimeRecord.FFI.non_opt GLibDateTimeRecord.FFI.p;
    val getDisplayName_ = _import "g_file_info_get_display_name" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getEditName_ = _import "g_file_info_get_edit_name" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getEtag_ = _import "g_file_info_get_etag" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getFileType_ = _import "g_file_info_get_file_type" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> GioFileType.FFI.val_;
    val getIcon_ = _import "g_file_info_get_icon" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val getIsBackup_ = _import "g_file_info_get_is_backup" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> GBool.FFI.val_;
    val getIsHidden_ = _import "g_file_info_get_is_hidden" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> GBool.FFI.val_;
    val getIsSymlink_ = _import "g_file_info_get_is_symlink" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> GBool.FFI.val_;
    val getModificationTime_ = fn x1 & x2 => (_import "g_file_info_get_modification_time" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p * GLibTimeValRecord.FFI.non_opt GLibTimeValRecord.FFI.p -> unit;) (x1, x2)
    val getName_ = _import "g_file_info_get_name" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getSize_ = _import "g_file_info_get_size" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> GInt64.FFI.val_;
    val getSortOrder_ = _import "g_file_info_get_sort_order" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> GInt32.FFI.val_;
    val getSymbolicIcon_ = _import "g_file_info_get_symbolic_icon" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val getSymlinkTarget_ = _import "g_file_info_get_symlink_target" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val hasAttribute_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_has_attribute" :
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val listAttributes_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_list_attributes" :
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> Utf8CPtrArray.FFI.opt Utf8CPtrArray.FFI.out_p;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GBool.FFI.val_
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt64.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAttributeMask_ = fn x1 & x2 => (_import "g_file_info_set_attribute_mask" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p * GioFileAttributeMatcherRecord.FFI.non_opt GioFileAttributeMatcherRecord.FFI.p -> unit;) (x1, x2)
    val setAttributeObject_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_file_info_set_attribute_object" :
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioFileAttributeStatus.FFI.val_
               -> GBool.FFI.val_;
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt32.FFI.val_
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt64.FFI.val_
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFileType_ = fn x1 & x2 => (_import "g_file_info_set_file_type" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p * GioFileType.FFI.val_ -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "g_file_info_set_icon" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p * GioIconClass.FFI.non_opt GioIconClass.FFI.p -> unit;) (x1, x2)
    val setIsHidden_ = fn x1 & x2 => (_import "g_file_info_set_is_hidden" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setIsSymlink_ = fn x1 & x2 => (_import "g_file_info_set_is_symlink" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setModificationTime_ = fn x1 & x2 => (_import "g_file_info_set_modification_time" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p * GLibTimeValRecord.FFI.non_opt GLibTimeValRecord.FFI.p -> unit;) (x1, x2)
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_set_name" :
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSize_ = fn x1 & x2 => (_import "g_file_info_set_size" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p * GInt64.FFI.val_ -> unit;) (x1, x2)
    val setSortOrder_ = fn x1 & x2 => (_import "g_file_info_set_sort_order" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setSymbolicIcon_ = fn x1 & x2 => (_import "g_file_info_set_symbolic_icon" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p * GioIconClass.FFI.non_opt GioIconClass.FFI.p -> unit;) (x1, x2)
    val setSymlinkTarget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_info_set_symlink_target" :
              GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unsetAttributeMask_ = _import "g_file_info_unset_attribute_mask" : GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p -> unit;
    type 'a class = 'a GioFileInfoClass.class
    type file_attribute_type_t = GioFileAttributeType.t
    type file_attribute_matcher_t = GioFileAttributeMatcherRecord.t
    type file_attribute_status_t = GioFileAttributeStatus.t
    type file_type_t = GioFileType.t
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioFileInfoClass.FFI.fromPtr true) new_ ()
    fun clearStatus self = (GioFileInfoClass.FFI.withPtr false ---> I) clearStatus_ self
    fun copyInto self destInfo = (GioFileInfoClass.FFI.withPtr false &&&> GioFileInfoClass.FFI.withPtr false ---> I) copyInto_ (self & destInfo)
    fun dup self = (GioFileInfoClass.FFI.withPtr false ---> GioFileInfoClass.FFI.fromPtr true) dup_ self
    fun getAttributeAsString self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) getAttributeAsString_ (self & attribute)
    fun getAttributeBoolean self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) getAttributeBoolean_ (self & attribute)
    fun getAttributeByteString self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getAttributeByteString_ (self & attribute) before GioFileInfoClass.FFI.touchPtr self before Utf8.FFI.touchPtr attribute
    fun getAttributeInt32 self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GInt32.FFI.fromVal) getAttributeInt32_ (self & attribute)
    fun getAttributeInt64 self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GInt64.FFI.fromVal) getAttributeInt64_ (self & attribute)
    fun getAttributeObject self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GObjectObjectClass.FFI.fromPtr false) getAttributeObject_ (self & attribute) before GioFileInfoClass.FFI.touchPtr self before Utf8.FFI.touchPtr attribute
    fun getAttributeStatus self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioFileAttributeStatus.FFI.fromVal) getAttributeStatus_ (self & attribute)
    fun getAttributeString self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getAttributeString_ (self & attribute) before GioFileInfoClass.FFI.touchPtr self before Utf8.FFI.touchPtr attribute
    fun getAttributeStringv self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr 0) getAttributeStringv_ (self & attribute) before GioFileInfoClass.FFI.touchPtr self before Utf8.FFI.touchPtr attribute
    fun getAttributeType self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioFileAttributeType.FFI.fromVal) getAttributeType_ (self & attribute)
    fun getAttributeUint32 self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GUInt32.FFI.fromVal) getAttributeUint32_ (self & attribute)
    fun getAttributeUint64 self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GUInt64.FFI.fromVal) getAttributeUint64_ (self & attribute)
    fun getContentType self = (GioFileInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getContentType_ self before GioFileInfoClass.FFI.touchPtr self
    fun getDeletionDate self = (GioFileInfoClass.FFI.withPtr false ---> GLibDateTimeRecord.FFI.fromPtr true) getDeletionDate_ self
    fun getDisplayName self = (GioFileInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDisplayName_ self before GioFileInfoClass.FFI.touchPtr self
    fun getEditName self = (GioFileInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getEditName_ self before GioFileInfoClass.FFI.touchPtr self
    fun getEtag self = (GioFileInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getEtag_ self before GioFileInfoClass.FFI.touchPtr self
    fun getFileType self = (GioFileInfoClass.FFI.withPtr false ---> GioFileType.FFI.fromVal) getFileType_ self
    fun getIcon self = (GioFileInfoClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) getIcon_ self before GioFileInfoClass.FFI.touchPtr self
    fun getIsBackup self = (GioFileInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsBackup_ self
    fun getIsHidden self = (GioFileInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsHidden_ self
    fun getIsSymlink self = (GioFileInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsSymlink_ self
    fun getModificationTime self =
      let
        val result & () = (GioFileInfoClass.FFI.withPtr false &&&> GLibTimeValRecord.FFI.withNewPtr ---> GLibTimeValRecord.FFI.fromPtr true && I) getModificationTime_ (self & ())
      in
        result
      end
    fun getName self = (GioFileInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GioFileInfoClass.FFI.touchPtr self
    fun getSize self = (GioFileInfoClass.FFI.withPtr false ---> GInt64.FFI.fromVal) getSize_ self
    fun getSortOrder self = (GioFileInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getSortOrder_ self
    fun getSymbolicIcon self = (GioFileInfoClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) getSymbolicIcon_ self before GioFileInfoClass.FFI.touchPtr self
    fun getSymlinkTarget self = (GioFileInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getSymlinkTarget_ self before GioFileInfoClass.FFI.touchPtr self
    fun hasAttribute self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasAttribute_ (self & attribute)
    fun hasNamespace self nameSpace = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasNamespace_ (self & nameSpace)
    fun listAttributes self nameSpace = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> Utf8CPtrArray.FFI.fromOptPtr ~1) listAttributes_ (self & nameSpace)
    fun removeAttribute self attribute = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) removeAttribute_ (self & attribute)
    fun setAttributeBoolean self (attribute, attrValue) =
      (
        GioFileInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GioFileInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
        GioFileInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GioFileInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt64.FFI.withVal
         ---> I
      )
        setAttributeInt64_
        (
          self
           & attribute
           & attrValue
        )
    fun setAttributeMask self mask = (GioFileInfoClass.FFI.withPtr false &&&> GioFileAttributeMatcherRecord.FFI.withPtr false ---> I) setAttributeMask_ (self & mask)
    fun setAttributeObject self (attribute, attrValue) =
      (
        GioFileInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectObjectClass.FFI.withPtr false
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
        GioFileInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GioFileInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
        GioFileInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GioFileInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt64.FFI.withVal
         ---> I
      )
        setAttributeUint64_
        (
          self
           & attribute
           & attrValue
        )
    fun setContentType self contentType = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setContentType_ (self & contentType)
    fun setDisplayName self displayName = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setDisplayName_ (self & displayName)
    fun setEditName self editName = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setEditName_ (self & editName)
    fun setFileType self type' = (GioFileInfoClass.FFI.withPtr false &&&> GioFileType.FFI.withVal ---> I) setFileType_ (self & type')
    fun setIcon self icon = (GioFileInfoClass.FFI.withPtr false &&&> GioIconClass.FFI.withPtr false ---> I) setIcon_ (self & icon)
    fun setIsHidden self isHidden = (GioFileInfoClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setIsHidden_ (self & isHidden)
    fun setIsSymlink self isSymlink = (GioFileInfoClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setIsSymlink_ (self & isSymlink)
    fun setModificationTime self mtime = (GioFileInfoClass.FFI.withPtr false &&&> GLibTimeValRecord.FFI.withPtr false ---> I) setModificationTime_ (self & mtime)
    fun setName self name = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setName_ (self & name)
    fun setSize self size = (GioFileInfoClass.FFI.withPtr false &&&> GInt64.FFI.withVal ---> I) setSize_ (self & size)
    fun setSortOrder self sortOrder = (GioFileInfoClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setSortOrder_ (self & sortOrder)
    fun setSymbolicIcon self icon = (GioFileInfoClass.FFI.withPtr false &&&> GioIconClass.FFI.withPtr false ---> I) setSymbolicIcon_ (self & icon)
    fun setSymlinkTarget self symlinkTarget = (GioFileInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setSymlinkTarget_ (self & symlinkTarget)
    fun unsetAttributeMask self = (GioFileInfoClass.FFI.withPtr false ---> I) unsetAttributeMask_ self
  end
