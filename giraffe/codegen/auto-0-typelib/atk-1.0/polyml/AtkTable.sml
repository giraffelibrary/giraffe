structure AtkTable :>
  ATK_TABLE
    where type 'a class = 'a AtkTableClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_table_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val addColumnSelection_ = call (load_sym libatk "atk_table_add_column_selection") (AtkTableClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val addRowSelection_ = call (load_sym libatk "atk_table_add_row_selection") (AtkTableClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val getCaption_ = call (load_sym libatk "atk_table_get_caption") (AtkTableClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val getColumnAtIndex_ = call (load_sym libatk "atk_table_get_column_at_index") (AtkTableClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Int32.PolyML.cVal)
      val getColumnDescription_ = call (load_sym libatk "atk_table_get_column_description") (AtkTableClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getColumnExtentAt_ =
        call (load_sym libatk "atk_table_get_column_extent_at")
          (
            AtkTableClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Int32.PolyML.cVal
          )
      val getColumnHeader_ = call (load_sym libatk "atk_table_get_column_header") (AtkTableClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> AtkObjectClass.PolyML.cPtr)
      val getIndexAt_ =
        call (load_sym libatk "atk_table_get_index_at")
          (
            AtkTableClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Int32.PolyML.cVal
          )
      val getNColumns_ = call (load_sym libatk "atk_table_get_n_columns") (AtkTableClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getNRows_ = call (load_sym libatk "atk_table_get_n_rows") (AtkTableClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getRowAtIndex_ = call (load_sym libatk "atk_table_get_row_at_index") (AtkTableClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Int32.PolyML.cVal)
      val getRowDescription_ = call (load_sym libatk "atk_table_get_row_description") (AtkTableClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getRowExtentAt_ =
        call (load_sym libatk "atk_table_get_row_extent_at")
          (
            AtkTableClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Int32.PolyML.cVal
          )
      val getRowHeader_ = call (load_sym libatk "atk_table_get_row_header") (AtkTableClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> AtkObjectClass.PolyML.cPtr)
      val getSummary_ = call (load_sym libatk "atk_table_get_summary") (AtkTableClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val isColumnSelected_ = call (load_sym libatk "atk_table_is_column_selected") (AtkTableClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val isRowSelected_ = call (load_sym libatk "atk_table_is_row_selected") (AtkTableClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val isSelected_ =
        call (load_sym libatk "atk_table_is_selected")
          (
            AtkTableClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val refAt_ =
        call (load_sym libatk "atk_table_ref_at")
          (
            AtkTableClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> AtkObjectClass.PolyML.cPtr
          )
      val removeColumnSelection_ = call (load_sym libatk "atk_table_remove_column_selection") (AtkTableClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val removeRowSelection_ = call (load_sym libatk "atk_table_remove_row_selection") (AtkTableClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val setCaption_ = call (load_sym libatk "atk_table_set_caption") (AtkTableClass.PolyML.cPtr &&> AtkObjectClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setColumnDescription_ =
        call (load_sym libatk "atk_table_set_column_description")
          (
            AtkTableClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val setColumnHeader_ =
        call (load_sym libatk "atk_table_set_column_header")
          (
            AtkTableClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> AtkObjectClass.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val setRowDescription_ =
        call (load_sym libatk "atk_table_set_row_description")
          (
            AtkTableClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val setRowHeader_ =
        call (load_sym libatk "atk_table_set_row_header")
          (
            AtkTableClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> AtkObjectClass.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val setSummary_ = call (load_sym libatk "atk_table_set_summary") (AtkTableClass.PolyML.cPtr &&> AtkObjectClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a AtkTableClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addColumnSelection self column = (AtkTableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) addColumnSelection_ (self & column)
    fun addRowSelection self row = (AtkTableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) addRowSelection_ (self & row)
    fun getCaption self = (AtkTableClass.C.withPtr ---> AtkObjectClass.C.fromPtr false) getCaption_ self
    fun getColumnAtIndex self index = (AtkTableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Int32.C.fromVal) getColumnAtIndex_ (self & index)
    fun getColumnDescription self column = (AtkTableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> Utf8.C.fromPtr false) getColumnDescription_ (self & column)
    fun getColumnExtentAt self row column =
      (
        AtkTableClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        getColumnExtentAt_
        (
          self
           & row
           & column
        )
    fun getColumnHeader self column = (AtkTableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> AtkObjectClass.C.fromPtr false) getColumnHeader_ (self & column)
    fun getIndexAt self row column =
      (
        AtkTableClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        getIndexAt_
        (
          self
           & row
           & column
        )
    fun getNColumns self = (AtkTableClass.C.withPtr ---> FFI.Int32.C.fromVal) getNColumns_ self
    fun getNRows self = (AtkTableClass.C.withPtr ---> FFI.Int32.C.fromVal) getNRows_ self
    fun getRowAtIndex self index = (AtkTableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Int32.C.fromVal) getRowAtIndex_ (self & index)
    fun getRowDescription self row = (AtkTableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> Utf8.C.fromPtr false) getRowDescription_ (self & row)
    fun getRowExtentAt self row column =
      (
        AtkTableClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        getRowExtentAt_
        (
          self
           & row
           & column
        )
    fun getRowHeader self row = (AtkTableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> AtkObjectClass.C.fromPtr false) getRowHeader_ (self & row)
    fun getSummary self = (AtkTableClass.C.withPtr ---> AtkObjectClass.C.fromPtr true) getSummary_ self
    fun isColumnSelected self column = (AtkTableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) isColumnSelected_ (self & column)
    fun isRowSelected self row = (AtkTableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) isRowSelected_ (self & row)
    fun isSelected self row column =
      (
        AtkTableClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
        AtkTableClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> AtkObjectClass.C.fromPtr true
      )
        refAt_
        (
          self
           & row
           & column
        )
    fun removeColumnSelection self column = (AtkTableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) removeColumnSelection_ (self & column)
    fun removeRowSelection self row = (AtkTableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) removeRowSelection_ (self & row)
    fun setCaption self caption = (AtkTableClass.C.withPtr &&&> AtkObjectClass.C.withPtr ---> I) setCaption_ (self & caption)
    fun setColumnDescription self column description =
      (
        AtkTableClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> Utf8.C.withPtr
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
        AtkTableClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> AtkObjectClass.C.withPtr
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
        AtkTableClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> Utf8.C.withPtr
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
        AtkTableClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> AtkObjectClass.C.withPtr
         ---> I
      )
        setRowHeader_
        (
          self
           & row
           & header
        )
    fun setSummary self accessible = (AtkTableClass.C.withPtr &&&> AtkObjectClass.C.withPtr ---> I) setSummary_ (self & accessible)
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
