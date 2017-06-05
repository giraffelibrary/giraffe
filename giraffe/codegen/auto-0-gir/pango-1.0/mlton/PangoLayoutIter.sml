structure PangoLayoutIter :>
  PANGO_LAYOUT_ITER
    where type t = PangoLayoutIterRecord.t
    where type 'a layout_class = 'a PangoLayoutClass.class
    where type layout_line_t = PangoLayoutLineRecord.t
    where type rectangle_t = PangoRectangleRecord.t
    where type layout_run_t = PangoLayoutRunRecord.t =
  struct
    val getType_ = _import "pango_layout_iter_get_type" : unit -> GObjectType.FFI.val_;
    val atLastLine_ = _import "pango_layout_iter_at_last_line" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> GBool.FFI.val_;
    val copy_ = _import "pango_layout_iter_copy" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p;
    val getBaseline_ = _import "pango_layout_iter_get_baseline" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> GInt.FFI.val_;
    val getCharExtents_ = fn x1 & x2 => (_import "pango_layout_iter_get_char_extents" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p -> unit;) (x1, x2)
    val getClusterExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_iter_get_cluster_extents" :
              PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getIndex_ = _import "pango_layout_iter_get_index" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> GInt.FFI.val_;
    val getLayout_ = _import "pango_layout_iter_get_layout" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p;
    val getLayoutExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_iter_get_layout_extents" :
              PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getLine_ = _import "pango_layout_iter_get_line" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> PangoLayoutLineRecord.FFI.notnull PangoLayoutLineRecord.FFI.p;
    val getLineExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_iter_get_line_extents" :
              PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getLineReadonly_ = _import "pango_layout_iter_get_line_readonly" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> PangoLayoutLineRecord.FFI.notnull PangoLayoutLineRecord.FFI.p;
    val getLineYrange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_iter_get_line_yrange" :
              PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getRun_ = _import "pango_layout_iter_get_run" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> PangoLayoutRunRecord.FFI.notnull PangoLayoutRunRecord.FFI.p;
    val getRunExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_iter_get_run_extents" :
              PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getRunReadonly_ = _import "pango_layout_iter_get_run_readonly" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> PangoLayoutRunRecord.FFI.notnull PangoLayoutRunRecord.FFI.p;
    val nextChar_ = _import "pango_layout_iter_next_char" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> GBool.FFI.val_;
    val nextCluster_ = _import "pango_layout_iter_next_cluster" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> GBool.FFI.val_;
    val nextLine_ = _import "pango_layout_iter_next_line" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> GBool.FFI.val_;
    val nextRun_ = _import "pango_layout_iter_next_run" : PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p -> GBool.FFI.val_;
    type t = PangoLayoutIterRecord.t
    type 'a layout_class = 'a PangoLayoutClass.class
    type layout_line_t = PangoLayoutLineRecord.t
    type rectangle_t = PangoRectangleRecord.t
    type layout_run_t = PangoLayoutRunRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun atLastLine self = (PangoLayoutIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) atLastLine_ self
    fun copy self = (PangoLayoutIterRecord.FFI.withPtr ---> PangoLayoutIterRecord.FFI.fromPtr true) copy_ self
    fun getBaseline self = (PangoLayoutIterRecord.FFI.withPtr ---> GInt.FFI.fromVal) getBaseline_ self
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
    fun getIndex self = (PangoLayoutIterRecord.FFI.withPtr ---> GInt.FFI.fromVal) getIndex_ self
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
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getLineYrange_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (y0, y1)
      end
    fun getRun self = (PangoLayoutIterRecord.FFI.withPtr ---> PangoLayoutRunRecord.FFI.fromPtr false) getRun_ self
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
    fun getRunReadonly self = (PangoLayoutIterRecord.FFI.withPtr ---> PangoLayoutRunRecord.FFI.fromPtr false) getRunReadonly_ self
    fun nextChar self = (PangoLayoutIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) nextChar_ self
    fun nextCluster self = (PangoLayoutIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) nextCluster_ self
    fun nextLine self = (PangoLayoutIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) nextLine_ self
    fun nextRun self = (PangoLayoutIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) nextRun_ self
  end
