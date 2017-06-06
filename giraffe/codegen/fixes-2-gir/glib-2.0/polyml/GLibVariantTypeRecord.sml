structure GLibVariantTypeRecord :> G_LIB_VARIANT_TYPE_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val cPtr = Pointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val dup_ =
        call
          (load_sym libgobject "g_variant_type_copy")
          (cPtr --> cPtr)

      val free_ =
        call
          (load_sym libgobject "g_variant_type_free")
          (cPtr --> cVoid)

      val getType_ =
        call
          (load_sym libgobject "g_variant_type_get_gtype")
          (cVoid --> GObjectType.PolyML.cVal);
    end

    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
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
