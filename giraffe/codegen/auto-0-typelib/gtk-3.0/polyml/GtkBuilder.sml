structure GtkBuilder :>
  GTK_BUILDER
    where type 'a class = 'a GtkBuilderClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a application_class = 'a GtkApplicationClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_builder_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_builder_new") (cVoid --> GtkBuilderClass.PolyML.cPtr)
      val newFromFile_ = call (getSymbol "gtk_builder_new_from_file") (Utf8.PolyML.cInPtr --> GtkBuilderClass.PolyML.cPtr)
      val newFromResource_ = call (getSymbol "gtk_builder_new_from_resource") (Utf8.PolyML.cInPtr --> GtkBuilderClass.PolyML.cPtr)
      val newFromString_ = call (getSymbol "gtk_builder_new_from_string") (Utf8.PolyML.cInPtr &&> GInt64.PolyML.cVal --> GtkBuilderClass.PolyML.cPtr)
      val addFromFile_ =
        call (getSymbol "gtk_builder_add_from_file")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val addFromResource_ =
        call (getSymbol "gtk_builder_add_from_resource")
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
             &&> Utf8CPtrArray.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val addObjectsFromResource_ =
        call (getSymbol "gtk_builder_add_objects_from_resource")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8CPtrArray.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val addObjectsFromString_ =
        call (getSymbol "gtk_builder_add_objects_from_string")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> Utf8CPtrArray.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val exposeObject_ =
        call (getSymbol "gtk_builder_expose_object")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             --> cVoid
          )
      val extendWithTemplate_ =
        call (getSymbol "gtk_builder_extend_with_template")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GObjectType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val getApplication_ = call (getSymbol "gtk_builder_get_application") (GtkBuilderClass.PolyML.cPtr --> GtkApplicationClass.PolyML.cOptPtr)
      val getObject_ = call (getSymbol "gtk_builder_get_object") (GtkBuilderClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cOptPtr)
      val getTranslationDomain_ = call (getSymbol "gtk_builder_get_translation_domain") (GtkBuilderClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTypeFromName_ = call (getSymbol "gtk_builder_get_type_from_name") (GtkBuilderClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectType.PolyML.cVal)
      val setApplication_ = call (getSymbol "gtk_builder_set_application") (GtkBuilderClass.PolyML.cPtr &&> GtkApplicationClass.PolyML.cPtr --> cVoid)
      val setTranslationDomain_ = call (getSymbol "gtk_builder_set_translation_domain") (GtkBuilderClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
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
      val valueFromStringType_ =
        call (getSymbol "gtk_builder_value_from_string_type")
          (
            GtkBuilderClass.PolyML.cPtr
             &&> GObjectType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GtkBuilderClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a application_class = 'a GtkApplicationClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkBuilderClass.FFI.fromPtr true) new_ ()
    fun newFromFile filename = (Utf8.FFI.withPtr 0 ---> GtkBuilderClass.FFI.fromPtr true) newFromFile_ filename
    fun newFromResource resourcePath = (Utf8.FFI.withPtr 0 ---> GtkBuilderClass.FFI.fromPtr true) newFromResource_ resourcePath
    fun newFromString (string, length) = (Utf8.FFI.withPtr 0 &&&> GInt64.FFI.withVal ---> GtkBuilderClass.FFI.fromPtr true) newFromString_ (string & length)
    fun addFromFile self filename =
      (
        GtkBuilderClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        addFromFile_
        (
          self
           & filename
           & []
        )
    fun addFromResource self resourcePath =
      (
        GtkBuilderClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        addFromResource_
        (
          self
           & resourcePath
           & []
        )
    fun addFromString self (buffer, length) =
      (
        GtkBuilderClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
    fun addObjectsFromFile self (filename, objectIds) =
      (
        GtkBuilderClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
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
    fun addObjectsFromResource self (resourcePath, objectIds) =
      (
        GtkBuilderClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        addObjectsFromResource_
        (
          self
           & resourcePath
           & objectIds
           & []
        )
    fun addObjectsFromString
      self
      (
        buffer,
        length,
        objectIds
      ) =
      (
        GtkBuilderClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt64.FFI.withVal
         &&&> Utf8CPtrArray.FFI.withPtr 0
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
    fun exposeObject self (name, object) =
      (
        GtkBuilderClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectObjectClass.FFI.withPtr false
         ---> I
      )
        exposeObject_
        (
          self
           & name
           & object
        )
    fun extendWithTemplate
      self
      (
        widget,
        templateType,
        buffer,
        length
      ) =
      (
        GtkBuilderClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GObjectType.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt64.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        extendWithTemplate_
        (
          self
           & widget
           & templateType
           & buffer
           & length
           & []
        )
    fun getApplication self = (GtkBuilderClass.FFI.withPtr false ---> GtkApplicationClass.FFI.fromOptPtr false) getApplication_ self
    fun getObject self name = (GtkBuilderClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GObjectObjectClass.FFI.fromOptPtr false) getObject_ (self & name)
    fun getTranslationDomain self = (GtkBuilderClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTranslationDomain_ self
    fun getTypeFromName self typeName = (GtkBuilderClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GObjectType.FFI.fromVal) getTypeFromName_ (self & typeName)
    fun setApplication self application = (GtkBuilderClass.FFI.withPtr false &&&> GtkApplicationClass.FFI.withPtr false ---> I) setApplication_ (self & application)
    fun setTranslationDomain self domain = (GtkBuilderClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setTranslationDomain_ (self & domain)
    fun valueFromString self (pspec, string) =
      let
        val value & () =
          (
            GtkBuilderClass.FFI.withPtr false
             &&&> GObjectParamSpecClass.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GObjectValueRecord.FFI.withNewPtr
             &&&> GLibErrorRecord.handleError
             ---> GObjectValueRecord.FFI.fromPtr true && ignore
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
        value
      end
    fun valueFromStringType self (type', string) =
      let
        val value & () =
          (
            GtkBuilderClass.FFI.withPtr false
             &&&> GObjectType.FFI.withVal
             &&&> Utf8.FFI.withPtr 0
             &&&> GObjectValueRecord.FFI.withNewPtr
             &&&> GLibErrorRecord.handleError
             ---> GObjectValueRecord.FFI.fromPtr true && ignore
          )
            valueFromStringType_
            (
              self
               & type'
               & string
               & ()
               & []
            )
      in
        value
      end
    local
      open ValueAccessor
    in
      val translationDomainProp =
        {
          name = "translation-domain",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
