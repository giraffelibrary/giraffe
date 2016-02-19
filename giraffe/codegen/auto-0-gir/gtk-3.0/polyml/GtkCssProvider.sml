structure GtkCssProvider :>
  GTK_CSS_PROVIDER
    where type 'a class_t = 'a GtkCssProviderClass.t
    where type 'a style_provider_class_t = 'a GtkStyleProviderClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_css_provider_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_css_provider_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getDefault_ = call (load_sym libgtk "gtk_css_provider_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getNamed_ = call (load_sym libgtk "gtk_css_provider_get_named") (Utf8.PolyML.INPTR &&> Utf8.PolyML.INOPTPTR --> GObjectObjectClass.PolyML.PTR)
      val loadFromFile_ =
        call (load_sym libgtk "gtk_css_provider_load_from_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val loadFromPath_ =
        call (load_sym libgtk "gtk_css_provider_load_from_path")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val toString_ = call (load_sym libgtk "gtk_css_provider_to_string") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
    end
    type 'a class_t = 'a GtkCssProviderClass.t
    type 'a style_provider_class_t = 'a GtkStyleProviderClass.t
    type t = base class_t
    fun asStyleProvider self = (GObjectObjectClass.C.withPtr ---> GtkStyleProviderClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCssProviderClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkCssProviderClass.C.fromPtr false) getDefault_ ()
    fun getNamed name variant = (Utf8.C.withPtr &&&> Utf8.C.withOptPtr ---> GtkCssProviderClass.C.fromPtr false) getNamed_ (name & variant)
    fun loadFromFile self file =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        loadFromPath_
        (
          self
           & path
           & []
        )
    fun toString self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
