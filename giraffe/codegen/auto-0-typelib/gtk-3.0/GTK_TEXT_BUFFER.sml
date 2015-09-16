signature GTK_TEXT_BUFFER =
  sig
    type 'a class_t
    type 'a text_child_anchor_class_t
    type 'a text_mark_class_t
    type 'a clipboard_class_t
    type text_iter_record_t
    type 'a text_tag_class_t
    type target_list_record_t
    type 'a text_tag_table_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : 'a text_tag_table_class_t option -> base class_t
    val addMark :
      'a class_t
       -> 'b text_mark_class_t
       -> text_iter_record_t
       -> unit
    val addSelectionClipboard :
      'a class_t
       -> 'b clipboard_class_t
       -> unit
    val applyTag :
      'a class_t
       -> 'b text_tag_class_t
       -> text_iter_record_t
       -> text_iter_record_t
       -> unit
    val applyTagByName :
      'a class_t
       -> string
       -> text_iter_record_t
       -> text_iter_record_t
       -> unit
    val backspace :
      'a class_t
       -> text_iter_record_t
       -> bool
       -> bool
       -> bool
    val beginUserAction : 'a class_t -> unit
    val copyClipboard :
      'a class_t
       -> 'b clipboard_class_t
       -> unit
    val createChildAnchor :
      'a class_t
       -> text_iter_record_t
       -> base text_child_anchor_class_t
    val createMark :
      'a class_t
       -> string option
       -> text_iter_record_t
       -> bool
       -> base text_mark_class_t
    val cutClipboard :
      'a class_t
       -> 'b clipboard_class_t
       -> bool
       -> unit
    val delete :
      'a class_t
       -> text_iter_record_t
       -> text_iter_record_t
       -> unit
    val deleteInteractive :
      'a class_t
       -> text_iter_record_t
       -> text_iter_record_t
       -> bool
       -> bool
    val deleteMark :
      'a class_t
       -> 'b text_mark_class_t
       -> unit
    val deleteMarkByName :
      'a class_t
       -> string
       -> unit
    val deleteSelection :
      'a class_t
       -> bool
       -> bool
       -> bool
    val deserializeGetCanCreateTags :
      'a class_t
       -> Gdk.AtomRecord.t
       -> bool
    val deserializeSetCanCreateTags :
      'a class_t
       -> Gdk.AtomRecord.t
       -> bool
       -> unit
    val endUserAction : 'a class_t -> unit
    val getBounds : 'a class_t -> text_iter_record_t * text_iter_record_t
    val getCharCount : 'a class_t -> LargeInt.int
    val getCopyTargetList : 'a class_t -> target_list_record_t
    val getEndIter : 'a class_t -> text_iter_record_t
    val getHasSelection : 'a class_t -> bool
    val getInsert : 'a class_t -> base text_mark_class_t
    val getIterAtChildAnchor :
      'a class_t
       -> 'b text_child_anchor_class_t
       -> text_iter_record_t
    val getIterAtLine :
      'a class_t
       -> LargeInt.int
       -> text_iter_record_t
    val getIterAtLineIndex :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> text_iter_record_t
    val getIterAtLineOffset :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> text_iter_record_t
    val getIterAtMark :
      'a class_t
       -> 'b text_mark_class_t
       -> text_iter_record_t
    val getIterAtOffset :
      'a class_t
       -> LargeInt.int
       -> text_iter_record_t
    val getLineCount : 'a class_t -> LargeInt.int
    val getMark :
      'a class_t
       -> string
       -> base text_mark_class_t
    val getModified : 'a class_t -> bool
    val getPasteTargetList : 'a class_t -> target_list_record_t
    val getSelectionBound : 'a class_t -> base text_mark_class_t
    val getSelectionBounds : 'a class_t -> (text_iter_record_t * text_iter_record_t) option
    val getSlice :
      'a class_t
       -> text_iter_record_t
       -> text_iter_record_t
       -> bool
       -> string
    val getStartIter : 'a class_t -> text_iter_record_t
    val getTagTable : 'a class_t -> base text_tag_table_class_t
    val getText :
      'a class_t
       -> text_iter_record_t
       -> text_iter_record_t
       -> bool
       -> string
    val insert :
      'a class_t
       -> text_iter_record_t
       -> string
       -> LargeInt.int
       -> unit
    val insertAtCursor :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val insertChildAnchor :
      'a class_t
       -> text_iter_record_t
       -> 'b text_child_anchor_class_t
       -> unit
    val insertInteractive :
      'a class_t
       -> text_iter_record_t
       -> string
       -> LargeInt.int
       -> bool
       -> bool
    val insertInteractiveAtCursor :
      'a class_t
       -> string
       -> LargeInt.int
       -> bool
       -> bool
    val insertPixbuf :
      'a class_t
       -> text_iter_record_t
       -> 'b GdkPixbuf.PixbufClass.t
       -> unit
    val insertRange :
      'a class_t
       -> text_iter_record_t
       -> text_iter_record_t
       -> text_iter_record_t
       -> unit
    val insertRangeInteractive :
      'a class_t
       -> text_iter_record_t
       -> text_iter_record_t
       -> text_iter_record_t
       -> bool
       -> bool
    val moveMark :
      'a class_t
       -> 'b text_mark_class_t
       -> text_iter_record_t
       -> unit
    val moveMarkByName :
      'a class_t
       -> string
       -> text_iter_record_t
       -> unit
    val pasteClipboard :
      'a class_t
       -> 'b clipboard_class_t
       -> text_iter_record_t option
       -> bool
       -> unit
    val placeCursor :
      'a class_t
       -> text_iter_record_t
       -> unit
    val registerDeserializeTagset :
      'a class_t
       -> string option
       -> Gdk.AtomRecord.t
    val registerSerializeTagset :
      'a class_t
       -> string option
       -> Gdk.AtomRecord.t
    val removeAllTags :
      'a class_t
       -> text_iter_record_t
       -> text_iter_record_t
       -> unit
    val removeSelectionClipboard :
      'a class_t
       -> 'b clipboard_class_t
       -> unit
    val removeTag :
      'a class_t
       -> 'b text_tag_class_t
       -> text_iter_record_t
       -> text_iter_record_t
       -> unit
    val removeTagByName :
      'a class_t
       -> string
       -> text_iter_record_t
       -> text_iter_record_t
       -> unit
    val selectRange :
      'a class_t
       -> text_iter_record_t
       -> text_iter_record_t
       -> unit
    val setModified :
      'a class_t
       -> bool
       -> unit
    val setText :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val unregisterDeserializeFormat :
      'a class_t
       -> Gdk.AtomRecord.t
       -> unit
    val unregisterSerializeFormat :
      'a class_t
       -> Gdk.AtomRecord.t
       -> unit
    val applyTagSig :
      (base text_tag_class_t
        -> text_iter_record_t
        -> text_iter_record_t
        -> unit)
       -> 'a class_t Signal.signal
    val beginUserActionSig : (unit -> unit) -> 'a class_t Signal.signal
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val deleteRangeSig :
      (text_iter_record_t
        -> text_iter_record_t
        -> unit)
       -> 'a class_t Signal.signal
    val endUserActionSig : (unit -> unit) -> 'a class_t Signal.signal
    val insertChildAnchorSig :
      (text_iter_record_t
        -> base text_child_anchor_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val insertPixbufSig :
      (text_iter_record_t
        -> base GdkPixbuf.PixbufClass.t
        -> unit)
       -> 'a class_t Signal.signal
    val insertTextSig :
      (text_iter_record_t
        -> string
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val markDeletedSig : (base text_mark_class_t -> unit) -> 'a class_t Signal.signal
    val markSetSig :
      (text_iter_record_t
        -> base text_mark_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val modifiedChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val pasteDoneSig : (base clipboard_class_t -> unit) -> 'a class_t Signal.signal
    val removeTagSig :
      (base text_tag_class_t
        -> text_iter_record_t
        -> text_iter_record_t
        -> unit)
       -> 'a class_t Signal.signal
    val copyTargetListProp : ('a class_t, target_list_record_t option) Property.readonly
    val cursorPositionProp : ('a class_t, LargeInt.int) Property.readonly
    val hasSelectionProp : ('a class_t, bool) Property.readonly
    val pasteTargetListProp : ('a class_t, target_list_record_t option) Property.readonly
    val tagTableProp : ('a class_t, base text_tag_table_class_t option, 'b text_tag_table_class_t option) Property.readwrite
    val textProp : ('a class_t, string option, string option) Property.readwrite
  end
