structure GObjectClosureRecord :>
  G_OBJECT_CLOSURE_RECORD
    where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val take_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_closure_take" : notnull p -> unit;
      else ignore

    val ref_ = _import "g_closure_ref" : notnull p -> notnull p;

    val sink_ = _import "g_closure_sink" : notnull p -> unit;

    val copy_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_closure_ref_sink" : notnull p -> notnull p;
      else fn ptr => ref_ ptr before sink_ ptr  (* must do ref before sink *)

    val free_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_g_closure_unref" : notnull p -> unit;
      else _import "g_closure_unref" : notnull p -> unit;

    val getType_ = _import "g_closure_get_type" : unit -> GObjectType.C.val_;

    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor

    structure Record =
      BoxedRecord (
        type notnull = notnull
        type 'a p = 'a p
        val take_ = take_
        val copy_ = copy_
        val free_ = free_
      )
    open Record

    structure Type =
      BoxedType (
        structure Record = Record
        type t = t
        val getType_ = getType_
      )
    open Type
  end
