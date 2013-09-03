structure GtkSourcePrintCompositor :>
  GTK_SOURCE_PRINT_COMPOSITOR
    where type 'a class_t = 'a GtkSourcePrintCompositorClass.t
    where type 'a viewclass_t = 'a GtkSourceViewClass.t
    where type 'a bufferclass_t = 'a GtkSourceBufferClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtksourceview "gtk_source_print_compositor_new") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val newFromView_ = call (load_sym libgtksourceview "gtk_source_print_compositor_new_from_view") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val drawPage_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_draw_page")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val getBodyFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_body_font_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getBottomMargin_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_bottom_margin") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getBuffer_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_buffer") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFooterFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_footer_font_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getHeaderFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_header_font_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getHighlightSyntax_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_highlight_syntax") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getLeftMargin_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_left_margin") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getLineNumbersFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_line_numbers_font_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getNPages_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_n_pages") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getPaginationProgress_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_pagination_progress") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Double.VAL)
      val getPrintFooter_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_print_footer") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getPrintHeader_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_print_header") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getPrintLineNumbers_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_print_line_numbers") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.UInt32.VAL)
      val getRightMargin_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_right_margin") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getTabWidth_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_tab_width") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.UInt32.VAL)
      val getTopMargin_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_top_margin") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getWrapMode_ = call (load_sym libgtksourceview "gtk_source_print_compositor_get_wrap_mode") (GObjectObjectClass.PolyML.PTR --> GtkWrapMode.PolyML.VAL)
      val paginate_ = call (load_sym libgtksourceview "gtk_source_print_compositor_paginate") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setBodyFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_body_font_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setBottomMargin_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_set_bottom_margin")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Double.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setFooterFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_footer_font_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INOPTPTR --> FFI.PolyML.VOID)
      val setFooterFormat_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_set_footer_format")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Bool.VAL
             &&> FFI.PolyML.String.INOPTPTR
             &&> FFI.PolyML.String.INOPTPTR
             &&> FFI.PolyML.String.INOPTPTR
             --> FFI.PolyML.VOID
          )
      val setHeaderFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_header_font_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INOPTPTR --> FFI.PolyML.VOID)
      val setHeaderFormat_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_set_header_format")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Bool.VAL
             &&> FFI.PolyML.String.INOPTPTR
             &&> FFI.PolyML.String.INOPTPTR
             &&> FFI.PolyML.String.INOPTPTR
             --> FFI.PolyML.VOID
          )
      val setHighlightSyntax_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_highlight_syntax") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setLeftMargin_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_set_left_margin")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Double.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setLineNumbersFontName_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_line_numbers_font_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INOPTPTR --> FFI.PolyML.VOID)
      val setPrintFooter_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_print_footer") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setPrintHeader_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_print_header") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setPrintLineNumbers_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_print_line_numbers") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.UInt32.VAL --> FFI.PolyML.VOID)
      val setRightMargin_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_set_right_margin")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Double.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setTabWidth_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_tab_width") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.UInt32.VAL --> FFI.PolyML.VOID)
      val setTopMargin_ =
        call (load_sym libgtksourceview "gtk_source_print_compositor_set_top_margin")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Double.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setWrapMode_ = call (load_sym libgtksourceview "gtk_source_print_compositor_set_wrap_mode") (GObjectObjectClass.PolyML.PTR &&> GtkWrapMode.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkSourcePrintCompositorClass.t
    type 'a viewclass_t = 'a GtkSourceViewClass.t
    type 'a bufferclass_t = 'a GtkSourceBufferClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new buffer = (GObjectObjectClass.C.withPtr ---> GtkSourcePrintCompositorClass.C.fromPtr true) new_ buffer
    fun newFromView view = (GObjectObjectClass.C.withPtr ---> GtkSourcePrintCompositorClass.C.fromPtr true) newFromView_ view
    fun drawPage self context pageNr =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         ---> I
      )
        drawPage_
        (
          self
           & context
           & pageNr
        )
    fun getBodyFontName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getBodyFontName_ self
    fun getBottomMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getBottomMargin_ (self & unit)
    fun getBuffer self = (GObjectObjectClass.C.withPtr ---> GtkSourceBufferClass.C.fromPtr false) getBuffer_ self
    fun getFooterFontName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getFooterFontName_ self
    fun getHeaderFontName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getHeaderFontName_ self
    fun getHighlightSyntax self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getHighlightSyntax_ self
    fun getLeftMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getLeftMargin_ (self & unit)
    fun getLineNumbersFontName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getLineNumbersFontName_ self
    fun getNPages self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getNPages_ self
    fun getPaginationProgress self = (GObjectObjectClass.C.withPtr ---> FFI.Double.fromVal) getPaginationProgress_ self
    fun getPrintFooter self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getPrintFooter_ self
    fun getPrintHeader self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getPrintHeader_ self
    fun getPrintLineNumbers self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.fromVal) getPrintLineNumbers_ self
    fun getRightMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getRightMargin_ (self & unit)
    fun getTabWidth self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.fromVal) getTabWidth_ self
    fun getTopMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getTopMargin_ (self & unit)
    fun getWrapMode self = (GObjectObjectClass.C.withPtr ---> GtkWrapMode.C.fromVal) getWrapMode_ self
    fun paginate self context = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) paginate_ (self & context)
    fun setBodyFontName self fontName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setBodyFontName_ (self & fontName)
    fun setBottomMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setBottomMargin_
        (
          self
           & margin
           & unit
        )
    fun setFooterFontName self fontName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setFooterFontName_ (self & fontName)
    fun setFooterFormat self separator left center right =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.withVal
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.String.withConstOptPtr
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
    fun setHeaderFontName self fontName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setHeaderFontName_ (self & fontName)
    fun setHeaderFormat self separator left center right =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.withVal
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.String.withConstOptPtr
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
    fun setHighlightSyntax self highlight = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setHighlightSyntax_ (self & highlight)
    fun setLeftMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setLeftMargin_
        (
          self
           & margin
           & unit
        )
    fun setLineNumbersFontName self fontName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setLineNumbersFontName_ (self & fontName)
    fun setPrintFooter self print = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setPrintFooter_ (self & print)
    fun setPrintHeader self print = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setPrintHeader_ (self & print)
    fun setPrintLineNumbers self interval = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.withVal ---> I) setPrintLineNumbers_ (self & interval)
    fun setRightMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setRightMargin_
        (
          self
           & margin
           & unit
        )
    fun setTabWidth self width = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.withVal ---> I) setTabWidth_ (self & width)
    fun setTopMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setTopMargin_
        (
          self
           & margin
           & unit
        )
    fun setWrapMode self wrapMode = (GObjectObjectClass.C.withPtr &&&> GtkWrapMode.C.withVal ---> I) setWrapMode_ (self & wrapMode)
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
