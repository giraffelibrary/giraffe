structure AtkDocument :>
  ATK_DOCUMENT
    where type 'a class_t = 'a AtkDocumentClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_document_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getAttributeValue_ = call (load_sym libatk "atk_document_get_attribute_value") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val getDocumentType_ = call (load_sym libatk "atk_document_get_document_type") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getLocale_ = call (load_sym libatk "atk_document_get_locale") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val setAttributeValue_ =
        call (load_sym libatk "atk_document_set_attribute_value")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a AtkDocumentClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAttributeValue self attributeName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getAttributeValue_ (self & attributeName)
    fun getDocumentType self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDocumentType_ self
    fun getLocale self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getLocale_ self
    fun setAttributeValue self attributeName attributeValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
