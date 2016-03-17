structure PangoMatrix :>
  PANGO_MATRIX
    where type t = PangoMatrixRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_matrix_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val concat_ = call (load_sym libpango "pango_matrix_concat") (PangoMatrixRecord.PolyML.cPtr &&> PangoMatrixRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val copy_ = call (load_sym libpango "pango_matrix_copy") (PangoMatrixRecord.PolyML.cPtr --> PangoMatrixRecord.PolyML.cPtr)
      val getFontScaleFactor_ = call (load_sym libpango "pango_matrix_get_font_scale_factor") (PangoMatrixRecord.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val rotate_ = call (load_sym libpango "pango_matrix_rotate") (PangoMatrixRecord.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val scale_ =
        call (load_sym libpango "pango_matrix_scale")
          (
            PangoMatrixRecord.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val transformDistance_ =
        call (load_sym libpango "pango_matrix_transform_distance")
          (
            PangoMatrixRecord.PolyML.cPtr
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val transformPoint_ =
        call (load_sym libpango "pango_matrix_transform_point")
          (
            PangoMatrixRecord.PolyML.cPtr
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val translate_ =
        call (load_sym libpango "pango_matrix_translate")
          (
            PangoMatrixRecord.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
    type t = PangoMatrixRecord.t
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
