structure GtkCssProvider :>
  GTK_CSS_PROVIDER
    where type 'a class = 'a GtkCssProviderClass.class
    where type 'a style_provider_class = 'a GtkStyleProviderClass.class =
  struct
    val getType_ = _import "gtk_css_provider_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_css_provider_new" : unit -> GtkCssProviderClass.C.notnull GtkCssProviderClass.C.p;
    val getDefault_ = _import "gtk_css_provider_get_default" : unit -> GtkCssProviderClass.C.notnull GtkCssProviderClass.C.p;
    val getNamed_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_gtk_css_provider_get_named" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GtkCssProviderClass.C.notnull GtkCssProviderClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val loadFromFile_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_css_provider_load_from_file" :
              GtkCssProviderClass.C.notnull GtkCssProviderClass.C.p
               * GioFileClass.C.notnull GioFileClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GtkCssProviderClass.C.notnull GtkCssProviderClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val toString_ = _import "gtk_css_provider_to_string" : GtkCssProviderClass.C.notnull GtkCssProviderClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
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
