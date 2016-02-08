structure AtkDocument :>
  ATK_DOCUMENT
    where type 'a class_t = 'a AtkDocumentClass.t =
  struct
    val getType_ = _import "atk_document_get_type" : unit -> GObjectType.C.val_;
    val getAttributeValue_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_document_get_attribute_value" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDocumentType_ = _import "atk_document_get_document_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getLocale_ = _import "atk_document_get_locale" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val setAttributeValue_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_atk_document_set_attribute_value" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class_t = 'a AtkDocumentClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAttributeValue self attributeName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> Utf8.C.fromPtr false) getAttributeValue_ (self & attributeName)
    fun getDocumentType self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDocumentType_ self
    fun getLocale self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getLocale_ self
    fun setAttributeValue self attributeName attributeValue =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> Utf8.C.withConstPtr
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
