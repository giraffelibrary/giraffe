structure AtkTableCell :>
  ATK_TABLE_CELL
    where type 'a class = 'a AtkTableCellClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    val getType_ = _import "atk_table_cell_get_type" : unit -> GObjectType.FFI.val_;
    val getColumnSpan_ = _import "atk_table_cell_get_column_span" : AtkTableCellClass.FFI.non_opt AtkTableCellClass.FFI.p -> GInt32.FFI.val_;
    val getPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_cell_get_position" :
              AtkTableCellClass.FFI.non_opt AtkTableCellClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              AtkTableCellClass.FFI.non_opt AtkTableCellClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getRowSpan_ = _import "atk_table_cell_get_row_span" : AtkTableCellClass.FFI.non_opt AtkTableCellClass.FFI.p -> GInt32.FFI.val_;
    val getTable_ = _import "atk_table_cell_get_table" : AtkTableCellClass.FFI.non_opt AtkTableCellClass.FFI.p -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;
    type 'a class = 'a AtkTableCellClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getColumnSpan self = (AtkTableCellClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getColumnSpan_ self
    fun getPosition self =
      let
        val row
         & column
         & retVal =
          (
            AtkTableCellClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getPosition_
            (
              self
               & GInt32.null
               & GInt32.null
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
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getRowColumnSpan_
            (
              self
               & GInt32.null
               & GInt32.null
               & GInt32.null
               & GInt32.null
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
    fun getRowSpan self = (AtkTableCellClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getRowSpan_ self
    fun getTable self = (AtkTableCellClass.FFI.withPtr false ---> AtkObjectClass.FFI.fromPtr true) getTable_ self
  end
