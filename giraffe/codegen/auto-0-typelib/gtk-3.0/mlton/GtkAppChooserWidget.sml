structure GtkAppChooserWidget :>
  GTK_APP_CHOOSER_WIDGET
    where type 'a class = 'a GtkAppChooserWidgetClass.class
    where type 'a app_chooser_class = 'a GtkAppChooserClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a menu_class = 'a GtkMenuClass.class =
  struct
    val getType_ = _import "gtk_app_chooser_widget_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_app_chooser_widget_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getDefaultText_ = _import "gtk_app_chooser_widget_get_default_text" : GtkAppChooserWidgetClass.C.notnull GtkAppChooserWidgetClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getShowAll_ = _import "gtk_app_chooser_widget_get_show_all" : GtkAppChooserWidgetClass.C.notnull GtkAppChooserWidgetClass.C.p -> FFI.Bool.C.val_;
    val getShowDefault_ = _import "gtk_app_chooser_widget_get_show_default" : GtkAppChooserWidgetClass.C.notnull GtkAppChooserWidgetClass.C.p -> FFI.Bool.C.val_;
    val getShowFallback_ = _import "gtk_app_chooser_widget_get_show_fallback" : GtkAppChooserWidgetClass.C.notnull GtkAppChooserWidgetClass.C.p -> FFI.Bool.C.val_;
    val getShowOther_ = _import "gtk_app_chooser_widget_get_show_other" : GtkAppChooserWidgetClass.C.notnull GtkAppChooserWidgetClass.C.p -> FFI.Bool.C.val_;
    val getShowRecommended_ = _import "gtk_app_chooser_widget_get_show_recommended" : GtkAppChooserWidgetClass.C.notnull GtkAppChooserWidgetClass.C.p -> FFI.Bool.C.val_;
    val setDefaultText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_app_chooser_widget_set_default_text" :
              GtkAppChooserWidgetClass.C.notnull GtkAppChooserWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setShowAll_ = fn x1 & x2 => (_import "gtk_app_chooser_widget_set_show_all" : GtkAppChooserWidgetClass.C.notnull GtkAppChooserWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowDefault_ = fn x1 & x2 => (_import "gtk_app_chooser_widget_set_show_default" : GtkAppChooserWidgetClass.C.notnull GtkAppChooserWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowFallback_ = fn x1 & x2 => (_import "gtk_app_chooser_widget_set_show_fallback" : GtkAppChooserWidgetClass.C.notnull GtkAppChooserWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowOther_ = fn x1 & x2 => (_import "gtk_app_chooser_widget_set_show_other" : GtkAppChooserWidgetClass.C.notnull GtkAppChooserWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowRecommended_ = fn x1 & x2 => (_import "gtk_app_chooser_widget_set_show_recommended" : GtkAppChooserWidgetClass.C.notnull GtkAppChooserWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
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
