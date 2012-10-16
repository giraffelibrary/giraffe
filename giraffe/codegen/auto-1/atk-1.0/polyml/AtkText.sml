structure AtkText :>
  ATK_TEXT
    where type 'a class_t = 'a AtkTextClass.t
    where type textrangerecord_t = AtkTextRangeRecord.t
    where type textrectanglerecord_t = AtkTextRectangleRecord.t
    where type coordtype_t = AtkCoordType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_text_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val freeRanges_ = call (load_sym libatk "atk_text_free_ranges") (AtkTextRangeRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val addSelection_ =
        call (load_sym libatk "atk_text_add_selection")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val getCaretOffset_ = call (load_sym libatk "atk_text_get_caret_offset") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getCharacterAtOffset_ = call (load_sym libatk "atk_text_get_character_at_offset") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Char.VAL)
      val getCharacterCount_ = call (load_sym libatk "atk_text_get_character_count") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getNSelections_ = call (load_sym libatk "atk_text_get_n_selections") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getOffsetAtPoint_ =
        call (load_sym libatk "atk_text_get_offset_at_point")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> AtkCoordType.PolyML.VAL
             --> FFI.PolyML.Int32.VAL
          )
      val getRangeExtents_ =
        call (load_sym libatk "atk_text_get_range_extents")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> AtkCoordType.PolyML.VAL
             &&> AtkTextRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getText_ =
        call (load_sym libatk "atk_text_get_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val removeSelection_ = call (load_sym libatk "atk_text_remove_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val setCaretOffset_ = call (load_sym libatk "atk_text_set_caret_offset") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val setSelection_ =
        call (load_sym libatk "atk_text_set_selection")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.Bool.VAL
          )
    end
    type 'a class_t = 'a AtkTextClass.t
    type textrangerecord_t = AtkTextRangeRecord.t
    type textrectanglerecord_t = AtkTextRectangleRecord.t
    type coordtype_t = AtkCoordType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun freeRanges ranges = (AtkTextRangeRecord.C.withPtr ---> I) freeRanges_ ranges
    fun addSelection self startOffset endOffset =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> FFI.Bool.fromVal
      )
        addSelection_
        (
          self
           & startOffset
           & endOffset
        )
    fun getCaretOffset self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getCaretOffset_ self
    fun getCharacterAtOffset self offset = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Char.fromVal) getCharacterAtOffset_ (self & offset)
    fun getCharacterCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getCharacterCount_ self
    fun getNSelections self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getNSelections_ self
    fun getOffsetAtPoint self x y coords =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> AtkCoordType.C.withVal
         ---> FFI.Int32.fromVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> FFI.String.fromPtr true
      )
        getText_
        (
          self
           & startOffset
           & endOffset
        )
    fun removeSelection self selectionNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) removeSelection_ (self & selectionNum)
    fun setCaretOffset self offset = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) setCaretOffset_ (self & offset)
    fun setSelection self selectionNum startOffset endOffset =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> FFI.Bool.fromVal
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
