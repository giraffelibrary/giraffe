structure PangoLayoutIter :>
  PANGO_LAYOUT_ITER
    where type t = PangoLayoutIterRecord.t
    where type 'a layout_class = 'a PangoLayoutClass.class
    where type layout_line_t = PangoLayoutLineRecord.t
    where type rectangle_t = PangoRectangleRecord.t
    where type glyph_item_t = PangoGlyphItemRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_layout_iter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val atLastLine_ = call (getSymbol "pango_layout_iter_at_last_line") (PangoLayoutIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val copy_ = call (getSymbol "pango_layout_iter_copy") (PangoLayoutIterRecord.PolyML.cPtr --> PangoLayoutIterRecord.PolyML.cPtr)
      val getBaseline_ = call (getSymbol "pango_layout_iter_get_baseline") (PangoLayoutIterRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getCharExtents_ = call (getSymbol "pango_layout_iter_get_char_extents") (PangoLayoutIterRecord.PolyML.cPtr &&> PangoRectangleRecord.PolyML.cPtr --> cVoid)
      val getClusterExtents_ =
        call (getSymbol "pango_layout_iter_get_cluster_extents")
          (
            PangoLayoutIterRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getIndex_ = call (getSymbol "pango_layout_iter_get_index") (PangoLayoutIterRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getLayout_ = call (getSymbol "pango_layout_iter_get_layout") (PangoLayoutIterRecord.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getLayoutExtents_ =
        call (getSymbol "pango_layout_iter_get_layout_extents")
          (
            PangoLayoutIterRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getLine_ = call (getSymbol "pango_layout_iter_get_line") (PangoLayoutIterRecord.PolyML.cPtr --> PangoLayoutLineRecord.PolyML.cPtr)
      val getLineExtents_ =
        call (getSymbol "pango_layout_iter_get_line_extents")
          (
            PangoLayoutIterRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getLineReadonly_ = call (getSymbol "pango_layout_iter_get_line_readonly") (PangoLayoutIterRecord.PolyML.cPtr --> PangoLayoutLineRecord.PolyML.cPtr)
      val getLineYrange_ =
        call (getSymbol "pango_layout_iter_get_line_yrange")
          (
            PangoLayoutIterRecord.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getRun_ = call (getSymbol "pango_layout_iter_get_run") (PangoLayoutIterRecord.PolyML.cPtr --> PangoGlyphItemRecord.PolyML.cPtr)
      val getRunExtents_ =
        call (getSymbol "pango_layout_iter_get_run_extents")
          (
            PangoLayoutIterRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getRunReadonly_ = call (getSymbol "pango_layout_iter_get_run_readonly") (PangoLayoutIterRecord.PolyML.cPtr --> PangoGlyphItemRecord.PolyML.cPtr)
      val nextChar_ = call (getSymbol "pango_layout_iter_next_char") (PangoLayoutIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val nextCluster_ = call (getSymbol "pango_layout_iter_next_cluster") (PangoLayoutIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val nextLine_ = call (getSymbol "pango_layout_iter_next_line") (PangoLayoutIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val nextRun_ = call (getSymbol "pango_layout_iter_next_run") (PangoLayoutIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = PangoLayoutIterRecord.t
    type 'a layout_class = 'a PangoLayoutClass.class
    type layout_line_t = PangoLayoutLineRecord.t
    type rectangle_t = PangoRectangleRecord.t
    type glyph_item_t = PangoGlyphItemRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun atLastLine self = (PangoLayoutIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) atLastLine_ self
    fun copy self = (PangoLayoutIterRecord.FFI.withPtr ---> PangoLayoutIterRecord.FFI.fromPtr true) copy_ self
    fun getBaseline self = (PangoLayoutIterRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getBaseline_ self
    fun getCharExtents self logicalRect = (PangoLayoutIterRecord.FFI.withPtr &&&> PangoRectangleRecord.FFI.withPtr ---> I) getCharExtents_ (self & logicalRect)
    fun getClusterExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutIterRecord.FFI.withPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true
                   && PangoRectangleRecord.FFI.fromPtr true
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
    fun getIndex self = (PangoLayoutIterRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getIndex_ self
    fun getLayout self = (PangoLayoutIterRecord.FFI.withPtr ---> PangoLayoutClass.FFI.fromPtr false) getLayout_ self
    fun getLayoutExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutIterRecord.FFI.withPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true
                   && PangoRectangleRecord.FFI.fromPtr true
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
    fun getLine self = (PangoLayoutIterRecord.FFI.withPtr ---> PangoLayoutLineRecord.FFI.fromPtr true) getLine_ self
    fun getLineExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutIterRecord.FFI.withPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true
                   && PangoRectangleRecord.FFI.fromPtr true
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
    fun getLineReadonly self = (PangoLayoutIterRecord.FFI.withPtr ---> PangoLayoutLineRecord.FFI.fromPtr true) getLineReadonly_ self
    fun getLineYrange self =
      let
        val y0
         & y1
         & () =
          (
            PangoLayoutIterRecord.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getLineYrange_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (y0, y1)
      end
    fun getRun self = (PangoLayoutIterRecord.FFI.withPtr ---> PangoGlyphItemRecord.FFI.fromPtr false) getRun_ self
    fun getRunExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutIterRecord.FFI.withPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true
                   && PangoRectangleRecord.FFI.fromPtr true
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
    fun getRunReadonly self = (PangoLayoutIterRecord.FFI.withPtr ---> PangoGlyphItemRecord.FFI.fromPtr false) getRunReadonly_ self
    fun nextChar self = (PangoLayoutIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) nextChar_ self
    fun nextCluster self = (PangoLayoutIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) nextCluster_ self
    fun nextLine self = (PangoLayoutIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) nextLine_ self
    fun nextRun self = (PangoLayoutIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) nextRun_ self
  end
