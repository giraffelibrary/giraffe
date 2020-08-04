structure GtkCellAreaBoxClass :>
  GTK_CELL_AREA_BOX_CLASS
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type C.opt = GtkCellAreaClass.C.opt
    where type C.non_opt = GtkCellAreaClass.C.non_opt
    where type 'a C.p = 'a GtkCellAreaClass.C.p =
  struct
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    open GtkCellAreaClass
    type 'a cell_area_box = unit
    type 'a class = 'a cell_area_box class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_area_box_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
          setValue = (I &&&> FFI.withPtr false ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
        }
  end
