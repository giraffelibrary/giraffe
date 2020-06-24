structure GtkCssProvider :>
  GTK_CSS_PROVIDER
    where type 'a class = 'a GtkCssProviderClass.class
    where type 'a style_provider_class = 'a GtkStyleProviderClass.class =
  struct
    val getType_ = _import "gtk_css_provider_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_css_provider_new" : unit -> GtkCssProviderClass.FFI.non_opt GtkCssProviderClass.FFI.p;
    val getDefault_ = _import "gtk_css_provider_get_default" : unit -> GtkCssProviderClass.FFI.non_opt GtkCssProviderClass.FFI.p;
    val getNamed_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_gtk_css_provider_get_named" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GtkCssProviderClass.FFI.non_opt GtkCssProviderClass.FFI.p;
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
              GtkCssProviderClass.FFI.non_opt GtkCssProviderClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GInt64.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GtkCssProviderClass.FFI.non_opt GtkCssProviderClass.FFI.p
               * GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GtkCssProviderClass.FFI.non_opt GtkCssProviderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val loadFromResource_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_css_provider_load_from_resource" :
              GtkCssProviderClass.FFI.non_opt GtkCssProviderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "gtk_css_provider_to_string" : GtkCssProviderClass.FFI.non_opt GtkCssProviderClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
        val length = LargeInt.fromInt (GUInt8CArrayN.length data)
        val () =
          (
            GtkCssProviderClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
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
