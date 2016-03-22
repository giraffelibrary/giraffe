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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_buffer_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_text_buffer_new") (GtkTextTagTableClass.PolyML.cOptPtr --> GtkTextBufferClass.PolyML.cPtr)
      val addMark_ =
        call (load_sym libgtk "gtk_text_buffer_add_mark")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextMarkClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val addSelectionClipboard_ = call (load_sym libgtk "gtk_text_buffer_add_selection_clipboard") (GtkTextBufferClass.PolyML.cPtr &&> GtkClipboardClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val applyTag_ =
        call (load_sym libgtk "gtk_text_buffer_apply_tag")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextTagClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val applyTagByName_ =
        call (load_sym libgtk "gtk_text_buffer_apply_tag_by_name")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val backspace_ =
        call (load_sym libgtk "gtk_text_buffer_backspace")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val beginUserAction_ = call (load_sym libgtk "gtk_text_buffer_begin_user_action") (GtkTextBufferClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val copyClipboard_ = call (load_sym libgtk "gtk_text_buffer_copy_clipboard") (GtkTextBufferClass.PolyML.cPtr &&> GtkClipboardClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val createChildAnchor_ = call (load_sym libgtk "gtk_text_buffer_create_child_anchor") (GtkTextBufferClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> GtkTextChildAnchorClass.PolyML.cPtr)
      val createMark_ =
        call (load_sym libgtk "gtk_text_buffer_create_mark")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> GtkTextMarkClass.PolyML.cPtr
          )
      val cutClipboard_ =
        call (load_sym libgtk "gtk_text_buffer_cut_clipboard")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkClipboardClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val delete_ =
        call (load_sym libgtk "gtk_text_buffer_delete")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val deleteInteractive_ =
        call (load_sym libgtk "gtk_text_buffer_delete_interactive")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val deleteMark_ = call (load_sym libgtk "gtk_text_buffer_delete_mark") (GtkTextBufferClass.PolyML.cPtr &&> GtkTextMarkClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val deleteMarkByName_ = call (load_sym libgtk "gtk_text_buffer_delete_mark_by_name") (GtkTextBufferClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val deleteSelection_ =
        call (load_sym libgtk "gtk_text_buffer_delete_selection")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val deserializeGetCanCreateTags_ = call (load_sym libgtk "gtk_text_buffer_deserialize_get_can_create_tags") (GtkTextBufferClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val deserializeSetCanCreateTags_ =
        call (load_sym libgtk "gtk_text_buffer_deserialize_set_can_create_tags")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val endUserAction_ = call (load_sym libgtk "gtk_text_buffer_end_user_action") (GtkTextBufferClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getBounds_ =
        call (load_sym libgtk "gtk_text_buffer_get_bounds")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getCharCount_ = call (load_sym libgtk "gtk_text_buffer_get_char_count") (GtkTextBufferClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getCopyTargetList_ = call (load_sym libgtk "gtk_text_buffer_get_copy_target_list") (GtkTextBufferClass.PolyML.cPtr --> GtkTargetListRecord.PolyML.cPtr)
      val getEndIter_ = call (load_sym libgtk "gtk_text_buffer_get_end_iter") (GtkTextBufferClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getHasSelection_ = call (load_sym libgtk "gtk_text_buffer_get_has_selection") (GtkTextBufferClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getInsert_ = call (load_sym libgtk "gtk_text_buffer_get_insert") (GtkTextBufferClass.PolyML.cPtr --> GtkTextMarkClass.PolyML.cPtr)
      val getIterAtChildAnchor_ =
        call (load_sym libgtk "gtk_text_buffer_get_iter_at_child_anchor")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextChildAnchorClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getIterAtLine_ =
        call (load_sym libgtk "gtk_text_buffer_get_iter_at_line")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getIterAtLineIndex_ =
        call (load_sym libgtk "gtk_text_buffer_get_iter_at_line_index")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getIterAtLineOffset_ =
        call (load_sym libgtk "gtk_text_buffer_get_iter_at_line_offset")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getIterAtMark_ =
        call (load_sym libgtk "gtk_text_buffer_get_iter_at_mark")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextMarkClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getIterAtOffset_ =
        call (load_sym libgtk "gtk_text_buffer_get_iter_at_offset")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getLineCount_ = call (load_sym libgtk "gtk_text_buffer_get_line_count") (GtkTextBufferClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getMark_ = call (load_sym libgtk "gtk_text_buffer_get_mark") (GtkTextBufferClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkTextMarkClass.PolyML.cPtr)
      val getModified_ = call (load_sym libgtk "gtk_text_buffer_get_modified") (GtkTextBufferClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPasteTargetList_ = call (load_sym libgtk "gtk_text_buffer_get_paste_target_list") (GtkTextBufferClass.PolyML.cPtr --> GtkTargetListRecord.PolyML.cPtr)
      val getSelectionBound_ = call (load_sym libgtk "gtk_text_buffer_get_selection_bound") (GtkTextBufferClass.PolyML.cPtr --> GtkTextMarkClass.PolyML.cPtr)
      val getSelectionBounds_ =
        call (load_sym libgtk "gtk_text_buffer_get_selection_bounds")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val getSlice_ =
        call (load_sym libgtk "gtk_text_buffer_get_slice")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val getStartIter_ = call (load_sym libgtk "gtk_text_buffer_get_start_iter") (GtkTextBufferClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getTagTable_ = call (load_sym libgtk "gtk_text_buffer_get_tag_table") (GtkTextBufferClass.PolyML.cPtr --> GtkTextTagTableClass.PolyML.cPtr)
      val getText_ =
        call (load_sym libgtk "gtk_text_buffer_get_text")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val insert_ =
        call (load_sym libgtk "gtk_text_buffer_insert")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val insertAtCursor_ =
        call (load_sym libgtk "gtk_text_buffer_insert_at_cursor")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val insertChildAnchor_ =
        call (load_sym libgtk "gtk_text_buffer_insert_child_anchor")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextChildAnchorClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val insertInteractive_ =
        call (load_sym libgtk "gtk_text_buffer_insert_interactive")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val insertInteractiveAtCursor_ =
        call (load_sym libgtk "gtk_text_buffer_insert_interactive_at_cursor")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val insertPixbuf_ =
        call (load_sym libgtk "gtk_text_buffer_insert_pixbuf")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val insertRange_ =
        call (load_sym libgtk "gtk_text_buffer_insert_range")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val insertRangeInteractive_ =
        call (load_sym libgtk "gtk_text_buffer_insert_range_interactive")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val moveMark_ =
        call (load_sym libgtk "gtk_text_buffer_move_mark")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextMarkClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val moveMarkByName_ =
        call (load_sym libgtk "gtk_text_buffer_move_mark_by_name")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val pasteClipboard_ =
        call (load_sym libgtk "gtk_text_buffer_paste_clipboard")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkClipboardClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cOptPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val placeCursor_ = call (load_sym libgtk "gtk_text_buffer_place_cursor") (GtkTextBufferClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val registerDeserializeTagset_ = call (load_sym libgtk "gtk_text_buffer_register_deserialize_tagset") (GtkTextBufferClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> GdkAtomRecord.PolyML.cPtr)
      val registerSerializeTagset_ = call (load_sym libgtk "gtk_text_buffer_register_serialize_tagset") (GtkTextBufferClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> GdkAtomRecord.PolyML.cPtr)
      val removeAllTags_ =
        call (load_sym libgtk "gtk_text_buffer_remove_all_tags")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val removeSelectionClipboard_ = call (load_sym libgtk "gtk_text_buffer_remove_selection_clipboard") (GtkTextBufferClass.PolyML.cPtr &&> GtkClipboardClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val removeTag_ =
        call (load_sym libgtk "gtk_text_buffer_remove_tag")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextTagClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val removeTagByName_ =
        call (load_sym libgtk "gtk_text_buffer_remove_tag_by_name")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val selectRange_ =
        call (load_sym libgtk "gtk_text_buffer_select_range")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val setModified_ = call (load_sym libgtk "gtk_text_buffer_set_modified") (GtkTextBufferClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setText_ =
        call (load_sym libgtk "gtk_text_buffer_set_text")
          (
            GtkTextBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val unregisterDeserializeFormat_ = call (load_sym libgtk "gtk_text_buffer_unregister_deserialize_format") (GtkTextBufferClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unregisterSerializeFormat_ = call (load_sym libgtk "gtk_text_buffer_unregister_serialize_format") (GtkTextBufferClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
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
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new table = (GtkTextTagTableClass.C.withOptPtr ---> GtkTextBufferClass.C.fromPtr true) new_ table
    fun addMark self mark where' =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextMarkClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        addMark_
        (
          self
           & mark
           & where'
        )
    fun addSelectionClipboard self clipboard = (GtkTextBufferClass.C.withPtr &&&> GtkClipboardClass.C.withPtr ---> I) addSelectionClipboard_ (self & clipboard)
    fun applyTag self tag start end' =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextTagClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        applyTag_
        (
          self
           & tag
           & start
           & end'
        )
    fun applyTagByName self name start end' =
      (
        GtkTextBufferClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        applyTagByName_
        (
          self
           & name
           & start
           & end'
        )
    fun backspace self iter interactive defaultEditable =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        backspace_
        (
          self
           & iter
           & interactive
           & defaultEditable
        )
    fun beginUserAction self = (GtkTextBufferClass.C.withPtr ---> I) beginUserAction_ self
    fun copyClipboard self clipboard = (GtkTextBufferClass.C.withPtr &&&> GtkClipboardClass.C.withPtr ---> I) copyClipboard_ (self & clipboard)
    fun createChildAnchor self iter = (GtkTextBufferClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> GtkTextChildAnchorClass.C.fromPtr false) createChildAnchor_ (self & iter)
    fun createMark self markName where' leftGravity =
      (
        GtkTextBufferClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> GtkTextMarkClass.C.fromPtr false
      )
        createMark_
        (
          self
           & markName
           & where'
           & leftGravity
        )
    fun cutClipboard self clipboard defaultEditable =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkClipboardClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        cutClipboard_
        (
          self
           & clipboard
           & defaultEditable
        )
    fun delete self start end' =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        delete_
        (
          self
           & start
           & end'
        )
    fun deleteInteractive self startIter endIter defaultEditable =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        deleteInteractive_
        (
          self
           & startIter
           & endIter
           & defaultEditable
        )
    fun deleteMark self mark = (GtkTextBufferClass.C.withPtr &&&> GtkTextMarkClass.C.withPtr ---> I) deleteMark_ (self & mark)
    fun deleteMarkByName self name = (GtkTextBufferClass.C.withPtr &&&> Utf8.C.withPtr ---> I) deleteMarkByName_ (self & name)
    fun deleteSelection self interactive defaultEditable =
      (
        GtkTextBufferClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        deleteSelection_
        (
          self
           & interactive
           & defaultEditable
        )
    fun deserializeGetCanCreateTags self format = (GtkTextBufferClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> FFI.Bool.C.fromVal) deserializeGetCanCreateTags_ (self & format)
    fun deserializeSetCanCreateTags self format canCreateTags =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        deserializeSetCanCreateTags_
        (
          self
           & format
           & canCreateTags
        )
    fun endUserAction self = (GtkTextBufferClass.C.withPtr ---> I) endUserAction_ self
    fun getBounds self =
      let
        val start
         & end'
         & () =
          (
            GtkTextBufferClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             ---> GtkTextIterRecord.C.fromPtr true
                   && GtkTextIterRecord.C.fromPtr true
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
    fun getCharCount self = (GtkTextBufferClass.C.withPtr ---> FFI.Int32.C.fromVal) getCharCount_ self
    fun getCopyTargetList self = (GtkTextBufferClass.C.withPtr ---> GtkTargetListRecord.C.fromPtr false) getCopyTargetList_ self
    fun getEndIter self =
      let
        val iter & () = (GtkTextBufferClass.C.withPtr &&&> GtkTextIterRecord.C.withNewPtr ---> GtkTextIterRecord.C.fromPtr true && I) getEndIter_ (self & ())
      in
        iter
      end
    fun getHasSelection self = (GtkTextBufferClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasSelection_ self
    fun getInsert self = (GtkTextBufferClass.C.withPtr ---> GtkTextMarkClass.C.fromPtr false) getInsert_ self
    fun getIterAtChildAnchor self anchor =
      let
        val iter & () =
          (
            GtkTextBufferClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GtkTextChildAnchorClass.C.withPtr
             ---> GtkTextIterRecord.C.fromPtr true && I
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
            GtkTextBufferClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> FFI.Int32.C.withVal
             ---> GtkTextIterRecord.C.fromPtr true && I
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
    fun getIterAtLineIndex self lineNumber byteIndex =
      let
        val iter & () =
          (
            GtkTextBufferClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             ---> GtkTextIterRecord.C.fromPtr true && I
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
    fun getIterAtLineOffset self lineNumber charOffset =
      let
        val iter & () =
          (
            GtkTextBufferClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             ---> GtkTextIterRecord.C.fromPtr true && I
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
            GtkTextBufferClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GtkTextMarkClass.C.withPtr
             ---> GtkTextIterRecord.C.fromPtr true && I
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
            GtkTextBufferClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> FFI.Int32.C.withVal
             ---> GtkTextIterRecord.C.fromPtr true && I
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
    fun getLineCount self = (GtkTextBufferClass.C.withPtr ---> FFI.Int32.C.fromVal) getLineCount_ self
    fun getMark self name = (GtkTextBufferClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkTextMarkClass.C.fromPtr false) getMark_ (self & name)
    fun getModified self = (GtkTextBufferClass.C.withPtr ---> FFI.Bool.C.fromVal) getModified_ self
    fun getPasteTargetList self = (GtkTextBufferClass.C.withPtr ---> GtkTargetListRecord.C.fromPtr false) getPasteTargetList_ self
    fun getSelectionBound self = (GtkTextBufferClass.C.withPtr ---> GtkTextMarkClass.C.fromPtr false) getSelectionBound_ self
    fun getSelectionBounds self =
      let
        val start
         & end'
         & retVal =
          (
            GtkTextBufferClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             ---> GtkTextIterRecord.C.fromPtr true
                   && GtkTextIterRecord.C.fromPtr true
                   && FFI.Bool.C.fromVal
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
    fun getSlice self start end' includeHiddenChars =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> Utf8.C.fromPtr true
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
        val iter & () = (GtkTextBufferClass.C.withPtr &&&> GtkTextIterRecord.C.withNewPtr ---> GtkTextIterRecord.C.fromPtr true && I) getStartIter_ (self & ())
      in
        iter
      end
    fun getTagTable self = (GtkTextBufferClass.C.withPtr ---> GtkTextTagTableClass.C.fromPtr false) getTagTable_ self
    fun getText self start end' includeHiddenChars =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> Utf8.C.fromPtr true
      )
        getText_
        (
          self
           & start
           & end'
           & includeHiddenChars
        )
    fun insert self iter text len =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        insert_
        (
          self
           & iter
           & text
           & len
        )
    fun insertAtCursor self text len =
      (
        GtkTextBufferClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        insertAtCursor_
        (
          self
           & text
           & len
        )
    fun insertChildAnchor self iter anchor =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextChildAnchorClass.C.withPtr
         ---> I
      )
        insertChildAnchor_
        (
          self
           & iter
           & anchor
        )
    fun insertInteractive self iter text len defaultEditable =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        insertInteractive_
        (
          self
           & iter
           & text
           & len
           & defaultEditable
        )
    fun insertInteractiveAtCursor self text len defaultEditable =
      (
        GtkTextBufferClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        insertInteractiveAtCursor_
        (
          self
           & text
           & len
           & defaultEditable
        )
    fun insertPixbuf self iter pixbuf =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GdkPixbufPixbufClass.C.withPtr
         ---> I
      )
        insertPixbuf_
        (
          self
           & iter
           & pixbuf
        )
    fun insertRange self iter start end' =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        insertRange_
        (
          self
           & iter
           & start
           & end'
        )
    fun insertRangeInteractive self iter start end' defaultEditable =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        insertRangeInteractive_
        (
          self
           & iter
           & start
           & end'
           & defaultEditable
        )
    fun moveMark self mark where' =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextMarkClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        moveMark_
        (
          self
           & mark
           & where'
        )
    fun moveMarkByName self name where' =
      (
        GtkTextBufferClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        moveMarkByName_
        (
          self
           & name
           & where'
        )
    fun pasteClipboard self clipboard overrideLocation defaultEditable =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkClipboardClass.C.withPtr
         &&&> GtkTextIterRecord.C.withOptPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        pasteClipboard_
        (
          self
           & clipboard
           & overrideLocation
           & defaultEditable
        )
    fun placeCursor self where' = (GtkTextBufferClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> I) placeCursor_ (self & where')
    fun registerDeserializeTagset self tagsetName = (GtkTextBufferClass.C.withPtr &&&> Utf8.C.withOptPtr ---> GdkAtomRecord.C.fromPtr false) registerDeserializeTagset_ (self & tagsetName)
    fun registerSerializeTagset self tagsetName = (GtkTextBufferClass.C.withPtr &&&> Utf8.C.withOptPtr ---> GdkAtomRecord.C.fromPtr false) registerSerializeTagset_ (self & tagsetName)
    fun removeAllTags self start end' =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        removeAllTags_
        (
          self
           & start
           & end'
        )
    fun removeSelectionClipboard self clipboard = (GtkTextBufferClass.C.withPtr &&&> GtkClipboardClass.C.withPtr ---> I) removeSelectionClipboard_ (self & clipboard)
    fun removeTag self tag start end' =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextTagClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        removeTag_
        (
          self
           & tag
           & start
           & end'
        )
    fun removeTagByName self name start end' =
      (
        GtkTextBufferClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        removeTagByName_
        (
          self
           & name
           & start
           & end'
        )
    fun selectRange self ins bound =
      (
        GtkTextBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        selectRange_
        (
          self
           & ins
           & bound
        )
    fun setModified self setting = (GtkTextBufferClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setModified_ (self & setting)
    fun setText self text len =
      (
        GtkTextBufferClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & len
        )
    fun unregisterDeserializeFormat self format = (GtkTextBufferClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> I) unregisterDeserializeFormat_ (self & format)
    fun unregisterSerializeFormat self format = (GtkTextBufferClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> I) unregisterSerializeFormat_ (self & format)
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
                f tag start end'
          )
      fun beginUserActionSig f = signal "begin-user-action" (void ---> ret_void) f
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun deleteRangeSig f = signal "delete-range" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GtkTextIterRecord.t ---> ret_void) (fn start & end' => f start end')
      fun endUserActionSig f = signal "end-user-action" (void ---> ret_void) f
      fun insertChildAnchorSig f = signal "insert-child-anchor" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GtkTextChildAnchorClass.t ---> ret_void) (fn location & anchor => f location anchor)
      fun insertPixbufSig f = signal "insert-pixbuf" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GdkPixbufPixbufClass.t ---> ret_void) (fn location & pixbuf => f location pixbuf)
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
                f location text len
          )
      fun markDeletedSig f = signal "mark-deleted" (get 0w1 GtkTextMarkClass.t ---> ret_void) f
      fun markSetSig f = signal "mark-set" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GtkTextMarkClass.t ---> ret_void) (fn location & mark => f location mark)
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
                f tag start end'
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
