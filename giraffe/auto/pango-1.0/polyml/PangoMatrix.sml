structure PangoMatrix :>
  PANGO_MATRIX
    where type record_t = PangoMatrixRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_matrix_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val concat_ = call (load_sym libpango "pango_matrix_concat") (PangoMatrixRecord.PolyML.PTR &&> PangoMatrixRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val copy_ = call (load_sym libpango "pango_matrix_copy") (PangoMatrixRecord.PolyML.PTR --> PangoMatrixRecord.PolyML.PTR)
      val getFontScaleFactor_ = call (load_sym libpango "pango_matrix_get_font_scale_factor") (PangoMatrixRecord.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val rotate_ = call (load_sym libpango "pango_matrix_rotate") (PangoMatrixRecord.PolyML.PTR &&> FFI.Double.PolyML.VAL --> FFI.PolyML.VOID)
      val scale_ =
        call (load_sym libpango "pango_matrix_scale")
          (
            PangoMatrixRecord.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val transformDistance_ =
        call (load_sym libpango "pango_matrix_transform_distance")
          (
            PangoMatrixRecord.PolyML.PTR
             &&> FFI.Double.PolyML.REF
             &&> FFI.Double.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val transformPoint_ =
        call (load_sym libpango "pango_matrix_transform_point")
          (
            PangoMatrixRecord.PolyML.PTR
             &&> FFI.Double.PolyML.REF
             &&> FFI.Double.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val translate_ =
        call (load_sym libpango "pango_matrix_translate")
          (
            PangoMatrixRecord.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
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
