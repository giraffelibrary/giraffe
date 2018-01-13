structure GtkBuilder :>
  GTK_BUILDER
    where type 'a class = 'a GtkBuilderClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a application_class = 'a GtkApplicationClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    val getType_ = _import "gtk_builder_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_builder_new" : unit -> GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p;
    val newFromFile_ = _import "mlton_gtk_builder_new_from_file" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p;
    val newFromResource_ = _import "mlton_gtk_builder_new_from_resource" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p;
    val newFromString_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_builder_new_from_string" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSSize.FFI.val_
               -> GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val addFromFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_builder_add_from_file" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addFromResource_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_builder_add_from_resource" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addFromString_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_builder_add_from_string" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val addObjectsFromFile_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_gtk_builder_add_objects_from_file" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8CVector.MLton.p1
               * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val addObjectsFromResource_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_gtk_builder_add_objects_from_resource" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8CVector.MLton.p1
               * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val addObjectsFromString_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_gtk_builder_add_objects_from_string" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.val_
               * Utf8CVector.MLton.p1
               * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val exposeObject_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_builder_expose_object" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val extendWithTemplate_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_gtk_builder_extend_with_template" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GObjectType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getApplication_ = _import "gtk_builder_get_application" : GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p -> GtkApplicationClass.FFI.notnull GtkApplicationClass.FFI.p;
    val getObject_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_builder_get_object" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getTranslationDomain_ = _import "gtk_builder_get_translation_domain" : GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getTypeFromName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_builder_get_type_from_name" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GObjectType.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setApplication_ = fn x1 & x2 => (_import "gtk_builder_set_application" : GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p * GtkApplicationClass.FFI.notnull GtkApplicationClass.FFI.p -> unit;) (x1, x2)
    val setTranslationDomain_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_builder_set_translation_domain" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val valueFromString_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_gtk_builder_value_from_string" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val valueFromStringType_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_gtk_builder_value_from_string_type" :
              GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * GObjectType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    type 'a class = 'a GtkBuilderClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a application_class = 'a GtkApplicationClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkBuilderClass.FFI.fromPtr true) new_ ()
    fun newFromFile filename = (Utf8.FFI.withPtr ---> GtkBuilderClass.FFI.fromPtr true) newFromFile_ filename
    fun newFromResource resourcePath = (Utf8.FFI.withPtr ---> GtkBuilderClass.FFI.fromPtr true) newFromResource_ resourcePath
    fun newFromString (string, length) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> GtkBuilderClass.FFI.fromPtr true) newFromString_ (string & length)
    fun addFromFile self filename =
      (
        GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt.FFI.fromVal
      )
        addFromFile_
        (
          self
           & filename
           & []
        )
    fun addFromResource self resourcePath =
      (
        GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt.FFI.fromVal
      )
        addFromResource_
        (
          self
           & resourcePath
           & []
        )
    fun addFromString self (buffer, length) =
      (
        GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GSize.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GUInt.FFI.fromVal
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
        GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8CVector.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt.FFI.fromVal
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
        GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8CVector.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt.FFI.fromVal
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
        GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GSize.FFI.withVal
         &&&> Utf8CVector.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt.FFI.fromVal
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
        GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withPtr
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
        GtkBuilderClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GObjectType.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GSize.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GUInt.FFI.fromVal
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
    fun getApplication self = (GtkBuilderClass.FFI.withPtr ---> GtkApplicationClass.FFI.fromPtr false) getApplication_ self
    fun getObject self name = (GtkBuilderClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr false) getObject_ (self & name)
    fun getTranslationDomain self = (GtkBuilderClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTranslationDomain_ self
    fun getTypeFromName self typeName = (GtkBuilderClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GObjectType.FFI.fromVal) getTypeFromName_ (self & typeName)
    fun setApplication self application = (GtkBuilderClass.FFI.withPtr &&&> GtkApplicationClass.FFI.withPtr ---> I) setApplication_ (self & application)
    fun setTranslationDomain self domain = (GtkBuilderClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setTranslationDomain_ (self & domain)
    fun valueFromString self (pspec, string) =
      let
        val value & () =
          (
            GtkBuilderClass.FFI.withPtr
             &&&> GObjectParamSpecClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
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
            GtkBuilderClass.FFI.withPtr
             &&&> GObjectType.FFI.withVal
             &&&> Utf8.FFI.withPtr
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
      open Property
    in
      val translationDomainProp =
        {
          get = fn x => get "translation-domain" stringOpt x,
          set = fn x => set "translation-domain" stringOpt x
        }
    end
  end
