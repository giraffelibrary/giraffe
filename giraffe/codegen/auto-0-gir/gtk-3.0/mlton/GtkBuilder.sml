structure GtkBuilder :>
  GTK_BUILDER
    where type 'a class = 'a GtkBuilderClass.class =
  struct
    val getType_ = _import "gtk_builder_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_builder_new" : unit -> GtkBuilderClass.C.notnull GtkBuilderClass.C.p;
    val addFromFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_builder_add_from_file" :
              GtkBuilderClass.C.notnull GtkBuilderClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.UInt.C.val_;
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
              GtkBuilderClass.C.notnull GtkBuilderClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Size.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.UInt.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getObject_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_builder_get_object" :
              GtkBuilderClass.C.notnull GtkBuilderClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getTranslationDomain_ = _import "gtk_builder_get_translation_domain" : GtkBuilderClass.C.notnull GtkBuilderClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val setTranslationDomain_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_builder_set_translation_domain" :
              GtkBuilderClass.C.notnull GtkBuilderClass.C.p
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
              GtkBuilderClass.C.notnull GtkBuilderClass.C.p
               * GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
