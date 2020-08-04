structure GtkAppChooserWidget :>
  GTK_APP_CHOOSER_WIDGET
    where type 'a class = 'a GtkAppChooserWidgetClass.class
    where type 'a app_chooser_class = 'a GtkAppChooserClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a menu_class = 'a GtkMenuClass.class =
  struct
    val getType_ = _import "gtk_app_chooser_widget_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_app_chooser_widget_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getDefaultText_ = _import "gtk_app_chooser_widget_get_default_text" : GtkAppChooserWidgetClass.FFI.non_opt GtkAppChooserWidgetClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getShowAll_ = _import "gtk_app_chooser_widget_get_show_all" : GtkAppChooserWidgetClass.FFI.non_opt GtkAppChooserWidgetClass.FFI.p -> GBool.FFI.val_;
    val getShowDefault_ = _import "gtk_app_chooser_widget_get_show_default" : GtkAppChooserWidgetClass.FFI.non_opt GtkAppChooserWidgetClass.FFI.p -> GBool.FFI.val_;
    val getShowFallback_ = _import "gtk_app_chooser_widget_get_show_fallback" : GtkAppChooserWidgetClass.FFI.non_opt GtkAppChooserWidgetClass.FFI.p -> GBool.FFI.val_;
    val getShowOther_ = _import "gtk_app_chooser_widget_get_show_other" : GtkAppChooserWidgetClass.FFI.non_opt GtkAppChooserWidgetClass.FFI.p -> GBool.FFI.val_;
    val getShowRecommended_ = _import "gtk_app_chooser_widget_get_show_recommended" : GtkAppChooserWidgetClass.FFI.non_opt GtkAppChooserWidgetClass.FFI.p -> GBool.FFI.val_;
    val setDefaultText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_app_chooser_widget_set_default_text" :
              GtkAppChooserWidgetClass.FFI.non_opt GtkAppChooserWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setShowAll_ = fn x1 & x2 => (_import "gtk_app_chooser_widget_set_show_all" : GtkAppChooserWidgetClass.FFI.non_opt GtkAppChooserWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowDefault_ = fn x1 & x2 => (_import "gtk_app_chooser_widget_set_show_default" : GtkAppChooserWidgetClass.FFI.non_opt GtkAppChooserWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowFallback_ = fn x1 & x2 => (_import "gtk_app_chooser_widget_set_show_fallback" : GtkAppChooserWidgetClass.FFI.non_opt GtkAppChooserWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowOther_ = fn x1 & x2 => (_import "gtk_app_chooser_widget_set_show_other" : GtkAppChooserWidgetClass.FFI.non_opt GtkAppChooserWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowRecommended_ = fn x1 & x2 => (_import "gtk_app_chooser_widget_set_show_recommended" : GtkAppChooserWidgetClass.FFI.non_opt GtkAppChooserWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
