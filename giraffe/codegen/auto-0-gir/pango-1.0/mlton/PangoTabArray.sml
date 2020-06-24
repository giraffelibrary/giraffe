structure PangoTabArray :>
  PANGO_TAB_ARRAY
    where type t = PangoTabArrayRecord.t
    where type tab_align_t = PangoTabAlign.t =
  struct
    val getType_ = _import "pango_tab_array_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "pango_tab_array_new" : GInt.FFI.val_ * GBool.FFI.val_ -> PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p;) (x1, x2)
    val copy_ = _import "pango_tab_array_copy" : PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p -> PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p;
    val getPositionsInPixels_ = _import "pango_tab_array_get_positions_in_pixels" : PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p -> GBool.FFI.val_;
    val getSize_ = _import "pango_tab_array_get_size" : PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p -> GInt.FFI.val_;
    val getTab_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_tab_array_get_tab" :
              PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p
               * GInt.FFI.val_
               * PangoTabAlign.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val resize_ = fn x1 & x2 => (_import "pango_tab_array_resize" : PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setTab_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_tab_array_set_tab" :
              PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p
               * GInt.FFI.val_
               * PangoTabAlign.FFI.val_
               * GInt.FFI.val_
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
    fun new (initialSize, positionsInPixels) = (GInt.FFI.withVal &&&> GBool.FFI.withVal ---> PangoTabArrayRecord.FFI.fromPtr true) new_ (initialSize & positionsInPixels)
    fun copy self = (PangoTabArrayRecord.FFI.withPtr ---> PangoTabArrayRecord.FFI.fromPtr true) copy_ self
    fun getPositionsInPixels self = (PangoTabArrayRecord.FFI.withPtr ---> GBool.FFI.fromVal) getPositionsInPixels_ self
    fun getSize self = (PangoTabArrayRecord.FFI.withPtr ---> GInt.FFI.fromVal) getSize_ self
    fun getTab self tabIndex =
      let
        val alignment
         & location
         & () =
          (
            PangoTabArrayRecord.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> PangoTabAlign.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> PangoTabAlign.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getTab_
            (
              self
               & tabIndex
               & PangoTabAlign.null
               & GInt.null
            )
      in
        (alignment, location)
      end
    fun resize self newSize = (PangoTabArrayRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) resize_ (self & newSize)
    fun setTab
      self
      (
        tabIndex,
        alignment,
        location
      ) =
      (
        PangoTabArrayRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> PangoTabAlign.FFI.withVal
         &&&> GInt.FFI.withVal
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
