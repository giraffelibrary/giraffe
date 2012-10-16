structure GtkPrintContext :>
  GTK_PRINT_CONTEXT
    where type 'a class_t = 'a GtkPrintContextClass.t
    where type 'a pagesetupclass_t = 'a GtkPageSetupClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_print_context_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val createPangoContext_ = call (load_sym libgtk "gtk_print_context_create_pango_context") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val createPangoLayout_ = call (load_sym libgtk "gtk_print_context_create_pango_layout") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getCairoContext_ = call (load_sym libgtk "gtk_print_context_get_cairo_context") (GObjectObjectClass.PolyML.PTR --> CairoContextRecord.PolyML.PTR)
      val getDpiX_ = call (load_sym libgtk "gtk_print_context_get_dpi_x") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Double.VAL)
      val getDpiY_ = call (load_sym libgtk "gtk_print_context_get_dpi_y") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Double.VAL)
      val getHardMargins_ =
        call (load_sym libgtk "gtk_print_context_get_hard_margins")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Double.REF
             &&> FFI.PolyML.Double.REF
             &&> FFI.PolyML.Double.REF
             &&> FFI.PolyML.Double.REF
             --> FFI.PolyML.Bool.VAL
          )
      val getHeight_ = call (load_sym libgtk "gtk_print_context_get_height") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Double.VAL)
      val getPageSetup_ = call (load_sym libgtk "gtk_print_context_get_page_setup") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getPangoFontmap_ = call (load_sym libgtk "gtk_print_context_get_pango_fontmap") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getWidth_ = call (load_sym libgtk "gtk_print_context_get_width") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Double.VAL)
      val setCairoContext_ =
        call (load_sym libgtk "gtk_print_context_set_cairo_context")
          (
            GObjectObjectClass.PolyML.PTR
             &&> CairoContextRecord.PolyML.PTR
             &&> FFI.PolyML.Double.VAL
             &&> FFI.PolyML.Double.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkPrintContextClass.t
    type 'a pagesetupclass_t = 'a GtkPageSetupClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createPangoContext self = (GObjectObjectClass.C.withPtr ---> PangoContextClass.C.fromPtr true) createPangoContext_ self
    fun createPangoLayout self = (GObjectObjectClass.C.withPtr ---> PangoLayoutClass.C.fromPtr true) createPangoLayout_ self
    fun getCairoContext self = (GObjectObjectClass.C.withPtr ---> CairoContextRecord.C.fromPtr false) getCairoContext_ self
    fun getDpiX self = (GObjectObjectClass.C.withPtr ---> FFI.Double.fromVal) getDpiX_ self
    fun getDpiY self = (GObjectObjectClass.C.withPtr ---> FFI.Double.fromVal) getDpiY_ self
    fun getHardMargins self =
      let
        val top
         & bottom
         & left
         & right
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Double.withRefVal
             &&&> FFI.Double.withRefVal
             &&&> FFI.Double.withRefVal
             &&&> FFI.Double.withRefVal
             ---> FFI.Double.fromVal
                   && FFI.Double.fromVal
                   && FFI.Double.fromVal
                   && FFI.Double.fromVal
                   && FFI.Bool.fromVal
          )
            getHardMargins_
            (
              self
               & 0.0
               & 0.0
               & 0.0
               & 0.0
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
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Double.fromVal) getHeight_ self
    fun getPageSetup self = (GObjectObjectClass.C.withPtr ---> GtkPageSetupClass.C.fromPtr false) getPageSetup_ self
    fun getPangoFontmap self = (GObjectObjectClass.C.withPtr ---> PangoFontMapClass.C.fromPtr false) getPangoFontmap_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Double.fromVal) getWidth_ self
    fun setCairoContext self cr dpiX dpiY =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
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
