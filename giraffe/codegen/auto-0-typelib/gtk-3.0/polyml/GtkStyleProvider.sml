structure GtkStyleProvider :>
  GTK_STYLE_PROVIDER
    where type 'a class_t = 'a GtkStyleProviderClass.t
    where type 'a iconfactoryclass_t = 'a GtkIconFactoryClass.t
    where type 'a stylepropertiesclass_t = 'a GtkStylePropertiesClass.t
    where type stateflags_t = GtkStateFlags.t
    where type widgetpathrecord_t = GtkWidgetPathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_style_provider_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getIconFactory_ = call (load_sym libgtk "gtk_style_provider_get_icon_factory") (GObjectObjectClass.PolyML.PTR &&> GtkWidgetPathRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getStyle_ = call (load_sym libgtk "gtk_style_provider_get_style") (GObjectObjectClass.PolyML.PTR &&> GtkWidgetPathRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getStyleProperty_ =
        call (load_sym libgtk "gtk_style_provider_get_style_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkWidgetPathRecord.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GObjectParamSpecClass.PolyML.PTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a GtkStyleProviderClass.t
    type 'a iconfactoryclass_t = 'a GtkIconFactoryClass.t
    type 'a stylepropertiesclass_t = 'a GtkStylePropertiesClass.t
    type stateflags_t = GtkStateFlags.t
    type widgetpathrecord_t = GtkWidgetPathRecord.t
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
