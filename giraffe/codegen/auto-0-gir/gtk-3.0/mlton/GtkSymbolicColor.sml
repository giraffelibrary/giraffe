structure GtkSymbolicColor :>
  GTK_SYMBOLIC_COLOR
    where type t = GtkSymbolicColorRecord.t
    where type 'a style_properties_class = 'a GtkStylePropertiesClass.class =
  struct
    val getType_ = _import "gtk_symbolic_color_get_type" : unit -> GObjectType.FFI.val_;
    val newAlpha_ = fn x1 & x2 => (_import "gtk_symbolic_color_new_alpha" : GtkSymbolicColorRecord.FFI.notnull GtkSymbolicColorRecord.FFI.p * GDouble.FFI.val_ -> GtkSymbolicColorRecord.FFI.notnull GtkSymbolicColorRecord.FFI.p;) (x1, x2)
    val newLiteral_ = _import "gtk_symbolic_color_new_literal" : GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> GtkSymbolicColorRecord.FFI.notnull GtkSymbolicColorRecord.FFI.p;
    val newMix_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_symbolic_color_new_mix" :
              GtkSymbolicColorRecord.FFI.notnull GtkSymbolicColorRecord.FFI.p
               * GtkSymbolicColorRecord.FFI.notnull GtkSymbolicColorRecord.FFI.p
               * GDouble.FFI.val_
               -> GtkSymbolicColorRecord.FFI.notnull GtkSymbolicColorRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newName_ = _import "mlton_gtk_symbolic_color_new_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkSymbolicColorRecord.FFI.notnull GtkSymbolicColorRecord.FFI.p;
    val newShade_ = fn x1 & x2 => (_import "gtk_symbolic_color_new_shade" : GtkSymbolicColorRecord.FFI.notnull GtkSymbolicColorRecord.FFI.p * GDouble.FFI.val_ -> GtkSymbolicColorRecord.FFI.notnull GtkSymbolicColorRecord.FFI.p;) (x1, x2)
    val newWin32_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_symbolic_color_new_win32" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               -> GtkSymbolicColorRecord.FFI.notnull GtkSymbolicColorRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val resolve_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_symbolic_color_resolve" :
              GtkSymbolicColorRecord.FFI.notnull GtkSymbolicColorRecord.FFI.p
               * unit GtkStylePropertiesClass.FFI.p
               * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "gtk_symbolic_color_to_string" : GtkSymbolicColorRecord.FFI.notnull GtkSymbolicColorRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    type t = GtkSymbolicColorRecord.t
    type 'a style_properties_class = 'a GtkStylePropertiesClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newAlpha (color, factor) = (GtkSymbolicColorRecord.FFI.withPtr &&&> GDouble.FFI.withVal ---> GtkSymbolicColorRecord.FFI.fromPtr true) newAlpha_ (color & factor)
    fun newLiteral color = (GdkRgbaRecord.FFI.withPtr ---> GtkSymbolicColorRecord.FFI.fromPtr true) newLiteral_ color
    fun newMix
      (
        color1,
        color2,
        factor
      ) =
      (
        GtkSymbolicColorRecord.FFI.withPtr
         &&&> GtkSymbolicColorRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         ---> GtkSymbolicColorRecord.FFI.fromPtr true
      )
        newMix_
        (
          color1
           & color2
           & factor
        )
    fun newName name = (Utf8.FFI.withPtr ---> GtkSymbolicColorRecord.FFI.fromPtr true) newName_ name
    fun newShade (color, factor) = (GtkSymbolicColorRecord.FFI.withPtr &&&> GDouble.FFI.withVal ---> GtkSymbolicColorRecord.FFI.fromPtr true) newShade_ (color & factor)
    fun newWin32 (themeClass, id) = (Utf8.FFI.withPtr &&&> GInt.FFI.withVal ---> GtkSymbolicColorRecord.FFI.fromPtr true) newWin32_ (themeClass & id)
    fun resolve self props =
      let
        val resolvedColor & retVal =
          (
            GtkSymbolicColorRecord.FFI.withPtr
             &&&> GtkStylePropertiesClass.FFI.withOptPtr
             &&&> GdkRgbaRecord.FFI.withNewPtr
             ---> GdkRgbaRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            resolve_
            (
              self
               & props
               & ()
            )
      in
        if retVal then SOME resolvedColor else NONE
      end
    fun toString self = (GtkSymbolicColorRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
