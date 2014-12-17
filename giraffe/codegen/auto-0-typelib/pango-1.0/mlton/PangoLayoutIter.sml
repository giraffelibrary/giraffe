structure PangoLayoutIter :>
  PANGO_LAYOUT_ITER
    where type record_t = PangoLayoutIterRecord.t
    where type 'a layoutclass_t = 'a PangoLayoutClass.t
    where type layoutlinerecord_t = PangoLayoutLineRecord.t
    where type rectanglerecord_t = PangoRectangleRecord.t
    where type glyphitemrecord_t = PangoGlyphItemRecord.t =
  struct
    val getType_ = _import "pango_layout_iter_get_type" : unit -> GObjectType.C.val_;
    val atLastLine_ = _import "pango_layout_iter_at_last_line" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> FFI.Bool.C.val_;
    val copy_ = _import "pango_layout_iter_copy" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p;
    val getBaseline_ = _import "pango_layout_iter_get_baseline" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> FFI.Int32.C.val_;
    val getCharExtents_ = fn x1 & x2 => (_import "pango_layout_iter_get_char_extents" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p -> unit;) (x1, x2)
    val getClusterExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_iter_get_cluster_extents" :
              PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getIndex_ = _import "pango_layout_iter_get_index" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> FFI.Int32.C.val_;
    val getLayout_ = _import "pango_layout_iter_get_layout" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getLayoutExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_iter_get_layout_extents" :
              PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getLine_ = _import "pango_layout_iter_get_line" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p;
    val getLineExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_iter_get_line_extents" :
              PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getLineReadonly_ = _import "pango_layout_iter_get_line_readonly" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p;
    val getLineYrange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_iter_get_line_yrange" :
              PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getRun_ = _import "pango_layout_iter_get_run" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> PangoGlyphItemRecord.C.notnull PangoGlyphItemRecord.C.p;
    val getRunExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_iter_get_run_extents" :
              PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getRunReadonly_ = _import "pango_layout_iter_get_run_readonly" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> PangoGlyphItemRecord.C.notnull PangoGlyphItemRecord.C.p;
    val nextChar_ = _import "pango_layout_iter_next_char" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> FFI.Bool.C.val_;
    val nextCluster_ = _import "pango_layout_iter_next_cluster" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> FFI.Bool.C.val_;
    val nextLine_ = _import "pango_layout_iter_next_line" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> FFI.Bool.C.val_;
    val nextRun_ = _import "pango_layout_iter_next_run" : PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p -> FFI.Bool.C.val_;
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
