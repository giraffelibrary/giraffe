structure AtkTableCell :>
  ATK_TABLE_CELL
    where type 'a class = 'a AtkTableCellClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_table_cell_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getColumnSpan_ = call (getSymbol "atk_table_cell_get_column_span") (AtkTableCellClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getPosition_ =
        call (getSymbol "atk_table_cell_get_position")
          (
            AtkTableCellClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getRowColumnSpan_ =
        call (getSymbol "atk_table_cell_get_row_column_span")
          (
            AtkTableCellClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getRowSpan_ = call (getSymbol "atk_table_cell_get_row_span") (AtkTableCellClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getTable_ = call (getSymbol "atk_table_cell_get_table") (AtkTableCellClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a AtkTableCellClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getColumnSpan self = (AtkTableCellClass.FFI.withPtr false ---> GInt.FFI.fromVal) getColumnSpan_ self
    fun getPosition self =
      let
        val row
         & column
         & retVal =
          (
            AtkTableCellClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getPosition_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        if retVal then SOME (row, column) else NONE
      end
    fun getRowColumnSpan self =
      let
        val row
         & column
         & rowSpan
         & columnSpan
         & retVal =
          (
            AtkTableCellClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getRowColumnSpan_
            (
              self
               & GInt.null
               & GInt.null
               & GInt.null
               & GInt.null
            )
      in
        if retVal
        then
          SOME
            (
              row,
              column,
              rowSpan,
              columnSpan
            )
        else NONE
      end
    fun getRowSpan self = (AtkTableCellClass.FFI.withPtr false ---> GInt.FFI.fromVal) getRowSpan_ self
    fun getTable self = (AtkTableCellClass.FFI.withPtr false ---> AtkObjectClass.FFI.fromPtr true) getTable_ self
  end
