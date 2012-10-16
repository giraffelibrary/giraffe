structure PangoLayoutLine :>
  PANGO_LAYOUT_LINE
    where type record_t = PangoLayoutLineRecord.t
    where type rectanglerecord_t = PangoRectangleRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_layout_line_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getExtents_ =
        call (load_sym libpango "pango_layout_line_get_extents")
          (
            PangoLayoutLineRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getPixelExtents_ =
        call (load_sym libpango "pango_layout_line_get_pixel_extents")
          (
            PangoLayoutLineRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val indexToX_ =
        call (load_sym libpango "pango_layout_line_index_to_x")
          (
            PangoLayoutLineRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Bool.VAL
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.VOID
          )
      val xToIndex_ =
        call (load_sym libpango "pango_layout_line_x_to_index")
          (
            PangoLayoutLineRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.REF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.Bool.VAL
          )
    end
    type record_t = PangoLayoutLineRecord.t
    type rectanglerecord_t = PangoRectangleRecord.t
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
             &&&> FFI.Int32.withVal
             &&&> FFI.Bool.withVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal && I
          )
            indexToX_
            (
              self
               & index
               & trailing
               & 0
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
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && FFI.Bool.fromVal
          )
            xToIndex_
            (
              self
               & xPos
               & 0
               & 0
            )
      in
        if retVal then SOME (index, trailing) else NONE
      end
  end
