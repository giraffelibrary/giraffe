structure GtkCssProvider :>
  GTK_CSS_PROVIDER
    where type 'a class_t = 'a GtkCssProviderClass.t
    where type 'a styleproviderclass_t = 'a GtkStyleProviderClass.t =
  struct
    val getType_ = _import "gtk_css_provider_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_css_provider_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDefault_ = _import "gtk_css_provider_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getNamed_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_gtk_css_provider_get_named" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val toString_ = _import "gtk_css_provider_to_string" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    type 'a class_t = 'a GtkCssProviderClass.t
    type 'a styleproviderclass_t = 'a GtkStyleProviderClass.t
    type t = base class_t
    fun asStyleProvider self = (GObjectObjectClass.C.withPtr ---> GtkStyleProviderClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCssProviderClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkCssProviderClass.C.fromPtr false) getDefault_ ()
    fun getNamed name variant = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstOptPtr ---> GtkCssProviderClass.C.fromPtr false) getNamed_ (name & variant)
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
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        loadFromPath_
        (
          self
           & path
           & []
        )
    fun toString self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) toString_ self
  end
