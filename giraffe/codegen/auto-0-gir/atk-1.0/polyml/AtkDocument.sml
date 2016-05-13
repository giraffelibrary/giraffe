structure AtkDocument :>
  ATK_DOCUMENT
    where type 'a class = 'a AtkDocumentClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_document_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getAttributeValue_ = call (load_sym libatk "atk_document_get_attribute_value") (AtkDocumentClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getDocumentType_ = call (load_sym libatk "atk_document_get_document_type") (AtkDocumentClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLocale_ = call (load_sym libatk "atk_document_get_locale") (AtkDocumentClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setAttributeValue_ =
        call (load_sym libatk "atk_document_set_attribute_value")
          (
            AtkDocumentClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a AtkDocumentClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAttributeValue self attributeName = (AtkDocumentClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getAttributeValue_ (self & attributeName)
    fun getDocumentType self = (AtkDocumentClass.C.withPtr ---> Utf8.C.fromPtr false) getDocumentType_ self
    fun getLocale self = (AtkDocumentClass.C.withPtr ---> Utf8.C.fromPtr false) getLocale_ self
    fun setAttributeValue self attributeName attributeValue =
      (
        AtkDocumentClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> FFI.Bool.C.fromVal
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
