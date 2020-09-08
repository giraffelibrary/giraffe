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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkHeaderBarClass.FFI.fromPtr false) new_ ()
    fun getCustomTitle self = (GtkHeaderBarClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getCustomTitle_ self
    fun getDecorationLayout self = (GtkHeaderBarClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDecorationLayout_ self
    fun getHasSubtitle self = (GtkHeaderBarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasSubtitle_ self
    fun getShowCloseButton self = (GtkHeaderBarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowCloseButton_ self
    fun getSubtitle self = (GtkHeaderBarClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getSubtitle_ self
    fun getTitle self = (GtkHeaderBarClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getTitle_ self
    fun packEnd self child = (GtkHeaderBarClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) packEnd_ (self & child)
    fun packStart self child = (GtkHeaderBarClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) packStart_ (self & child)
    fun setCustomTitle self titleWidget = (GtkHeaderBarClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setCustomTitle_ (self & titleWidget)
    fun setDecorationLayout self layout = (GtkHeaderBarClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setDecorationLayout_ (self & layout)
    fun setHasSubtitle self setting = (GtkHeaderBarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHasSubtitle_ (self & setting)
    fun setShowCloseButton self setting = (GtkHeaderBarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowCloseButton_ (self & setting)
    fun setSubtitle self subtitle = (GtkHeaderBarClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setSubtitle_ (self & subtitle)
    fun setTitle self title = (GtkHeaderBarClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setTitle_ (self & title)
    local
      open ValueAccessor
    in
      val customTitleProp =
        {
          name = "custom-title",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val decorationLayoutProp =
        {
          name = "decoration-layout",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val decorationLayoutSetProp =
        {
          name = "decoration-layout-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val hasSubtitleProp =
        {
          name = "has-subtitle",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showCloseButtonProp =
        {
          name = "show-close-button",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val spacingProp =
        {
          name = "spacing",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val subtitleProp =
        {
          name = "subtitle",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val titleProp =
        {
          name = "title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
