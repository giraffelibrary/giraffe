structure PangoColorRecord :> PANGO_COLOR_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val cPtr = Pointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val copy_ =
        call
          (load_sym libpango "pango_color_copy")
          (cPtr --> cPtr)

      val free_ =
        call
          (load_sym libpango "pango_color_free")
          (cPtr --> PolyMLFFI.cVoid)

      val getType_ =
        call
          (load_sym libpango "pango_color_get_type")
          (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal);
    end

    structure Record =
      BoxedRecord (
        type notnull = notnull
        type 'a p = 'a p
        val take_ = ignore
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
