structure AtkText :>
  ATK_TEXT
    where type 'a class = 'a AtkTextClass.class
    where type text_range_t = AtkTextRangeRecord.t
    where type text_rectangle_t = AtkTextRectangleRecord.t
    where type coord_type_t = AtkCoordType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_text_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val freeRanges_ = call (load_sym libatk "atk_text_free_ranges") (AtkTextRangeRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val addSelection_ =
        call (load_sym libatk "atk_text_add_selection")
          (
            AtkTextClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val getCaretOffset_ = call (load_sym libatk "atk_text_get_caret_offset") (AtkTextClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getCharacterAtOffset_ = call (load_sym libatk "atk_text_get_character_at_offset") (AtkTextClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Char.PolyML.cVal)
      val getCharacterCount_ = call (load_sym libatk "atk_text_get_character_count") (AtkTextClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getNSelections_ = call (load_sym libatk "atk_text_get_n_selections") (AtkTextClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getOffsetAtPoint_ =
        call (load_sym libatk "atk_text_get_offset_at_point")
          (
            AtkTextClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             --> FFI.Int32.PolyML.cVal
          )
      val getRangeExtents_ =
        call (load_sym libatk "atk_text_get_range_extents")
          (
            AtkTextClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             &&> AtkTextRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getText_ =
        call (load_sym libatk "atk_text_get_text")
          (
            AtkTextClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val removeSelection_ = call (load_sym libatk "atk_text_remove_selection") (AtkTextClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val setCaretOffset_ = call (load_sym libatk "atk_text_set_caret_offset") (AtkTextClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val setSelection_ =
        call (load_sym libatk "atk_text_set_selection")
          (
            AtkTextClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a AtkTextClass.class
    type text_range_t = AtkTextRangeRecord.t
    type text_rectangle_t = AtkTextRectangleRecord.t
    type coord_type_t = AtkCoordType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun freeRanges ranges = (AtkTextRangeRecord.C.withPtr ---> I) freeRanges_ ranges
    fun addSelection self startOffset endOffset =
      (
        AtkTextClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        addSelection_
        (
          self
           & startOffset
           & endOffset
        )
    fun getCaretOffset self = (AtkTextClass.C.withPtr ---> FFI.Int32.C.fromVal) getCaretOffset_ self
    fun getCharacterAtOffset self offset = (AtkTextClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Char.C.fromVal) getCharacterAtOffset_ (self & offset)
    fun getCharacterCount self = (AtkTextClass.C.withPtr ---> FFI.Int32.C.fromVal) getCharacterCount_ self
    fun getNSelections self = (AtkTextClass.C.withPtr ---> FFI.Int32.C.fromVal) getNSelections_ self
    fun getOffsetAtPoint self x y coords =
      (
        AtkTextClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> AtkCoordType.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        getOffsetAtPoint_
        (
          self
           & x
           & y
           & coords
        )
    fun getRangeExtents self startOffset endOffset coordType rect =
      (
        AtkTextClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> AtkCoordType.C.withVal
         &&&> AtkTextRectangleRecord.C.withPtr
         ---> I
      )
        getRangeExtents_
        (
          self
           & startOffset
           & endOffset
           & coordType
           & rect
        )
    fun getText self startOffset endOffset =
      (
        AtkTextClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> Utf8.C.fromPtr true
      )
        getText_
        (
          self
           & startOffset
           & endOffset
        )
    fun removeSelection self selectionNum = (AtkTextClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) removeSelection_ (self & selectionNum)
    fun setCaretOffset self offset = (AtkTextClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) setCaretOffset_ (self & offset)
    fun setSelection self selectionNum startOffset endOffset =
      (
        AtkTextClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        setSelection_
        (
          self
           & selectionNum
           & startOffset
           & endOffset
        )
    local
      open ClosureMarshal Signal
    in
      fun textAttributesChangedSig f = signal "text-attributes-changed" (void ---> ret_void) f
      fun textCaretMovedSig f = signal "text-caret-moved" (get 0w1 int ---> ret_void) f
      fun textChangedSig f = signal "text-changed" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn object & p0 => f object p0)
      fun textInsertSig f =
        signal "text-insert"
          (
            get 0w1 int
             &&&> get 0w2 int
             &&&> get 0w3 string
             ---> ret_void
          )
          (
            fn
              object
               & p0
               & p1 =>
                f object p0 p1
          )
      fun textRemoveSig f =
        signal "text-remove"
          (
            get 0w1 int
             &&&> get 0w2 int
             &&&> get 0w3 string
             ---> ret_void
          )
          (
            fn
              object
               & p0
               & p1 =>
                f object p0 p1
          )
      fun textSelectionChangedSig f = signal "text-selection-changed" (void ---> ret_void) f
      fun textUpdateSig f =
        signal "text-update"
          (
            get 0w1 int
             &&&> get 0w2 int
             &&&> get 0w3 int
             &&&> get 0w4 string
             ---> ret_void
          )
          (
            fn
              object
               & p0
               & p1
               & p2 =>
                f object p0 p1 p2
          )
    end
  end
