structure GtkSymbolicColor :>
  GTK_SYMBOLIC_COLOR
    where type record_t = GtkSymbolicColorRecord.t
    where type 'a stylepropertiesclass_t = 'a GtkStylePropertiesClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_symbolic_color_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newAlpha_ = call (load_sym libgtk "gtk_symbolic_color_new_alpha") (GtkSymbolicColorRecord.PolyML.PTR &&> FFI.Double.PolyML.VAL --> GtkSymbolicColorRecord.PolyML.PTR)
      val newLiteral_ = call (load_sym libgtk "gtk_symbolic_color_new_literal") (GdkRgbaRecord.PolyML.PTR --> GtkSymbolicColorRecord.PolyML.PTR)
      val newMix_ =
        call (load_sym libgtk "gtk_symbolic_color_new_mix")
          (
            GtkSymbolicColorRecord.PolyML.PTR
             &&> GtkSymbolicColorRecord.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             --> GtkSymbolicColorRecord.PolyML.PTR
          )
      val newName_ = call (load_sym libgtk "gtk_symbolic_color_new_name") (FFI.String.PolyML.INPTR --> GtkSymbolicColorRecord.PolyML.PTR)
      val newShade_ = call (load_sym libgtk "gtk_symbolic_color_new_shade") (GtkSymbolicColorRecord.PolyML.PTR &&> FFI.Double.PolyML.VAL --> GtkSymbolicColorRecord.PolyML.PTR)
      val resolve_ =
        call (load_sym libgtk "gtk_symbolic_color_resolve")
          (
            GtkSymbolicColorRecord.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GdkRgbaRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val toString_ = call (load_sym libgtk "gtk_symbolic_color_to_string") (GtkSymbolicColorRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
    end
    type record_t = GtkSymbolicColorRecord.t
    type 'a stylepropertiesclass_t = 'a GtkStylePropertiesClass.t
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
    fun newName name = (FFI.String.C.withConstPtr ---> GtkSymbolicColorRecord.C.fromPtr true) newName_ name
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
    fun toString self = (GtkSymbolicColorRecord.C.withPtr ---> FFI.String.C.fromPtr true) toString_ self
  end
