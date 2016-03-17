structure GtkStyleProvider :>
  GTK_STYLE_PROVIDER
    where type 'a class = 'a GtkStyleProviderClass.class
    where type 'a icon_factory_class = 'a GtkIconFactoryClass.class
    where type 'a style_properties_class = 'a GtkStylePropertiesClass.class
    where type state_flags_t = GtkStateFlags.t
    where type widget_path_t = GtkWidgetPathRecord.t =
  struct
    val getType_ = _import "gtk_style_provider_get_type" : unit -> GObjectType.C.val_;
    val getIconFactory_ = fn x1 & x2 => (_import "gtk_style_provider_get_icon_factory" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getStyle_ = fn x1 & x2 => (_import "gtk_style_provider_get_style" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getStyleProperty_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_style_provider_get_style_property" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * GtkStateFlags.C.val_
               * GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> FFI.Bool.C.val_;
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
