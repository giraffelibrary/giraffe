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
      val getType_ = call (load_sym libgtk "gtk_app_chooser_widget_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_app_chooser_widget_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getDefaultText_ = call (load_sym libgtk "gtk_app_chooser_widget_get_default_text") (GtkAppChooserWidgetClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getShowAll_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_all") (GtkAppChooserWidgetClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowDefault_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_default") (GtkAppChooserWidgetClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowFallback_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_fallback") (GtkAppChooserWidgetClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowOther_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_other") (GtkAppChooserWidgetClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowRecommended_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_recommended") (GtkAppChooserWidgetClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setDefaultText_ = call (load_sym libgtk "gtk_app_chooser_widget_set_default_text") (GtkAppChooserWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setShowAll_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_all") (GtkAppChooserWidgetClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setShowDefault_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_default") (GtkAppChooserWidgetClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setShowFallback_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_fallback") (GtkAppChooserWidgetClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setShowOther_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_other") (GtkAppChooserWidgetClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setShowRecommended_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_recommended") (GtkAppChooserWidgetClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkAppChooserWidgetClass.class
    type 'a app_chooser_class = 'a GtkAppChooserClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a menu_class = 'a GtkMenuClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asAppChooser self = (GObjectObjectClass.C.withPtr ---> GtkAppChooserClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new contentType = (Utf8.C.withPtr ---> GtkAppChooserWidgetClass.C.fromPtr false) new_ contentType
    fun getDefaultText self = (GtkAppChooserWidgetClass.C.withPtr ---> Utf8.C.fromPtr false) getDefaultText_ self
    fun getShowAll self = (GtkAppChooserWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowAll_ self
    fun getShowDefault self = (GtkAppChooserWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowDefault_ self
    fun getShowFallback self = (GtkAppChooserWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowFallback_ self
    fun getShowOther self = (GtkAppChooserWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowOther_ self
    fun getShowRecommended self = (GtkAppChooserWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowRecommended_ self
    fun setDefaultText self text = (GtkAppChooserWidgetClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDefaultText_ (self & text)
    fun setShowAll self setting = (GtkAppChooserWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowAll_ (self & setting)
    fun setShowDefault self setting = (GtkAppChooserWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowDefault_ (self & setting)
    fun setShowFallback self setting = (GtkAppChooserWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowFallback_ (self & setting)
    fun setShowOther self setting = (GtkAppChooserWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowOther_ (self & setting)
    fun setShowRecommended self setting = (GtkAppChooserWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowRecommended_ (self & setting)
    local
      open ClosureMarshal Signal
    in
      fun applicationActivatedSig f = signal "application-activated" (get 0w1 GioAppInfoClass.t ---> ret_void) f
      fun applicationSelectedSig f = signal "application-selected" (get 0w1 GioAppInfoClass.t ---> ret_void) f
      fun populatePopupSig f = signal "populate-popup" (get 0w1 GtkMenuClass.t &&&> get 0w2 GioAppInfoClass.t ---> ret_void) (fn menu & application => f menu application)
    end
    local
      open Property
    in
      val defaultTextProp =
        {
          get = fn x => get "default-text" stringOpt x,
          set = fn x => set "default-text" stringOpt x
        }
      val showAllProp =
        {
          get = fn x => get "show-all" boolean x,
          set = fn x => set "show-all" boolean x
        }
      val showDefaultProp =
        {
          get = fn x => get "show-default" boolean x,
          set = fn x => set "show-default" boolean x
        }
      val showFallbackProp =
        {
          get = fn x => get "show-fallback" boolean x,
          set = fn x => set "show-fallback" boolean x
        }
      val showOtherProp =
        {
          get = fn x => get "show-other" boolean x,
          set = fn x => set "show-other" boolean x
        }
      val showRecommendedProp =
        {
          get = fn x => get "show-recommended" boolean x,
          set = fn x => set "show-recommended" boolean x
        }
    end
  end
