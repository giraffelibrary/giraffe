structure GtkSourcePrintCompositor :>
  GTK_SOURCE_PRINT_COMPOSITOR
    where type 'a class = 'a GtkSourcePrintCompositorClass.class
    where type 'a view_class = 'a GtkSourceViewClass.class
    where type 'a buffer_class = 'a GtkSourceBufferClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_print_compositor_new") (GtkSourceBufferClass.PolyML.cPtr --> GtkSourcePrintCompositorClass.PolyML.cPtr)
      val newFromView_ = call (load_sym libgtksourceview "gtk_source_print_compositor_new_from_view") (GtkSourceViewClass.PolyML.cPtr --> GtkSourcePrintCompositorClass.PolyML.cPtr)
      val drawPage_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_draw_page")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> GtkPrintContextClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val getBodyFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_body_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getBottomMargin_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_bottom_margin") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getBuffer_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_buffer") (GtkSourcePrintCompositorClass.PolyML.cPtr --> GtkSourceBufferClass.PolyML.cPtr)
      val getFooterFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_footer_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getHeaderFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_header_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getHighlightSyntax_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_highlight_syntax") (GtkSourcePrintCompositorClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getLeftMargin_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_left_margin") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getLineNumbersFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_line_numbers_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNPages_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_n_pages") (GtkSourcePrintCompositorClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getPaginationProgress_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_pagination_progress") (GtkSourcePrintCompositorClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getPrintFooter_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_print_footer") (GtkSourcePrintCompositorClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPrintHeader_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_print_header") (GtkSourcePrintCompositorClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPrintLineNumbers_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_print_line_numbers") (GtkSourcePrintCompositorClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getRightMargin_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_right_margin") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getTabWidth_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_tab_width") (GtkSourcePrintCompositorClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getTopMargin_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_top_margin") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getWrapMode_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_wrap_mode") (GtkSourcePrintCompositorClass.PolyML.cPtr --> GtkWrapMode.PolyML.cVal)
      val paginate_ = call (load_sym libgtksourceview "gtk_source_print_compositor_paginate") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GtkPrintContextClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setBodyFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_body_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setBottomMargin_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_set_bottom_margin")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setFooterFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_footer_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setFooterFormat_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_set_footer_format")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> PolyMLFFI.cVoid
          )
      val setHeaderFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_header_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setHeaderFormat_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_set_header_format")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> PolyMLFFI.cVoid
          )
      val setHighlightSyntax_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_highlight_syntax") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setLeftMargin_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_set_left_margin")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setLineNumbersFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_line_numbers_font_name") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setPrintFooter_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_print_footer") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPrintHeader_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_print_header") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPrintLineNumbers_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_print_line_numbers") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setRightMargin_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_set_right_margin")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setTabWidth_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_tab_width") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTopMargin_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_set_top_margin")
          (
            GtkSourcePrintCompositorClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setWrapMode_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_wrap_mode") (GtkSourcePrintCompositorClass.PolyML.cPtr &&> GtkWrapMode.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkSourcePrintCompositorClass.class
    type 'a view_class = 'a GtkSourceViewClass.class
    type 'a buffer_class = 'a GtkSourceBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new buffer = (GtkSourceBufferClass.C.withPtr ---> GtkSourcePrintCompositorClass.C.fromPtr true) new_ buffer
    fun newFromView view = (GtkSourceViewClass.C.withPtr ---> GtkSourcePrintCompositorClass.C.fromPtr true) newFromView_ view
    fun drawPage self context pageNr =
      (
        GtkSourcePrintCompositorClass.C.withPtr
         &&&> GtkPrintContextClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        drawPage_
        (
          self
           & context
           & pageNr
        )
    fun getBodyFontName self = (GtkSourcePrintCompositorClass.C.withPtr ---> Utf8.C.fromPtr true) getBodyFontName_ self
    fun getBottomMargin self unit = (GtkSourcePrintCompositorClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getBottomMargin_ (self & unit)
    fun getBuffer self = (GtkSourcePrintCompositorClass.C.withPtr ---> GtkSourceBufferClass.C.fromPtr false) getBuffer_ self
    fun getFooterFontName self = (GtkSourcePrintCompositorClass.C.withPtr ---> Utf8.C.fromPtr true) getFooterFontName_ self
    fun getHeaderFontName self = (GtkSourcePrintCompositorClass.C.withPtr ---> Utf8.C.fromPtr true) getHeaderFontName_ self
    fun getHighlightSyntax self = (GtkSourcePrintCompositorClass.C.withPtr ---> FFI.Bool.C.fromVal) getHighlightSyntax_ self
    fun getLeftMargin self unit = (GtkSourcePrintCompositorClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getLeftMargin_ (self & unit)
    fun getLineNumbersFontName self = (GtkSourcePrintCompositorClass.C.withPtr ---> Utf8.C.fromPtr true) getLineNumbersFontName_ self
    fun getNPages self = (GtkSourcePrintCompositorClass.C.withPtr ---> FFI.Int32.C.fromVal) getNPages_ self
    fun getPaginationProgress self = (GtkSourcePrintCompositorClass.C.withPtr ---> FFI.Double.C.fromVal) getPaginationProgress_ self
    fun getPrintFooter self = (GtkSourcePrintCompositorClass.C.withPtr ---> FFI.Bool.C.fromVal) getPrintFooter_ self
    fun getPrintHeader self = (GtkSourcePrintCompositorClass.C.withPtr ---> FFI.Bool.C.fromVal) getPrintHeader_ self
    fun getPrintLineNumbers self = (GtkSourcePrintCompositorClass.C.withPtr ---> FFI.UInt32.C.fromVal) getPrintLineNumbers_ self
    fun getRightMargin self unit = (GtkSourcePrintCompositorClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getRightMargin_ (self & unit)
    fun getTabWidth self = (GtkSourcePrintCompositorClass.C.withPtr ---> FFI.UInt32.C.fromVal) getTabWidth_ self
    fun getTopMargin self unit = (GtkSourcePrintCompositorClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getTopMargin_ (self & unit)
    fun getWrapMode self = (GtkSourcePrintCompositorClass.C.withPtr ---> GtkWrapMode.C.fromVal) getWrapMode_ self
    fun paginate self context = (GtkSourcePrintCompositorClass.C.withPtr &&&> GtkPrintContextClass.C.withPtr ---> FFI.Bool.C.fromVal) paginate_ (self & context)
    fun setBodyFontName self fontName = (GtkSourcePrintCompositorClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setBodyFontName_ (self & fontName)
    fun setBottomMargin self margin unit =
      (
        GtkSourcePrintCompositorClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setBottomMargin_
        (
          self
           & margin
           & unit
        )
    fun setFooterFontName self fontName = (GtkSourcePrintCompositorClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setFooterFontName_ (self & fontName)
    fun setFooterFormat self separator left center right =
      (
        GtkSourcePrintCompositorClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
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
    fun setHeaderFontName self fontName = (GtkSourcePrintCompositorClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setHeaderFontName_ (self & fontName)
    fun setHeaderFormat self separator left center right =
      (
        GtkSourcePrintCompositorClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
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
    fun setHighlightSyntax self highlight = (GtkSourcePrintCompositorClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHighlightSyntax_ (self & highlight)
    fun setLeftMargin self margin unit =
      (
        GtkSourcePrintCompositorClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setLeftMargin_
        (
          self
           & margin
           & unit
        )
    fun setLineNumbersFontName self fontName = (GtkSourcePrintCompositorClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setLineNumbersFontName_ (self & fontName)
    fun setPrintFooter self print = (GtkSourcePrintCompositorClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPrintFooter_ (self & print)
    fun setPrintHeader self print = (GtkSourcePrintCompositorClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPrintHeader_ (self & print)
    fun setPrintLineNumbers self interval = (GtkSourcePrintCompositorClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setPrintLineNumbers_ (self & interval)
    fun setRightMargin self margin unit =
      (
        GtkSourcePrintCompositorClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setRightMargin_
        (
          self
           & margin
           & unit
        )
    fun setTabWidth self width = (GtkSourcePrintCompositorClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setTabWidth_ (self & width)
    fun setTopMargin self margin unit =
      (
        GtkSourcePrintCompositorClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setTopMargin_
        (
          self
           & margin
           & unit
        )
    fun setWrapMode self wrapMode = (GtkSourcePrintCompositorClass.C.withPtr &&&> GtkWrapMode.C.withVal ---> I) setWrapMode_ (self & wrapMode)
    local
      open Property
    in
      val bodyFontNameProp =
        {
          get = fn x => get "body-font-name" stringOpt x,
          set = fn x => set "body-font-name" stringOpt x
        }
      val bufferProp =
        {
          get = fn x => get "buffer" GtkSourceBufferClass.tOpt x,
          set = fn x => set "buffer" GtkSourceBufferClass.tOpt x
        }
      val footerFontNameProp =
        {
          get = fn x => get "footer-font-name" stringOpt x,
          set = fn x => set "footer-font-name" stringOpt x
        }
      val headerFontNameProp =
        {
          get = fn x => get "header-font-name" stringOpt x,
          set = fn x => set "header-font-name" stringOpt x
        }
      val highlightSyntaxProp =
        {
          get = fn x => get "highlight-syntax" boolean x,
          set = fn x => set "highlight-syntax" boolean x
        }
      val lineNumbersFontNameProp =
        {
          get = fn x => get "line-numbers-font-name" stringOpt x,
          set = fn x => set "line-numbers-font-name" stringOpt x
        }
      val nPagesProp = {get = fn x => get "n-pages" int x}
      val printFooterProp =
        {
          get = fn x => get "print-footer" boolean x,
          set = fn x => set "print-footer" boolean x
        }
      val printHeaderProp =
        {
          get = fn x => get "print-header" boolean x,
          set = fn x => set "print-header" boolean x
        }
      val printLineNumbersProp =
        {
          get = fn x => get "print-line-numbers" uint x,
          set = fn x => set "print-line-numbers" uint x
        }
      val tabWidthProp =
        {
          get = fn x => get "tab-width" uint x,
          set = fn x => set "tab-width" uint x
        }
      val wrapModeProp =
        {
          get = fn x => get "wrap-mode" GtkWrapMode.t x,
          set = fn x => set "wrap-mode" GtkWrapMode.t x
        }
    end
  end
