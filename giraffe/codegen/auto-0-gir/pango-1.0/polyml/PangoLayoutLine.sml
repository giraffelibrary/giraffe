structure PangoLayoutLine :>
  PANGO_LAYOUT_LINE
    where type t = PangoLayoutLineRecord.t
    where type rectangle_t = PangoRectangleRecord.t =
  struct
    structure GIntCVectorNType =
      CValueCVectorNType(
        structure CElemType = GIntType
        structure ElemSequence = CValueVectorSequence(GIntType)
      )
    structure GIntCVectorN = CVectorN(GIntCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_layout_line_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getExtents_ =
        call (getSymbol "pango_layout_line_get_extents")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getPixelExtents_ =
        call (getSymbol "pango_layout_line_get_pixel_extents")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getXRanges_ =
        call (getSymbol "pango_layout_line_get_x_ranges")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GIntCVectorN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val indexToX_ =
        call (getSymbol "pango_layout_line_index_to_x")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val xToIndex_ =
        call (getSymbol "pango_layout_line_x_to_index")
          (
            PangoLayoutLineRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
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
            PangoLayoutLineRecord.FFI.withPtr
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
            PangoLayoutLineRecord.FFI.withPtr
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
    fun getXRanges self startIndex endIndex =
      let
        val ranges
         & nRanges
         & () =
          (
            PangoLayoutLineRecord.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GIntCVectorN.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             ---> GIntCVectorN.FFI.fromPtr 1
                   && GInt.FFI.fromVal
                   && I
          )
            getXRanges_
            (
              self
               & startIndex
               & endIndex
               & NONE
               & GInt.null
            )
      in
        ranges (LargeInt.toInt nRanges)
      end
    fun indexToX self index trailing =
      let
        val xPos & () =
          (
            PangoLayoutLineRecord.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal && I
          )
            indexToX_
            (
              self
               & index
               & trailing
               & GInt.null
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
            PangoLayoutLineRecord.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            xToIndex_
            (
              self
               & xPos
               & GInt.null
               & GInt.null
            )
      in
        if retVal then SOME (index, trailing) else NONE
      end
  end
