structure GtkPrintContext :>
  GTK_PRINT_CONTEXT
    where type 'a class = 'a GtkPrintContextClass.class
    where type 'a page_setup_class = 'a GtkPageSetupClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_print_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val createPangoContext_ = call (getSymbol "gtk_print_context_create_pango_context") (GtkPrintContextClass.PolyML.cPtr --> PangoContextClass.PolyML.cPtr)
      val createPangoLayout_ = call (getSymbol "gtk_print_context_create_pango_layout") (GtkPrintContextClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getCairoContext_ = call (getSymbol "gtk_print_context_get_cairo_context") (GtkPrintContextClass.PolyML.cPtr --> CairoContextRecord.PolyML.cPtr)
      val getDpiX_ = call (getSymbol "gtk_print_context_get_dpi_x") (GtkPrintContextClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getDpiY_ = call (getSymbol "gtk_print_context_get_dpi_y") (GtkPrintContextClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getHardMargins_ =
        call (getSymbol "gtk_print_context_get_hard_margins")
          (
            GtkPrintContextClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getHeight_ = call (getSymbol "gtk_print_context_get_height") (GtkPrintContextClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getPageSetup_ = call (getSymbol "gtk_print_context_get_page_setup") (GtkPrintContextClass.PolyML.cPtr --> GtkPageSetupClass.PolyML.cPtr)
      val getPangoFontmap_ = call (getSymbol "gtk_print_context_get_pango_fontmap") (GtkPrintContextClass.PolyML.cPtr --> PangoFontMapClass.PolyML.cPtr)
      val getWidth_ = call (getSymbol "gtk_print_context_get_width") (GtkPrintContextClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val setCairoContext_ =
        call (getSymbol "gtk_print_context_set_cairo_context")
          (
            GtkPrintContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GtkPrintContextClass.class
    type 'a page_setup_class = 'a GtkPageSetupClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun createPangoContext self = (GtkPrintContextClass.FFI.withPtr false ---> PangoContextClass.FFI.fromPtr true) createPangoContext_ self
    fun createPangoLayout self = (GtkPrintContextClass.FFI.withPtr false ---> PangoLayoutClass.FFI.fromPtr true) createPangoLayout_ self
    fun getCairoContext self = (GtkPrintContextClass.FFI.withPtr false ---> CairoContextRecord.FFI.fromPtr false) getCairoContext_ self before GtkPrintContextClass.FFI.touchPtr self
    fun getDpiX self = (GtkPrintContextClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getDpiX_ self
    fun getDpiY self = (GtkPrintContextClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getDpiY_ self
    fun getHardMargins self =
      let
        val top
         & bottom
         & left
         & right
         & retVal =
          (
            GtkPrintContextClass.FFI.withPtr false
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
    fun getHeight self = (GtkPrintContextClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getHeight_ self
    fun getPageSetup self = (GtkPrintContextClass.FFI.withPtr false ---> GtkPageSetupClass.FFI.fromPtr false) getPageSetup_ self before GtkPrintContextClass.FFI.touchPtr self
    fun getPangoFontmap self = (GtkPrintContextClass.FFI.withPtr false ---> PangoFontMapClass.FFI.fromPtr false) getPangoFontmap_ self before GtkPrintContextClass.FFI.touchPtr self
    fun getWidth self = (GtkPrintContextClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getWidth_ self
    fun setCairoContext
      self
      (
        cr,
        dpiX,
        dpiY
      ) =
      (
        GtkPrintContextClass.FFI.withPtr false
         &&&> CairoContextRecord.FFI.withPtr false
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
