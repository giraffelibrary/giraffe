structure PangoLayoutIter :>
  PANGO_LAYOUT_ITER
    where type t = PangoLayoutIterRecord.t
    where type 'a layout_class = 'a PangoLayoutClass.class
    where type layout_line_t = PangoLayoutLineRecord.t
    where type rectangle_t = PangoRectangleRecord.t
    where type layout_run_t = PangoLayoutRunRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_layout_iter_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val atLastLine_ = call (load_sym libpango "pango_layout_iter_at_last_line") (PangoLayoutIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val copy_ = call (load_sym libpango "pango_layout_iter_copy") (PangoLayoutIterRecord.PolyML.cPtr --> PangoLayoutIterRecord.PolyML.cPtr)
      val getBaseline_ = call (load_sym libpango "pango_layout_iter_get_baseline") (PangoLayoutIterRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getCharExtents_ = call (load_sym libpango "pango_layout_iter_get_char_extents") (PangoLayoutIterRecord.PolyML.cPtr &&> PangoRectangleRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getClusterExtents_ =
        call (load_sym libpango "pango_layout_iter_get_cluster_extents")
          (
            PangoLayoutIterRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getIndex_ = call (load_sym libpango "pango_layout_iter_get_index") (PangoLayoutIterRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getLayout_ = call (load_sym libpango "pango_layout_iter_get_layout") (PangoLayoutIterRecord.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getLayoutExtents_ =
        call (load_sym libpango "pango_layout_iter_get_layout_extents")
          (
            PangoLayoutIterRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getLine_ = call (load_sym libpango "pango_layout_iter_get_line") (PangoLayoutIterRecord.PolyML.cPtr --> PangoLayoutLineRecord.PolyML.cPtr)
      val getLineExtents_ =
        call (load_sym libpango "pango_layout_iter_get_line_extents")
          (
            PangoLayoutIterRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getLineReadonly_ = call (load_sym libpango "pango_layout_iter_get_line_readonly") (PangoLayoutIterRecord.PolyML.cPtr --> PangoLayoutLineRecord.PolyML.cPtr)
      val getLineYrange_ =
        call (load_sym libpango "pango_layout_iter_get_line_yrange")
          (
            PangoLayoutIterRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getRun_ = call (load_sym libpango "pango_layout_iter_get_run") (PangoLayoutIterRecord.PolyML.cPtr --> PangoLayoutRunRecord.PolyML.cPtr)
      val getRunExtents_ =
        call (load_sym libpango "pango_layout_iter_get_run_extents")
          (
            PangoLayoutIterRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getRunReadonly_ = call (load_sym libpango "pango_layout_iter_get_run_readonly") (PangoLayoutIterRecord.PolyML.cPtr --> PangoLayoutRunRecord.PolyML.cPtr)
      val nextChar_ = call (load_sym libpango "pango_layout_iter_next_char") (PangoLayoutIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val nextCluster_ = call (load_sym libpango "pango_layout_iter_next_cluster") (PangoLayoutIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val nextLine_ = call (load_sym libpango "pango_layout_iter_next_line") (PangoLayoutIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val nextRun_ = call (load_sym libpango "pango_layout_iter_next_run") (PangoLayoutIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type t = PangoLayoutIterRecord.t
    type 'a layout_class = 'a PangoLayoutClass.class
    type layout_line_t = PangoLayoutLineRecord.t
    type rectangle_t = PangoRectangleRecord.t
    type layout_run_t = PangoLayoutRunRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun atLastLine self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) atLastLine_ self
    fun copy self = (PangoLayoutIterRecord.C.withPtr ---> PangoLayoutIterRecord.C.fromPtr true) copy_ self
    fun getBaseline self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Int.C.fromVal) getBaseline_ self
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
    fun getIndex self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Int.C.fromVal) getIndex_ self
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
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getLineYrange_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (y0, y1)
      end
    fun getRun self = (PangoLayoutIterRecord.C.withPtr ---> PangoLayoutRunRecord.C.fromPtr false) getRun_ self
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
    fun getRunReadonly self = (PangoLayoutIterRecord.C.withPtr ---> PangoLayoutRunRecord.C.fromPtr false) getRunReadonly_ self
    fun nextChar self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) nextChar_ self
    fun nextCluster self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) nextCluster_ self
    fun nextLine self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) nextLine_ self
    fun nextRun self = (PangoLayoutIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) nextRun_ self
  end
