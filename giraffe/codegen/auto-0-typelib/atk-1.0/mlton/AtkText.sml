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
    val getType_ = _import "atk_text_get_type" : unit -> GObjectType.FFI.val_;
    val freeRanges_ = _import "atk_text_free_ranges" : AtkTextRangeRecord.FFI.notnull AtkTextRangeRecord.FFI.p -> unit;
    val addSelection_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_text_add_selection" :
              AtkTextClass.FFI.notnull AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getBoundedRanges_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "atk_text_get_bounded_ranges" :
              AtkTextClass.FFI.notnull AtkTextClass.FFI.p
               * AtkTextRectangleRecord.FFI.notnull AtkTextRectangleRecord.FFI.p
               * AtkCoordType.FFI.val_
               * AtkTextClipType.FFI.val_
               * AtkTextClipType.FFI.val_
               -> AtkTextRangeRecordCVector.FFI.notnull AtkTextRangeRecordCVector.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getCaretOffset_ = _import "atk_text_get_caret_offset" : AtkTextClass.FFI.notnull AtkTextClass.FFI.p -> GInt32.FFI.val_;
    val getCharacterAtOffset_ = fn x1 & x2 => (_import "atk_text_get_character_at_offset" : AtkTextClass.FFI.notnull AtkTextClass.FFI.p * GInt32.FFI.val_ -> GChar.FFI.val_;) (x1, x2)
    val getCharacterCount_ = _import "atk_text_get_character_count" : AtkTextClass.FFI.notnull AtkTextClass.FFI.p -> GInt32.FFI.val_;
    val getNSelections_ = _import "atk_text_get_n_selections" : AtkTextClass.FFI.notnull AtkTextClass.FFI.p -> GInt32.FFI.val_;
    val getOffsetAtPoint_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_text_get_offset_at_point" :
              AtkTextClass.FFI.notnull AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * AtkCoordType.FFI.val_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getRangeExtents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "atk_text_get_range_extents" :
              AtkTextClass.FFI.notnull AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * AtkCoordType.FFI.val_
               * AtkTextRectangleRecord.FFI.notnull AtkTextRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getText_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_text_get_text" :
              AtkTextClass.FFI.notnull AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val removeSelection_ = fn x1 & x2 => (_import "atk_text_remove_selection" : AtkTextClass.FFI.notnull AtkTextClass.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val setCaretOffset_ = fn x1 & x2 => (_import "atk_text_set_caret_offset" : AtkTextClass.FFI.notnull AtkTextClass.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val setSelection_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_text_set_selection" :
              AtkTextClass.FFI.notnull AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
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
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
    fun getCaretOffset self = (AtkTextClass.FFI.withPtr ---> GInt32.FFI.fromVal) getCaretOffset_ self
    fun getCharacterAtOffset self offset = (AtkTextClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GChar.FFI.fromVal) getCharacterAtOffset_ (self & offset)
    fun getCharacterCount self = (AtkTextClass.FFI.withPtr ---> GInt32.FFI.fromVal) getCharacterCount_ self
    fun getNSelections self = (AtkTextClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNSelections_ self
    fun getOffsetAtPoint self x y coords =
      (
        AtkTextClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> AtkCoordType.FFI.withVal
         ---> GInt32.FFI.fromVal
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
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        getText_
        (
          self
           & startOffset
           & endOffset
        )
    fun removeSelection self selectionNum = (AtkTextClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) removeSelection_ (self & selectionNum)
    fun setCaretOffset self offset = (AtkTextClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) setCaretOffset_ (self & offset)
    fun setSelection self selectionNum startOffset endOffset =
      (
        AtkTextClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
