structure GLibPollFDRecord :> G_LIB_POLL_F_D_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val new_ = _import "giraffe_g_lib_poll_f_d_new" : unit -> notnull p;
    val copy_ = fn x1 & x2 => (_import "giraffe_g_lib_poll_f_d_copy" : notnull p * notnull p -> unit;) (x1, x2)
    val free_ = _import "giraffe_g_lib_poll_f_d_free" : notnull p -> unit;
    val size_ = _import "giraffe_g_lib_poll_f_d_size" : unit -> GUInt.FFI.val_;
    structure Record =
      BoxedValueRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val new_ = new_
        val copy_ = copy_
        val take_ = ignore
        val clear_ = ignore
        val free_ = free_
        val size_ = size_
      )
    open Record
  end
