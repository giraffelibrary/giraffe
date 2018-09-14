structure PangoLogAttrRecord :> PANGO_LOG_ATTR_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val size_ = _import "giraffe_pango_log_attr_size" : unit -> GSize.FFI.val_;
    val memcpy_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "memcpy" :
              notnull p
               * notnull p
               * GSize.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val copy_ =
      fn
        src & dest =>
          memcpy_
            (
              dest
               & src
               & size_ ()
            )
    val clear_ = Fn.ignore
    structure Record =
      BoxedValueRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val copy_ = copy_
        val clear_ = clear_
        val size_ = size_
      )
    open Record
  end
