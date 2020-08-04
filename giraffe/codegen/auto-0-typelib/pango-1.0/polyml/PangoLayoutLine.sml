structure PangoLayoutLine :>
  PANGO_LAYOUT_LINE
    where type t = PangoLayoutLineRecord.t
    where type rectangle_t = PangoRectangleRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_layout_line_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getExtents_ =
        call (getSymbol "pango_layout_line_get_extents")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getPixelExtents_ =
        call (getSymbol "pango_layout_line_get_pixel_extents")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getXRanges_ =
        call (getSymbol "pango_layout_line_get_x_ranges")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32CArrayN.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val indexToX_ =
        call (getSymbol "pango_layout_line_index_to_x")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val xToIndex_ =
        call (getSymbol "pango_layout_line_x_to_index")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
    end
    type t = PangoLayoutLineRecord.t
    type rectangle_t = PangoRectangleRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutLineRecord.FFI.withPtr false
             &&&> PangoRectangleRecord.FFI.withNewPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true
                   && PangoRectangleRecord.FFI.fromPtr true
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
            PangoLayoutLineRecord.FFI.withPtr false
             &&&> PangoRectangleRecord.FFI.withNewPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true
                   && PangoRectangleRecord.FFI.fromPtr true
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
    fun getXRanges self (startIndex, endIndex) =
      let
        val ranges
         & nRanges
         & () =
          (
            PangoLayoutLineRecord.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32CArrayN.FFI.withRefOptPtr 0
             &&&> GInt32.FFI.withRefVal
             ---> GInt32CArrayN.FFI.fromPtr ~1
                   && GInt32.FFI.fromVal
                   && I
          )
            getXRanges_
            (
              self
               & startIndex
               & endIndex
               & NONE
               & GInt32.null
            )
      in
        ranges (LargeInt.toInt nRanges)
      end
    fun indexToX self (index, trailing) =
      let
        val xPos & () =
          (
            PangoLayoutLineRecord.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal && I
          )
            indexToX_
            (
              self
               & index
               & trailing
               & GInt32.null
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
            PangoLayoutLineRecord.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            xToIndex_
            (
              self
               & xPos
               & GInt32.null
               & GInt32.null
            )
      in
        if retVal then SOME (index, trailing) else NONE
      end
  end
