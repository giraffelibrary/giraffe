structure PangoLayoutIter :>
  PANGO_LAYOUT_ITER
    where type record_t = PangoLayoutIterRecord.t
    where type 'a layoutclass_t = 'a PangoLayoutClass.t
    where type layoutlinerecord_t = PangoLayoutLineRecord.t
    where type rectanglerecord_t = PangoRectangleRecord.t
    where type glyphitemrecord_t = PangoGlyphItemRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_layout_iter_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val atLastLine_ = call (load_sym libpango "pango_layout_iter_at_last_line") (PangoLayoutIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val copy_ = call (load_sym libpango "pango_layout_iter_copy") (PangoLayoutIterRecord.PolyML.PTR --> PangoLayoutIterRecord.PolyML.PTR)
      val getBaseline_ = call (load_sym libpango "pango_layout_iter_get_baseline") (PangoLayoutIterRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getCharExtents_ = call (load_sym libpango "pango_layout_iter_get_char_extents") (PangoLayoutIterRecord.PolyML.PTR &&> PangoRectangleRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getClusterExtents_ =
        call (load_sym libpango "pango_layout_iter_get_cluster_extents")
          (
            PangoLayoutIterRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getIndex_ = call (load_sym libpango "pango_layout_iter_get_index") (PangoLayoutIterRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getLayout_ = call (load_sym libpango "pango_layout_iter_get_layout") (PangoLayoutIterRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getLayoutExtents_ =
        call (load_sym libpango "pango_layout_iter_get_layout_extents")
          (
            PangoLayoutIterRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getLine_ = call (load_sym libpango "pango_layout_iter_get_line") (PangoLayoutIterRecord.PolyML.PTR --> PangoLayoutLineRecord.PolyML.PTR)
      val getLineExtents_ =
        call (load_sym libpango "pango_layout_iter_get_line_extents")
          (
            PangoLayoutIterRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getLineReadonly_ = call (load_sym libpango "pango_layout_iter_get_line_readonly") (PangoLayoutIterRecord.PolyML.PTR --> PangoLayoutLineRecord.PolyML.PTR)
      val getLineYrange_ =
        call (load_sym libpango "pango_layout_iter_get_line_yrange")
          (
            PangoLayoutIterRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getRun_ = call (load_sym libpango "pango_layout_iter_get_run") (PangoLayoutIterRecord.PolyML.PTR --> PangoGlyphItemRecord.PolyML.PTR)
      val getRunExtents_ =
        call (load_sym libpango "pango_layout_iter_get_run_extents")
          (
            PangoLayoutIterRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getRunReadonly_ = call (load_sym libpango "pango_layout_iter_get_run_readonly") (PangoLayoutIterRecord.PolyML.PTR --> PangoGlyphItemRecord.PolyML.PTR)
      val nextChar_ = call (load_sym libpango "pango_layout_iter_next_char") (PangoLayoutIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val nextCluster_ = call (load_sym libpango "pango_layout_iter_next_cluster") (PangoLayoutIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val nextLine_ = call (load_sym libpango "pango_layout_iter_next_line") (PangoLayoutIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val nextRun_ = call (load_sym libpango "pango_layout_iter_next_run") (PangoLayoutIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type record_t = PangoLayoutIterRecord.t
    type 'a layoutclass_t = 'a PangoLayoutClass.t
    type layoutlinerecord_t = PangoLayoutLineRecord.t
    type rectanglerecord_t = PangoRectangleRecord.t
    type glyphitemrecord_t = PangoGlyphItemRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun atLastLine self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) atLastLine_ self
    fun copy self = (PangoLayoutIterRecord.C.withPtr ---> PangoLayoutIterRecord.C.fromPtr true) copy_ self
    fun getBaseline self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Int32.C.fromVal) getBaseline_ self
    fun getCharExtents self logicalRect = (PangoLayoutIterRecord.C.withPtr &&&> PangoRectangleRecord.C.withPtr ---> I) getCharExtents_ (self & logicalRect)
    fun getClusterExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutIterRecord.C.withPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true
                   && PangoRectangleRecord.C.fromPtr true
                   && I
          )
            getClusterExtents_
            (
              self
               & ()
               & ()
            )
      in
        (inkRect, logicalRect)
      end
    fun getIndex self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Int32.C.fromVal) getIndex_ self
    fun getLayout self = (PangoLayoutIterRecord.C.withPtr ---> PangoLayoutClass.C.fromPtr false) getLayout_ self
    fun getLayoutExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutIterRecord.C.withPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true
                   && PangoRectangleRecord.C.fromPtr true
                   && I
          )
            getLayoutExtents_
            (
              self
               & ()
               & ()
            )
      in
        (inkRect, logicalRect)
      end
    fun getLine self = (PangoLayoutIterRecord.C.withPtr ---> PangoLayoutLineRecord.C.fromPtr true) getLine_ self
    fun getLineExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutIterRecord.C.withPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true
                   && PangoRectangleRecord.C.fromPtr true
                   && I
          )
            getLineExtents_
            (
              self
               & ()
               & ()
            )
      in
        (inkRect, logicalRect)
      end
    fun getLineReadonly self = (PangoLayoutIterRecord.C.withPtr ---> PangoLayoutLineRecord.C.fromPtr true) getLineReadonly_ self
    fun getLineYrange self =
      let
        val y0
         & y1
         & () =
          (
            PangoLayoutIterRecord.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getLineYrange_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (y0, y1)
      end
    fun getRun self = (PangoLayoutIterRecord.C.withPtr ---> PangoGlyphItemRecord.C.fromPtr false) getRun_ self
    fun getRunExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutIterRecord.C.withPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true
                   && PangoRectangleRecord.C.fromPtr true
                   && I
          )
            getRunExtents_
            (
              self
               & ()
               & ()
            )
      in
        (inkRect, logicalRect)
      end
    fun getRunReadonly self = (PangoLayoutIterRecord.C.withPtr ---> PangoGlyphItemRecord.C.fromPtr false) getRunReadonly_ self
    fun nextChar self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) nextChar_ self
    fun nextCluster self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) nextCluster_ self
    fun nextLine self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) nextLine_ self
    fun nextRun self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) nextRun_ self
  end
