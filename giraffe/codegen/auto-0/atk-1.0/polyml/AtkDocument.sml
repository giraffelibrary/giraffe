structure AtkDocument :>
  ATK_DOCUMENT
    where type 'a class_t = 'a AtkDocumentClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_document_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getAttributeValue_ = call (load_sym libatk "atk_document_get_attribute_value") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val getDocument_ = call (load_sym libatk "atk_document_get_document") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getDocumentType_ = call (load_sym libatk "atk_document_get_document_type") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getLocale_ = call (load_sym libatk "atk_document_get_locale") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val setAttributeValue_ =
        call (load_sym libatk "atk_document_set_attribute_value")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.Bool.VAL
          )
    end
    type 'a class_t = 'a AtkDocumentClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAttributeValue self attributeName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) getAttributeValue_ (self & attributeName)
    fun getDocument self = (GObjectObjectClass.C.withPtr ---> I) getDocument_ self
    fun getDocumentType self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getDocumentType_ self
    fun getLocale self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getLocale_ self
    fun setAttributeValue self attributeName attributeValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         ---> FFI.Bool.fromVal
      )
        setAttributeValue_
        (
          self
           & attributeName
           & attributeValue
        )
    local
      open ClosureMarshal Signal
    in
      fun loadCompleteSig f = signal "load-complete" (void ---> ret_void) f
      fun loadStoppedSig f = signal "load-stopped" (void ---> ret_void) f
      fun reloadSig f = signal "reload" (void ---> ret_void) f
    end
  end
