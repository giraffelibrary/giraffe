structure GtkRendererCellAccessibleClass :>
  GTK_RENDERER_CELL_ACCESSIBLE_CLASS
    where type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class
    where type C.notnull = GtkCellAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkCellAccessibleClass.C.p =
  struct
    type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class
    open GtkCellAccessibleClass
    type 'a renderer_cell_accessible = unit
    type 'a class = 'a renderer_cell_accessible class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_renderer_cell_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
