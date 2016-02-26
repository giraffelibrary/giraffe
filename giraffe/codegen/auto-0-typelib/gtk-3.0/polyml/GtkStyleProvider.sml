structure GtkStyleProvider :>
  GTK_STYLE_PROVIDER
    where type 'a class_t = 'a GtkStyleProviderClass.t
    where type 'a icon_factory_class_t = 'a GtkIconFactoryClass.t
    where type 'a style_properties_class_t = 'a GtkStylePropertiesClass.t
    where type state_flags_t = GtkStateFlags.t
    where type widget_path_record_t = GtkWidgetPathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_style_provider_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getIconFactory_ = call (load_sym libgtk "gtk_style_provider_get_icon_factory") (GObjectObjectClass.PolyML.cPtr &&> GtkWidgetPathRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getStyle_ = call (load_sym libgtk "gtk_style_provider_get_style") (GObjectObjectClass.PolyML.cPtr &&> GtkWidgetPathRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getStyleProperty_ =
        call (load_sym libgtk "gtk_style_provider_get_style_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkWidgetPathRecord.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GObjectParamSpecClass.PolyML.cPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class_t = 'a GtkStyleProviderClass.t
    type 'a icon_factory_class_t = 'a GtkIconFactoryClass.t
    type 'a style_properties_class_t = 'a GtkStylePropertiesClass.t
    type state_flags_t = GtkStateFlags.t
    type widget_path_record_t = GtkWidgetPathRecord.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getIconFactory self path = (GObjectObjectClass.C.withPtr &&&> GtkWidgetPathRecord.C.withPtr ---> GtkIconFactoryClass.C.fromPtr false) getIconFactory_ (self & path)
    fun getStyle self path = (GObjectObjectClass.C.withPtr &&&> GtkWidgetPathRecord.C.withPtr ---> GtkStylePropertiesClass.C.fromPtr true) getStyle_ (self & path)
    fun getStyleProperty self path state pspec =
      let
        val value & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkWidgetPathRecord.C.withPtr
             &&&> GtkStateFlags.C.withVal
             &&&> GObjectParamSpecClass.C.withPtr
             &&&> GObjectValueRecord.C.withNewPtr
             ---> GObjectValueRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            getStyleProperty_
            (
              self
               & path
               & state
               & pspec
               & ()
            )
      in
        if retVal then SOME value else NONE
      end
  end
