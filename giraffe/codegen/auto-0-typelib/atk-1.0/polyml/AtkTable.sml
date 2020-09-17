structure AtkTable :>
  ATK_TABLE
    where type 'a class = 'a AtkTableClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_table_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addColumnSelection_ = call (getSymbol "atk_table_add_column_selection") (AtkTableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val addRowSelection_ = call (getSymbol "atk_table_add_row_selection") (AtkTableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val getCaption_ = call (getSymbol "atk_table_get_caption") (AtkTableClass.PolyML.cPtr --> AtkObjectClass.PolyML.cOptPtr)
      val getColumnAtIndex_ = call (getSymbol "atk_table_get_column_at_index") (AtkTableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val getColumnDescription_ = call (getSymbol "atk_table_get_column_description") (AtkTableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getColumnExtentAt_ =
        call (getSymbol "atk_table_get_column_extent_at")
          (
            AtkTableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val getColumnHeader_ = call (getSymbol "atk_table_get_column_header") (AtkTableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> AtkObjectClass.PolyML.cOptPtr)
      val getIndexAt_ =
        call (getSymbol "atk_table_get_index_at")
          (
            AtkTableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val getNColumns_ = call (getSymbol "atk_table_get_n_columns") (AtkTableClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getNRows_ = call (getSymbol "atk_table_get_n_rows") (AtkTableClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getRowAtIndex_ = call (getSymbol "atk_table_get_row_at_index") (AtkTableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val getRowDescription_ = call (getSymbol "atk_table_get_row_description") (AtkTableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutOptPtr)
      val getRowExtentAt_ =
        call (getSymbol "atk_table_get_row_extent_at")
          (
            AtkTableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val getRowHeader_ = call (getSymbol "atk_table_get_row_header") (AtkTableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> AtkObjectClass.PolyML.cOptPtr)
      val getSummary_ = call (getSymbol "atk_table_get_summary") (AtkTableClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val isColumnSelected_ = call (getSymbol "atk_table_is_column_selected") (AtkTableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val isRowSelected_ = call (getSymbol "atk_table_is_row_selected") (AtkTableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val isSelected_ =
        call (getSymbol "atk_table_is_selected")
          (
            AtkTableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val refAt_ =
        call (getSymbol "atk_table_ref_at")
          (
            AtkTableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> AtkObjectClass.PolyML.cPtr
          )
      val removeColumnSelection_ = call (getSymbol "atk_table_remove_column_selection") (AtkTableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val removeRowSelection_ = call (getSymbol "atk_table_remove_row_selection") (AtkTableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val setCaption_ = call (getSymbol "atk_table_set_caption") (AtkTableClass.PolyML.cPtr &&> AtkObjectClass.PolyML.cPtr --> cVoid)
      val setColumnDescription_ =
        call (getSymbol "atk_table_set_column_description")
          (
            AtkTableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val setColumnHeader_ =
        call (getSymbol "atk_table_set_column_header")
          (
            AtkTableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> AtkObjectClass.PolyML.cPtr
             --> cVoid
          )
      val setRowDescription_ =
        call (getSymbol "atk_table_set_row_description")
          (
            AtkTableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val setRowHeader_ =
        call (getSymbol "atk_table_set_row_header")
          (
            AtkTableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> AtkObjectClass.PolyML.cPtr
             --> cVoid
          )
      val setSummary_ = call (getSymbol "atk_table_set_summary") (AtkTableClass.PolyML.cPtr &&> AtkObjectClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a AtkTableClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addColumnSelection self column = (AtkTableClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) addColumnSelection_ (self & column)
    fun addRowSelection self row = (AtkTableClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) addRowSelection_ (self & row)
    fun getCaption self = (AtkTableClass.FFI.withPtr false ---> AtkObjectClass.FFI.fromOptPtr false) getCaption_ self before AtkTableClass.FFI.touchPtr self
    fun getColumnAtIndex self index = (AtkTableClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) getColumnAtIndex_ (self & index)
    fun getColumnDescription self column = (AtkTableClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 0) getColumnDescription_ (self & column) before AtkTableClass.FFI.touchPtr self
    fun getColumnExtentAt self (row, column) =
      (
        AtkTableClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        getColumnExtentAt_
        (
          self
           & row
           & column
        )
    fun getColumnHeader self column = (AtkTableClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> AtkObjectClass.FFI.fromOptPtr false) getColumnHeader_ (self & column) before AtkTableClass.FFI.touchPtr self
    fun getIndexAt self (row, column) =
      (
        AtkTableClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        getIndexAt_
        (
          self
           & row
           & column
        )
    fun getNColumns self = (AtkTableClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNColumns_ self
    fun getNRows self = (AtkTableClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNRows_ self
    fun getRowAtIndex self index = (AtkTableClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) getRowAtIndex_ (self & index)
    fun getRowDescription self row = (AtkTableClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) getRowDescription_ (self & row) before AtkTableClass.FFI.touchPtr self
    fun getRowExtentAt self (row, column) =
      (
        AtkTableClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        getRowExtentAt_
        (
          self
           & row
           & column
        )
    fun getRowHeader self row = (AtkTableClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> AtkObjectClass.FFI.fromOptPtr false) getRowHeader_ (self & row) before AtkTableClass.FFI.touchPtr self
    fun getSummary self = (AtkTableClass.FFI.withPtr false ---> AtkObjectClass.FFI.fromPtr true) getSummary_ self
    fun isColumnSelected self column = (AtkTableClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) isColumnSelected_ (self & column)
    fun isRowSelected self row = (AtkTableClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) isRowSelected_ (self & row)
    fun isSelected self (row, column) =
      (
        AtkTableClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        isSelected_
        (
          self
           & row
           & column
        )
    fun refAt self (row, column) =
      (
        AtkTableClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> AtkObjectClass.FFI.fromPtr true
      )
        refAt_
        (
          self
           & row
           & column
        )
    fun removeColumnSelection self column = (AtkTableClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) removeColumnSelection_ (self & column)
    fun removeRowSelection self row = (AtkTableClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) removeRowSelection_ (self & row)
    fun setCaption self caption = (AtkTableClass.FFI.withPtr false &&&> AtkObjectClass.FFI.withPtr false ---> I) setCaption_ (self & caption)
    fun setColumnDescription self (column, description) =
      (
        AtkTableClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        setColumnDescription_
        (
          self
           & column
           & description
        )
    fun setColumnHeader self (column, header) =
      (
        AtkTableClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr false
         ---> I
      )
        setColumnHeader_
        (
          self
           & column
           & header
        )
    fun setRowDescription self (row, description) =
      (
        AtkTableClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        setRowDescription_
        (
          self
           & row
           & description
        )
    fun setRowHeader self (row, header) =
      (
        AtkTableClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr false
         ---> I
      )
        setRowHeader_
        (
          self
           & row
           & header
        )
    fun setSummary self accessible = (AtkTableClass.FFI.withPtr false &&&> AtkObjectClass.FFI.withPtr false ---> I) setSummary_ (self & accessible)
    local
      open ClosureMarshal Signal
    in
      fun columnDeletedSig f = signal "column-deleted" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn arg1 & arg2 => f (arg1, arg2))
      fun columnInsertedSig f = signal "column-inserted" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn arg1 & arg2 => f (arg1, arg2))
      fun columnReorderedSig f = signal "column-reordered" (void ---> ret_void) f
      fun modelChangedSig f = signal "model-changed" (void ---> ret_void) f
      fun rowDeletedSig f = signal "row-deleted" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn arg1 & arg2 => f (arg1, arg2))
      fun rowInsertedSig f = signal "row-inserted" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn arg1 & arg2 => f (arg1, arg2))
      fun rowReorderedSig f = signal "row-reordered" (void ---> ret_void) f
    end
  end
