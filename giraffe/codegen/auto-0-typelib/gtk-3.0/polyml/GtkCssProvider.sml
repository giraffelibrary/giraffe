structure GtkCssProvider :>
  GTK_CSS_PROVIDER
    where type 'a class = 'a GtkCssProviderClass.class
    where type 'a style_provider_class = 'a GtkStyleProviderClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_css_provider_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_css_provider_new") (cVoid --> GtkCssProviderClass.PolyML.cPtr)
      val getDefault_ = call (getSymbol "gtk_css_provider_get_default") (cVoid --> GtkCssProviderClass.PolyML.cPtr)
      val getNamed_ = call (getSymbol "gtk_css_provider_get_named") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInOptPtr --> GtkCssProviderClass.PolyML.cPtr)
      val loadFromData_ =
        call (getSymbol "gtk_css_provider_load_from_data")
          (
            GtkCssProviderClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val loadFromFile_ =
        call (getSymbol "gtk_css_provider_load_from_file")
          (
            GtkCssProviderClass.PolyML.cPtr
             &&> GioFileClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val loadFromPath_ =
        call (getSymbol "gtk_css_provider_load_from_path")
          (
            GtkCssProviderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val loadFromResource_ = call (getSymbol "gtk_css_provider_load_from_resource") (GtkCssProviderClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val toString_ = call (getSymbol "gtk_css_provider_to_string") (GtkCssProviderClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GtkCssProviderClass.class
    type 'a style_provider_class = 'a GtkStyleProviderClass.class
    type t = base class
    fun asStyleProvider self = (GObjectObjectClass.FFI.withPtr false ---> GtkStyleProviderClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCssProviderClass.FFI.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkCssProviderClass.FFI.fromPtr false) getDefault_ ()
    fun getNamed (name, variant) = (Utf8.FFI.withPtr 0 &&&> Utf8.FFI.withOptPtr 0 ---> GtkCssProviderClass.FFI.fromPtr false) getNamed_ (name & variant) before Utf8.FFI.touchPtr name before Utf8.FFI.touchOptPtr variant
    fun loadFromData self data =
      let
        val length = LargeInt.fromInt (GUInt8CArrayN.length data)
        val () =
          (
            GtkCssProviderClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GInt64.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> ignore
          )
            loadFromData_
            (
              self
               & data
               & length
               & []
            )
      in
        ()
      end
    fun loadFromFile self file =
      (
        GtkCssProviderClass.FFI.withPtr false
         &&&> GioFileClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadFromFile_
        (
          self
           & file
           & []
        )
    fun loadFromPath self path =
      (
        GtkCssProviderClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadFromPath_
        (
          self
           & path
           & []
        )
    fun loadFromResource self resourcePath = (GtkCssProviderClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) loadFromResource_ (self & resourcePath)
    fun toString self = (GtkCssProviderClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) toString_ self
  end
