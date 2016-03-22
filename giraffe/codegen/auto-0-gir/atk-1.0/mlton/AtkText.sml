structure AtkText :>
  ATK_TEXT
    where type 'a class = 'a AtkTextClass.class
    where type text_range_t = AtkTextRangeRecord.t
    where type text_rectangle_t = AtkTextRectangleRecord.t
    where type coord_type_t = AtkCoordType.t =
  struct
    val getType_ = _import "atk_text_get_type" : unit -> GObjectType.C.val_;
    val freeRanges_ = _import "atk_text_free_ranges" : AtkTextRangeRecord.C.notnull AtkTextRangeRecord.C.p -> unit;
    val addSelection_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_text_add_selection" :
              AtkTextClass.C.notnull AtkTextClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getCaretOffset_ = _import "atk_text_get_caret_offset" : AtkTextClass.C.notnull AtkTextClass.C.p -> FFI.Int.C.val_;
    val getCharacterAtOffset_ = fn x1 & x2 => (_import "atk_text_get_character_at_offset" : AtkTextClass.C.notnull AtkTextClass.C.p * FFI.Int.C.val_ -> FFI.Char.C.val_;) (x1, x2)
    val getCharacterCount_ = _import "atk_text_get_character_count" : AtkTextClass.C.notnull AtkTextClass.C.p -> FFI.Int.C.val_;
    val getNSelections_ = _import "atk_text_get_n_selections" : AtkTextClass.C.notnull AtkTextClass.C.p -> FFI.Int.C.val_;
    val getOffsetAtPoint_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_text_get_offset_at_point" :
              AtkTextClass.C.notnull AtkTextClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * AtkCoordType.C.val_
               -> FFI.Int.C.val_;
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
              AtkTextClass.C.notnull AtkTextClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * AtkCoordType.C.val_
               * AtkTextRectangleRecord.C.notnull AtkTextRectangleRecord.C.p
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
              AtkTextClass.C.notnull AtkTextClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val removeSelection_ = fn x1 & x2 => (_import "atk_text_remove_selection" : AtkTextClass.C.notnull AtkTextClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val setCaretOffset_ = fn x1 & x2 => (_import "atk_text_set_caret_offset" : AtkTextClass.C.notnull AtkTextClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val setSelection_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_text_set_selection" :
              AtkTextClass.C.notnull AtkTextClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        addSelection_
        (
          self
           & startOffset
           & endOffset
        )
    fun getCaretOffset self = (AtkTextClass.C.withPtr ---> FFI.Int.C.fromVal) getCaretOffset_ self
    fun getCharacterAtOffset self offset = (AtkTextClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Char.C.fromVal) getCharacterAtOffset_ (self & offset)
    fun getCharacterCount self = (AtkTextClass.C.withPtr ---> FFI.Int.C.fromVal) getCharacterCount_ self
    fun getNSelections self = (AtkTextClass.C.withPtr ---> FFI.Int.C.fromVal) getNSelections_ self
    fun getOffsetAtPoint self x y coords =
      (
        AtkTextClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> AtkCoordType.C.withVal
         ---> FFI.Int.C.fromVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> Utf8.C.fromPtr true
      )
        getText_
        (
          self
           & startOffset
           & endOffset
        )
    fun removeSelection self selectionNum = (AtkTextClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) removeSelection_ (self & selectionNum)
    fun setCaretOffset self offset = (AtkTextClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) setCaretOffset_ (self & offset)
    fun setSelection self selectionNum startOffset endOffset =
      (
        AtkTextClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
