structure AtkTableCell :>
  ATK_TABLE_CELL
    where type 'a class = 'a AtkTableCellClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    val getType_ = _import "atk_table_cell_get_type" : unit -> GObjectType.FFI.val_;
    val getColumnSpan_ = _import "atk_table_cell_get_column_span" : AtkTableCellClass.FFI.notnull AtkTableCellClass.FFI.p -> GInt.FFI.val_;
    val getPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_cell_get_position" :
              AtkTableCellClass.FFI.notnull AtkTableCellClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getRowColumnSpan_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "atk_table_cell_get_row_column_span" :
              AtkTableCellClass.FFI.notnull AtkTableCellClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getRowSpan_ = _import "atk_table_cell_get_row_span" : AtkTableCellClass.FFI.notnull AtkTableCellClass.FFI.p -> GInt.FFI.val_;
    val getTable_ = _import "atk_table_cell_get_table" : AtkTableCellClass.FFI.notnull AtkTableCellClass.FFI.p -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;
    type 'a class = 'a AtkTableCellClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getColumnSpan self = (AtkTableCellClass.FFI.withPtr ---> GInt.FFI.fromVal) getColumnSpan_ self
    fun getPosition self =
      let
        val row
         & column
         & retVal =
          (
            AtkTableCellClass.FFI.withPtr
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
            AtkTableCellClass.FFI.withPtr
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
    fun getRowSpan self = (AtkTableCellClass.FFI.withPtr ---> GInt.FFI.fromVal) getRowSpan_ self
    fun getTable self = (AtkTableCellClass.FFI.withPtr ---> AtkObjectClass.FFI.fromPtr true) getTable_ self
  end
