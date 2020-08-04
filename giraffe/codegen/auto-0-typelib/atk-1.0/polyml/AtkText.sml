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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_text_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addSelection_ =
        call (getSymbol "atk_text_add_selection")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
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
             --> AtkTextRangeRecordCPtrArray.PolyML.cOutPtr
          )
      val getCaretOffset_ = call (getSymbol "atk_text_get_caret_offset") (AtkTextClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getCharacterAtOffset_ = call (getSymbol "atk_text_get_character_at_offset") (AtkTextClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GChar.PolyML.cVal)
      val getCharacterCount_ = call (getSymbol "atk_text_get_character_count") (AtkTextClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getCharacterExtents_ =
        call (getSymbol "atk_text_get_character_extents")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> AtkCoordType.PolyML.cVal
             --> cVoid
          )
      val getNSelections_ = call (getSymbol "atk_text_get_n_selections") (AtkTextClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getOffsetAtPoint_ =
        call (getSymbol "atk_text_get_offset_at_point")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val getRangeExtents_ =
        call (getSymbol "atk_text_get_range_extents")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             &&> AtkTextRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getSelection_ =
        call (getSymbol "atk_text_get_selection")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> Utf8.PolyML.cOutPtr
          )
      val getStringAtOffset_ =
        call (getSymbol "atk_text_get_string_at_offset")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> AtkTextGranularity.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> Utf8.PolyML.cOutOptPtr
          )
      val getText_ =
        call (getSymbol "atk_text_get_text")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val getTextAfterOffset_ =
        call (getSymbol "atk_text_get_text_after_offset")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> AtkTextBoundary.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> Utf8.PolyML.cOutPtr
          )
      val getTextAtOffset_ =
        call (getSymbol "atk_text_get_text_at_offset")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> AtkTextBoundary.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> Utf8.PolyML.cOutPtr
          )
      val getTextBeforeOffset_ =
        call (getSymbol "atk_text_get_text_before_offset")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> AtkTextBoundary.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> Utf8.PolyML.cOutPtr
          )
      val removeSelection_ = call (getSymbol "atk_text_remove_selection") (AtkTextClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val setCaretOffset_ = call (getSymbol "atk_text_set_caret_offset") (AtkTextClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val setSelection_ =
        call (getSymbol "atk_text_set_selection")
          (
            AtkTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GBool.PolyML.cVal
          )
    end
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
