structure GtkSelectionData :>
  GTK_SELECTION_DATA
    where type t = GtkSelectionDataRecord.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    val getType_ = _import "gtk_selection_data_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "gtk_selection_data_copy" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p;
    val getDataType_ = _import "gtk_selection_data_get_data_type" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p;
    val getData_ = fn x1 & x2 => (_import "gtk_selection_data_get_data_with_length" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p * GInt32.FFI.ref_ -> GUInt8CArrayN.FFI.notnull GUInt8CArrayN.FFI.out_p;) (x1, x2)
    val getDisplay_ = _import "gtk_selection_data_get_display" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p;
    val getFormat_ = _import "gtk_selection_data_get_format" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> GInt32.FFI.val_;
    val getLength_ = _import "gtk_selection_data_get_length" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> GInt32.FFI.val_;
    val getPixbuf_ = _import "gtk_selection_data_get_pixbuf" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> unit GdkPixbufPixbufClass.FFI.p;
    val getSelection_ = _import "gtk_selection_data_get_selection" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p;
    val getTarget_ = _import "gtk_selection_data_get_target" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p;
    val getTargets_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_selection_data_get_targets" :
              GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p
               * GdkAtomRecordCPtrArrayN.MLton.r1
               * (unit, GdkAtomRecordCPtrArrayN.FFI.notnull) GdkAtomRecordCPtrArrayN.MLton.r2
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getText_ = _import "gtk_selection_data_get_text" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> unit Utf8.FFI.out_p;
    val getUris_ = _import "gtk_selection_data_get_uris" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> Utf8CPtrArray.FFI.notnull Utf8CPtrArray.FFI.out_p;
    val set_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_gtk_selection_data_set" :
              GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p
               * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p
               * GInt32.FFI.val_
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.notnull GUInt8CArrayN.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setPixbuf_ = fn x1 & x2 => (_import "gtk_selection_data_set_pixbuf" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setText_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_selection_data_set_text" :
              GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setUris_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_selection_data_set_uris" :
              GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.notnull Utf8CPtrArray.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val targetsIncludeImage_ = fn x1 & x2 => (_import "gtk_selection_data_targets_include_image" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p * GBool.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val targetsIncludeRichText_ = fn x1 & x2 => (_import "gtk_selection_data_targets_include_rich_text" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p * GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val targetsIncludeText_ = _import "gtk_selection_data_targets_include_text" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> GBool.FFI.val_;
    val targetsIncludeUri_ = _import "gtk_selection_data_targets_include_uri" : GtkSelectionDataRecord.FFI.notnull GtkSelectionDataRecord.FFI.p -> GBool.FFI.val_;
    type t = GtkSelectionDataRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GtkSelectionDataRecord.FFI.withPtr ---> GtkSelectionDataRecord.FFI.fromPtr true) copy_ self
    fun getDataType self = (GtkSelectionDataRecord.FFI.withPtr ---> GdkAtomRecord.FFI.fromPtr false) getDataType_ self
    fun getData self =
      let
        val length & retVal = (GtkSelectionDataRecord.FFI.withPtr &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr 0) getData_ (self & GInt32.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getDisplay self = (GtkSelectionDataRecord.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getFormat self = (GtkSelectionDataRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getFormat_ self
    fun getLength self = (GtkSelectionDataRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getLength_ self
    fun getPixbuf self = (GtkSelectionDataRecord.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) getPixbuf_ self
    fun getSelection self = (GtkSelectionDataRecord.FFI.withPtr ---> GdkAtomRecord.FFI.fromPtr false) getSelection_ self
    fun getTarget self = (GtkSelectionDataRecord.FFI.withPtr ---> GdkAtomRecord.FFI.fromPtr false) getTarget_ self
    fun getTargets self =
      let
        val targets
         & nAtoms
         & retVal =
          (
            GtkSelectionDataRecord.FFI.withPtr
             &&&> GdkAtomRecordCPtrArrayN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> GdkAtomRecordCPtrArrayN.FFI.fromPtr 1
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getTargets_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        if retVal then SOME (targets (LargeInt.toInt nAtoms)) else NONE
      end
    fun getText self = (GtkSelectionDataRecord.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) getText_ self
    fun getUris self = (GtkSelectionDataRecord.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 2) getUris_ self
    fun set
      self
      (
        type',
        format,
        data
      ) =
      let
        val length = LargeInt.fromInt (GUInt8CArrayN.length data)
        val () =
          (
            GtkSelectionDataRecord.FFI.withPtr
             &&&> GdkAtomRecord.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GInt32.FFI.withVal
             ---> I
          )
            set_
            (
              self
               & type'
               & format
               & data
               & length
            )
      in
        ()
      end
    fun setPixbuf self pixbuf = (GtkSelectionDataRecord.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withPtr ---> GBool.FFI.fromVal) setPixbuf_ (self & pixbuf)
    fun setText self (str, len) =
      (
        GtkSelectionDataRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setText_
        (
          self
           & str
           & len
        )
    fun setUris self uris = (GtkSelectionDataRecord.FFI.withPtr &&&> Utf8CPtrArray.FFI.withPtr ---> GBool.FFI.fromVal) setUris_ (self & uris)
    fun targetsIncludeImage self writable = (GtkSelectionDataRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) targetsIncludeImage_ (self & writable)
    fun targetsIncludeRichText self buffer = (GtkSelectionDataRecord.FFI.withPtr &&&> GtkTextBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) targetsIncludeRichText_ (self & buffer)
    fun targetsIncludeText self = (GtkSelectionDataRecord.FFI.withPtr ---> GBool.FFI.fromVal) targetsIncludeText_ self
    fun targetsIncludeUri self = (GtkSelectionDataRecord.FFI.withPtr ---> GBool.FFI.fromVal) targetsIncludeUri_ self
  end
