structure PangoLayoutLine :>
  PANGO_LAYOUT_LINE
    where type record_t = PangoLayoutLineRecord.t
    where type rectanglerecord_t = PangoRectangleRecord.t =
  struct
    val getType_ = _import "pango_layout_line_get_type" : unit -> GObjectType.C.val_;
    val getExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_line_get_extents" :
              PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
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
              PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val indexToX_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_layout_line_index_to_x" :
              PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p
               * FFI.Int.C.val_
               * FFI.Bool.C.val_
               * FFI.Int.C.ref_
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
              PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
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
             &&&> FFI.Int.C.withVal
             &&&> FFI.Bool.C.withVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal && I
          )
            indexToX_
            (
              self
               & index
               & trailing
               & FFI.Int.null
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
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            xToIndex_
            (
              self
               & xPos
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        if retVal then SOME (index, trailing) else NONE
      end
  end
