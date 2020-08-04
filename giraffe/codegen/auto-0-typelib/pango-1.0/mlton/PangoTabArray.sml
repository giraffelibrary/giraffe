structure PangoTabArray :>
  PANGO_TAB_ARRAY
    where type t = PangoTabArrayRecord.t
    where type tab_align_t = PangoTabAlign.t =
  struct
    val getType_ = _import "pango_tab_array_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "pango_tab_array_new" : GInt32.FFI.val_ * GBool.FFI.val_ -> PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p;) (x1, x2)
    val copy_ = _import "pango_tab_array_copy" : PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p -> PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p;
    val getPositionsInPixels_ = _import "pango_tab_array_get_positions_in_pixels" : PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p -> GBool.FFI.val_;
    val getSize_ = _import "pango_tab_array_get_size" : PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p -> GInt32.FFI.val_;
    val getTab_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_tab_array_get_tab" :
              PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p
               * GInt32.FFI.val_
               * PangoTabAlign.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val resize_ = fn x1 & x2 => (_import "pango_tab_array_resize" : PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setTab_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_tab_array_set_tab" :
              PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p
               * GInt32.FFI.val_
               * PangoTabAlign.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type t = PangoTabArrayRecord.t
    type tab_align_t = PangoTabAlign.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (initialSize, positionsInPixels) = (GInt32.FFI.withVal &&&> GBool.FFI.withVal ---> PangoTabArrayRecord.FFI.fromPtr true) new_ (initialSize & positionsInPixels)
    fun copy self = (PangoTabArrayRecord.FFI.withPtr false ---> PangoTabArrayRecord.FFI.fromPtr true) copy_ self
    fun getPositionsInPixels self = (PangoTabArrayRecord.FFI.withPtr false ---> GBool.FFI.fromVal) getPositionsInPixels_ self
    fun getSize self = (PangoTabArrayRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) getSize_ self
    fun getTab self tabIndex =
      let
        val alignment
         & location
         & () =
          (
            PangoTabArrayRecord.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> PangoTabAlign.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> PangoTabAlign.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getTab_
            (
              self
               & tabIndex
               & PangoTabAlign.null
               & GInt32.null
            )
      in
        (alignment, location)
      end
    fun resize self newSize = (PangoTabArrayRecord.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) resize_ (self & newSize)
    fun setTab
      self
      (
        tabIndex,
        alignment,
        location
      ) =
      (
        PangoTabArrayRecord.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> PangoTabAlign.FFI.withVal
         &&&> GInt32.FFI.withVal
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
