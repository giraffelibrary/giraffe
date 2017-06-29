structure GtkBuilder :>
  GTK_BUILDER
    where type 'a class = 'a GtkBuilderClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_builder_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_builder_new") (PolyMLFFI.cVoid --> GtkBuilderClass.PolyML.cPtr)
      val addFromFile_ =
        call (getSymbol "gtk_builder_add_from_file")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val addFromString_ =
        call (getSymbol "gtk_builder_add_from_string")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val addObjectsFromFile_ =
        call (getSymbol "gtk_builder_add_objects_from_file")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8CVector.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val addObjectsFromString_ =
        call (getSymbol "gtk_builder_add_objects_from_string")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> Utf8CVector.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val getObject_ = call (getSymbol "gtk_builder_get_object") (GtkBuilderClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getTranslationDomain_ = call (getSymbol "gtk_builder_get_translation_domain") (GtkBuilderClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setTranslationDomain_ = call (getSymbol "gtk_builder_set_translation_domain") (GtkBuilderClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val valueFromString_ =
        call (getSymbol "gtk_builder_value_from_string")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> GObjectParamSpecClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GtkBuilderClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkBuilderClass.FFI.fromPtr true) new_ ()
    fun addFromFile self filename =
      (
        GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        addFromFile_
        (
          self
           & filename
           & []
        )
    fun addFromString self buffer length =
      (
        GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        addFromString_
        (
          self
           & buffer
           & length
           & []
        )
    fun addObjectsFromFile self filename objectIds =
      (
        GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8CVector.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        addObjectsFromFile_
        (
          self
           & filename
           & objectIds
           & []
        )
    fun addObjectsFromString self buffer length objectIds =
      (
        GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> Utf8CVector.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        addObjectsFromString_
        (
          self
           & buffer
           & length
           & objectIds
           & []
        )
    fun getObject self name = (GtkBuilderClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr false) getObject_ (self & name)
    fun getTranslationDomain self = (GtkBuilderClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTranslationDomain_ self
    fun setTranslationDomain self domain = (GtkBuilderClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setTranslationDomain_ (self & domain)
    fun valueFromString self pspec string =
      let
        val value & retVal =
          (
            GtkBuilderClass.FFI.withPtr
             &&&> GObjectParamSpecClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GObjectValueRecord.FFI.withNewPtr
             &&&> GLibErrorRecord.handleError
             ---> GObjectValueRecord.FFI.fromPtr true && GBool.FFI.fromVal
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
