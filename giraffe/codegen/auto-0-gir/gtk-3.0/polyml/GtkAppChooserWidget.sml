structure GtkAppChooserWidget :>
  GTK_APP_CHOOSER_WIDGET
    where type 'a class_t = 'a GtkAppChooserWidgetClass.t
    where type 'a app_chooser_class_t = 'a GtkAppChooserClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type 'a menu_class_t = 'a GtkMenuClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_app_chooser_widget_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_app_chooser_widget_new") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDefaultText_ = call (load_sym libgtk "gtk_app_chooser_widget_get_default_text") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getShowAll_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_all") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowDefault_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_default") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowFallback_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_fallback") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowOther_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_other") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowRecommended_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_recommended") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setDefaultText_ = call (load_sym libgtk "gtk_app_chooser_widget_set_default_text") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setShowAll_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_all") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setShowDefault_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_default") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setShowFallback_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_fallback") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setShowOther_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_other") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setShowRecommended_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_recommended") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkAppChooserWidgetClass.t
    type 'a app_chooser_class_t = 'a GtkAppChooserClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type 'a menu_class_t = 'a GtkMenuClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asAppChooser self = (GObjectObjectClass.C.withPtr ---> GtkAppChooserClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new contentType = (Utf8.C.withPtr ---> GtkAppChooserWidgetClass.C.fromPtr false) new_ contentType
    fun getDefaultText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDefaultText_ self
    fun getShowAll self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowAll_ self
    fun getShowDefault self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowDefault_ self
    fun getShowFallback self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowFallback_ self
    fun getShowOther self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowOther_ self
    fun getShowRecommended self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowRecommended_ self
    fun setDefaultText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDefaultText_ (self & text)
    fun setShowAll self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowAll_ (self & setting)
    fun setShowDefault self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowDefault_ (self & setting)
    fun setShowFallback self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowFallback_ (self & setting)
    fun setShowOther self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowOther_ (self & setting)
    fun setShowRecommended self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowRecommended_ (self & setting)
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
