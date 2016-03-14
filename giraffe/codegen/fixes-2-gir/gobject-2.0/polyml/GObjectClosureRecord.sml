structure GObjectClosureRecord :>
  G_OBJECT_CLOSURE_RECORD
    where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val cPtr = Pointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val take_ =
        if GiraffeDebug.isEnabled
        then
          call
            (load_sym libgiraffegobject "giraffe_debug_closure_take")
            (cPtr --> FFI.PolyML.cVoid)
        else
          ignore

      val ref_ =
        call
          (load_sym libgobject "g_closure_ref")
          (cPtr --> cPtr)

      val sink_ =
        call
          (load_sym libgobject "g_closure_sink")
          (cPtr --> FFI.PolyML.cVoid)

      val copy_ =
        if GiraffeDebug.isEnabled
        then 
          call
            (load_sym libgiraffegobject "giraffe_debug_closure_ref_sink")
            (cPtr --> cPtr)
        else
          fn ptr => ref_ ptr before sink_ ptr  (* must do ref before sink *)

      val free_ =
        if GiraffeDebug.isEnabled
        then
          call
            (load_sym libgiraffegobject "giraffe_debug_g_closure_unref")
            (cPtr --> FFI.PolyML.cVoid)
        else
          call
            (load_sym libgobject "g_closure_unref")
            (cPtr --> FFI.PolyML.cVoid)

      val getType_ =
        call
          (load_sym libgobject "g_closure_get_type")
          (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal);
    end

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
