structure AtkDocument :>
  ATK_DOCUMENT
    where type 'a class = 'a AtkDocumentClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_document_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getAttributeValue_ = call (getSymbol "atk_document_get_attribute_value") (AtkDocumentClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getCurrentPageNumber_ = call (getSymbol "atk_document_get_current_page_number") (AtkDocumentClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getDocumentType_ = call (getSymbol "atk_document_get_document_type") (AtkDocumentClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLocale_ = call (getSymbol "atk_document_get_locale") (AtkDocumentClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPageCount_ = call (getSymbol "atk_document_get_page_count") (AtkDocumentClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val setAttributeValue_ =
        call (getSymbol "atk_document_set_attribute_value")
          (
            AtkDocumentClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a AtkDocumentClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getAttributeValue self attributeName = (AtkDocumentClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getAttributeValue_ (self & attributeName)
    fun getCurrentPageNumber self = (AtkDocumentClass.FFI.withPtr ---> GInt.FFI.fromVal) getCurrentPageNumber_ self
    fun getDocumentType self = (AtkDocumentClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDocumentType_ self
    fun getLocale self = (AtkDocumentClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLocale_ self
    fun getPageCount self = (AtkDocumentClass.FFI.withPtr ---> GInt.FFI.fromVal) getPageCount_ self
    fun setAttributeValue self (attributeName, attributeValue) =
      (
        AtkDocumentClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GBool.FFI.fromVal
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
      fun pageChangedSig f = signal "page-changed" (get 0w1 int ---> ret_void) f
      fun reloadSig f = signal "reload" (void ---> ret_void) f
    end
  end
