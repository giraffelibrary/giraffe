structure GtkGradient :>
  GTK_GRADIENT
    where type t = GtkGradientRecord.t
    where type symbolic_color_t = GtkSymbolicColorRecord.t
    where type 'a style_properties_class = 'a GtkStylePropertiesClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_gradient_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newLinear_ =
        call (getSymbol "gtk_gradient_new_linear")
          (
            GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GtkGradientRecord.PolyML.cPtr
          )
      val newRadial_ =
        call (getSymbol "gtk_gradient_new_radial")
          (
            GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GtkGradientRecord.PolyML.cPtr
          )
      val addColorStop_ =
        call (getSymbol "gtk_gradient_add_color_stop")
          (
            GtkGradientRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GtkSymbolicColorRecord.PolyML.cPtr
             --> cVoid
          )
      val resolve_ =
        call (getSymbol "gtk_gradient_resolve")
          (
            GtkGradientRecord.PolyML.cPtr
             &&> GtkStylePropertiesClass.PolyML.cPtr
             &&> CairoPatternRecord.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val resolveForContext_ = call (getSymbol "gtk_gradient_resolve_for_context") (GtkGradientRecord.PolyML.cPtr &&> GtkStyleContextClass.PolyML.cPtr --> CairoPatternRecord.PolyML.cPtr)
      val toString_ = call (getSymbol "gtk_gradient_to_string") (GtkGradientRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type t = GtkGradientRecord.t
    type symbolic_color_t = GtkSymbolicColorRecord.t
    type 'a style_properties_class = 'a GtkStylePropertiesClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newLinear
      (
        x0,
        y0,
        x1,
        y1
      ) =
      (
        GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GtkGradientRecord.FFI.fromPtr true
      )
        newLinear_
        (
          x0
           & y0
           & x1
           & y1
        )
    fun newRadial
      (
        x0,
        y0,
        radius0,
        x1,
        y1,
        radius1
      ) =
      (
        GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GtkGradientRecord.FFI.fromPtr true
      )
        newRadial_
        (
          x0
           & y0
           & radius0
           & x1
           & y1
           & radius1
        )
    fun addColorStop self (offset, color) =
      (
        GtkGradientRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkSymbolicColorRecord.FFI.withPtr false
         ---> I
      )
        addColorStop_
        (
          self
           & offset
           & color
        )
    fun resolve self props =
      let
        val resolvedGradient & retVal =
          (
            GtkGradientRecord.FFI.withPtr false
             &&&> GtkStylePropertiesClass.FFI.withPtr false
             &&&> CairoPatternRecord.FFI.withRefOptPtr true
             ---> CairoPatternRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            resolve_
            (
              self
               & props
               & NONE
            )
      in
        if retVal then SOME resolvedGradient else NONE
      end
    fun resolveForContext self context = (GtkGradientRecord.FFI.withPtr false &&&> GtkStyleContextClass.FFI.withPtr false ---> CairoPatternRecord.FFI.fromPtr true) resolveForContext_ (self & context)
    fun toString self = (GtkGradientRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) toString_ self
  end
