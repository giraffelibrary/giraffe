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
    val getType_ = _import "pango_layout_line_get_type" : unit -> GObjectType.FFI.val_;
    val getExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_line_get_extents" :
              PangoLayoutLineRecord.FFI.notnull PangoLayoutLineRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPixelExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_line_get_pixel_extents" :
              PangoLayoutLineRecord.FFI.notnull PangoLayoutLineRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getXRanges_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_pango_layout_line_get_x_ranges" :
              PangoLayoutLineRecord.FFI.notnull PangoLayoutLineRecord.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GIntCVectorN.MLton.r1
               * (unit, GIntCVectorN.FFI.notnull) GIntCVectorN.MLton.r2
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val indexToX_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_layout_line_index_to_x" :
              PangoLayoutLineRecord.FFI.notnull PangoLayoutLineRecord.FFI.p
               * GInt.FFI.val_
               * GBool.FFI.val_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val xToIndex_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_layout_line_x_to_index" :
              PangoLayoutLineRecord.FFI.notnull PangoLayoutLineRecord.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
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
