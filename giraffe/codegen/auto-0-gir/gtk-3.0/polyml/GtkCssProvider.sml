structure GtkCssProvider :>
  GTK_CSS_PROVIDER
    where type 'a class = 'a GtkCssProviderClass.class
    where type 'a style_provider_class = 'a GtkStyleProviderClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_css_provider_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_css_provider_new") (FFI.PolyML.cVoid --> GtkCssProviderClass.PolyML.cPtr)
      val getDefault_ = call (load_sym libgtk "gtk_css_provider_get_default") (FFI.PolyML.cVoid --> GtkCssProviderClass.PolyML.cPtr)
      val getNamed_ = call (load_sym libgtk "gtk_css_provider_get_named") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInOptPtr --> GtkCssProviderClass.PolyML.cPtr)
      val loadFromFile_ =
        call (load_sym libgtk "gtk_css_provider_load_from_file")
          (
            GtkCssProviderClass.PolyML.cPtr
             &&> GioFileClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val loadFromPath_ =
        call (load_sym libgtk "gtk_css_provider_load_from_path")
          (
            GtkCssProviderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val toString_ = call (load_sym libgtk "gtk_css_provider_to_string") (GtkCssProviderClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GtkCssProviderClass.class
    type 'a style_provider_class = 'a GtkStyleProviderClass.class
    type t = base class
    fun asStyleProvider self = (GObjectObjectClass.C.withPtr ---> GtkStyleProviderClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCssProviderClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkCssProviderClass.C.fromPtr false) getDefault_ ()
    fun getNamed name variant = (Utf8.C.withPtr &&&> Utf8.C.withOptPtr ---> GtkCssProviderClass.C.fromPtr false) getNamed_ (name & variant)
    fun loadFromFile self file =
      (
        GtkCssProviderClass.C.withPtr
         &&&> GioFileClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        loadFromFile_
        (
          self
           & file
           & []
        )
    fun loadFromPath self path =
      (
        GtkCssProviderClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        loadFromPath_
        (
          self
           & path
           & []
        )
    fun toString self = (GtkCssProviderClass.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
