structure PangoLayoutLine :>
  PANGO_LAYOUT_LINE
    where type record_t = PangoLayoutLineRecord.t
    where type rectangle_record_t = PangoRectangleRecord.t =
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
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Int.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val xToIndex_ =
        call (load_sym libpango "pango_layout_line_x_to_index")
          (
            PangoLayoutLineRecord.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.REF
             &&> FFI.Int.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
    end
    type record_t = PangoLayoutLineRecord.t
    type rectangle_record_t = PangoRectangleRecord.t
    type t = record_t
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
