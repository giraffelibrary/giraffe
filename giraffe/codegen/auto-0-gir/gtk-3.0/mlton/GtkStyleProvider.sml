structure GtkStyleProvider :>
  GTK_STYLE_PROVIDER
    where type 'a class = 'a GtkStyleProviderClass.class
    where type 'a icon_factory_class = 'a GtkIconFactoryClass.class
    where type 'a style_properties_class = 'a GtkStylePropertiesClass.class
    where type state_flags_t = GtkStateFlags.t
    where type widget_path_t = GtkWidgetPathRecord.t =
  struct
    val getType_ = _import "gtk_style_provider_get_type" : unit -> GObjectType.FFI.val_;
    val getIconFactory_ = fn x1 & x2 => (_import "gtk_style_provider_get_icon_factory" : GtkStyleProviderClass.FFI.non_opt GtkStyleProviderClass.FFI.p * GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p -> GtkIconFactoryClass.FFI.opt GtkIconFactoryClass.FFI.p;) (x1, x2)
    val getStyle_ = fn x1 & x2 => (_import "gtk_style_provider_get_style" : GtkStyleProviderClass.FFI.non_opt GtkStyleProviderClass.FFI.p * GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p -> GtkStylePropertiesClass.FFI.opt GtkStylePropertiesClass.FFI.p;) (x1, x2)
    val getStyleProperty_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_style_provider_get_style_property" :
              GtkStyleProviderClass.FFI.non_opt GtkStyleProviderClass.FFI.p
               * GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GtkStateFlags.FFI.val_
               * GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class = 'a GtkStyleProviderClass.class
    type 'a icon_factory_class = 'a GtkIconFactoryClass.class
    type 'a style_properties_class = 'a GtkStylePropertiesClass.class
    type state_flags_t = GtkStateFlags.t
    type widget_path_t = GtkWidgetPathRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getIconFactory self path = (GtkStyleProviderClass.FFI.withPtr &&&> GtkWidgetPathRecord.FFI.withPtr ---> GtkIconFactoryClass.FFI.fromOptPtr false) getIconFactory_ (self & path)
    fun getStyle self path = (GtkStyleProviderClass.FFI.withPtr &&&> GtkWidgetPathRecord.FFI.withPtr ---> GtkStylePropertiesClass.FFI.fromOptPtr true) getStyle_ (self & path)
    fun getStyleProperty
      self
      (
        path,
        state,
        pspec
      ) =
      let
        val value & retVal =
          (
            GtkStyleProviderClass.FFI.withPtr
             &&&> GtkWidgetPathRecord.FFI.withPtr
             &&&> GtkStateFlags.FFI.withVal
             &&&> GObjectParamSpecClass.FFI.withPtr
             &&&> GObjectValueRecord.FFI.withNewPtr
             ---> GObjectValueRecord.FFI.fromPtr true && GBool.FFI.fromVal
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
