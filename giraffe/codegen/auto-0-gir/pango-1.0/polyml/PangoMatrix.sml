structure PangoMatrix :>
  PANGO_MATRIX
    where type t = PangoMatrixRecord.t
    where type rectangle_t = PangoRectangleRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_matrix_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val concat_ = call (getSymbol "pango_matrix_concat") (PangoMatrixRecord.PolyML.cPtr &&> PangoMatrixRecord.PolyML.cPtr --> cVoid)
      val copy_ = call (getSymbol "pango_matrix_copy") (PangoMatrixRecord.PolyML.cPtr --> PangoMatrixRecord.PolyML.cOptPtr)
      val getFontScaleFactor_ = call (getSymbol "pango_matrix_get_font_scale_factor") (PangoMatrixRecord.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getFontScaleFactors_ =
        call (getSymbol "pango_matrix_get_font_scale_factors")
          (
            PangoMatrixRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val rotate_ = call (getSymbol "pango_matrix_rotate") (PangoMatrixRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val scale_ =
        call (getSymbol "pango_matrix_scale")
          (
            PangoMatrixRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val transformDistance_ =
        call (getSymbol "pango_matrix_transform_distance")
          (
            PangoMatrixRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val transformPixelRectangle_ = call (getSymbol "pango_matrix_transform_pixel_rectangle") (PangoMatrixRecord.PolyML.cPtr &&> PangoRectangleRecord.PolyML.cPtr --> cVoid)
      val transformPoint_ =
        call (getSymbol "pango_matrix_transform_point")
          (
            PangoMatrixRecord.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val transformRectangle_ = call (getSymbol "pango_matrix_transform_rectangle") (PangoMatrixRecord.PolyML.cPtr &&> PangoRectangleRecord.PolyML.cPtr --> cVoid)
      val translate_ =
        call (getSymbol "pango_matrix_translate")
          (
            PangoMatrixRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
    end
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
        val rect & () = (PangoMatrixRecord.FFI.withPtr false &&&> PangoRectangleRecord.FFI.withDupPtr ---> PangoRectangleRecord.FFI.fromPtr true && I) transformPixelRectangle_ (self & rect)
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
        val rect & () = (PangoMatrixRecord.FFI.withPtr false &&&> PangoRectangleRecord.FFI.withDupPtr ---> PangoRectangleRecord.FFI.fromPtr true && I) transformRectangle_ (self & rect)
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
