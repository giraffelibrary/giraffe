structure GtkSourceStyleScheme :>
  GTK_SOURCE_STYLE_SCHEME
    where type 'a class = 'a GtkSourceStyleSchemeClass.class
    where type 'a style_class = 'a GtkSourceStyleClass.class =
  struct
    val getType_ = _import "gtk_source_style_scheme_get_type" : unit -> GObjectType.FFI.val_;
    val getAuthors_ = _import "gtk_source_style_scheme_get_authors" : GtkSourceStyleSchemeClass.FFI.non_opt GtkSourceStyleSchemeClass.FFI.p -> Utf8CPtrArray.FFI.opt Utf8CPtrArray.FFI.out_p;
    val getDescription_ = _import "gtk_source_style_scheme_get_description" : GtkSourceStyleSchemeClass.FFI.non_opt GtkSourceStyleSchemeClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getFilename_ = _import "gtk_source_style_scheme_get_filename" : GtkSourceStyleSchemeClass.FFI.non_opt GtkSourceStyleSchemeClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getId_ = _import "gtk_source_style_scheme_get_id" : GtkSourceStyleSchemeClass.FFI.non_opt GtkSourceStyleSchemeClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getName_ = _import "gtk_source_style_scheme_get_name" : GtkSourceStyleSchemeClass.FFI.non_opt GtkSourceStyleSchemeClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getStyle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_style_scheme_get_style" :
              GtkSourceStyleSchemeClass.FFI.non_opt GtkSourceStyleSchemeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkSourceStyleClass.FFI.opt GtkSourceStyleClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkSourceStyleSchemeClass.class
    type 'a style_class = 'a GtkSourceStyleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getAuthors self = (GtkSourceStyleSchemeClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromOptPtr 0) getAuthors_ self before GtkSourceStyleSchemeClass.FFI.touchPtr self
    fun getDescription self = (GtkSourceStyleSchemeClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getDescription_ self before GtkSourceStyleSchemeClass.FFI.touchPtr self
    fun getFilename self = (GtkSourceStyleSchemeClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getFilename_ self before GtkSourceStyleSchemeClass.FFI.touchPtr self
    fun getId self = (GtkSourceStyleSchemeClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getId_ self before GtkSourceStyleSchemeClass.FFI.touchPtr self
    fun getName self = (GtkSourceStyleSchemeClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GtkSourceStyleSchemeClass.FFI.touchPtr self
    fun getStyle self styleId = (GtkSourceStyleSchemeClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkSourceStyleClass.FFI.fromOptPtr false) getStyle_ (self & styleId) before GtkSourceStyleSchemeClass.FFI.touchPtr self before Utf8.FFI.touchPtr styleId
    local
      open ValueAccessor
    in
      val descriptionProp =
        {
          name = "description",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val filenameProp =
        {
          name = "filename",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val idProp =
        {
          name = "id",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
    end
  end
