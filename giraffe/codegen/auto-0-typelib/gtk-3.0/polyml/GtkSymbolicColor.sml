structure GtkSymbolicColor :>
  GTK_SYMBOLIC_COLOR
    where type record_t = GtkSymbolicColorRecord.t
    where type 'a style_properties_class_t = 'a GtkStylePropertiesClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_symbolic_color_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val newAlpha_ = call (load_sym libgtk "gtk_symbolic_color_new_alpha") (GtkSymbolicColorRecord.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> GtkSymbolicColorRecord.PolyML.cPtr)
      val newLiteral_ = call (load_sym libgtk "gtk_symbolic_color_new_literal") (GdkRgbaRecord.PolyML.cPtr --> GtkSymbolicColorRecord.PolyML.cPtr)
      val newMix_ =
        call (load_sym libgtk "gtk_symbolic_color_new_mix")
          (
            GtkSymbolicColorRecord.PolyML.cPtr
             &&> GtkSymbolicColorRecord.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             --> GtkSymbolicColorRecord.PolyML.cPtr
          )
      val newName_ = call (load_sym libgtk "gtk_symbolic_color_new_name") (Utf8.PolyML.cInPtr --> GtkSymbolicColorRecord.PolyML.cPtr)
      val newShade_ = call (load_sym libgtk "gtk_symbolic_color_new_shade") (GtkSymbolicColorRecord.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> GtkSymbolicColorRecord.PolyML.cPtr)
      val resolve_ =
        call (load_sym libgtk "gtk_symbolic_color_resolve")
          (
            GtkSymbolicColorRecord.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val toString_ = call (load_sym libgtk "gtk_symbolic_color_to_string") (GtkSymbolicColorRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type record_t = GtkSymbolicColorRecord.t
    type 'a style_properties_class_t = 'a GtkStylePropertiesClass.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newAlpha color factor = (GtkSymbolicColorRecord.C.withPtr &&&> FFI.Double.C.withVal ---> GtkSymbolicColorRecord.C.fromPtr true) newAlpha_ (color & factor)
    fun newLiteral color = (GdkRgbaRecord.C.withPtr ---> GtkSymbolicColorRecord.C.fromPtr true) newLiteral_ color
    fun newMix color1 color2 factor =
      (
        GtkSymbolicColorRecord.C.withPtr
         &&&> GtkSymbolicColorRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         ---> GtkSymbolicColorRecord.C.fromPtr true
      )
        newMix_
        (
          color1
           & color2
           & factor
        )
    fun newName name = (Utf8.C.withPtr ---> GtkSymbolicColorRecord.C.fromPtr true) newName_ name
    fun newShade color factor = (GtkSymbolicColorRecord.C.withPtr &&&> FFI.Double.C.withVal ---> GtkSymbolicColorRecord.C.fromPtr true) newShade_ (color & factor)
    fun resolve self props =
      let
        val resolvedColor & retVal =
          (
            GtkSymbolicColorRecord.C.withPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GdkRgbaRecord.C.withNewPtr
             ---> GdkRgbaRecord.C.fromPtr true && FFI.Bool.C.fromVal
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
    fun toString self = (GtkSymbolicColorRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
