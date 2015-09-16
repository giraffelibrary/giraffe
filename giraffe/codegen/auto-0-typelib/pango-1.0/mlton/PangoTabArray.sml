structure PangoTabArray :>
  PANGO_TAB_ARRAY
    where type record_t = PangoTabArrayRecord.t
    where type tab_align_t = PangoTabAlign.t =
  struct
    val getType_ = _import "pango_tab_array_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "pango_tab_array_new" : FFI.Int32.C.val_ * FFI.Bool.C.val_ -> PangoTabArrayRecord.C.notnull PangoTabArrayRecord.C.p;) (x1, x2)
    val copy_ = _import "pango_tab_array_copy" : PangoTabArrayRecord.C.notnull PangoTabArrayRecord.C.p -> PangoTabArrayRecord.C.notnull PangoTabArrayRecord.C.p;
    val getPositionsInPixels_ = _import "pango_tab_array_get_positions_in_pixels" : PangoTabArrayRecord.C.notnull PangoTabArrayRecord.C.p -> FFI.Bool.C.val_;
    val getSize_ = _import "pango_tab_array_get_size" : PangoTabArrayRecord.C.notnull PangoTabArrayRecord.C.p -> FFI.Int32.C.val_;
    val getTab_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_tab_array_get_tab" :
              PangoTabArrayRecord.C.notnull PangoTabArrayRecord.C.p
               * FFI.Int32.C.val_
               * PangoTabAlign.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val resize_ = fn x1 & x2 => (_import "pango_tab_array_resize" : PangoTabArrayRecord.C.notnull PangoTabArrayRecord.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setTab_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_tab_array_set_tab" :
              PangoTabArrayRecord.C.notnull PangoTabArrayRecord.C.p
               * FFI.Int32.C.val_
               * PangoTabAlign.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type record_t = PangoTabArrayRecord.t
    type tab_align_t = PangoTabAlign.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new initialSize positionsInPixels = (FFI.Int32.C.withVal &&&> FFI.Bool.C.withVal ---> PangoTabArrayRecord.C.fromPtr true) new_ (initialSize & positionsInPixels)
    fun copy self = (PangoTabArrayRecord.C.withPtr ---> PangoTabArrayRecord.C.fromPtr true) copy_ self
    fun getPositionsInPixels self = (PangoTabArrayRecord.C.withPtr ---> FFI.Bool.C.fromVal) getPositionsInPixels_ self
    fun getSize self = (PangoTabArrayRecord.C.withPtr ---> FFI.Int32.C.fromVal) getSize_ self
    fun getTab self tabIndex =
      let
        val alignment
         & location
         & () =
          (
            PangoTabArrayRecord.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> PangoTabAlign.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> PangoTabAlign.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getTab_
            (
              self
               & tabIndex
               & PangoTabAlign.null
               & FFI.Int32.null
            )
      in
        (alignment, location)
      end
    fun resize self newSize = (PangoTabArrayRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> I) resize_ (self & newSize)
    fun setTab self tabIndex alignment location =
      (
        PangoTabArrayRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> PangoTabAlign.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setTab_
        (
          self
           & tabIndex
           & alignment
           & location
        )
  end
