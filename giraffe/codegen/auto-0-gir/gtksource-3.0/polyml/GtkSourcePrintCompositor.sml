structure GtkSourcePrintCompositor :>
  GTK_SOURCE_PRINT_COMPOSITOR
    where type 'a class = 'a GtkSourcePrintCompositorClass.class
    where type 'a view_class = 'a GtkSourceViewClass.class
    where type 'a buffer_class = 'a GtkSourceBufferClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_print_compositor_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_print_compositor_new") (GtkSourceBufferClass.PolyML.cPtr --> GtkSourcePrintCompositorClass.PolyML.cPtr)
      val newFromView_ = call (getSymbol "gtk_source_print_compositor_new_from_view") (GtkSourceViewClass.PolyML.cPtr --> GtkSourcePrintCompositorClass.PolyML.cPtr)
      val drawPage_ =
        call (getSymbol "gtk_source_print_compositor_draw_page")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> GtkPrintContextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val getBodyFontName_ = call (getSymbol "gtk_source_print_compositor_get_body_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getBottomMargin_ = call (getSymbol "gtk_source_print_compositor_get_bottom_margin") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getBuffer_ = call (getSymbol "gtk_source_print_compositor_get_buffer") (GtkSourcePrintCompositorClass.PolyML.cPtr --> GtkSourceBufferClass.PolyML.cPtr)
      val getFooterFontName_ = call (getSymbol "gtk_source_print_compositor_get_footer_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getHeaderFontName_ = call (getSymbol "gtk_source_print_compositor_get_header_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getHighlightSyntax_ = call (getSymbol "gtk_source_print_compositor_get_highlight_syntax") (GtkSourcePrintCompositorClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLeftMargin_ = call (getSymbol "gtk_source_print_compositor_get_left_margin") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getLineNumbersFontName_ = call (getSymbol "gtk_source_print_compositor_get_line_numbers_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNPages_ = call (getSymbol "gtk_source_print_compositor_get_n_pages") (GtkSourcePrintCompositorClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getPaginationProgress_ = call (getSymbol "gtk_source_print_compositor_get_pagination_progress") (GtkSourcePrintCompositorClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getPrintFooter_ = call (getSymbol "gtk_source_print_compositor_get_print_footer") (GtkSourcePrintCompositorClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPrintHeader_ = call (getSymbol "gtk_source_print_compositor_get_print_header") (GtkSourcePrintCompositorClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPrintLineNumbers_ = call (getSymbol "gtk_source_print_compositor_get_print_line_numbers") (GtkSourcePrintCompositorClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getRightMargin_ = call (getSymbol "gtk_source_print_compositor_get_right_margin") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getTabWidth_ = call (getSymbol "gtk_source_print_compositor_get_tab_width") (GtkSourcePrintCompositorClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getTopMargin_ = call (getSymbol "gtk_source_print_compositor_get_top_margin") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getWrapMode_ = call (getSymbol "gtk_source_print_compositor_get_wrap_mode") (GtkSourcePrintCompositorClass.PolyML.cPtr --> GtkWrapMode.PolyML.cVal)
      val paginate_ = call (getSymbol "gtk_source_print_compositor_paginate") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GtkPrintContextClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setBodyFontName_ = call (getSymbol "gtk_source_print_compositor_set_body_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setBottomMargin_ =
        call (getSymbol "gtk_source_print_compositor_set_bottom_margin")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> cVoid
          )
      val setFooterFontName_ = call (getSymbol "gtk_source_print_compositor_set_footer_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setFooterFormat_ =
        call (getSymbol "gtk_source_print_compositor_set_footer_format")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val setHeaderFontName_ = call (getSymbol "gtk_source_print_compositor_set_header_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setHeaderFormat_ =
        call (getSymbol "gtk_source_print_compositor_set_header_format")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val setHighlightSyntax_ = call (getSymbol "gtk_source_print_compositor_set_highlight_syntax") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setLeftMargin_ =
        call (getSymbol "gtk_source_print_compositor_set_left_margin")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> cVoid
          )
      val setLineNumbersFontName_ = call (getSymbol "gtk_source_print_compositor_set_line_numbers_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setPrintFooter_ = call (getSymbol "gtk_source_print_compositor_set_print_footer") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPrintHeader_ = call (getSymbol "gtk_source_print_compositor_set_print_header") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPrintLineNumbers_ = call (getSymbol "gtk_source_print_compositor_set_print_line_numbers") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val setRightMargin_ =
        call (getSymbol "gtk_source_print_compositor_set_right_margin")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> cVoid
          )
      val setTabWidth_ = call (getSymbol "gtk_source_print_compositor_set_tab_width") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val setTopMargin_ =
        call (getSymbol "gtk_source_print_compositor_set_top_margin")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> cVoid
          )
      val setWrapMode_ = call (getSymbol "gtk_source_print_compositor_set_wrap_mode") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GtkWrapMode.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkSourcePrintCompositorClass.class
    type 'a view_class = 'a GtkSourceViewClass.class
    type 'a buffer_class = 'a GtkSourceBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new buffer = (GtkSourceBufferClass.FFI.withPtr false ---> GtkSourcePrintCompositorClass.FFI.fromPtr true) new_ buffer
    fun newFromView view = (GtkSourceViewClass.FFI.withPtr false ---> GtkSourcePrintCompositorClass.FFI.fromPtr true) newFromView_ view
    fun drawPage self (context, pageNr) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr false
         &&&> GtkPrintContextClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        drawPage_
        (
          self
           & context
           & pageNr
        )
    fun getBodyFontName self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getBodyFontName_ self
    fun getBottomMargin self unit = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getBottomMargin_ (self & unit)
    fun getBuffer self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> GtkSourceBufferClass.FFI.fromPtr false) getBuffer_ self before GtkSourcePrintCompositorClass.FFI.touchPtr self
    fun getFooterFontName self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getFooterFontName_ self
    fun getHeaderFontName self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getHeaderFontName_ self
    fun getHighlightSyntax self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHighlightSyntax_ self
    fun getLeftMargin self unit = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getLeftMargin_ (self & unit)
    fun getLineNumbersFontName self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getLineNumbersFontName_ self
    fun getNPages self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> GInt.FFI.fromVal) getNPages_ self
    fun getPaginationProgress self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getPaginationProgress_ self
    fun getPrintFooter self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> GBool.FFI.fromVal) getPrintFooter_ self
    fun getPrintHeader self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> GBool.FFI.fromVal) getPrintHeader_ self
    fun getPrintLineNumbers self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getPrintLineNumbers_ self
    fun getRightMargin self unit = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getRightMargin_ (self & unit)
    fun getTabWidth self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getTabWidth_ self
    fun getTopMargin self unit = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getTopMargin_ (self & unit)
    fun getWrapMode self = (GtkSourcePrintCompositorClass.FFI.withPtr false ---> GtkWrapMode.FFI.fromVal) getWrapMode_ self
    fun paginate self context = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> GtkPrintContextClass.FFI.withPtr false ---> GBool.FFI.fromVal) paginate_ (self & context)
    fun setBodyFontName self fontName = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setBodyFontName_ (self & fontName)
    fun setBottomMargin self (margin, unit) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setBottomMargin_
        (
          self
           & margin
           & unit
        )
    fun setFooterFontName self fontName = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setFooterFontName_ (self & fontName)
    fun setFooterFormat
      self
      (
        separator,
        left,
        center,
        right
      ) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        setFooterFormat_
        (
          self
           & separator
           & left
           & center
           & right
        )
    fun setHeaderFontName self fontName = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setHeaderFontName_ (self & fontName)
    fun setHeaderFormat
      self
      (
        separator,
        left,
        center,
        right
      ) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        setHeaderFormat_
        (
          self
           & separator
           & left
           & center
           & right
        )
    fun setHighlightSyntax self highlight = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHighlightSyntax_ (self & highlight)
    fun setLeftMargin self (margin, unit) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setLeftMargin_
        (
          self
           & margin
           & unit
        )
    fun setLineNumbersFontName self fontName = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLineNumbersFontName_ (self & fontName)
    fun setPrintFooter self print = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setPrintFooter_ (self & print)
    fun setPrintHeader self print = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setPrintHeader_ (self & print)
    fun setPrintLineNumbers self interval = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setPrintLineNumbers_ (self & interval)
    fun setRightMargin self (margin, unit) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setRightMargin_
        (
          self
           & margin
           & unit
        )
    fun setTabWidth self width = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setTabWidth_ (self & width)
    fun setTopMargin self (margin, unit) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setTopMargin_
        (
          self
           & margin
           & unit
        )
    fun setWrapMode self wrapMode = (GtkSourcePrintCompositorClass.FFI.withPtr false &&&> GtkWrapMode.FFI.withVal ---> I) setWrapMode_ (self & wrapMode)
    local
      open ValueAccessor
    in
      val bodyFontNameProp =
        {
          name = "body-font-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val bufferProp =
        {
          name = "buffer",
          gtype = fn () => C.gtype GtkSourceBufferClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceBufferClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkSourceBufferClass.tOpt x
        }
      val footerFontNameProp =
        {
          name = "footer-font-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val headerFontNameProp =
        {
          name = "header-font-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val highlightSyntaxProp =
        {
          name = "highlight-syntax",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val lineNumbersFontNameProp =
        {
          name = "line-numbers-font-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val nPagesProp =
        {
          name = "n-pages",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val printFooterProp =
        {
          name = "print-footer",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val printHeaderProp =
        {
          name = "print-header",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val printLineNumbersProp =
        {
          name = "print-line-numbers",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val tabWidthProp =
        {
          name = "tab-width",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val wrapModeProp =
        {
          name = "wrap-mode",
          gtype = fn () => C.gtype GtkWrapMode.t (),
          get = fn x => fn () => C.get GtkWrapMode.t x,
          set = fn x => C.set GtkWrapMode.t x,
          init = fn x => C.set GtkWrapMode.t x
        }
    end
  end
