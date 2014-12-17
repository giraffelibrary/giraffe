structure AtkTable :>
  ATK_TABLE
    where type 'a class_t = 'a AtkTableClass.t
    where type 'a objectclass_t = 'a AtkObjectClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_table_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val addColumnSelection_ = call (load_sym libatk "atk_table_add_column_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val addRowSelection_ = call (load_sym libatk "atk_table_add_row_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val getCaption_ = call (load_sym libatk "atk_table_get_caption") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getColumnAtIndex_ = call (load_sym libatk "atk_table_get_column_at_index") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.Int32.PolyML.VAL)
      val getColumnDescription_ = call (load_sym libatk "atk_table_get_column_description") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val getColumnExtentAt_ =
        call (load_sym libatk "atk_table_get_column_extent_at")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Int32.PolyML.VAL
          )
      val getColumnHeader_ = call (load_sym libatk "atk_table_get_column_header") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getIndexAt_ =
        call (load_sym libatk "atk_table_get_index_at")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Int32.PolyML.VAL
          )
      val getNColumns_ = call (load_sym libatk "atk_table_get_n_columns") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getNRows_ = call (load_sym libatk "atk_table_get_n_rows") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getRowAtIndex_ = call (load_sym libatk "atk_table_get_row_at_index") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.Int32.PolyML.VAL)
      val getRowDescription_ = call (load_sym libatk "atk_table_get_row_description") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val getRowExtentAt_ =
        call (load_sym libatk "atk_table_get_row_extent_at")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Int32.PolyML.VAL
          )
      val getRowHeader_ = call (load_sym libatk "atk_table_get_row_header") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getSummary_ = call (load_sym libatk "atk_table_get_summary") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val isColumnSelected_ = call (load_sym libatk "atk_table_is_column_selected") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val isRowSelected_ = call (load_sym libatk "atk_table_is_row_selected") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val isSelected_ =
        call (load_sym libatk "atk_table_is_selected")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val refAt_ =
        call (load_sym libatk "atk_table_ref_at")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val removeColumnSelection_ = call (load_sym libatk "atk_table_remove_column_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val removeRowSelection_ = call (load_sym libatk "atk_table_remove_row_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val setCaption_ = call (load_sym libatk "atk_table_set_caption") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setColumnDescription_ =
        call (load_sym libatk "atk_table_set_column_description")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val setColumnHeader_ =
        call (load_sym libatk "atk_table_set_column_header")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val setRowDescription_ =
        call (load_sym libatk "atk_table_set_row_description")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val setRowHeader_ =
        call (load_sym libatk "atk_table_set_row_header")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val setSummary_ = call (load_sym libatk "atk_table_set_summary") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a AtkTableClass.t
    type 'a objectclass_t = 'a AtkObjectClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addColumnSelection self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) addColumnSelection_ (self & column)
    fun addRowSelection self row = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) addRowSelection_ (self & row)
    fun getCaption self = (GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr false) getCaption_ self
    fun getColumnAtIndex self index = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Int32.C.fromVal) getColumnAtIndex_ (self & index)
    fun getColumnDescription self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.String.C.fromPtr false) getColumnDescription_ (self & column)
    fun getColumnExtentAt self row column =
      (
        GObjectObjectClass.C.withPtr
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
    fun getColumnHeader self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> AtkObjectClass.C.fromPtr false) getColumnHeader_ (self & column)
    fun getIndexAt self row column =
      (
        GObjectObjectClass.C.withPtr
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
    fun getNColumns self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNColumns_ self
    fun getNRows self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNRows_ self
    fun getRowAtIndex self index = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Int32.C.fromVal) getRowAtIndex_ (self & index)
    fun getRowDescription self row = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.String.C.fromPtr false) getRowDescription_ (self & row)
    fun getRowExtentAt self row column =
      (
        GObjectObjectClass.C.withPtr
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
    fun getRowHeader self row = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> AtkObjectClass.C.fromPtr false) getRowHeader_ (self & row)
    fun getSummary self = (GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr true) getSummary_ self
    fun isColumnSelected self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) isColumnSelected_ (self & column)
    fun isRowSelected self row = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) isRowSelected_ (self & row)
    fun isSelected self row column =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun removeColumnSelection self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) removeColumnSelection_ (self & column)
    fun removeRowSelection self row = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) removeRowSelection_ (self & row)
    fun setCaption self caption = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setCaption_ (self & caption)
    fun setColumnDescription self column description =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
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
