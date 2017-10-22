structure GtkCssProvider :>
  GTK_CSS_PROVIDER
    where type 'a class = 'a GtkCssProviderClass.class
    where type 'a style_provider_class = 'a GtkStyleProviderClass.class =
  struct
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
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
             &&> GUInt8CVectorN.PolyML.cInPtr
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
    fun asStyleProvider self = (GObjectObjectClass.FFI.withPtr ---> GtkStyleProviderClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCssProviderClass.FFI.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkCssProviderClass.FFI.fromPtr false) getDefault_ ()
    fun getNamed (name, variant) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> GtkCssProviderClass.FFI.fromPtr false) getNamed_ (name & variant)
    fun loadFromData self data =
      let
        val length = LargeInt.fromInt (GUInt8CVectorN.length data)
        val () =
          (
            GtkCssProviderClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
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
        GtkCssProviderClass.FFI.withPtr
         &&&> GioFileClass.FFI.withPtr
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
        GtkCssProviderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadFromPath_
        (
          self
           & path
           & []
        )
    fun loadFromResource self resourcePath = (GtkCssProviderClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) loadFromResource_ (self & resourcePath)
    fun toString self = (GtkCssProviderClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
