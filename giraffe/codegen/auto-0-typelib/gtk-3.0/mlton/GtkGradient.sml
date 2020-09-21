structure GtkGradient :>
  GTK_GRADIENT
    where type t = GtkGradientRecord.t
    where type symbolic_color_t = GtkSymbolicColorRecord.t
    where type 'a style_properties_class = 'a GtkStylePropertiesClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    val getType_ = _import "gtk_gradient_get_type" : unit -> GObjectType.FFI.val_;
    val newLinear_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_gradient_new_linear" :
              GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GtkGradientRecord.FFI.non_opt GtkGradientRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newRadial_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_gradient_new_radial" :
              GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GtkGradientRecord.FFI.non_opt GtkGradientRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val addColorStop_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_gradient_add_color_stop" :
              GtkGradientRecord.FFI.non_opt GtkGradientRecord.FFI.p
               * GDouble.FFI.val_
               * GtkSymbolicColorRecord.FFI.non_opt GtkSymbolicColorRecord.FFI.p
               -> unit;
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
            _import "gtk_gradient_resolve" :
              GtkGradientRecord.FFI.non_opt GtkGradientRecord.FFI.p
               * GtkStylePropertiesClass.FFI.non_opt GtkStylePropertiesClass.FFI.p
               * (CairoPatternRecord.FFI.opt, CairoPatternRecord.FFI.non_opt) CairoPatternRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val resolveForContext_ = fn x1 & x2 => (_import "gtk_gradient_resolve_for_context" : GtkGradientRecord.FFI.non_opt GtkGradientRecord.FFI.p * GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> CairoPatternRecord.FFI.non_opt CairoPatternRecord.FFI.p;) (x1, x2)
    val toString_ = _import "gtk_gradient_to_string" : GtkGradientRecord.FFI.non_opt GtkGradientRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
