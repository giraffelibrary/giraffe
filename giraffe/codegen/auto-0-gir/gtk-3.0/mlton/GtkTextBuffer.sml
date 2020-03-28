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
    val getType_ = _import "gtk_text_buffer_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_text_buffer_new" : unit GtkTextTagTableClass.FFI.p -> GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p;
    val addMark_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_add_mark" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextMarkClass.FFI.notnull GtkTextMarkClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addSelectionClipboard_ = fn x1 & x2 => (_import "gtk_text_buffer_add_selection_clipboard" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GtkClipboardClass.FFI.notnull GtkClipboardClass.FFI.p -> unit;) (x1, x2)
    val applyTag_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_apply_tag" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextTagClass.FFI.notnull GtkTextTagClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val applyTagByName_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_text_buffer_apply_tag_by_name" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val backspace_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_backspace" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val beginUserAction_ = _import "gtk_text_buffer_begin_user_action" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> unit;
    val copyClipboard_ = fn x1 & x2 => (_import "gtk_text_buffer_copy_clipboard" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GtkClipboardClass.FFI.notnull GtkClipboardClass.FFI.p -> unit;) (x1, x2)
    val createChildAnchor_ = fn x1 & x2 => (_import "gtk_text_buffer_create_child_anchor" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GtkTextChildAnchorClass.FFI.notnull GtkTextChildAnchorClass.FFI.p;) (x1, x2)
    val createMark_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_text_buffer_create_mark" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GBool.FFI.val_
               -> GtkTextMarkClass.FFI.notnull GtkTextMarkClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val cutClipboard_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_cut_clipboard" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkClipboardClass.FFI.notnull GtkClipboardClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val delete_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_delete" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val deleteInteractive_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_delete_interactive" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val deleteMark_ = fn x1 & x2 => (_import "gtk_text_buffer_delete_mark" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GtkTextMarkClass.FFI.notnull GtkTextMarkClass.FFI.p -> unit;) (x1, x2)
    val deleteMarkByName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_text_buffer_delete_mark_by_name" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val deleteSelection_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_delete_selection" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val deserialize_ =
      fn
        x1
         & x2
         & x3
         & x4
         & (x5, x6)
         & x7
         & x8 =>
          (
            _import "mlton_gtk_text_buffer_deserialize" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.notnull GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val deserializeGetCanCreateTags_ = fn x1 & x2 => (_import "gtk_text_buffer_deserialize_get_can_create_tags" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val deserializeSetCanCreateTags_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_deserialize_set_can_create_tags" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val endUserAction_ = _import "gtk_text_buffer_end_user_action" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> unit;
    val getBounds_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_get_bounds" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getCharCount_ = _import "gtk_text_buffer_get_char_count" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> GInt.FFI.val_;
    val getCopyTargetList_ = _import "gtk_text_buffer_get_copy_target_list" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p;
    val getDeserializeFormats_ = fn x1 & x2 => (_import "gtk_text_buffer_get_deserialize_formats" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GInt.FFI.ref_ -> GdkAtomRecordCArrayN.FFI.notnull GdkAtomRecordCArrayN.FFI.out_p;) (x1, x2)
    val getEndIter_ = fn x1 & x2 => (_import "gtk_text_buffer_get_end_iter" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> unit;) (x1, x2)
    val getHasSelection_ = _import "gtk_text_buffer_get_has_selection" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> GBool.FFI.val_;
    val getInsert_ = _import "gtk_text_buffer_get_insert" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> GtkTextMarkClass.FFI.notnull GtkTextMarkClass.FFI.p;
    val getIterAtChildAnchor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_get_iter_at_child_anchor" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextChildAnchorClass.FFI.notnull GtkTextChildAnchorClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getIterAtLine_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_get_iter_at_line" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getIterAtLineIndex_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_get_iter_at_line_index" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getIterAtLineOffset_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_get_iter_at_line_offset" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getIterAtMark_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_get_iter_at_mark" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextMarkClass.FFI.notnull GtkTextMarkClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getIterAtOffset_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_get_iter_at_offset" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getLineCount_ = _import "gtk_text_buffer_get_line_count" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> GInt.FFI.val_;
    val getMark_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_text_buffer_get_mark" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit GtkTextMarkClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getModified_ = _import "gtk_text_buffer_get_modified" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> GBool.FFI.val_;
    val getPasteTargetList_ = _import "gtk_text_buffer_get_paste_target_list" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p;
    val getSelectionBound_ = _import "gtk_text_buffer_get_selection_bound" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> GtkTextMarkClass.FFI.notnull GtkTextMarkClass.FFI.p;
    val getSelectionBounds_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_get_selection_bounds" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getSerializeFormats_ = fn x1 & x2 => (_import "gtk_text_buffer_get_serialize_formats" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GInt.FFI.ref_ -> GdkAtomRecordCArrayN.FFI.notnull GdkAtomRecordCArrayN.FFI.out_p;) (x1, x2)
    val getSlice_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_get_slice" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GBool.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getStartIter_ = fn x1 & x2 => (_import "gtk_text_buffer_get_start_iter" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> unit;) (x1, x2)
    val getTagTable_ = _import "gtk_text_buffer_get_tag_table" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p -> GtkTextTagTableClass.FFI.notnull GtkTextTagTableClass.FFI.p;
    val getText_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_get_text" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GBool.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val insert_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_text_buffer_insert" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val insertAtCursor_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_text_buffer_insert_at_cursor" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val insertChildAnchor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_insert_child_anchor" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextChildAnchorClass.FFI.notnull GtkTextChildAnchorClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val insertInteractive_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_gtk_text_buffer_insert_interactive" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val insertInteractiveAtCursor_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_text_buffer_insert_interactive_at_cursor" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val insertMarkup_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_text_buffer_insert_markup" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val insertPixbuf_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_insert_pixbuf" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val insertRange_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_insert_range" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val insertRangeInteractive_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_text_buffer_insert_range_interactive" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val moveMark_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_move_mark" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextMarkClass.FFI.notnull GtkTextMarkClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val moveMarkByName_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_text_buffer_move_mark_by_name" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val pasteClipboard_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_paste_clipboard" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkClipboardClass.FFI.notnull GtkClipboardClass.FFI.p
               * unit GtkTextIterRecord.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val placeCursor_ = fn x1 & x2 => (_import "gtk_text_buffer_place_cursor" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> unit;) (x1, x2)
    val registerDeserializeTagset_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_text_buffer_register_deserialize_tagset" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val registerSerializeTagset_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_text_buffer_register_serialize_tagset" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val removeAllTags_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_remove_all_tags" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeSelectionClipboard_ = fn x1 & x2 => (_import "gtk_text_buffer_remove_selection_clipboard" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GtkClipboardClass.FFI.notnull GtkClipboardClass.FFI.p -> unit;) (x1, x2)
    val removeTag_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_remove_tag" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextTagClass.FFI.notnull GtkTextTagClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val removeTagByName_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_text_buffer_remove_tag_by_name" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val selectRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_select_range" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val serialize_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_text_buffer_serialize" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GSize.FFI.ref_
               -> GUInt8CArrayN.FFI.notnull GUInt8CArrayN.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setModified_ = fn x1 & x2 => (_import "gtk_text_buffer_set_modified" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setText_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_text_buffer_set_text" :
              GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val unregisterDeserializeFormat_ = fn x1 & x2 => (_import "gtk_text_buffer_unregister_deserialize_format" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p -> unit;) (x1, x2)
    val unregisterSerializeFormat_ = fn x1 & x2 => (_import "gtk_text_buffer_unregister_serialize_format" : GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p -> unit;) (x1, x2)
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
        val length = LargeInt.fromInt (GUInt8CArrayN.length data)
        val () =
          (
            GtkTextBufferClass.FFI.withPtr
             &&&> GtkTextBufferClass.FFI.withPtr
             &&&> GdkAtomRecord.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
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
        val nFormats & retVal = (GtkTextBufferClass.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GdkAtomRecordCArrayN.FFI.fromPtr 1) getDeserializeFormats_ (self & GInt.null)
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
    fun getMark self name = (GtkTextBufferClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkTextMarkClass.FFI.fromOptPtr false) getMark_ (self & name)
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
        val nFormats & retVal = (GtkTextBufferClass.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GdkAtomRecordCArrayN.FFI.fromPtr 1) getSerializeFormats_ (self & GInt.null)
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
             ---> GSize.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr 1
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
          new = fn x => new "tag-table" GtkTextTagTableClass.tOpt x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x,
          new = fn x => new "text" stringOpt x
        }
    end
  end
