structure GtkBuilder :>
  GTK_BUILDER
    where type 'a class = 'a GtkBuilderClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_builder_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_builder_new") (PolyMLFFI.cVoid --> GtkBuilderClass.PolyML.cPtr)
      val addFromFile_ =
        call (load_sym libgtk "gtk_builder_add_from_file")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.UInt.PolyML.cVal
          )
      val addFromString_ =
        call (load_sym libgtk "gtk_builder_add_from_string")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Size.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.UInt.PolyML.cVal
          )
      val getObject_ = call (load_sym libgtk "gtk_builder_get_object") (GtkBuilderClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getTranslationDomain_ = call (load_sym libgtk "gtk_builder_get_translation_domain") (GtkBuilderClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setTranslationDomain_ = call (load_sym libgtk "gtk_builder_set_translation_domain") (GtkBuilderClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val valueFromString_ =
        call (load_sym libgtk "gtk_builder_value_from_string")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> GObjectParamSpecClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a GtkBuilderClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkBuilderClass.C.fromPtr true) new_ ()
    fun addFromFile self filename =
      (
        GtkBuilderClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.UInt.C.fromVal
      )
        addFromFile_
        (
          self
           & filename
           & []
        )
    fun addFromString self buffer length =
      (
        GtkBuilderClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Size.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.UInt.C.fromVal
      )
        addFromString_
        (
          self
           & buffer
           & length
           & []
        )
    fun getObject self name = (GtkBuilderClass.C.withPtr &&&> Utf8.C.withPtr ---> GObjectObjectClass.C.fromPtr false) getObject_ (self & name)
    fun getTranslationDomain self = (GtkBuilderClass.C.withPtr ---> Utf8.C.fromPtr false) getTranslationDomain_ self
    fun setTranslationDomain self domain = (GtkBuilderClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setTranslationDomain_ (self & domain)
    fun valueFromString self pspec string =
      let
        val value & retVal =
          (
            GtkBuilderClass.C.withPtr
             &&&> GObjectParamSpecClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> GObjectValueRecord.C.withNewPtr
             &&&> GLibErrorRecord.handleError
             ---> GObjectValueRecord.C.fromPtr true && FFI.Bool.C.fromVal
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
