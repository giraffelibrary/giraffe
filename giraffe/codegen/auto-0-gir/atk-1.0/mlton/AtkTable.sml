structure AtkTable :>
  ATK_TABLE
    where type 'a class = 'a AtkTableClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    val getType_ = _import "atk_table_get_type" : unit -> GObjectType.FFI.val_;
    val addColumnSelection_ = fn x1 & x2 => (_import "atk_table_add_column_selection" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * GInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val addRowSelection_ = fn x1 & x2 => (_import "atk_table_add_row_selection" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * GInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val getCaption_ = _import "atk_table_get_caption" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;
    val getColumnAtIndex_ = fn x1 & x2 => (_import "atk_table_get_column_at_index" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * GInt.FFI.val_ -> GInt.FFI.val_;) (x1, x2)
    val getColumnDescription_ = fn x1 & x2 => (_import "atk_table_get_column_description" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * GInt.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val getColumnExtentAt_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_get_column_extent_at" :
              AtkTableClass.FFI.notnull AtkTableClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getColumnHeader_ = fn x1 & x2 => (_import "atk_table_get_column_header" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * GInt.FFI.val_ -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;) (x1, x2)
    val getIndexAt_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_get_index_at" :
              AtkTableClass.FFI.notnull AtkTableClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getNColumns_ = _import "atk_table_get_n_columns" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p -> GInt.FFI.val_;
    val getNRows_ = _import "atk_table_get_n_rows" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p -> GInt.FFI.val_;
    val getRowAtIndex_ = fn x1 & x2 => (_import "atk_table_get_row_at_index" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * GInt.FFI.val_ -> GInt.FFI.val_;) (x1, x2)
    val getRowDescription_ = fn x1 & x2 => (_import "atk_table_get_row_description" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * GInt.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val getRowExtentAt_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_get_row_extent_at" :
              AtkTableClass.FFI.notnull AtkTableClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getRowHeader_ = fn x1 & x2 => (_import "atk_table_get_row_header" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * GInt.FFI.val_ -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;) (x1, x2)
    val getSummary_ = _import "atk_table_get_summary" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;
    val isColumnSelected_ = fn x1 & x2 => (_import "atk_table_is_column_selected" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * GInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val isRowSelected_ = fn x1 & x2 => (_import "atk_table_is_row_selected" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * GInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val isSelected_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_is_selected" :
              AtkTableClass.FFI.notnull AtkTableClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val refAt_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_ref_at" :
              AtkTableClass.FFI.notnull AtkTableClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val removeColumnSelection_ = fn x1 & x2 => (_import "atk_table_remove_column_selection" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * GInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val removeRowSelection_ = fn x1 & x2 => (_import "atk_table_remove_row_selection" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * GInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val setCaption_ = fn x1 & x2 => (_import "atk_table_set_caption" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> unit;) (x1, x2)
    val setColumnDescription_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_atk_table_set_column_description" :
              AtkTableClass.FFI.notnull AtkTableClass.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setColumnHeader_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_set_column_header" :
              AtkTableClass.FFI.notnull AtkTableClass.FFI.p
               * GInt.FFI.val_
               * AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setRowDescription_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_atk_table_set_row_description" :
              AtkTableClass.FFI.notnull AtkTableClass.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setRowHeader_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_set_row_header" :
              AtkTableClass.FFI.notnull AtkTableClass.FFI.p
               * GInt.FFI.val_
               * AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSummary_ = fn x1 & x2 => (_import "atk_table_set_summary" : AtkTableClass.FFI.notnull AtkTableClass.FFI.p * AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a AtkTableClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addColumnSelection self column = (AtkTableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) addColumnSelection_ (self & column)
    fun addRowSelection self row = (AtkTableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) addRowSelection_ (self & row)
    fun getCaption self = (AtkTableClass.FFI.withPtr ---> AtkObjectClass.FFI.fromPtr false) getCaption_ self
    fun getColumnAtIndex self index = (AtkTableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) getColumnAtIndex_ (self & index)
    fun getColumnDescription self column = (AtkTableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr 0) getColumnDescription_ (self & column)
    fun getColumnExtentAt self row column =
      (
        AtkTableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        getColumnExtentAt_
        (
          self
           & row
           & column
        )
    fun getColumnHeader self column = (AtkTableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> AtkObjectClass.FFI.fromPtr false) getColumnHeader_ (self & column)
    fun getIndexAt self row column =
      (
        AtkTableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        getIndexAt_
        (
          self
           & row
           & column
        )
    fun getNColumns self = (AtkTableClass.FFI.withPtr ---> GInt.FFI.fromVal) getNColumns_ self
    fun getNRows self = (AtkTableClass.FFI.withPtr ---> GInt.FFI.fromVal) getNRows_ self
    fun getRowAtIndex self index = (AtkTableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) getRowAtIndex_ (self & index)
    fun getRowDescription self row = (AtkTableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr 0) getRowDescription_ (self & row)
    fun getRowExtentAt self row column =
      (
        AtkTableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        getRowExtentAt_
        (
          self
           & row
           & column
        )
    fun getRowHeader self row = (AtkTableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> AtkObjectClass.FFI.fromPtr false) getRowHeader_ (self & row)
    fun getSummary self = (AtkTableClass.FFI.withPtr ---> AtkObjectClass.FFI.fromPtr true) getSummary_ self
    fun isColumnSelected self column = (AtkTableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) isColumnSelected_ (self & column)
    fun isRowSelected self row = (AtkTableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) isRowSelected_ (self & row)
    fun isSelected self row column =
      (
        AtkTableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        isSelected_
        (
          self
           & row
           & column
        )
    fun refAt self row column =
      (
        AtkTableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> AtkObjectClass.FFI.fromPtr true
      )
        refAt_
        (
          self
           & row
           & column
        )
    fun removeColumnSelection self column = (AtkTableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) removeColumnSelection_ (self & column)
    fun removeRowSelection self row = (AtkTableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) removeRowSelection_ (self & row)
    fun setCaption self caption = (AtkTableClass.FFI.withPtr &&&> AtkObjectClass.FFI.withPtr ---> I) setCaption_ (self & caption)
    fun setColumnDescription self column description =
      (
        AtkTableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setColumnDescription_
        (
          self
           & column
           & description
        )
    fun setColumnHeader self column header =
      (
        AtkTableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr
         ---> I
      )
        setColumnHeader_
        (
          self
           & column
           & header
        )
    fun setRowDescription self row description =
      (
        AtkTableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setRowDescription_
        (
          self
           & row
           & description
        )
    fun setRowHeader self row header =
      (
        AtkTableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr
         ---> I
      )
        setRowHeader_
        (
          self
           & row
           & header
        )
    fun setSummary self accessible = (AtkTableClass.FFI.withPtr &&&> AtkObjectClass.FFI.withPtr ---> I) setSummary_ (self & accessible)
    local
      open ClosureMarshal Signal
    in
      fun columnDeletedSig f = signal "column-deleted" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn object & p0 => f object p0)
      fun columnInsertedSig f = signal "column-inserted" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn object & p0 => f object p0)
      fun columnReorderedSig f = signal "column-reordered" (void ---> ret_void) f
      fun modelChangedSig f = signal "model-changed" (void ---> ret_void) f
      fun rowDeletedSig f = signal "row-deleted" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn object & p0 => f object p0)
      fun rowInsertedSig f = signal "row-inserted" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn object & p0 => f object p0)
      fun rowReorderedSig f = signal "row-reordered" (void ---> ret_void) f
    end
  end
