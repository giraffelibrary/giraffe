structure GtkAppChooserWidget :>
  GTK_APP_CHOOSER_WIDGET
    where type 'a class_t = 'a GtkAppChooserWidgetClass.t
    where type 'a appchooserclass_t = 'a GtkAppChooserClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type 'a menuclass_t = 'a GtkMenuClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_app_chooser_widget_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_app_chooser_widget_new") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getDefaultText_ = call (load_sym libgtk "gtk_app_chooser_widget_get_default_text") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getShowAll_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_all") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getShowDefault_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_default") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getShowFallback_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_fallback") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getShowOther_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_other") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getShowRecommended_ = call (load_sym libgtk "gtk_app_chooser_widget_get_show_recommended") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setDefaultText_ = call (load_sym libgtk "gtk_app_chooser_widget_set_default_text") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setShowAll_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_all") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setShowDefault_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_default") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setShowFallback_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_fallback") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setShowOther_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_other") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setShowRecommended_ = call (load_sym libgtk "gtk_app_chooser_widget_set_show_recommended") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkAppChooserWidgetClass.t
    type 'a appchooserclass_t = 'a GtkAppChooserClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type 'a menuclass_t = 'a GtkMenuClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asAppChooser self = (GObjectObjectClass.C.withPtr ---> GtkAppChooserClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new contentType = (FFI.String.C.withConstPtr ---> GtkAppChooserWidgetClass.C.fromPtr false) new_ contentType
    fun getDefaultText self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDefaultText_ self
    fun getShowAll self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowAll_ self
    fun getShowDefault self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowDefault_ self
    fun getShowFallback self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowFallback_ self
    fun getShowOther self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowOther_ self
    fun getShowRecommended self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowRecommended_ self
    fun setDefaultText self text = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setDefaultText_ (self & text)
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
