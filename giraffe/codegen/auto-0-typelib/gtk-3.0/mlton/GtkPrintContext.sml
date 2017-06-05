structure GtkPrintContext :>
  GTK_PRINT_CONTEXT
    where type 'a class = 'a GtkPrintContextClass.class
    where type 'a page_setup_class = 'a GtkPageSetupClass.class =
  struct
    val getType_ = _import "gtk_print_context_get_type" : unit -> GObjectType.FFI.val_;
    val createPangoContext_ = _import "gtk_print_context_create_pango_context" : GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p -> PangoContextClass.FFI.notnull PangoContextClass.FFI.p;
    val createPangoLayout_ = _import "gtk_print_context_create_pango_layout" : GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p -> PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p;
    val getCairoContext_ = _import "gtk_print_context_get_cairo_context" : GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p -> CairoContextRecord.FFI.notnull CairoContextRecord.FFI.p;
    val getDpiX_ = _import "gtk_print_context_get_dpi_x" : GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p -> GDouble.FFI.val_;
    val getDpiY_ = _import "gtk_print_context_get_dpi_y" : GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p -> GDouble.FFI.val_;
    val getHardMargins_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_print_context_get_hard_margins" :
              GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getHeight_ = _import "gtk_print_context_get_height" : GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p -> GDouble.FFI.val_;
    val getPageSetup_ = _import "gtk_print_context_get_page_setup" : GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p -> GtkPageSetupClass.FFI.notnull GtkPageSetupClass.FFI.p;
    val getPangoFontmap_ = _import "gtk_print_context_get_pango_fontmap" : GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p -> PangoFontMapClass.FFI.notnull PangoFontMapClass.FFI.p;
    val getWidth_ = _import "gtk_print_context_get_width" : GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p -> GDouble.FFI.val_;
    val setCairoContext_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_print_context_set_cairo_context" :
              GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p
               * CairoContextRecord.FFI.notnull CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun createPangoContext self = (GtkPrintContextClass.FFI.withPtr ---> PangoContextClass.FFI.fromPtr true) createPangoContext_ self
    fun createPangoLayout self = (GtkPrintContextClass.FFI.withPtr ---> PangoLayoutClass.FFI.fromPtr true) createPangoLayout_ self
    fun getCairoContext self = (GtkPrintContextClass.FFI.withPtr ---> CairoContextRecord.FFI.fromPtr false) getCairoContext_ self
    fun getDpiX self = (GtkPrintContextClass.FFI.withPtr ---> GDouble.FFI.fromVal) getDpiX_ self
    fun getDpiY self = (GtkPrintContextClass.FFI.withPtr ---> GDouble.FFI.fromVal) getDpiY_ self
    fun getHardMargins self =
      let
        val top
         & bottom
         & left
         & right
         & retVal =
          (
            GtkPrintContextClass.FFI.withPtr
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getHardMargins_
            (
              self
               & GDouble.null
               & GDouble.null
               & GDouble.null
               & GDouble.null
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
    fun getHeight self = (GtkPrintContextClass.FFI.withPtr ---> GDouble.FFI.fromVal) getHeight_ self
    fun getPageSetup self = (GtkPrintContextClass.FFI.withPtr ---> GtkPageSetupClass.FFI.fromPtr false) getPageSetup_ self
    fun getPangoFontmap self = (GtkPrintContextClass.FFI.withPtr ---> PangoFontMapClass.FFI.fromPtr false) getPangoFontmap_ self
    fun getWidth self = (GtkPrintContextClass.FFI.withPtr ---> GDouble.FFI.fromVal) getWidth_ self
    fun setCairoContext self cr dpiX dpiY =
      (
        GtkPrintContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
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
