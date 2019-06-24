structure GtkSelectionData :>
  GTK_SELECTION_DATA
    where type t = GtkSelectionDataRecord.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    structure GdkAtomRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GdkAtomRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GdkAtomRecordCVectorN = CVectorN(GdkAtomRecordCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_selection_data_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (getSymbol "gtk_selection_data_copy") (GtkSelectionDataRecord.PolyML.cPtr --> GtkSelectionDataRecord.PolyML.cPtr)
      val getDataType_ = call (getSymbol "gtk_selection_data_get_data_type") (GtkSelectionDataRecord.PolyML.cPtr --> GdkAtomRecord.PolyML.cPtr)
      val getData_ = call (getSymbol "gtk_selection_data_get_data_with_length") (GtkSelectionDataRecord.PolyML.cPtr &&> GInt.PolyML.cRef --> GUInt8CVectorN.PolyML.cOutPtr)
      val getDisplay_ = call (getSymbol "gtk_selection_data_get_display") (GtkSelectionDataRecord.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getFormat_ = call (getSymbol "gtk_selection_data_get_format") (GtkSelectionDataRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getLength_ = call (getSymbol "gtk_selection_data_get_length") (GtkSelectionDataRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getPixbuf_ = call (getSymbol "gtk_selection_data_get_pixbuf") (GtkSelectionDataRecord.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cOptPtr)
      val getSelection_ = call (getSymbol "gtk_selection_data_get_selection") (GtkSelectionDataRecord.PolyML.cPtr --> GdkAtomRecord.PolyML.cPtr)
      val getTarget_ = call (getSymbol "gtk_selection_data_get_target") (GtkSelectionDataRecord.PolyML.cPtr --> GdkAtomRecord.PolyML.cPtr)
      val getTargets_ =
        call (getSymbol "gtk_selection_data_get_targets")
          (
            GtkSelectionDataRecord.PolyML.cPtr
             &&> GdkAtomRecordCVectorN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getText_ = call (getSymbol "gtk_selection_data_get_text") (GtkSelectionDataRecord.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getUris_ = call (getSymbol "gtk_selection_data_get_uris") (GtkSelectionDataRecord.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val set_ =
        call (getSymbol "gtk_selection_data_set")
          (
            GtkSelectionDataRecord.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setPixbuf_ = call (getSymbol "gtk_selection_data_set_pixbuf") (GtkSelectionDataRecord.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setText_ =
        call (getSymbol "gtk_selection_data_set_text")
          (
            GtkSelectionDataRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setUris_ = call (getSymbol "gtk_selection_data_set_uris") (GtkSelectionDataRecord.PolyML.cPtr &&> Utf8CVector.PolyML.cInPtr --> GBool.PolyML.cVal)
      val targetsIncludeImage_ = call (getSymbol "gtk_selection_data_targets_include_image") (GtkSelectionDataRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> GBool.PolyML.cVal)
      val targetsIncludeRichText_ = call (getSymbol "gtk_selection_data_targets_include_rich_text") (GtkSelectionDataRecord.PolyML.cPtr &&> GtkTextBufferClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val targetsIncludeText_ = call (getSymbol "gtk_selection_data_targets_include_text") (GtkSelectionDataRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val targetsIncludeUri_ = call (getSymbol "gtk_selection_data_targets_include_uri") (GtkSelectionDataRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = GtkSelectionDataRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GtkSelectionDataRecord.FFI.withPtr ---> GtkSelectionDataRecord.FFI.fromPtr true) copy_ self
    fun getDataType self = (GtkSelectionDataRecord.FFI.withPtr ---> GdkAtomRecord.FFI.fromPtr false) getDataType_ self
    fun getData self =
      let
        val length & retVal = (GtkSelectionDataRecord.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GUInt8CVectorN.FFI.fromPtr 0) getData_ (self & GInt.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getDisplay self = (GtkSelectionDataRecord.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getFormat self = (GtkSelectionDataRecord.FFI.withPtr ---> GInt.FFI.fromVal) getFormat_ self
    fun getLength self = (GtkSelectionDataRecord.FFI.withPtr ---> GInt.FFI.fromVal) getLength_ self
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
             &&&> GdkAtomRecordCVectorN.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             ---> GdkAtomRecordCVectorN.FFI.fromPtr 1
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getTargets_
            (
              self
               & NONE
               & GInt.null
            )
      in
        if retVal then SOME (targets (LargeInt.toInt nAtoms)) else NONE
      end
    fun getText self = (GtkSelectionDataRecord.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) getText_ self
    fun getUris self = (GtkSelectionDataRecord.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getUris_ self
    fun set
      self
      (
        type',
        format,
        data
      ) =
      let
        val length = LargeInt.fromInt (GUInt8CVectorN.length data)
        val () =
          (
            GtkSelectionDataRecord.FFI.withPtr
             &&&> GdkAtomRecord.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GInt.FFI.withVal
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
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setText_
        (
          self
           & str
           & len
        )
    fun setUris self uris = (GtkSelectionDataRecord.FFI.withPtr &&&> Utf8CVector.FFI.withPtr ---> GBool.FFI.fromVal) setUris_ (self & uris)
    fun targetsIncludeImage self writable = (GtkSelectionDataRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) targetsIncludeImage_ (self & writable)
    fun targetsIncludeRichText self buffer = (GtkSelectionDataRecord.FFI.withPtr &&&> GtkTextBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) targetsIncludeRichText_ (self & buffer)
    fun targetsIncludeText self = (GtkSelectionDataRecord.FFI.withPtr ---> GBool.FFI.fromVal) targetsIncludeText_ self
    fun targetsIncludeUri self = (GtkSelectionDataRecord.FFI.withPtr ---> GBool.FFI.fromVal) targetsIncludeUri_ self
  end
