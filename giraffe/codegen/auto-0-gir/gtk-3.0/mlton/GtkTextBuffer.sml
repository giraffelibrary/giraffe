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
    val getType_ = _import "gtk_text_buffer_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_text_buffer_new" : unit GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addMark_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_add_mark" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addSelectionClipboard_ = fn x1 & x2 => (_import "gtk_text_buffer_add_selection_clipboard" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val applyTag_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_apply_tag" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val beginUserAction_ = _import "gtk_text_buffer_begin_user_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val copyClipboard_ = fn x1 & x2 => (_import "gtk_text_buffer_copy_clipboard" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val createChildAnchor_ = fn x1 & x2 => (_import "gtk_text_buffer_create_child_anchor" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val createMark_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_text_buffer_create_mark" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * FFI.Bool.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * FFI.Bool.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val deleteMark_ = fn x1 & x2 => (_import "gtk_text_buffer_delete_mark" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val deleteMarkByName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_text_buffer_delete_mark_by_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val deserializeGetCanCreateTags_ = fn x1 & x2 => (_import "gtk_text_buffer_deserialize_get_can_create_tags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val deserializeSetCanCreateTags_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_deserialize_set_can_create_tags" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GdkAtomRecord.C.notnull GdkAtomRecord.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val endUserAction_ = _import "gtk_text_buffer_end_user_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getBounds_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_get_bounds" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getCharCount_ = _import "gtk_text_buffer_get_char_count" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getCopyTargetList_ = _import "gtk_text_buffer_get_copy_target_list" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p;
    val getEndIter_ = fn x1 & x2 => (_import "gtk_text_buffer_get_end_iter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> unit;) (x1, x2)
    val getHasSelection_ = _import "gtk_text_buffer_get_has_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getInsert_ = _import "gtk_text_buffer_get_insert" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getIterAtChildAnchor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_get_iter_at_child_anchor" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * FFI.Int.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getLineCount_ = _import "gtk_text_buffer_get_line_count" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getMark_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_text_buffer_get_mark" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getModified_ = _import "gtk_text_buffer_get_modified" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getPasteTargetList_ = _import "gtk_text_buffer_get_paste_target_list" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p;
    val getSelectionBound_ = _import "gtk_text_buffer_get_selection_bound" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSelectionBounds_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_buffer_get_selection_bounds" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getSlice_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_get_slice" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * FFI.Bool.C.val_
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getStartIter_ = fn x1 & x2 => (_import "gtk_text_buffer_get_start_iter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> unit;) (x1, x2)
    val getTagTable_ = _import "gtk_text_buffer_get_tag_table" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getText_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_get_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * FFI.Bool.C.val_
               -> Utf8.C.notnull Utf8.C.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               * FFI.Bool.C.val_
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               * FFI.Bool.C.val_
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * FFI.Bool.C.val_
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GtkTextIterRecord.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val placeCursor_ = fn x1 & x2 => (_import "gtk_text_buffer_place_cursor" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> unit;) (x1, x2)
    val registerDeserializeTagset_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_text_buffer_register_deserialize_tagset" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GdkAtomRecord.C.notnull GdkAtomRecord.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GdkAtomRecord.C.notnull GdkAtomRecord.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeSelectionClipboard_ = fn x1 & x2 => (_import "gtk_text_buffer_remove_selection_clipboard" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val removeTag_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_buffer_remove_tag" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setModified_ = fn x1 & x2 => (_import "gtk_text_buffer_set_modified" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setText_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_text_buffer_set_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val unregisterDeserializeFormat_ = fn x1 & x2 => (_import "gtk_text_buffer_unregister_deserialize_format" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> unit;) (x1, x2)
    val unregisterSerializeFormat_ = fn x1 & x2 => (_import "gtk_text_buffer_unregister_serialize_format" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> unit;) (x1, x2)
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
    fun new table = (GObjectObjectClass.C.withOptPtr ---> GtkTextBufferClass.C.fromPtr true) new_ table
    fun addMark self mark where' =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        addMark_
        (
          self
           & mark
           & where'
        )
    fun addSelectionClipboard self clipboard = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addSelectionClipboard_ (self & clipboard)
    fun applyTag self tag start end' =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun beginUserAction self = (GObjectObjectClass.C.withPtr ---> I) beginUserAction_ self
    fun copyClipboard self clipboard = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) copyClipboard_ (self & clipboard)
    fun createChildAnchor self iter = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> GtkTextChildAnchorClass.C.fromPtr false) createChildAnchor_ (self & iter)
    fun createMark self markName where' leftGravity =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun deleteMark self mark = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) deleteMark_ (self & mark)
    fun deleteMarkByName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) deleteMarkByName_ (self & name)
    fun deleteSelection self interactive defaultEditable =
      (
        GObjectObjectClass.C.withPtr
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
    fun deserializeGetCanCreateTags self format = (GObjectObjectClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> FFI.Bool.C.fromVal) deserializeGetCanCreateTags_ (self & format)
    fun deserializeSetCanCreateTags self format canCreateTags =
      (
        GObjectObjectClass.C.withPtr
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
    fun endUserAction self = (GObjectObjectClass.C.withPtr ---> I) endUserAction_ self
    fun getBounds self =
      let
        val start
         & end'
         & () =
          (
            GObjectObjectClass.C.withPtr
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
    fun getCharCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getCharCount_ self
    fun getCopyTargetList self = (GObjectObjectClass.C.withPtr ---> GtkTargetListRecord.C.fromPtr false) getCopyTargetList_ self
    fun getEndIter self =
      let
        val iter & () = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withNewPtr ---> GtkTextIterRecord.C.fromPtr true && I) getEndIter_ (self & ())
      in
        iter
      end
    fun getHasSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasSelection_ self
    fun getInsert self = (GObjectObjectClass.C.withPtr ---> GtkTextMarkClass.C.fromPtr false) getInsert_ self
    fun getIterAtChildAnchor self anchor =
      let
        val iter & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> FFI.Int.C.withVal
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
            GObjectObjectClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
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
            GObjectObjectClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
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
            GObjectObjectClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> FFI.Int.C.withVal
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
    fun getLineCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getLineCount_ self
    fun getMark self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkTextMarkClass.C.fromPtr false) getMark_ (self & name)
    fun getModified self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getModified_ self
    fun getPasteTargetList self = (GObjectObjectClass.C.withPtr ---> GtkTargetListRecord.C.fromPtr false) getPasteTargetList_ self
    fun getSelectionBound self = (GObjectObjectClass.C.withPtr ---> GtkTextMarkClass.C.fromPtr false) getSelectionBound_ self
    fun getSelectionBounds self =
      let
        val start
         & end'
         & retVal =
          (
            GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        val iter & () = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withNewPtr ---> GtkTextIterRecord.C.fromPtr true && I) getStartIter_ (self & ())
      in
        iter
      end
    fun getTagTable self = (GObjectObjectClass.C.withPtr ---> GtkTextTagTableClass.C.fromPtr false) getTagTable_ self
    fun getText self start end' includeHiddenChars =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun placeCursor self where' = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> I) placeCursor_ (self & where')
    fun registerDeserializeTagset self tagsetName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> GdkAtomRecord.C.fromPtr false) registerDeserializeTagset_ (self & tagsetName)
    fun registerSerializeTagset self tagsetName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> GdkAtomRecord.C.fromPtr false) registerSerializeTagset_ (self & tagsetName)
    fun removeAllTags self start end' =
      (
        GObjectObjectClass.C.withPtr
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
    fun removeSelectionClipboard self clipboard = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeSelectionClipboard_ (self & clipboard)
    fun removeTag self tag start end' =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun setModified self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setModified_ (self & setting)
    fun setText self text len =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & len
        )
    fun unregisterDeserializeFormat self format = (GObjectObjectClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> I) unregisterDeserializeFormat_ (self & format)
    fun unregisterSerializeFormat self format = (GObjectObjectClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> I) unregisterSerializeFormat_ (self & format)
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
