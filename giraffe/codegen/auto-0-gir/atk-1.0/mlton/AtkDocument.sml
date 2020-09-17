structure AtkDocument :>
  ATK_DOCUMENT
    where type 'a class = 'a AtkDocumentClass.class =
  struct
    val getType_ = _import "atk_document_get_type" : unit -> GObjectType.FFI.val_;
    val getAttributeValue_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_document_get_attribute_value" :
              AtkDocumentClass.FFI.non_opt AtkDocumentClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getCurrentPageNumber_ = _import "atk_document_get_current_page_number" : AtkDocumentClass.FFI.non_opt AtkDocumentClass.FFI.p -> GInt.FFI.val_;
    val getDocumentType_ = _import "atk_document_get_document_type" : AtkDocumentClass.FFI.non_opt AtkDocumentClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getLocale_ = _import "atk_document_get_locale" : AtkDocumentClass.FFI.non_opt AtkDocumentClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPageCount_ = _import "atk_document_get_page_count" : AtkDocumentClass.FFI.non_opt AtkDocumentClass.FFI.p -> GInt.FFI.val_;
    val setAttributeValue_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_atk_document_set_attribute_value" :
              AtkDocumentClass.FFI.non_opt AtkDocumentClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class = 'a AtkDocumentClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getAttributeValue self attributeName = (AtkDocumentClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromOptPtr 0) getAttributeValue_ (self & attributeName) before AtkDocumentClass.FFI.touchPtr self before Utf8.FFI.touchPtr attributeName
    fun getCurrentPageNumber self = (AtkDocumentClass.FFI.withPtr false ---> GInt.FFI.fromVal) getCurrentPageNumber_ self
    fun getDocumentType self = (AtkDocumentClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDocumentType_ self before AtkDocumentClass.FFI.touchPtr self
    fun getLocale self = (AtkDocumentClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getLocale_ self before AtkDocumentClass.FFI.touchPtr self
    fun getPageCount self = (AtkDocumentClass.FFI.withPtr false ---> GInt.FFI.fromVal) getPageCount_ self
    fun setAttributeValue self (attributeName, attributeValue) =
      (
        AtkDocumentClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
