structure PangoMatrix :>
  PANGO_MATRIX
    where type record_t = PangoMatrixRecord.t =
  struct
    val getType_ = _import "pango_matrix_get_type" : unit -> GObjectType.C.val_;
    val concat_ = fn x1 & x2 => (_import "pango_matrix_concat" : PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p * PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p -> unit;) (x1, x2)
    val copy_ = _import "pango_matrix_copy" : PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p -> PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p;
    val getFontScaleFactor_ = _import "pango_matrix_get_font_scale_factor" : PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p -> FFI.Double.C.val_;
    val rotate_ = fn x1 & x2 => (_import "pango_matrix_rotate" : PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val scale_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_matrix_scale" :
              PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
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
              PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
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
              PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
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
              PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type record_t = PangoMatrixRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun concat self newMatrix = (PangoMatrixRecord.C.withPtr &&&> PangoMatrixRecord.C.withPtr ---> I) concat_ (self & newMatrix)
    fun copy self = (PangoMatrixRecord.C.withPtr ---> PangoMatrixRecord.C.fromPtr true) copy_ self
    fun getFontScaleFactor self = (PangoMatrixRecord.C.withPtr ---> FFI.Double.C.fromVal) getFontScaleFactor_ self
    fun rotate self degrees = (PangoMatrixRecord.C.withPtr &&&> FFI.Double.C.withVal ---> I) rotate_ (self & degrees)
    fun scale self scaleX scaleY =
      (
        PangoMatrixRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        scale_
        (
          self
           & scaleX
           & scaleY
        )
    fun transformDistance self dx dy =
      let
        val dx
         & dy
         & () =
          (
            PangoMatrixRecord.C.withPtr
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             ---> FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
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
    fun transformPoint self x y =
      let
        val x
         & y
         & () =
          (
            PangoMatrixRecord.C.withPtr
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             ---> FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
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
    fun translate self tx ty =
      (
        PangoMatrixRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        translate_
        (
          self
           & tx
           & ty
        )
  end
