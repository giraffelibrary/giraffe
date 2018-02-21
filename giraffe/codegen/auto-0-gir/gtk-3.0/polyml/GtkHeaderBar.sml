structure GtkHeaderBar :>
  GTK_HEADER_BAR
    where type 'a class = 'a GtkHeaderBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_header_bar_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_header_bar_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getCustomTitle_ = call (getSymbol "gtk_header_bar_get_custom_title") (GtkHeaderBarClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getDecorationLayout_ = call (getSymbol "gtk_header_bar_get_decoration_layout") (GtkHeaderBarClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getHasSubtitle_ = call (getSymbol "gtk_header_bar_get_has_subtitle") (GtkHeaderBarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowCloseButton_ = call (getSymbol "gtk_header_bar_get_show_close_button") (GtkHeaderBarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSubtitle_ = call (getSymbol "gtk_header_bar_get_subtitle") (GtkHeaderBarClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getTitle_ = call (getSymbol "gtk_header_bar_get_title") (GtkHeaderBarClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val packEnd_ = call (getSymbol "gtk_header_bar_pack_end") (GtkHeaderBarClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val packStart_ = call (getSymbol "gtk_header_bar_pack_start") (GtkHeaderBarClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val setCustomTitle_ = call (getSymbol "gtk_header_bar_set_custom_title") (GtkHeaderBarClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setDecorationLayout_ = call (getSymbol "gtk_header_bar_set_decoration_layout") (GtkHeaderBarClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setHasSubtitle_ = call (getSymbol "gtk_header_bar_set_has_subtitle") (GtkHeaderBarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowCloseButton_ = call (getSymbol "gtk_header_bar_set_show_close_button") (GtkHeaderBarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSubtitle_ = call (getSymbol "gtk_header_bar_set_subtitle") (GtkHeaderBarClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setTitle_ = call (getSymbol "gtk_header_bar_set_title") (GtkHeaderBarClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
    end
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
          set = fn x => set "custom-title" GtkWidgetClass.tOpt x
        }
      val decorationLayoutProp =
        {
          get = fn x => get "decoration-layout" stringOpt x,
          set = fn x => set "decoration-layout" stringOpt x
        }
      val decorationLayoutSetProp =
        {
          get = fn x => get "decoration-layout-set" boolean x,
          set = fn x => set "decoration-layout-set" boolean x
        }
      val hasSubtitleProp =
        {
          get = fn x => get "has-subtitle" boolean x,
          set = fn x => set "has-subtitle" boolean x
        }
      val showCloseButtonProp =
        {
          get = fn x => get "show-close-button" boolean x,
          set = fn x => set "show-close-button" boolean x
        }
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x
        }
      val subtitleProp =
        {
          get = fn x => get "subtitle" stringOpt x,
          set = fn x => set "subtitle" stringOpt x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
    end
  end
