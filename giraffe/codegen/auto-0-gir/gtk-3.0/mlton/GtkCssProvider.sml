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
    val getType_ = _import "gtk_css_provider_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_css_provider_new" : unit -> GtkCssProviderClass.FFI.notnull GtkCssProviderClass.FFI.p;
    val getDefault_ = _import "gtk_css_provider_get_default" : unit -> GtkCssProviderClass.FFI.notnull GtkCssProviderClass.FFI.p;
    val getNamed_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_gtk_css_provider_get_named" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GtkCssProviderClass.FFI.notnull GtkCssProviderClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val loadFromData_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_css_provider_load_from_data" :
              GtkCssProviderClass.FFI.notnull GtkCssProviderClass.FFI.p
               * GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GSSize.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val loadFromFile_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_css_provider_load_from_file" :
              GtkCssProviderClass.FFI.notnull GtkCssProviderClass.FFI.p
               * GioFileClass.FFI.notnull GioFileClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val loadFromPath_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_css_provider_load_from_path" :
              GtkCssProviderClass.FFI.notnull GtkCssProviderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val toString_ = _import "gtk_css_provider_to_string" : GtkCssProviderClass.FFI.notnull GtkCssProviderClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    type 'a class = 'a GtkCssProviderClass.class
    type 'a style_provider_class = 'a GtkStyleProviderClass.class
    type t = base class
    fun asStyleProvider self = (GObjectObjectClass.FFI.withPtr ---> GtkStyleProviderClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCssProviderClass.FFI.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkCssProviderClass.FFI.fromPtr false) getDefault_ ()
    fun getNamed name variant = (Utf8.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> GtkCssProviderClass.FFI.fromPtr false) getNamed_ (name & variant)
    fun loadFromData self data =
      let
        val length = LargeInt.fromInt (GUInt8CVectorN.length data)
        val retVal =
          (
            GtkCssProviderClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal
          )
            loadFromData_
            (
              self
               & data
               & length
               & []
            )
      in
        retVal
      end
    fun loadFromFile self file =
      (
        GtkCssProviderClass.FFI.withPtr
         &&&> GioFileClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
         ---> GBool.FFI.fromVal
      )
        loadFromPath_
        (
          self
           & path
           & []
        )
    fun toString self = (GtkCssProviderClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
