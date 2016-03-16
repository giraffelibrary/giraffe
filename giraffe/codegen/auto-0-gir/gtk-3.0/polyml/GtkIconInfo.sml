structure GtkIconInfo :>
  GTK_ICON_INFO
    where type record_t = GtkIconInfoRecord.t
    where type 'a icon_theme_class_t = 'a GtkIconThemeClass.t
    where type 'a style_context_class_t = 'a GtkStyleContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_info_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val newForPixbuf_ = call (load_sym libgtk "gtk_icon_info_new_for_pixbuf") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GtkIconInfoRecord.PolyML.cPtr)
      val copy_ = call (load_sym libgtk "gtk_icon_info_copy") (GtkIconInfoRecord.PolyML.cPtr --> GtkIconInfoRecord.PolyML.cPtr)
      val getBaseSize_ = call (load_sym libgtk "gtk_icon_info_get_base_size") (GtkIconInfoRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getBuiltinPixbuf_ = call (load_sym libgtk "gtk_icon_info_get_builtin_pixbuf") (GtkIconInfoRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDisplayName_ = call (load_sym libgtk "gtk_icon_info_get_display_name") (GtkIconInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEmbeddedRect_ = call (load_sym libgtk "gtk_icon_info_get_embedded_rect") (GtkIconInfoRecord.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFilename_ = call (load_sym libgtk "gtk_icon_info_get_filename") (GtkIconInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val loadIcon_ = call (load_sym libgtk "gtk_icon_info_load_icon") (GtkIconInfoRecord.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val loadSymbolic_ =
        call (load_sym libgtk "gtk_icon_info_load_symbolic")
          (
            GtkIconInfoRecord.PolyML.cPtr
             &&> GdkRgbaRecord.PolyML.cPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> FFI.Bool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val loadSymbolicForContext_ =
        call (load_sym libgtk "gtk_icon_info_load_symbolic_for_context")
          (
            GtkIconInfoRecord.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val setRawCoordinates_ = call (load_sym libgtk "gtk_icon_info_set_raw_coordinates") (GtkIconInfoRecord.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type record_t = GtkIconInfoRecord.t
    type 'a icon_theme_class_t = 'a GtkIconThemeClass.t
    type 'a style_context_class_t = 'a GtkStyleContextClass.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newForPixbuf iconTheme pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkIconInfoRecord.C.fromPtr true) newForPixbuf_ (iconTheme & pixbuf)
    fun copy self = (GtkIconInfoRecord.C.withPtr ---> GtkIconInfoRecord.C.fromPtr true) copy_ self
    fun getBaseSize self = (GtkIconInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) getBaseSize_ self
    fun getBuiltinPixbuf self = (GtkIconInfoRecord.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getBuiltinPixbuf_ self
    fun getDisplayName self = (GtkIconInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) getDisplayName_ self
    fun getEmbeddedRect self =
      let
        val rectangle & retVal = (GtkIconInfoRecord.C.withPtr &&&> GdkRectangleRecord.C.withNewPtr ---> GdkRectangleRecord.C.fromPtr true && FFI.Bool.C.fromVal) getEmbeddedRect_ (self & ())
      in
        if retVal then SOME rectangle else NONE
      end
    fun getFilename self = (GtkIconInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) getFilename_ self
    fun loadIcon self = (GtkIconInfoRecord.C.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.C.fromPtr true) loadIcon_ (self & [])
    fun loadSymbolic self fg successColor warningColor errorColor =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoRecord.C.withPtr
             &&&> GdkRgbaRecord.C.withPtr
             &&&> GdkRgbaRecord.C.withOptPtr
             &&&> GdkRgbaRecord.C.withOptPtr
             &&&> GdkRgbaRecord.C.withOptPtr
             &&&> FFI.Bool.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> FFI.Bool.C.fromVal && GdkPixbufPixbufClass.C.fromPtr true
          )
            loadSymbolic_
            (
              self
               & fg
               & successColor
               & warningColor
               & errorColor
               & FFI.Bool.null
               & []
            )
      in
        (retVal, wasSymbolic)
      end
    fun loadSymbolicForContext self context =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoRecord.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.Bool.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> FFI.Bool.C.fromVal && GdkPixbufPixbufClass.C.fromPtr true
          )
            loadSymbolicForContext_
            (
              self
               & context
               & FFI.Bool.null
               & []
            )
      in
        (retVal, wasSymbolic)
      end
    fun setRawCoordinates self rawCoordinates = (GtkIconInfoRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRawCoordinates_ (self & rawCoordinates)
  end
