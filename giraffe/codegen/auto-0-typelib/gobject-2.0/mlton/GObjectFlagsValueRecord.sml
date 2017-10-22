structure GObjectFlagsValueRecord :> G_OBJECT_FLAGS_VALUE_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val new_ = _import "giraffe_g_object_flags_value_new" : unit -> notnull p;
    val copy_ = fn x1 & x2 => (_import "giraffe_g_object_flags_value_copy" : notnull p * notnull p -> unit;) (x1, x2)
    val free_ = _import "giraffe_g_object_flags_value_free" : notnull p -> unit;
    val size_ = _import "giraffe_g_object_flags_value_size" : unit -> GUInt.FFI.val_;
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
