structure AtkTable :>
  ATK_TABLE
    where type 'a class_t = 'a AtkTableClass.t
    where type 'a object_class_t = 'a AtkObjectClass.t =
  struct
    val getType_ = _import "atk_table_get_type" : unit -> GObjectType.C.val_;
    val addColumnSelection_ = fn x1 & x2 => (_import "atk_table_add_column_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val addRowSelection_ = fn x1 & x2 => (_import "atk_table_add_row_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val getCaption_ = _import "atk_table_get_caption" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getColumnAtIndex_ = fn x1 & x2 => (_import "atk_table_get_column_at_index" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Int.C.val_;) (x1, x2)
    val getColumnDescription_ = fn x1 & x2 => (_import "atk_table_get_column_description" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val getColumnExtentAt_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_get_column_extent_at" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getColumnHeader_ = fn x1 & x2 => (_import "atk_table_get_column_header" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getIndexAt_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_get_index_at" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getNColumns_ = _import "atk_table_get_n_columns" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getNRows_ = _import "atk_table_get_n_rows" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getRowAtIndex_ = fn x1 & x2 => (_import "atk_table_get_row_at_index" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Int.C.val_;) (x1, x2)
    val getRowDescription_ = fn x1 & x2 => (_import "atk_table_get_row_description" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val getRowExtentAt_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_get_row_extent_at" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getRowHeader_ = fn x1 & x2 => (_import "atk_table_get_row_header" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getSummary_ = _import "atk_table_get_summary" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val isColumnSelected_ = fn x1 & x2 => (_import "atk_table_is_column_selected" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val isRowSelected_ = fn x1 & x2 => (_import "atk_table_is_row_selected" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val isSelected_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_table_is_selected" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val removeColumnSelection_ = fn x1 & x2 => (_import "atk_table_remove_column_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val removeRowSelection_ = fn x1 & x2 => (_import "atk_table_remove_row_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val setCaption_ = fn x1 & x2 => (_import "atk_table_set_caption" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setColumnDescription_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_atk_table_set_column_description" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSummary_ = fn x1 & x2 => (_import "atk_table_set_summary" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a AtkTableClass.t
    type 'a object_class_t = 'a AtkObjectClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addColumnSelection self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) addColumnSelection_ (self & column)
    fun addRowSelection self row = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) addRowSelection_ (self & row)
    fun getCaption self = (GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr false) getCaption_ self
    fun getColumnAtIndex self index = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) getColumnAtIndex_ (self & index)
    fun getColumnDescription self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getColumnDescription_ (self & column)
    fun getColumnExtentAt self row column =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
      )
        getColumnExtentAt_
        (
          self
           & row
           & column
        )
    fun getColumnHeader self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> AtkObjectClass.C.fromPtr false) getColumnHeader_ (self & column)
    fun getIndexAt self row column =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
      )
        getIndexAt_
        (
          self
           & row
           & column
        )
    fun getNColumns self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNColumns_ self
    fun getNRows self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNRows_ self
    fun getRowAtIndex self index = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) getRowAtIndex_ (self & index)
    fun getRowDescription self row = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getRowDescription_ (self & row)
    fun getRowExtentAt self row column =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
      )
        getRowExtentAt_
        (
          self
           & row
           & column
        )
    fun getRowHeader self row = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> AtkObjectClass.C.fromPtr false) getRowHeader_ (self & row)
    fun getSummary self = (GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr true) getSummary_ self
    fun isColumnSelected self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) isColumnSelected_ (self & column)
    fun isRowSelected self row = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) isRowSelected_ (self & row)
    fun isSelected self row column =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        isSelected_
        (
          self
           & row
           & column
        )
    fun refAt self row column =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> AtkObjectClass.C.fromPtr true
      )
        refAt_
        (
          self
           & row
           & column
        )
    fun removeColumnSelection self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) removeColumnSelection_ (self & column)
    fun removeRowSelection self row = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) removeRowSelection_ (self & row)
    fun setCaption self caption = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setCaption_ (self & caption)
    fun setColumnDescription self column description =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        setRowHeader_
        (
          self
           & row
           & header
        )
    fun setSummary self accessible = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setSummary_ (self & accessible)
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
