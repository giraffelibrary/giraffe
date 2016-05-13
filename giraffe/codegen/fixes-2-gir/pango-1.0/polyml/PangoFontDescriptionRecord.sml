structure PangoFontDescriptionRecord :> PANGO_FONT_DESCRIPTION_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val cPtr = Pointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val new_ =
        call
          (load_sym libpango "pango_font_description_new")
          (PolyMLFFI.cVoid --> cPtr)

      val copy_ =
        call
          (load_sym libpango "pango_font_description_copy")
          (cPtr --> cPtr)

      val free_ =
        call
          (load_sym libpango "pango_font_description_free")
          (cPtr --> PolyMLFFI.cVoid)

      val getType_ =
        call
          (load_sym libpango "pango_font_description_get_type")
          (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal);
    end

    structure Record =
      BoxedNewRecord (
        type notnull = notnull
        type 'a p = 'a p
        val new_ = new_
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
