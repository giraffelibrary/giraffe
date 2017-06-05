structure GtkTreeIterRecord :> GTK_TREE_ITER_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val new_ = _import "giraffe_gtk_tree_iter_new" : unit -> notnull p;
    val copy_ =
      fn x1 & x2 =>
        (_import "giraffe_gtk_tree_iter_copy" : notnull p * notnull p -> unit;)
        (x1, x2)
    val free_ = _import "giraffe_gtk_tree_iter_free" : notnull p -> unit;
    val size_ = _import "giraffe_gtk_tree_iter_size" : unit -> GUInt.FFI.val_;
    val getType_ = _import "gtk_tree_iter_get_type" : unit -> GObjectType.FFI.val_;

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

    structure Type =
      BoxedType(
        structure Record = Record
        type t = t
        val getType_ = getType_
      )
    open Type
  end
