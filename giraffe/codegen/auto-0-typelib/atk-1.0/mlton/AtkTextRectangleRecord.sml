structure AtkTextRectangleRecord :> ATK_TEXT_RECTANGLE_RECORD =
  struct
    structure Pointer = CPointerInternal
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    val size_ = fn () => 16
    val memcpy_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "memcpy" :
              non_opt p
               * non_opt p
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
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p
        val copy_ = copy_
        val clear_ = clear_
        val size_ = size_
      )
    open Record
  end
