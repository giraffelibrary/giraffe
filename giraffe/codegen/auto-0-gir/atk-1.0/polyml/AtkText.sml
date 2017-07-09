structure AtkText :>
  ATK_TEXT
    where type 'a class = 'a AtkTextClass.class
    where type text_range_t = AtkTextRangeRecord.t
    where type text_clip_type_t = AtkTextClipType.t
    where type text_rectangle_t = AtkTextRectangleRecord.t
    where type coord_type_t = AtkCoordType.t =
  struct
    structure AtkTextRangeRecordCVectorType =
      CPointerCVectorType(
        structure CElemType = AtkTextRangeRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure AtkTextRangeRecordCVector = CVector(AtkTextRangeRecordCVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_text_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val freeRanges_ = call (getSymbol "atk_text_free_ranges") (AtkTextRangeRecord.PolyML.cPtr --> cVoid)
      val addSelection_ =
        call (getSymbol "atk_text_add_selection")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val getBoundedRanges_ =
        call (getSymbol "atk_text_get_bounded_ranges")
          (
            AtkTextClass.PolyML.cPtr
             &&> AtkTextRectangleRecord.PolyML.cPtr
             &&> AtkCoordType.PolyML.cVal
             &&> AtkTextClipType.PolyML.cVal
             &&> AtkTextClipType.PolyML.cVal
             --> AtkTextRangeRecordCVector.PolyML.cOutPtr
          )
      val getCaretOffset_ = call (getSymbol "atk_text_get_caret_offset") (AtkTextClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getCharacterAtOffset_ = call (getSymbol "atk_text_get_character_at_offset") (AtkTextClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GChar.PolyML.cVal)
      val getCharacterCount_ = call (getSymbol "atk_text_get_character_count") (AtkTextClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getNSelections_ = call (getSymbol "atk_text_get_n_selections") (AtkTextClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getOffsetAtPoint_ =
        call (getSymbol "atk_text_get_offset_at_point")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val getRangeExtents_ =
        call (getSymbol "atk_text_get_range_extents")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             &&> AtkTextRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getText_ =
        call (getSymbol "atk_text_get_text")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val removeSelection_ = call (getSymbol "atk_text_remove_selection") (AtkTextClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val setCaretOffset_ = call (getSymbol "atk_text_set_caret_offset") (AtkTextClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val setSelection_ =
        call (getSymbol "atk_text_set_selection")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a AtkTextClass.class
    type text_range_t = AtkTextRangeRecord.t
    type text_clip_type_t = AtkTextClipType.t
    type text_rectangle_t = AtkTextRectangleRecord.t
    type coord_type_t = AtkCoordType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun freeRanges ranges = (AtkTextRangeRecord.FFI.withPtr ---> I) freeRanges_ ranges
    fun addSelection self startOffset endOffset =
      (
        AtkTextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        addSelection_
        (
          self
           & startOffset
           & endOffset
        )
    fun getBoundedRanges self rect coordType xClipType yClipType =
      (
        AtkTextClass.FFI.withPtr
         &&&> AtkTextRectangleRecord.FFI.withPtr
         &&&> AtkCoordType.FFI.withVal
         &&&> AtkTextClipType.FFI.withVal
         &&&> AtkTextClipType.FFI.withVal
         ---> AtkTextRangeRecordCVector.FFI.fromPtr 2
      )
        getBoundedRanges_
        (
          self
           & rect
           & coordType
           & xClipType
           & yClipType
        )
    fun getCaretOffset self = (AtkTextClass.FFI.withPtr ---> GInt.FFI.fromVal) getCaretOffset_ self
    fun getCharacterAtOffset self offset = (AtkTextClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GChar.FFI.fromVal) getCharacterAtOffset_ (self & offset)
    fun getCharacterCount self = (AtkTextClass.FFI.withPtr ---> GInt.FFI.fromVal) getCharacterCount_ self
    fun getNSelections self = (AtkTextClass.FFI.withPtr ---> GInt.FFI.fromVal) getNSelections_ self
    fun getOffsetAtPoint self x y coords =
      (
        AtkTextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> AtkCoordType.FFI.withVal
         ---> GInt.FFI.fromVal
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
        AtkTextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> AtkCoordType.FFI.withVal
         &&&> AtkTextRectangleRecord.FFI.withPtr
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
        AtkTextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        getText_
        (
          self
           & startOffset
           & endOffset
        )
    fun removeSelection self selectionNum = (AtkTextClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) removeSelection_ (self & selectionNum)
    fun setCaretOffset self offset = (AtkTextClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) setCaretOffset_ (self & offset)
    fun setSelection self selectionNum startOffset endOffset =
      (
        AtkTextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
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
