structure GtkHeaderBar :>
  GTK_HEADER_BAR
    where type 'a class = 'a GtkHeaderBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_header_bar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_header_bar_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getCustomTitle_ = _import "gtk_header_bar_get_custom_title" : GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getDecorationLayout_ = _import "gtk_header_bar_get_decoration_layout" : GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getHasSubtitle_ = _import "gtk_header_bar_get_has_subtitle" : GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p -> GBool.FFI.val_;
    val getShowCloseButton_ = _import "gtk_header_bar_get_show_close_button" : GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p -> GBool.FFI.val_;
    val getSubtitle_ = _import "gtk_header_bar_get_subtitle" : GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getTitle_ = _import "gtk_header_bar_get_title" : GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val packEnd_ = fn x1 & x2 => (_import "gtk_header_bar_pack_end" : GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val packStart_ = fn x1 & x2 => (_import "gtk_header_bar_pack_start" : GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setCustomTitle_ = fn x1 & x2 => (_import "gtk_header_bar_set_custom_title" : GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setDecorationLayout_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_header_bar_set_decoration_layout" :
              GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setHasSubtitle_ = fn x1 & x2 => (_import "gtk_header_bar_set_has_subtitle" : GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowCloseButton_ = fn x1 & x2 => (_import "gtk_header_bar_set_show_close_button" : GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSubtitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_header_bar_set_subtitle" :
              GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_header_bar_set_title" :
              GtkHeaderBarClass.FFI.non_opt GtkHeaderBarClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkHeaderBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkHeaderBarClass.FFI.fromPtr false) new_ ()
    fun getCustomTitle self = (GtkHeaderBarClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getCustomTitle_ self
    fun getDecorationLayout self = (GtkHeaderBarClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDecorationLayout_ self
    fun getHasSubtitle self = (GtkHeaderBarClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasSubtitle_ self
    fun getShowCloseButton self = (GtkHeaderBarClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowCloseButton_ self
    fun getSubtitle self = (GtkHeaderBarClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getSubtitle_ self
    fun getTitle self = (GtkHeaderBarClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getTitle_ self
    fun packEnd self child = (GtkHeaderBarClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) packEnd_ (self & child)
    fun packStart self child = (GtkHeaderBarClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) packStart_ (self & child)
    fun setCustomTitle self titleWidget = (GtkHeaderBarClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setCustomTitle_ (self & titleWidget)
    fun setDecorationLayout self layout = (GtkHeaderBarClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setDecorationLayout_ (self & layout)
    fun setHasSubtitle self setting = (GtkHeaderBarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHasSubtitle_ (self & setting)
    fun setShowCloseButton self setting = (GtkHeaderBarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowCloseButton_ (self & setting)
    fun setSubtitle self subtitle = (GtkHeaderBarClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setSubtitle_ (self & subtitle)
    fun setTitle self title = (GtkHeaderBarClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setTitle_ (self & title)
    local
      open Property
    in
      val customTitleProp =
        {
          get = fn x => get "custom-title" GtkWidgetClass.tOpt x,
          set = fn x => set "custom-title" GtkWidgetClass.tOpt x,
          new = fn x => new "custom-title" GtkWidgetClass.tOpt x
        }
      val decorationLayoutProp =
        {
          get = fn x => get "decoration-layout" stringOpt x,
          set = fn x => set "decoration-layout" stringOpt x,
          new = fn x => new "decoration-layout" stringOpt x
        }
      val decorationLayoutSetProp =
        {
          get = fn x => get "decoration-layout-set" boolean x,
          set = fn x => set "decoration-layout-set" boolean x,
          new = fn x => new "decoration-layout-set" boolean x
        }
      val hasSubtitleProp =
        {
          get = fn x => get "has-subtitle" boolean x,
          set = fn x => set "has-subtitle" boolean x,
          new = fn x => new "has-subtitle" boolean x
        }
      val showCloseButtonProp =
        {
          get = fn x => get "show-close-button" boolean x,
          set = fn x => set "show-close-button" boolean x,
          new = fn x => new "show-close-button" boolean x
        }
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x,
          new = fn x => new "spacing" int x
        }
      val subtitleProp =
        {
          get = fn x => get "subtitle" stringOpt x,
          set = fn x => set "subtitle" stringOpt x,
          new = fn x => new "subtitle" stringOpt x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x,
          new = fn x => new "title" stringOpt x
        }
    end
  end
