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
              AtkDocumentClass.FFI.notnull AtkDocumentClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDocumentType_ = _import "atk_document_get_document_type" : AtkDocumentClass.FFI.notnull AtkDocumentClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getLocale_ = _import "atk_document_get_locale" : AtkDocumentClass.FFI.notnull AtkDocumentClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val setAttributeValue_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_atk_document_set_attribute_value" :
              AtkDocumentClass.FFI.notnull AtkDocumentClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
    fun getAttributeValue self attributeName = (AtkDocumentClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getAttributeValue_ (self & attributeName)
    fun getDocumentType self = (AtkDocumentClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDocumentType_ self
    fun getLocale self = (AtkDocumentClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLocale_ self
    fun setAttributeValue self attributeName attributeValue =
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
      fun reloadSig f = signal "reload" (void ---> ret_void) f
    end
  end
