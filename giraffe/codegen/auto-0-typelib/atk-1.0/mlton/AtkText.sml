structure AtkText :>
  ATK_TEXT
    where type 'a class = 'a AtkTextClass.class
    where type text_range_record_c_ptr_array_t = AtkTextRangeRecordCPtrArray.t
    where type text_clip_type_t = AtkTextClipType.t
    where type text_rectangle_t = AtkTextRectangleRecord.t
    where type coord_type_t = AtkCoordType.t
    where type text_granularity_t = AtkTextGranularity.t
    where type text_boundary_t = AtkTextBoundary.t =
  struct
    val getType_ = _import "atk_text_get_type" : unit -> GObjectType.FFI.val_;
    val addSelection_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_text_add_selection" :
              AtkTextClass.FFI.non_opt AtkTextClass.FFI.p
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
              AtkTextClass.FFI.non_opt AtkTextClass.FFI.p
               * AtkTextRectangleRecord.FFI.non_opt AtkTextRectangleRecord.FFI.p
               * AtkCoordType.FFI.val_
               * AtkTextClipType.FFI.val_
               * AtkTextClipType.FFI.val_
               -> AtkTextRangeRecordCPtrArray.FFI.non_opt AtkTextRangeRecordCPtrArray.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getCaretOffset_ = _import "atk_text_get_caret_offset" : AtkTextClass.FFI.non_opt AtkTextClass.FFI.p -> GInt32.FFI.val_;
    val getCharacterAtOffset_ = fn x1 & x2 => (_import "atk_text_get_character_at_offset" : AtkTextClass.FFI.non_opt AtkTextClass.FFI.p * GInt32.FFI.val_ -> GChar.FFI.val_;) (x1, x2)
    val getCharacterCount_ = _import "atk_text_get_character_count" : AtkTextClass.FFI.non_opt AtkTextClass.FFI.p -> GInt32.FFI.val_;
    val getCharacterExtents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "atk_text_get_character_extents" :
              AtkTextClass.FFI.non_opt AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * AtkCoordType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getNSelections_ = _import "atk_text_get_n_selections" : AtkTextClass.FFI.non_opt AtkTextClass.FFI.p -> GInt32.FFI.val_;
    val getOffsetAtPoint_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_text_get_offset_at_point" :
              AtkTextClass.FFI.non_opt AtkTextClass.FFI.p
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
              AtkTextClass.FFI.non_opt AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * AtkCoordType.FFI.val_
               * AtkTextRectangleRecord.FFI.non_opt AtkTextRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getSelection_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_text_get_selection" :
              AtkTextClass.FFI.non_opt AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getStringAtOffset_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "atk_text_get_string_at_offset" :
              AtkTextClass.FFI.non_opt AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * AtkTextGranularity.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> Utf8.FFI.opt Utf8.FFI.out_p;
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
              AtkTextClass.FFI.non_opt AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getTextAfterOffset_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "atk_text_get_text_after_offset" :
              AtkTextClass.FFI.non_opt AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * AtkTextBoundary.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getTextAtOffset_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "atk_text_get_text_at_offset" :
              AtkTextClass.FFI.non_opt AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * AtkTextBoundary.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getTextBeforeOffset_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "atk_text_get_text_before_offset" :
              AtkTextClass.FFI.non_opt AtkTextClass.FFI.p
               * GInt32.FFI.val_
               * AtkTextBoundary.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val removeSelection_ = fn x1 & x2 => (_import "atk_text_remove_selection" : AtkTextClass.FFI.non_opt AtkTextClass.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val setCaretOffset_ = fn x1 & x2 => (_import "atk_text_set_caret_offset" : AtkTextClass.FFI.non_opt AtkTextClass.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val setSelection_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_text_set_selection" :
              AtkTextClass.FFI.non_opt AtkTextClass.FFI.p
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
    type text_range_record_c_ptr_array_t = AtkTextRangeRecordCPtrArray.t
    type text_clip_type_t = AtkTextClipType.t
    type text_rectangle_t = AtkTextRectangleRecord.t
    type coord_type_t = AtkCoordType.t
    type text_granularity_t = AtkTextGranularity.t
    type text_boundary_t = AtkTextBoundary.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addSelection self (startOffset, endOffset) =
      (
        AtkTextClass.FFI.withPtr false
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
    fun getBoundedRanges
      self
      (
        rect,
        coordType,
        xClipType,
        yClipType
      ) =
      (
        AtkTextClass.FFI.withPtr false
         &&&> AtkTextRectangleRecord.FFI.withPtr false
         &&&> AtkCoordType.FFI.withVal
         &&&> AtkTextClipType.FFI.withVal
         &&&> AtkTextClipType.FFI.withVal
         ---> AtkTextRangeRecordCPtrArray.FFI.fromPtr ~1
      )
        getBoundedRanges_
        (
          self
           & rect
           & coordType
           & xClipType
           & yClipType
        )
    fun getCaretOffset self = (AtkTextClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getCaretOffset_ self
    fun getCharacterAtOffset self offset = (AtkTextClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GChar.FFI.fromVal) getCharacterAtOffset_ (self & offset)
    fun getCharacterCount self = (AtkTextClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getCharacterCount_ self
    fun getCharacterExtents self (offset, coords) =
      let
        val x
         & y
         & width
         & height
         & () =
          (
            AtkTextClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> AtkCoordType.FFI.withVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getCharacterExtents_
            (
              self
               & offset
               & GInt32.null
               & GInt32.null
               & GInt32.null
               & GInt32.null
               & coords
            )
      in
        (
          x,
          y,
          width,
          height
        )
      end
    fun getNSelections self = (AtkTextClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNSelections_ self
    fun getOffsetAtPoint
      self
      (
        x,
        y,
        coords
      ) =
      (
        AtkTextClass.FFI.withPtr false
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
    fun getRangeExtents
      self
      (
        startOffset,
        endOffset,
        coordType
      ) =
      let
        val rect & () =
          (
            AtkTextClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> AtkCoordType.FFI.withVal
             &&&> AtkTextRectangleRecord.FFI.withNewPtr
             ---> AtkTextRectangleRecord.FFI.fromPtr true && I
          )
            getRangeExtents_
            (
              self
               & startOffset
               & endOffset
               & coordType
               & ()
            )
      in
        rect
      end
    fun getSelection self selectionNum =
      let
        val startOffset
         & endOffset
         & retVal =
          (
            AtkTextClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
          )
            getSelection_
            (
              self
               & selectionNum
               & GInt32.null
               & GInt32.null
            )
      in
        (
          retVal,
          startOffset,
          endOffset
        )
      end
    fun getStringAtOffset self (offset, granularity) =
      let
        val startOffset
         & endOffset
         & retVal =
          (
            AtkTextClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> AtkTextGranularity.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && Utf8.FFI.fromOptPtr ~1
          )
            getStringAtOffset_
            (
              self
               & offset
               & granularity
               & GInt32.null
               & GInt32.null
            )
      in
        (
          retVal,
          startOffset,
          endOffset
        )
      end
    fun getText self (startOffset, endOffset) =
      (
        AtkTextClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> Utf8.FFI.fromPtr ~1
      )
        getText_
        (
          self
           & startOffset
           & endOffset
        )
    fun getTextAfterOffset self (offset, boundaryType) =
      let
        val startOffset
         & endOffset
         & retVal =
          (
            AtkTextClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> AtkTextBoundary.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
          )
            getTextAfterOffset_
            (
              self
               & offset
               & boundaryType
               & GInt32.null
               & GInt32.null
            )
      in
        (
          retVal,
          startOffset,
          endOffset
        )
      end
    fun getTextAtOffset self (offset, boundaryType) =
      let
        val startOffset
         & endOffset
         & retVal =
          (
            AtkTextClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> AtkTextBoundary.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
          )
            getTextAtOffset_
            (
              self
               & offset
               & boundaryType
               & GInt32.null
               & GInt32.null
            )
      in
        (
          retVal,
          startOffset,
          endOffset
        )
      end
    fun getTextBeforeOffset self (offset, boundaryType) =
      let
        val startOffset
         & endOffset
         & retVal =
          (
            AtkTextClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> AtkTextBoundary.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
          )
            getTextBeforeOffset_
            (
              self
               & offset
               & boundaryType
               & GInt32.null
               & GInt32.null
            )
      in
        (
          retVal,
          startOffset,
          endOffset
        )
      end
    fun removeSelection self selectionNum = (AtkTextClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) removeSelection_ (self & selectionNum)
    fun setCaretOffset self offset = (AtkTextClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) setCaretOffset_ (self & offset)
    fun setSelection
      self
      (
        selectionNum,
        startOffset,
        endOffset
      ) =
      (
        AtkTextClass.FFI.withPtr false
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
      fun textChangedSig f = signal "text-changed" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn arg1 & arg2 => f (arg1, arg2))
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
              arg1
               & arg2
               & arg3 =>
                f
                  (
                    arg1,
                    arg2,
                    arg3
                  )
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
              arg1
               & arg2
               & arg3 =>
                f
                  (
                    arg1,
                    arg2,
                    arg3
                  )
          )
      fun textSelectionChangedSig f = signal "text-selection-changed" (void ---> ret_void) f
    end
  end
