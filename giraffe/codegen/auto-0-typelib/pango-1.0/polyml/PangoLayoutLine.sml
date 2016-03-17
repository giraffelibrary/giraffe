structure PangoLayoutLine :>
  PANGO_LAYOUT_LINE
    where type t = PangoLayoutLineRecord.t
    where type rectangle_t = PangoRectangleRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_layout_line_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getExtents_ =
        call (load_sym libpango "pango_layout_line_get_extents")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getPixelExtents_ =
        call (load_sym libpango "pango_layout_line_get_pixel_extents")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val indexToX_ =
        call (load_sym libpango "pango_layout_line_index_to_x")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val xToIndex_ =
        call (load_sym libpango "pango_layout_line_x_to_index")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type t = PangoLayoutLineRecord.t
    type rectangle_t = PangoRectangleRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutLineRecord.C.withPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true
                   && PangoRectangleRecord.C.fromPtr true
                   && I
          )
            getExtents_
            (
              self
               & ()
               & ()
            )
      in
        (inkRect, logicalRect)
      end
    fun getPixelExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutLineRecord.C.withPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true
                   && PangoRectangleRecord.C.fromPtr true
                   && I
          )
            getPixelExtents_
            (
              self
               & ()
               & ()
            )
      in
        (inkRect, logicalRect)
      end
    fun indexToX self index trailing =
      let
        val xPos & () =
          (
            PangoLayoutLineRecord.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Bool.C.withVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal && I
          )
            indexToX_
            (
              self
               & index
               & trailing
               & FFI.Int32.null
            )
      in
        xPos
      end
    fun xToIndex self xPos =
      let
        val index
         & trailing
         & retVal =
          (
            PangoLayoutLineRecord.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            xToIndex_
            (
              self
               & xPos
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        if retVal then SOME (index, trailing) else NONE
      end
  end
