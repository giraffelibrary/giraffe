structure PangoLayoutLine :>
  PANGO_LAYOUT_LINE
    where type t = PangoLayoutLineRecord.t
    where type rectangle_t = PangoRectangleRecord.t =
  struct
    structure GInt32CVectorNType =
      CValueCVectorNType(
        structure CElemType = GInt32Type
        structure ElemSequence = CValueVectorSequence(GInt32Type)
      )
    structure GInt32CVectorN = CVectorN(GInt32CVectorNType)
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
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32CVectorN.MLton.r1
               * (unit, GInt32CVectorN.FFI.notnull) GInt32CVectorN.MLton.r2
               * GInt32.FFI.ref_
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
               * GInt32.FFI.val_
               * GBool.FFI.val_
               * GInt32.FFI.ref_
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
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32CVectorN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> GInt32CVectorN.FFI.fromPtr 1
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
    fun indexToX self index trailing =
      let
        val xPos & () =
          (
            PangoLayoutLineRecord.FFI.withPtr
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
            PangoLayoutLineRecord.FFI.withPtr
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
