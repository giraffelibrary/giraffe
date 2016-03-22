structure GtkPrintContext :>
  GTK_PRINT_CONTEXT
    where type 'a class = 'a GtkPrintContextClass.class
    where type 'a page_setup_class = 'a GtkPageSetupClass.class =
  struct
    val getType_ = _import "gtk_print_context_get_type" : unit -> GObjectType.C.val_;
    val createPangoContext_ = _import "gtk_print_context_create_pango_context" : GtkPrintContextClass.C.notnull GtkPrintContextClass.C.p -> PangoContextClass.C.notnull PangoContextClass.C.p;
    val createPangoLayout_ = _import "gtk_print_context_create_pango_layout" : GtkPrintContextClass.C.notnull GtkPrintContextClass.C.p -> PangoLayoutClass.C.notnull PangoLayoutClass.C.p;
    val getCairoContext_ = _import "gtk_print_context_get_cairo_context" : GtkPrintContextClass.C.notnull GtkPrintContextClass.C.p -> CairoContextRecord.C.notnull CairoContextRecord.C.p;
    val getDpiX_ = _import "gtk_print_context_get_dpi_x" : GtkPrintContextClass.C.notnull GtkPrintContextClass.C.p -> FFI.Double.C.val_;
    val getDpiY_ = _import "gtk_print_context_get_dpi_y" : GtkPrintContextClass.C.notnull GtkPrintContextClass.C.p -> FFI.Double.C.val_;
    val getHardMargins_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_print_context_get_hard_margins" :
              GtkPrintContextClass.C.notnull GtkPrintContextClass.C.p
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getHeight_ = _import "gtk_print_context_get_height" : GtkPrintContextClass.C.notnull GtkPrintContextClass.C.p -> FFI.Double.C.val_;
    val getPageSetup_ = _import "gtk_print_context_get_page_setup" : GtkPrintContextClass.C.notnull GtkPrintContextClass.C.p -> GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p;
    val getPangoFontmap_ = _import "gtk_print_context_get_pango_fontmap" : GtkPrintContextClass.C.notnull GtkPrintContextClass.C.p -> PangoFontMapClass.C.notnull PangoFontMapClass.C.p;
    val getWidth_ = _import "gtk_print_context_get_width" : GtkPrintContextClass.C.notnull GtkPrintContextClass.C.p -> FFI.Double.C.val_;
    val setCairoContext_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_print_context_set_cairo_context" :
              GtkPrintContextClass.C.notnull GtkPrintContextClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GtkPrintContextClass.class
    type 'a page_setup_class = 'a GtkPageSetupClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createPangoContext self = (GtkPrintContextClass.C.withPtr ---> PangoContextClass.C.fromPtr true) createPangoContext_ self
    fun createPangoLayout self = (GtkPrintContextClass.C.withPtr ---> PangoLayoutClass.C.fromPtr true) createPangoLayout_ self
    fun getCairoContext self = (GtkPrintContextClass.C.withPtr ---> CairoContextRecord.C.fromPtr false) getCairoContext_ self
    fun getDpiX self = (GtkPrintContextClass.C.withPtr ---> FFI.Double.C.fromVal) getDpiX_ self
    fun getDpiY self = (GtkPrintContextClass.C.withPtr ---> FFI.Double.C.fromVal) getDpiY_ self
    fun getHardMargins self =
      let
        val top
         & bottom
         & left
         & right
         & retVal =
          (
            GtkPrintContextClass.C.withPtr
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             ---> FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getHardMargins_
            (
              self
               & FFI.Double.null
               & FFI.Double.null
               & FFI.Double.null
               & FFI.Double.null
            )
      in
        if retVal
        then
          SOME
            (
              top,
              bottom,
              left,
              right
            )
        else NONE
      end
    fun getHeight self = (GtkPrintContextClass.C.withPtr ---> FFI.Double.C.fromVal) getHeight_ self
    fun getPageSetup self = (GtkPrintContextClass.C.withPtr ---> GtkPageSetupClass.C.fromPtr false) getPageSetup_ self
    fun getPangoFontmap self = (GtkPrintContextClass.C.withPtr ---> PangoFontMapClass.C.fromPtr false) getPangoFontmap_ self
    fun getWidth self = (GtkPrintContextClass.C.withPtr ---> FFI.Double.C.fromVal) getWidth_ self
    fun setCairoContext self cr dpiX dpiY =
      (
        GtkPrintContextClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        setCairoContext_
        (
          self
           & cr
           & dpiX
           & dpiY
        )
  end
