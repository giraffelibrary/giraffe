structure GtkTextBuffer :>
  GTK_TEXT_BUFFER
    where type 'a class = 'a GtkTextBufferClass.class
    where type 'a text_child_anchor_class = 'a GtkTextChildAnchorClass.class
    where type 'a text_mark_class = 'a GtkTextMarkClass.class
    where type 'a clipboard_class = 'a GtkClipboardClass.class
    where type text_iter_t = GtkTextIterRecord.t
    where type 'a text_tag_class = 'a GtkTextTagClass.class
    where type target_list_t = GtkTargetListRecord.t
    where type 'a text_tag_table_class = 'a GtkTextTagTableClass.class =
  struct
    structure GdkAtomRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GdkAtomRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GdkAtomRecordCVectorN = CVectorN(GdkAtomRecordCVectorNType)
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_text_buffer_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_text_buffer_new") (GtkTextTagTableClass.PolyML.cOptPtr --> GtkTextBufferClass.PolyML.cPtr)
      val addMark_ =
        call (getSymbol "gtk_text_buffer_add_mark")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextMarkClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val addSelectionClipboard_ = call (getSymbol "gtk_text_buffer_add_selection_clipboard") (GtkTextBufferClass.PolyML.cPtr &&> GtkClipboardClass.PolyML.cPtr --> cVoid)
      val applyTag_ =
        call (getSymbol "gtk_text_buffer_apply_tag")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextTagClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val applyTagByName_ =
        call (getSymbol "gtk_text_buffer_apply_tag_by_name")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val backspace_ =
        call (getSymbol "gtk_text_buffer_backspace")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val beginUserAction_ = call (getSymbol "gtk_text_buffer_begin_user_action") (GtkTextBufferClass.PolyML.cPtr --> cVoid)
      val copyClipboard_ = call (getSymbol "gtk_text_buffer_copy_clipboard") (GtkTextBufferClass.PolyML.cPtr &&> GtkClipboardClass.PolyML.cPtr --> cVoid)
      val createChildAnchor_ = call (getSymbol "gtk_text_buffer_create_child_anchor") (GtkTextBufferClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> GtkTextChildAnchorClass.PolyML.cPtr)
      val createMark_ =
        call (getSymbol "gtk_text_buffer_create_mark")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> GtkTextMarkClass.PolyML.cPtr
          )
      val cutClipboard_ =
        call (getSymbol "gtk_text_buffer_cut_clipboard")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkClipboardClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val delete_ =
        call (getSymbol "gtk_text_buffer_delete")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val deleteInteractive_ =
        call (getSymbol "gtk_text_buffer_delete_interactive")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val deleteMark_ = call (getSymbol "gtk_text_buffer_delete_mark") (GtkTextBufferClass.PolyML.cPtr &&> GtkTextMarkClass.PolyML.cPtr --> cVoid)
      val deleteMarkByName_ = call (getSymbol "gtk_text_buffer_delete_mark_by_name") (GtkTextBufferClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val deleteSelection_ =
        call (getSymbol "gtk_text_buffer_delete_selection")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val deserialize_ =
        call (getSymbol "gtk_text_buffer_deserialize")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextBufferClass.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val deserializeGetCanCreateTags_ = call (getSymbol "gtk_text_buffer_deserialize_get_can_create_tags") (GtkTextBufferClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val deserializeSetCanCreateTags_ =
        call (getSymbol "gtk_text_buffer_deserialize_set_can_create_tags")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val endUserAction_ = call (getSymbol "gtk_text_buffer_end_user_action") (GtkTextBufferClass.PolyML.cPtr --> cVoid)
      val getBounds_ =
        call (getSymbol "gtk_text_buffer_get_bounds")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val getCharCount_ = call (getSymbol "gtk_text_buffer_get_char_count") (GtkTextBufferClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getCopyTargetList_ = call (getSymbol "gtk_text_buffer_get_copy_target_list") (GtkTextBufferClass.PolyML.cPtr --> GtkTargetListRecord.PolyML.cPtr)
      val getDeserializeFormats_ = call (getSymbol "gtk_text_buffer_get_deserialize_formats") (GtkTextBufferClass.PolyML.cPtr &&> GInt.PolyML.cRef --> GdkAtomRecordCVectorN.PolyML.cOutPtr)
      val getEndIter_ = call (getSymbol "gtk_text_buffer_get_end_iter") (GtkTextBufferClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> cVoid)
      val getHasSelection_ = call (getSymbol "gtk_text_buffer_get_has_selection") (GtkTextBufferClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getInsert_ = call (getSymbol "gtk_text_buffer_get_insert") (GtkTextBufferClass.PolyML.cPtr --> GtkTextMarkClass.PolyML.cPtr)
      val getIterAtChildAnchor_ =
        call (getSymbol "gtk_text_buffer_get_iter_at_child_anchor")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextChildAnchorClass.PolyML.cPtr
             --> cVoid
          )
      val getIterAtLine_ =
        call (getSymbol "gtk_text_buffer_get_iter_at_line")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val getIterAtLineIndex_ =
        call (getSymbol "gtk_text_buffer_get_iter_at_line_index")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val getIterAtLineOffset_ =
        call (getSymbol "gtk_text_buffer_get_iter_at_line_offset")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val getIterAtMark_ =
        call (getSymbol "gtk_text_buffer_get_iter_at_mark")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextMarkClass.PolyML.cPtr
             --> cVoid
          )
      val getIterAtOffset_ =
        call (getSymbol "gtk_text_buffer_get_iter_at_offset")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val getLineCount_ = call (getSymbol "gtk_text_buffer_get_line_count") (GtkTextBufferClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMark_ = call (getSymbol "gtk_text_buffer_get_mark") (GtkTextBufferClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkTextMarkClass.PolyML.cPtr)
      val getModified_ = call (getSymbol "gtk_text_buffer_get_modified") (GtkTextBufferClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPasteTargetList_ = call (getSymbol "gtk_text_buffer_get_paste_target_list") (GtkTextBufferClass.PolyML.cPtr --> GtkTargetListRecord.PolyML.cPtr)
      val getSelectionBound_ = call (getSymbol "gtk_text_buffer_get_selection_bound") (GtkTextBufferClass.PolyML.cPtr --> GtkTextMarkClass.PolyML.cPtr)
      val getSelectionBounds_ =
        call (getSymbol "gtk_text_buffer_get_selection_bounds")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getSerializeFormats_ = call (getSymbol "gtk_text_buffer_get_serialize_formats") (GtkTextBufferClass.PolyML.cPtr &&> GInt.PolyML.cRef --> GdkAtomRecordCVectorN.PolyML.cOutPtr)
      val getSlice_ =
        call (getSymbol "gtk_text_buffer_get_slice")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val getStartIter_ = call (getSymbol "gtk_text_buffer_get_start_iter") (GtkTextBufferClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> cVoid)
      val getTagTable_ = call (getSymbol "gtk_text_buffer_get_tag_table") (GtkTextBufferClass.PolyML.cPtr --> GtkTextTagTableClass.PolyML.cPtr)
      val getText_ =
        call (getSymbol "gtk_text_buffer_get_text")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val insert_ =
        call (getSymbol "gtk_text_buffer_insert")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val insertAtCursor_ =
        call (getSymbol "gtk_text_buffer_insert_at_cursor")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val insertChildAnchor_ =
        call (getSymbol "gtk_text_buffer_insert_child_anchor")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextChildAnchorClass.PolyML.cPtr
             --> cVoid
          )
      val insertInteractive_ =
        call (getSymbol "gtk_text_buffer_insert_interactive")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val insertInteractiveAtCursor_ =
        call (getSymbol "gtk_text_buffer_insert_interactive_at_cursor")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val insertMarkup_ =
        call (getSymbol "gtk_text_buffer_insert_markup")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val insertPixbuf_ =
        call (getSymbol "gtk_text_buffer_insert_pixbuf")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             --> cVoid
          )
      val insertRange_ =
        call (getSymbol "gtk_text_buffer_insert_range")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val insertRangeInteractive_ =
        call (getSymbol "gtk_text_buffer_insert_range_interactive")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val moveMark_ =
        call (getSymbol "gtk_text_buffer_move_mark")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextMarkClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val moveMarkByName_ =
        call (getSymbol "gtk_text_buffer_move_mark_by_name")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val pasteClipboard_ =
        call (getSymbol "gtk_text_buffer_paste_clipboard")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkClipboardClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cOptPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val placeCursor_ = call (getSymbol "gtk_text_buffer_place_cursor") (GtkTextBufferClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> cVoid)
      val registerDeserializeTagset_ = call (getSymbol "gtk_text_buffer_register_deserialize_tagset") (GtkTextBufferClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> GdkAtomRecord.PolyML.cPtr)
      val registerSerializeTagset_ = call (getSymbol "gtk_text_buffer_register_serialize_tagset") (GtkTextBufferClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> GdkAtomRecord.PolyML.cPtr)
      val removeAllTags_ =
        call (getSymbol "gtk_text_buffer_remove_all_tags")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val removeSelectionClipboard_ = call (getSymbol "gtk_text_buffer_remove_selection_clipboard") (GtkTextBufferClass.PolyML.cPtr &&> GtkClipboardClass.PolyML.cPtr --> cVoid)
      val removeTag_ =
        call (getSymbol "gtk_text_buffer_remove_tag")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextTagClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val removeTagByName_ =
        call (getSymbol "gtk_text_buffer_remove_tag_by_name")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val selectRange_ =
        call (getSymbol "gtk_text_buffer_select_range")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val serialize_ =
        call (getSymbol "gtk_text_buffer_serialize")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextBufferClass.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GSize.PolyML.cRef
             --> GUInt8CVectorN.PolyML.cOutPtr
          )
      val setModified_ = call (getSymbol "gtk_text_buffer_set_modified") (GtkTextBufferClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setText_ =
        call (getSymbol "gtk_text_buffer_set_text")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val unregisterDeserializeFormat_ = call (getSymbol "gtk_text_buffer_unregister_deserialize_format") (GtkTextBufferClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> cVoid)
      val unregisterSerializeFormat_ = call (getSymbol "gtk_text_buffer_unregister_serialize_format") (GtkTextBufferClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkTextBufferClass.class
    type 'a text_child_anchor_class = 'a GtkTextChildAnchorClass.class
    type 'a text_mark_class = 'a GtkTextMarkClass.class
    type 'a clipboard_class = 'a GtkClipboardClass.class
    type text_iter_t = GtkTextIterRecord.t
    type 'a text_tag_class = 'a GtkTextTagClass.class
    type target_list_t = GtkTargetListRecord.t
    type 'a text_tag_table_class = 'a GtkTextTagTableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new table = (GtkTextTagTableClass.FFI.withOptPtr ---> GtkTextBufferClass.FFI.fromPtr true) new_ table
    fun addMark self (mark, where') =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextMarkClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        addMark_
        (
          self
           & mark
           & where'
        )
    fun addSelectionClipboard self clipboard = (GtkTextBufferClass.FFI.withPtr &&&> GtkClipboardClass.FFI.withPtr ---> I) addSelectionClipboard_ (self & clipboard)
    fun applyTag
      self
      (
        tag,
        start,
        end'
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextTagClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        applyTag_
        (
          self
           & tag
           & start
           & end'
        )
    fun applyTagByName
      self
      (
        name,
        start,
        end'
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        applyTagByName_
        (
          self
           & name
           & start
           & end'
        )
    fun backspace
      self
      (
        iter,
        interactive,
        defaultEditable
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        backspace_
        (
          self
           & iter
           & interactive
           & defaultEditable
        )
    fun beginUserAction self = (GtkTextBufferClass.FFI.withPtr ---> I) beginUserAction_ self
    fun copyClipboard self clipboard = (GtkTextBufferClass.FFI.withPtr &&&> GtkClipboardClass.FFI.withPtr ---> I) copyClipboard_ (self & clipboard)
    fun createChildAnchor self iter = (GtkTextBufferClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> GtkTextChildAnchorClass.FFI.fromPtr false) createChildAnchor_ (self & iter)
    fun createMark
      self
      (
        markName,
        where',
        leftGravity
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> GtkTextMarkClass.FFI.fromPtr false
      )
        createMark_
        (
          self
           & markName
           & where'
           & leftGravity
        )
    fun cutClipboard self (clipboard, defaultEditable) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkClipboardClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        cutClipboard_
        (
          self
           & clipboard
           & defaultEditable
        )
    fun delete self (start, end') =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        delete_
        (
          self
           & start
           & end'
        )
    fun deleteInteractive
      self
      (
        startIter,
        endIter,
        defaultEditable
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        deleteInteractive_
        (
          self
           & startIter
           & endIter
           & defaultEditable
        )
    fun deleteMark self mark = (GtkTextBufferClass.FFI.withPtr &&&> GtkTextMarkClass.FFI.withPtr ---> I) deleteMark_ (self & mark)
    fun deleteMarkByName self name = (GtkTextBufferClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) deleteMarkByName_ (self & name)
    fun deleteSelection self (interactive, defaultEditable) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        deleteSelection_
        (
          self
           & interactive
           & defaultEditable
        )
    fun deserialize
      self
      (
        contentBuffer,
        format,
        iter,
        data
      ) =
      let
        val length = LargeInt.fromInt (GUInt8CVectorN.length data)
        val () =
          (
            GtkTextBufferClass.FFI.withPtr
             &&&> GtkTextBufferClass.FFI.withPtr
             &&&> GdkAtomRecord.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> ignore
          )
            deserialize_
            (
              self
               & contentBuffer
               & format
               & iter
               & data
               & length
               & []
            )
      in
        ()
      end
    fun deserializeGetCanCreateTags self format = (GtkTextBufferClass.FFI.withPtr &&&> GdkAtomRecord.FFI.withPtr ---> GBool.FFI.fromVal) deserializeGetCanCreateTags_ (self & format)
    fun deserializeSetCanCreateTags self (format, canCreateTags) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GdkAtomRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        deserializeSetCanCreateTags_
        (
          self
           & format
           & canCreateTags
        )
    fun endUserAction self = (GtkTextBufferClass.FFI.withPtr ---> I) endUserAction_ self
    fun getBounds self =
      let
        val start
         & end'
         & () =
          (
            GtkTextBufferClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && I
          )
            getBounds_
            (
              self
               & ()
               & ()
            )
      in
        (start, end')
      end
    fun getCharCount self = (GtkTextBufferClass.FFI.withPtr ---> GInt.FFI.fromVal) getCharCount_ self
    fun getCopyTargetList self = (GtkTextBufferClass.FFI.withPtr ---> GtkTargetListRecord.FFI.fromPtr false) getCopyTargetList_ self
    fun getDeserializeFormats self =
      let
        val nFormats & retVal = (GtkTextBufferClass.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GdkAtomRecordCVectorN.FFI.fromPtr 1) getDeserializeFormats_ (self & GInt.null)
      in
        retVal (LargeInt.toInt nFormats)
      end
    fun getEndIter self =
      let
        val iter & () = (GtkTextBufferClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withNewPtr ---> GtkTextIterRecord.FFI.fromPtr true && I) getEndIter_ (self & ())
      in
        iter
      end
    fun getHasSelection self = (GtkTextBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasSelection_ self
    fun getInsert self = (GtkTextBufferClass.FFI.withPtr ---> GtkTextMarkClass.FFI.fromPtr false) getInsert_ self
    fun getIterAtChildAnchor self anchor =
      let
        val iter & () =
          (
            GtkTextBufferClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextChildAnchorClass.FFI.withPtr
             ---> GtkTextIterRecord.FFI.fromPtr true && I
          )
            getIterAtChildAnchor_
            (
              self
               & ()
               & anchor
            )
      in
        iter
      end
    fun getIterAtLine self lineNumber =
      let
        val iter & () =
          (
            GtkTextBufferClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GInt.FFI.withVal
             ---> GtkTextIterRecord.FFI.fromPtr true && I
          )
            getIterAtLine_
            (
              self
               & ()
               & lineNumber
            )
      in
        iter
      end
    fun getIterAtLineIndex self (lineNumber, byteIndex) =
      let
        val iter & () =
          (
            GtkTextBufferClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             ---> GtkTextIterRecord.FFI.fromPtr true && I
          )
            getIterAtLineIndex_
            (
              self
               & ()
               & lineNumber
               & byteIndex
            )
      in
        iter
      end
    fun getIterAtLineOffset self (lineNumber, charOffset) =
      let
        val iter & () =
          (
            GtkTextBufferClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             ---> GtkTextIterRecord.FFI.fromPtr true && I
          )
            getIterAtLineOffset_
            (
              self
               & ()
               & lineNumber
               & charOffset
            )
      in
        iter
      end
    fun getIterAtMark self mark =
      let
        val iter & () =
          (
            GtkTextBufferClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextMarkClass.FFI.withPtr
             ---> GtkTextIterRecord.FFI.fromPtr true && I
          )
            getIterAtMark_
            (
              self
               & ()
               & mark
            )
      in
        iter
      end
    fun getIterAtOffset self charOffset =
      let
        val iter & () =
          (
            GtkTextBufferClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GInt.FFI.withVal
             ---> GtkTextIterRecord.FFI.fromPtr true && I
          )
            getIterAtOffset_
            (
              self
               & ()
               & charOffset
            )
      in
        iter
      end
    fun getLineCount self = (GtkTextBufferClass.FFI.withPtr ---> GInt.FFI.fromVal) getLineCount_ self
    fun getMark self name = (GtkTextBufferClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkTextMarkClass.FFI.fromPtr false) getMark_ (self & name)
    fun getModified self = (GtkTextBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) getModified_ self
    fun getPasteTargetList self = (GtkTextBufferClass.FFI.withPtr ---> GtkTargetListRecord.FFI.fromPtr false) getPasteTargetList_ self
    fun getSelectionBound self = (GtkTextBufferClass.FFI.withPtr ---> GtkTextMarkClass.FFI.fromPtr false) getSelectionBound_ self
    fun getSelectionBounds self =
      let
        val start
         & end'
         & retVal =
          (
            GtkTextBufferClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            getSelectionBounds_
            (
              self
               & ()
               & ()
            )
      in
        if retVal then SOME (start, end') else NONE
      end
    fun getSerializeFormats self =
      let
        val nFormats & retVal = (GtkTextBufferClass.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GdkAtomRecordCVectorN.FFI.fromPtr 1) getSerializeFormats_ (self & GInt.null)
      in
        retVal (LargeInt.toInt nFormats)
      end
    fun getSlice
      self
      (
        start,
        end',
        includeHiddenChars
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        getSlice_
        (
          self
           & start
           & end'
           & includeHiddenChars
        )
    fun getStartIter self =
      let
        val iter & () = (GtkTextBufferClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withNewPtr ---> GtkTextIterRecord.FFI.fromPtr true && I) getStartIter_ (self & ())
      in
        iter
      end
    fun getTagTable self = (GtkTextBufferClass.FFI.withPtr ---> GtkTextTagTableClass.FFI.fromPtr false) getTagTable_ self
    fun getText
      self
      (
        start,
        end',
        includeHiddenChars
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        getText_
        (
          self
           & start
           & end'
           & includeHiddenChars
        )
    fun insert
      self
      (
        iter,
        text,
        len
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        insert_
        (
          self
           & iter
           & text
           & len
        )
    fun insertAtCursor self (text, len) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        insertAtCursor_
        (
          self
           & text
           & len
        )
    fun insertChildAnchor self (iter, anchor) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextChildAnchorClass.FFI.withPtr
         ---> I
      )
        insertChildAnchor_
        (
          self
           & iter
           & anchor
        )
    fun insertInteractive
      self
      (
        iter,
        text,
        len,
        defaultEditable
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        insertInteractive_
        (
          self
           & iter
           & text
           & len
           & defaultEditable
        )
    fun insertInteractiveAtCursor
      self
      (
        text,
        len,
        defaultEditable
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        insertInteractiveAtCursor_
        (
          self
           & text
           & len
           & defaultEditable
        )
    fun insertMarkup
      self
      (
        iter,
        markup,
        len
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        insertMarkup_
        (
          self
           & iter
           & markup
           & len
        )
    fun insertPixbuf self (iter, pixbuf) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         ---> I
      )
        insertPixbuf_
        (
          self
           & iter
           & pixbuf
        )
    fun insertRange
      self
      (
        iter,
        start,
        end'
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        insertRange_
        (
          self
           & iter
           & start
           & end'
        )
    fun insertRangeInteractive
      self
      (
        iter,
        start,
        end',
        defaultEditable
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        insertRangeInteractive_
        (
          self
           & iter
           & start
           & end'
           & defaultEditable
        )
    fun moveMark self (mark, where') =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextMarkClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        moveMark_
        (
          self
           & mark
           & where'
        )
    fun moveMarkByName self (name, where') =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        moveMarkByName_
        (
          self
           & name
           & where'
        )
    fun pasteClipboard
      self
      (
        clipboard,
        overrideLocation,
        defaultEditable
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkClipboardClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withOptPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        pasteClipboard_
        (
          self
           & clipboard
           & overrideLocation
           & defaultEditable
        )
    fun placeCursor self where' = (GtkTextBufferClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> I) placeCursor_ (self & where')
    fun registerDeserializeTagset self tagsetName = (GtkTextBufferClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> GdkAtomRecord.FFI.fromPtr false) registerDeserializeTagset_ (self & tagsetName)
    fun registerSerializeTagset self tagsetName = (GtkTextBufferClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> GdkAtomRecord.FFI.fromPtr false) registerSerializeTagset_ (self & tagsetName)
    fun removeAllTags self (start, end') =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        removeAllTags_
        (
          self
           & start
           & end'
        )
    fun removeSelectionClipboard self clipboard = (GtkTextBufferClass.FFI.withPtr &&&> GtkClipboardClass.FFI.withPtr ---> I) removeSelectionClipboard_ (self & clipboard)
    fun removeTag
      self
      (
        tag,
        start,
        end'
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextTagClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        removeTag_
        (
          self
           & tag
           & start
           & end'
        )
    fun removeTagByName
      self
      (
        name,
        start,
        end'
      ) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        removeTagByName_
        (
          self
           & name
           & start
           & end'
        )
    fun selectRange self (ins, bound) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        selectRange_
        (
          self
           & ins
           & bound
        )
    fun serialize
      self
      (
        contentBuffer,
        format,
        start,
        end'
      ) =
      let
        val length & retVal =
          (
            GtkTextBufferClass.FFI.withPtr
             &&&> GtkTextBufferClass.FFI.withPtr
             &&&> GdkAtomRecord.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             ---> GSize.FFI.fromVal && GUInt8CVectorN.FFI.fromPtr 1
          )
            serialize_
            (
              self
               & contentBuffer
               & format
               & start
               & end'
               & GSize.null
            )
      in
        retVal (LargeInt.toInt length)
      end
    fun setModified self setting = (GtkTextBufferClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setModified_ (self & setting)
    fun setText self (text, len) =
      (
        GtkTextBufferClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & len
        )
    fun unregisterDeserializeFormat self format = (GtkTextBufferClass.FFI.withPtr &&&> GdkAtomRecord.FFI.withPtr ---> I) unregisterDeserializeFormat_ (self & format)
    fun unregisterSerializeFormat self format = (GtkTextBufferClass.FFI.withPtr &&&> GdkAtomRecord.FFI.withPtr ---> I) unregisterSerializeFormat_ (self & format)
    local
      open ClosureMarshal Signal
    in
      fun applyTagSig f =
        signal "apply-tag"
          (
            get 0w1 GtkTextTagClass.t
             &&&> get 0w2 GtkTextIterRecord.t
             &&&> get 0w3 GtkTextIterRecord.t
             ---> ret_void
          )
          (
            fn
              tag
               & start
               & end' =>
                f
                  (
                    tag,
                    start,
                    end'
                  )
          )
      fun beginUserActionSig f = signal "begin-user-action" (void ---> ret_void) f
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun deleteRangeSig f = signal "delete-range" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GtkTextIterRecord.t ---> ret_void) (fn start & end' => f (start, end'))
      fun endUserActionSig f = signal "end-user-action" (void ---> ret_void) f
      fun insertChildAnchorSig f = signal "insert-child-anchor" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GtkTextChildAnchorClass.t ---> ret_void) (fn location & anchor => f (location, anchor))
      fun insertPixbufSig f = signal "insert-pixbuf" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GdkPixbufPixbufClass.t ---> ret_void) (fn location & pixbuf => f (location, pixbuf))
      fun insertTextSig f =
        signal "insert-text"
          (
            get 0w1 GtkTextIterRecord.t
             &&&> get 0w2 string
             &&&> get 0w3 int
             ---> ret_void
          )
          (
            fn
              location
               & text
               & len =>
                f
                  (
                    location,
                    text,
                    len
                  )
          )
      fun markDeletedSig f = signal "mark-deleted" (get 0w1 GtkTextMarkClass.t ---> ret_void) f
      fun markSetSig f = signal "mark-set" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GtkTextMarkClass.t ---> ret_void) (fn location & mark => f (location, mark))
      fun modifiedChangedSig f = signal "modified-changed" (void ---> ret_void) f
      fun pasteDoneSig f = signal "paste-done" (get 0w1 GtkClipboardClass.t ---> ret_void) f
      fun removeTagSig f =
        signal "remove-tag"
          (
            get 0w1 GtkTextTagClass.t
             &&&> get 0w2 GtkTextIterRecord.t
             &&&> get 0w3 GtkTextIterRecord.t
             ---> ret_void
          )
          (
            fn
              tag
               & start
               & end' =>
                f
                  (
                    tag,
                    start,
                    end'
                  )
          )
    end
    local
      open Property
    in
      val copyTargetListProp = {get = fn x => get "copy-target-list" GtkTargetListRecord.tOpt x}
      val cursorPositionProp = {get = fn x => get "cursor-position" int x}
      val hasSelectionProp = {get = fn x => get "has-selection" boolean x}
      val pasteTargetListProp = {get = fn x => get "paste-target-list" GtkTargetListRecord.tOpt x}
      val tagTableProp =
        {
          get = fn x => get "tag-table" GtkTextTagTableClass.tOpt x,
          set = fn x => set "tag-table" GtkTextTagTableClass.tOpt x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
    end
  end
