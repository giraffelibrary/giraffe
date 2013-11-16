signature GTK_PRINT_CONTEXT =
  sig
    type 'a class_t
    type 'a pagesetupclass_t
    val getType : unit -> GObject.Type.t
    val createPangoContext : 'a class_t -> base Pango.ContextClass.t
    val createPangoLayout : 'a class_t -> base Pango.LayoutClass.t
    val getCairoContext : 'a class_t -> Cairo.ContextRecord.t
    val getDpiX : 'a class_t -> real
    val getDpiY : 'a class_t -> real
    val getHardMargins :
      'a class_t
       -> (real
            * real
            * real
            * real)
            option
    val getHeight : 'a class_t -> real
    val getPageSetup : 'a class_t -> base pagesetupclass_t
    val getPangoFontmap : 'a class_t -> base Pango.FontMapClass.t
    val getWidth : 'a class_t -> real
    val setCairoContext :
      'a class_t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> unit
  end
