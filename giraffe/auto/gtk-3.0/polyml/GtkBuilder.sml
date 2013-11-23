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
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.UInt.PolyML.VAL
          )
      val addFromString_ =
        call (load_sym libgtk "gtk_builder_add_from_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Size.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.UInt.PolyML.VAL
          )
      val getObject_ = call (load_sym libgtk "gtk_builder_get_object") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getTranslationDomain_ = call (load_sym libgtk "gtk_builder_get_translation_domain") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val setTranslationDomain_ = call (load_sym libgtk "gtk_builder_set_translation_domain") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val valueFromString_ =
        call (load_sym libgtk "gtk_builder_value_from_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectParamSpecClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a GtkBuilderClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkBuilderClass.C.fromPtr true) new_ ()
    fun addFromFile self filename =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Size.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.UInt.C.fromVal
      )
        addFromString_
        (
          self
           & buffer
           & length
           & []
        )
    fun getObject self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GObjectObjectClass.C.fromPtr false) getObject_ (self & name)
    fun getTranslationDomain self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getTranslationDomain_ self
    fun setTranslationDomain self domain = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setTranslationDomain_ (self & domain)
    fun valueFromString self pspec string =
      let
        val value & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectParamSpecClass.C.withPtr
             &&&> FFI.String.C.withConstPtr
             &&&> GObjectValueRecord.C.withNewPtr
             &&&> GLibErrorRecord.C.handleError
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
