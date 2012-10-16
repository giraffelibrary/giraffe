structure GtkBuilder :>
  GTK_BUILDER
    where type 'a class_t = 'a GtkBuilderClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_builder_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_builder_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val addFromFile_ =
        call (load_sym libgtk "gtk_builder_add_from_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Word32.VAL
          )
      val addFromString_ =
        call (load_sym libgtk "gtk_builder_add_from_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word64.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Word32.VAL
          )
      val connectSignals_ = call (load_sym libgtk "gtk_builder_connect_signals") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getObject_ = call (load_sym libgtk "gtk_builder_get_object") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getTranslationDomain_ = call (load_sym libgtk "gtk_builder_get_translation_domain") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val setTranslationDomain_ = call (load_sym libgtk "gtk_builder_set_translation_domain") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INOPTPTR --> FFI.PolyML.VOID)
      val valueFromString_ =
        call (load_sym libgtk "gtk_builder_value_from_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectParamSpecClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
    end
    type 'a class_t = 'a GtkBuilderClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkBuilderClass.C.fromPtr true) new_ ()
    fun addFromFile self filename =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Word32.fromVal
      )
        addFromFile_
        (
          self
           & filename
           & []
        )
    fun addFromString self buffer length =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word64.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Word32.fromVal
      )
        addFromString_
        (
          self
           & buffer
           & length
           & []
        )
    fun connectSignals self = (GObjectObjectClass.C.withPtr ---> I) connectSignals_ self
    fun getObject self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GObjectObjectClass.C.fromPtr false) getObject_ (self & name)
    fun getTranslationDomain self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getTranslationDomain_ self
    fun setTranslationDomain self domain = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setTranslationDomain_ (self & domain)
    fun valueFromString self pspec string =
      let
        val value & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectParamSpecClass.C.withPtr
             &&&> FFI.String.withConstPtr
             &&&> GObjectValueRecord.C.withNewPtr
             &&&> GLibErrorRecord.C.handleError
             ---> GObjectValueRecord.C.fromPtr true && FFI.Bool.fromVal
          )
            valueFromString_
            (
              self
               & pspec
               & string
               & ()
               & []
            )
      in
        if retVal then SOME value else NONE
      end
    local
      open Property
    in
      val translationDomainProp =
        {
          get = fn x => get "translation-domain" stringOpt x,
          set = fn x => set "translation-domain" stringOpt x
        }
    end
  end
