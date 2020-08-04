structure GtkAppChooserWidget :>
  GTK_APP_CHOOSER_WIDGET
    where type 'a class = 'a GtkAppChooserWidgetClass.class
    where type 'a app_chooser_class = 'a GtkAppChooserClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a menu_class = 'a GtkMenuClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_app_chooser_widget_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_app_chooser_widget_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getDefaultText_ = call (getSymbol "gtk_app_chooser_widget_get_default_text") (GtkAppChooserWidgetClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getShowAll_ = call (getSymbol "gtk_app_chooser_widget_get_show_all") (GtkAppChooserWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowDefault_ = call (getSymbol "gtk_app_chooser_widget_get_show_default") (GtkAppChooserWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowFallback_ = call (getSymbol "gtk_app_chooser_widget_get_show_fallback") (GtkAppChooserWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowOther_ = call (getSymbol "gtk_app_chooser_widget_get_show_other") (GtkAppChooserWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowRecommended_ = call (getSymbol "gtk_app_chooser_widget_get_show_recommended") (GtkAppChooserWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setDefaultText_ = call (getSymbol "gtk_app_chooser_widget_set_default_text") (GtkAppChooserWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setShowAll_ = call (getSymbol "gtk_app_chooser_widget_set_show_all") (GtkAppChooserWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowDefault_ = call (getSymbol "gtk_app_chooser_widget_set_show_default") (GtkAppChooserWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowFallback_ = call (getSymbol "gtk_app_chooser_widget_set_show_fallback") (GtkAppChooserWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowOther_ = call (getSymbol "gtk_app_chooser_widget_set_show_other") (GtkAppChooserWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowRecommended_ = call (getSymbol "gtk_app_chooser_widget_set_show_recommended") (GtkAppChooserWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkAppChooserWidgetClass.class
    type 'a app_chooser_class = 'a GtkAppChooserClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a menu_class = 'a GtkMenuClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asAppChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkAppChooserClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new contentType = (Utf8.FFI.withPtr 0 ---> GtkAppChooserWidgetClass.FFI.fromPtr false) new_ contentType
    fun getDefaultText self = (GtkAppChooserWidgetClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDefaultText_ self
    fun getShowAll self = (GtkAppChooserWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowAll_ self
    fun getShowDefault self = (GtkAppChooserWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowDefault_ self
    fun getShowFallback self = (GtkAppChooserWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowFallback_ self
    fun getShowOther self = (GtkAppChooserWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowOther_ self
    fun getShowRecommended self = (GtkAppChooserWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowRecommended_ self
    fun setDefaultText self text = (GtkAppChooserWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setDefaultText_ (self & text)
    fun setShowAll self setting = (GtkAppChooserWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowAll_ (self & setting)
    fun setShowDefault self setting = (GtkAppChooserWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowDefault_ (self & setting)
    fun setShowFallback self setting = (GtkAppChooserWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowFallback_ (self & setting)
    fun setShowOther self setting = (GtkAppChooserWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowOther_ (self & setting)
    fun setShowRecommended self setting = (GtkAppChooserWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowRecommended_ (self & setting)
    local
      open ClosureMarshal Signal
    in
      fun applicationActivatedSig f = signal "application-activated" (get 0w1 GioAppInfoClass.t ---> ret_void) f
      fun applicationSelectedSig f = signal "application-selected" (get 0w1 GioAppInfoClass.t ---> ret_void) f
      fun populatePopupSig f = signal "populate-popup" (get 0w1 GtkMenuClass.t &&&> get 0w2 GioAppInfoClass.t ---> ret_void) (fn menu & application => f (menu, application))
    end
    local
      open Property
    in
      val defaultTextProp =
        {
          get = fn x => get "default-text" stringOpt x,
          set = fn x => set "default-text" stringOpt x,
          new = fn x => new "default-text" stringOpt x
        }
      val showAllProp =
        {
          get = fn x => get "show-all" boolean x,
          set = fn x => set "show-all" boolean x,
          new = fn x => new "show-all" boolean x
        }
      val showDefaultProp =
        {
          get = fn x => get "show-default" boolean x,
          set = fn x => set "show-default" boolean x,
          new = fn x => new "show-default" boolean x
        }
      val showFallbackProp =
        {
          get = fn x => get "show-fallback" boolean x,
          set = fn x => set "show-fallback" boolean x,
          new = fn x => new "show-fallback" boolean x
        }
      val showOtherProp =
        {
          get = fn x => get "show-other" boolean x,
          set = fn x => set "show-other" boolean x,
          new = fn x => new "show-other" boolean x
        }
      val showRecommendedProp =
        {
          get = fn x => get "show-recommended" boolean x,
          set = fn x => set "show-recommended" boolean x,
          new = fn x => new "show-recommended" boolean x
        }
    end
  end
