structure PangoItem :>
  PANGO_ITEM
    where type t = PangoItemRecord.t =
  struct
    val getType_ = _import "pango_item_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "pango_item_new" : unit -> PangoItemRecord.FFI.non_opt PangoItemRecord.FFI.p;
    val copy_ = _import "pango_item_copy" : PangoItemRecord.FFI.non_opt PangoItemRecord.FFI.p -> PangoItemRecord.FFI.opt PangoItemRecord.FFI.p;
    val split_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_item_split" :
              PangoItemRecord.FFI.non_opt PangoItemRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> PangoItemRecord.FFI.non_opt PangoItemRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type t = PangoItemRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoItemRecord.FFI.fromPtr true) new_ ()
    fun copy self = (PangoItemRecord.FFI.withPtr false ---> PangoItemRecord.FFI.fromOptPtr true) copy_ self
    fun split self (splitIndex, splitOffset) =
      (
        PangoItemRecord.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> PangoItemRecord.FFI.fromPtr true
      )
        split_
        (
          self
           & splitIndex
           & splitOffset
        )
  end
