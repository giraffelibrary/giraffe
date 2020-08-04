structure GtkFontButton :>
  GTK_FONT_BUTTON
    where type 'a class = 'a GtkFontButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a font_chooser_class = 'a GtkFontChooserClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_font_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_font_button_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithFont_ = call (getSymbol "gtk_font_button_new_with_font") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getFontName_ = call (getSymbol "gtk_font_button_get_font_name") (GtkFontButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getShowSize_ = call (getSymbol "gtk_font_button_get_show_size") (GtkFontButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowStyle_ = call (getSymbol "gtk_font_button_get_show_style") (GtkFontButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTitle_ = call (getSymbol "gtk_font_button_get_title") (GtkFontButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUseFont_ = call (getSymbol "gtk_font_button_get_use_font") (GtkFontButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getUseSize_ = call (getSymbol "gtk_font_button_get_use_size") (GtkFontButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setFontName_ = call (getSymbol "gtk_font_button_set_font_name") (GtkFontButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val setShowSize_ = call (getSymbol "gtk_font_button_set_show_size") (GtkFontButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowStyle_ = call (getSymbol "gtk_font_button_set_show_style") (GtkFontButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTitle_ = call (getSymbol "gtk_font_button_set_title") (GtkFontButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setUseFont_ = call (getSymbol "gtk_font_button_set_use_font") (GtkFontButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setUseSize_ = call (getSymbol "gtk_font_button_set_use_size") (GtkFontButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkFontButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a font_chooser_class = 'a GtkFontChooserClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asFontChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkFontChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkFontButtonClass.FFI.fromPtr false) new_ ()
    fun newWithFont fontname = (Utf8.FFI.withPtr 0 ---> GtkFontButtonClass.FFI.fromPtr false) newWithFont_ fontname
    fun getFontName self = (GtkFontButtonClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getFontName_ self
    fun getShowSize self = (GtkFontButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowSize_ self
    fun getShowStyle self = (GtkFontButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowStyle_ self
    fun getTitle self = (GtkFontButtonClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getUseFont self = (GtkFontButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseFont_ self
    fun getUseSize self = (GtkFontButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseSize_ self
    fun setFontName self fontname = (GtkFontButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) setFontName_ (self & fontname)
    fun setShowSize self showSize = (GtkFontButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowSize_ (self & showSize)
    fun setShowStyle self showStyle = (GtkFontButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowStyle_ (self & showStyle)
    fun setTitle self title = (GtkFontButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    fun setUseFont self useFont = (GtkFontButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseFont_ (self & useFont)
    fun setUseSize self useSize = (GtkFontButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseSize_ (self & useSize)
    local
      open ClosureMarshal Signal
    in
      fun fontSetSig f = signal "font-set" (void ---> ret_void) f
    end
    local
      open Property
    in
      val fontNameProp =
        {
          get = fn x => get "font-name" stringOpt x,
          set = fn x => set "font-name" stringOpt x,
          new = fn x => new "font-name" stringOpt x
        }
      val showSizeProp =
        {
          get = fn x => get "show-size" boolean x,
          set = fn x => set "show-size" boolean x,
          new = fn x => new "show-size" boolean x
        }
      val showStyleProp =
        {
          get = fn x => get "show-style" boolean x,
          set = fn x => set "show-style" boolean x,
          new = fn x => new "show-style" boolean x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x,
          new = fn x => new "title" stringOpt x
        }
      val useFontProp =
        {
          get = fn x => get "use-font" boolean x,
          set = fn x => set "use-font" boolean x,
          new = fn x => new "use-font" boolean x
        }
      val useSizeProp =
        {
          get = fn x => get "use-size" boolean x,
          set = fn x => set "use-size" boolean x,
          new = fn x => new "use-size" boolean x
        }
    end
  end
