structure PangoMatrix :>
  PANGO_MATRIX
    where type t = PangoMatrixRecord.t =
  struct
    val getType_ = _import "pango_matrix_get_type" : unit -> GObjectType.FFI.val_;
    val concat_ = fn x1 & x2 => (_import "pango_matrix_concat" : PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p * PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p -> unit;) (x1, x2)
    val copy_ = _import "pango_matrix_copy" : PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p -> unit PangoMatrixRecord.FFI.p;
    val getFontScaleFactor_ = _import "pango_matrix_get_font_scale_factor" : PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p -> GDouble.FFI.val_;
    val getFontScaleFactors_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_matrix_get_font_scale_factors" :
              PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rotate_ = fn x1 & x2 => (_import "pango_matrix_rotate" : PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val scale_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_matrix_scale" :
              PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p
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
              PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val transformPoint_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_matrix_transform_point" :
              PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val translate_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_matrix_translate" :
              PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun concat self newMatrix = (PangoMatrixRecord.FFI.withPtr &&&> PangoMatrixRecord.FFI.withPtr ---> I) concat_ (self & newMatrix)
    fun copy self = (PangoMatrixRecord.FFI.withPtr ---> PangoMatrixRecord.FFI.fromOptPtr true) copy_ self
    fun getFontScaleFactor self = (PangoMatrixRecord.FFI.withPtr ---> GDouble.FFI.fromVal) getFontScaleFactor_ self
    fun getFontScaleFactors self =
      let
        val xscale
         & yscale
         & () =
          (
            PangoMatrixRecord.FFI.withPtr
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
    fun rotate self degrees = (PangoMatrixRecord.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) rotate_ (self & degrees)
    fun scale self (scaleX, scaleY) =
      (
        PangoMatrixRecord.FFI.withPtr
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
            PangoMatrixRecord.FFI.withPtr
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
    fun transformPoint self (x, y) =
      let
        val x
         & y
         & () =
          (
            PangoMatrixRecord.FFI.withPtr
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
    fun translate self (tx, ty) =
      (
        PangoMatrixRecord.FFI.withPtr
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
