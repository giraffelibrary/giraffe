structure GtkSymbolicColor :>
  GTK_SYMBOLIC_COLOR
    where type record_t = GtkSymbolicColorRecord.t
    where type 'a stylepropertiesclass_t = 'a GtkStylePropertiesClass.t =
  struct
    val getType_ = _import "gtk_symbolic_color_get_type" : unit -> GObjectType.C.val_;
    val newAlpha_ = fn x1 & x2 => (_import "gtk_symbolic_color_new_alpha" : GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p * FFI.Double.val_ -> GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p;) (x1, x2)
    val newLiteral_ = _import "gtk_symbolic_color_new_literal" : GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p;
    val newMix_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_symbolic_color_new_mix" :
              GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p
               * GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p
               * FFI.Double.val_
               -> GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newName_ = _import "mlton_gtk_symbolic_color_new_name" : cstring * unit CPointer.t -> GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p;
    val newShade_ = fn x1 & x2 => (_import "gtk_symbolic_color_new_shade" : GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p * FFI.Double.val_ -> GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p;) (x1, x2)
    val resolve_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_symbolic_color_resolve" :
              GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p
               * unit GObjectObjectClass.C.p
               * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "gtk_symbolic_color_to_string" : GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p -> FFI.String.notnull FFI.String.out_p;
    type record_t = GtkSymbolicColorRecord.t
    type 'a stylepropertiesclass_t = 'a GtkStylePropertiesClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newAlpha color factor = (GtkSymbolicColorRecord.C.withPtr &&&> FFI.Double.withVal ---> GtkSymbolicColorRecord.C.fromPtr true) newAlpha_ (color & factor)
    fun newLiteral color = (GdkRgbaRecord.C.withPtr ---> GtkSymbolicColorRecord.C.fromPtr true) newLiteral_ color
    fun newMix color1 color2 factor =
      (
        GtkSymbolicColorRecord.C.withPtr
         &&&> GtkSymbolicColorRecord.C.withPtr
         &&&> FFI.Double.withVal
         ---> GtkSymbolicColorRecord.C.fromPtr true
      )
        newMix_
        (
          color1
           & color2
           & factor
        )
    fun newName name = (FFI.String.withConstPtr ---> GtkSymbolicColorRecord.C.fromPtr true) newName_ name
    fun newShade color factor = (GtkSymbolicColorRecord.C.withPtr &&&> FFI.Double.withVal ---> GtkSymbolicColorRecord.C.fromPtr true) newShade_ (color & factor)
    fun resolve self props =
      let
        val resolvedColor & retVal =
          (
            GtkSymbolicColorRecord.C.withPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GdkRgbaRecord.C.withNewPtr
             ---> GdkRgbaRecord.C.fromPtr true && FFI.Bool.fromVal
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
    fun toString self = (GtkSymbolicColorRecord.C.withPtr ---> FFI.String.fromPtr true) toString_ self
  end
