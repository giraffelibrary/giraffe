structure GtkStyleProvider :>
  GTK_STYLE_PROVIDER
    where type 'a class = 'a GtkStyleProviderClass.class
    where type 'a icon_factory_class = 'a GtkIconFactoryClass.class
    where type 'a style_properties_class = 'a GtkStylePropertiesClass.class
    where type state_flags_t = GtkStateFlags.t
    where type widget_path_t = GtkWidgetPathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_style_provider_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getIconFactory_ = call (load_sym libgtk "gtk_style_provider_get_icon_factory") (GtkStyleProviderClass.PolyML.cPtr &&> GtkWidgetPathRecord.PolyML.cPtr --> GtkIconFactoryClass.PolyML.cPtr)
      val getStyle_ = call (load_sym libgtk "gtk_style_provider_get_style") (GtkStyleProviderClass.PolyML.cPtr &&> GtkWidgetPathRecord.PolyML.cPtr --> GtkStylePropertiesClass.PolyML.cPtr)
      val getStyleProperty_ =
        call (load_sym libgtk "gtk_style_provider_get_style_property")
          (
            GtkStyleProviderClass.PolyML.cPtr
             &&> GtkWidgetPathRecord.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GObjectParamSpecClass.PolyML.cPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a GtkStyleProviderClass.class
    type 'a icon_factory_class = 'a GtkIconFactoryClass.class
    type 'a style_properties_class = 'a GtkStylePropertiesClass.class
    type state_flags_t = GtkStateFlags.t
    type widget_path_t = GtkWidgetPathRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getIconFactory self path = (GtkStyleProviderClass.C.withPtr &&&> GtkWidgetPathRecord.C.withPtr ---> GtkIconFactoryClass.C.fromPtr false) getIconFactory_ (self & path)
    fun getStyle self path = (GtkStyleProviderClass.C.withPtr &&&> GtkWidgetPathRecord.C.withPtr ---> GtkStylePropertiesClass.C.fromPtr true) getStyle_ (self & path)
    fun getStyleProperty self path state pspec =
      let
        val value & retVal =
          (
            GtkStyleProviderClass.C.withPtr
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
