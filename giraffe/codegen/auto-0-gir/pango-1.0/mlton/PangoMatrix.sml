structure PangoMatrix :>
  PANGO_MATRIX
    where type t = PangoMatrixRecord.t
    where type rectangle_t = PangoRectangleRecord.t =
  struct
    val getType_ = _import "pango_matrix_get_type" : unit -> GObjectType.FFI.val_;
    val concat_ = fn x1 & x2 => (_import "pango_matrix_concat" : PangoMatrixRecord.FFI.non_opt PangoMatrixRecord.FFI.p * PangoMatrixRecord.FFI.non_opt PangoMatrixRecord.FFI.p -> unit;) (x1, x2)
    val copy_ = _import "pango_matrix_copy" : PangoMatrixRecord.FFI.non_opt PangoMatrixRecord.FFI.p -> PangoMatrixRecord.FFI.opt PangoMatrixRecord.FFI.p;
    val getFontScaleFactor_ = _import "pango_matrix_get_font_scale_factor" : PangoMatrixRecord.FFI.non_opt PangoMatrixRecord.FFI.p -> GDouble.FFI.val_;
    val getFontScaleFactors_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_matrix_get_font_scale_factors" :
              PangoMatrixRecord.FFI.non_opt PangoMatrixRecord.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rotate_ = fn x1 & x2 => (_import "pango_matrix_rotate" : PangoMatrixRecord.FFI.non_opt PangoMatrixRecord.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val scale_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_matrix_scale" :
              PangoMatrixRecord.FFI.non_opt PangoMatrixRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val transformDistance_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_matrix_transform_distance" :
              PangoMatrixRecord.FFI.non_opt PangoMatrixRecord.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val transformPixelRectangle_ = fn x1 & x2 => (_import "pango_matrix_transform_pixel_rectangle" : PangoMatrixRecord.FFI.non_opt PangoMatrixRecord.FFI.p * PangoRectangleRecord.FFI.non_opt PangoRectangleRecord.FFI.p -> unit;) (x1, x2)
    val transformPoint_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_matrix_transform_point" :
              PangoMatrixRecord.FFI.non_opt PangoMatrixRecord.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val transformRectangle_ = fn x1 & x2 => (_import "pango_matrix_transform_rectangle" : PangoMatrixRecord.FFI.non_opt PangoMatrixRecord.FFI.p * PangoRectangleRecord.FFI.non_opt PangoRectangleRecord.FFI.p -> unit;) (x1, x2)
    val translate_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_matrix_translate" :
              PangoMatrixRecord.FFI.non_opt PangoMatrixRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type t = PangoMatrixRecord.t
    type rectangle_t = PangoRectangleRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun concat self newMatrix = (PangoMatrixRecord.FFI.withPtr false &&&> PangoMatrixRecord.FFI.withPtr false ---> I) concat_ (self & newMatrix)
    fun copy self = (PangoMatrixRecord.FFI.withPtr false ---> PangoMatrixRecord.FFI.fromOptPtr true) copy_ self
    fun getFontScaleFactor self = (PangoMatrixRecord.FFI.withPtr false ---> GDouble.FFI.fromVal) getFontScaleFactor_ self
    fun getFontScaleFactors self =
      let
        val xscale
         & yscale
         & () =
          (
            PangoMatrixRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            getFontScaleFactors_
            (
              self
               & GDouble.null
               & GDouble.null
            )
      in
        (xscale, yscale)
      end
    fun rotate self degrees = (PangoMatrixRecord.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) rotate_ (self & degrees)
    fun scale self (scaleX, scaleY) =
      (
        PangoMatrixRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        scale_
        (
          self
           & scaleX
           & scaleY
        )
    fun transformDistance self (dx, dy) =
      let
        val dx
         & dy
         & () =
          (
            PangoMatrixRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            transformDistance_
            (
              self
               & dx
               & dy
            )
      in
        (dx, dy)
      end
    fun transformPixelRectangle self rect =
      let
        val rect & () = (PangoMatrixRecord.FFI.withPtr false &&&> PangoRectangleRecord.FFI.withDupPtr true ---> PangoRectangleRecord.FFI.fromPtr true && I) transformPixelRectangle_ (self & rect)
      in
        rect
      end
    fun transformPoint self (x, y) =
      let
        val x
         & y
         & () =
          (
            PangoMatrixRecord.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            transformPoint_
            (
              self
               & x
               & y
            )
      in
        (x, y)
      end
    fun transformRectangle self rect =
      let
        val rect & () = (PangoMatrixRecord.FFI.withPtr false &&&> PangoRectangleRecord.FFI.withDupPtr true ---> PangoRectangleRecord.FFI.fromPtr true && I) transformRectangle_ (self & rect)
      in
        rect
      end
    fun translate self (tx, ty) =
      (
        PangoMatrixRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        translate_
        (
          self
           & tx
           & ty
        )
  end
