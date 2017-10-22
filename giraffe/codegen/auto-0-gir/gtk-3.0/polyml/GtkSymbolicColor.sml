structure GtkSymbolicColor :>
  GTK_SYMBOLIC_COLOR
    where type t = GtkSymbolicColorRecord.t
    where type 'a style_properties_class = 'a GtkStylePropertiesClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_symbolic_color_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newAlpha_ = call (getSymbol "gtk_symbolic_color_new_alpha") (GtkSymbolicColorRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> GtkSymbolicColorRecord.PolyML.cPtr)
      val newLiteral_ = call (getSymbol "gtk_symbolic_color_new_literal") (GdkRgbaRecord.PolyML.cPtr --> GtkSymbolicColorRecord.PolyML.cPtr)
      val newMix_ =
        call (getSymbol "gtk_symbolic_color_new_mix")
          (
            GtkSymbolicColorRecord.PolyML.cPtr
             &&> GtkSymbolicColorRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             --> GtkSymbolicColorRecord.PolyML.cPtr
          )
      val newName_ = call (getSymbol "gtk_symbolic_color_new_name") (Utf8.PolyML.cInPtr --> GtkSymbolicColorRecord.PolyML.cPtr)
      val newShade_ = call (getSymbol "gtk_symbolic_color_new_shade") (GtkSymbolicColorRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> GtkSymbolicColorRecord.PolyML.cPtr)
      val newWin32_ = call (getSymbol "gtk_symbolic_color_new_win32") (Utf8.PolyML.cInPtr &&> GInt.PolyML.cVal --> GtkSymbolicColorRecord.PolyML.cPtr)
      val resolve_ =
        call (getSymbol "gtk_symbolic_color_resolve")
          (
            GtkSymbolicColorRecord.PolyML.cPtr
             &&> GtkStylePropertiesClass.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val toString_ = call (getSymbol "gtk_symbolic_color_to_string") (GtkSymbolicColorRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
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
