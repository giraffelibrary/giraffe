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
      val copy_ = call (getSymbol "pango_layout_iter_copy") (PangoLayoutIterRecord.PolyML.cPtr --> PangoLayoutIterRecord.PolyML.cOptPtr)
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
      val getRun_ = call (getSymbol "pango_layout_iter_get_run") (PangoLayoutIterRecord.PolyML.cPtr --> PangoGlyphItemRecord.PolyML.cOptPtr)
      val getRunExtents_ =
        call (getSymbol "pango_layout_iter_get_run_extents")
          (
            PangoLayoutIterRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getRunReadonly_ = call (getSymbol "pango_layout_iter_get_run_readonly") (PangoLayoutIterRecord.PolyML.cPtr --> PangoGlyphItemRecord.PolyML.cOptPtr)
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
    fun atLastLine self = (PangoLayoutIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) atLastLine_ self
    fun copy self = (PangoLayoutIterRecord.FFI.withPtr false ---> PangoLayoutIterRecord.FFI.fromOptPtr true) copy_ self
    fun getBaseline self = (PangoLayoutIterRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) getBaseline_ self
    fun getCharExtents self =
      let
        val logicalRect & () = (PangoLayoutIterRecord.FFI.withPtr false &&&> PangoRectangleRecord.FFI.withNewPtr ---> PangoRectangleRecord.FFI.fromPtr true && I) getCharExtents_ (self & ())
      in
        logicalRect
      end
    fun getClusterExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutIterRecord.FFI.withPtr false
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
    fun getIndex self = (PangoLayoutIterRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) getIndex_ self
    fun getLayout self = (PangoLayoutIterRecord.FFI.withPtr false ---> PangoLayoutClass.FFI.fromPtr false) getLayout_ self before PangoLayoutIterRecord.FFI.touchPtr self
    fun getLayoutExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutIterRecord.FFI.withPtr false
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
    fun getLine self = (PangoLayoutIterRecord.FFI.withPtr false ---> PangoLayoutLineRecord.FFI.fromPtr true) getLine_ self
    fun getLineExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutIterRecord.FFI.withPtr false
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
    fun getLineReadonly self = (PangoLayoutIterRecord.FFI.withPtr false ---> PangoLayoutLineRecord.FFI.fromPtr false) getLineReadonly_ self before PangoLayoutIterRecord.FFI.touchPtr self
    fun getLineYrange self =
      let
        val y0
         & y1
         & () =
          (
            PangoLayoutIterRecord.FFI.withPtr false
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
    fun getRun self = (PangoLayoutIterRecord.FFI.withPtr false ---> PangoGlyphItemRecord.FFI.fromOptPtr false) getRun_ self before PangoLayoutIterRecord.FFI.touchPtr self
    fun getRunExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutIterRecord.FFI.withPtr false
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
    fun getRunReadonly self = (PangoLayoutIterRecord.FFI.withPtr false ---> PangoGlyphItemRecord.FFI.fromOptPtr false) getRunReadonly_ self before PangoLayoutIterRecord.FFI.touchPtr self
    fun nextChar self = (PangoLayoutIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) nextChar_ self
    fun nextCluster self = (PangoLayoutIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) nextCluster_ self
    fun nextLine self = (PangoLayoutIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) nextLine_ self
    fun nextRun self = (PangoLayoutIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) nextRun_ self
  end
