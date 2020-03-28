signature GTK_TEXT_BUFFER =
  sig
    type 'a class
    type 'a text_child_anchor_class
    type 'a text_mark_class
    type 'a clipboard_class
    type text_iter_t
    type 'a text_tag_class
    type target_list_t
    type 'a text_tag_table_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a text_tag_table_class option -> base class
    val addMark :
      'a class
       -> 'b text_mark_class * text_iter_t
       -> unit
    val addSelectionClipboard :
      'a class
       -> 'b clipboard_class
       -> unit
    val applyTag :
      'a class
       -> 'b text_tag_class
           * text_iter_t
           * text_iter_t
       -> unit
    val applyTagByName :
      'a class
       -> string
           * text_iter_t
           * text_iter_t
       -> unit
    val backspace :
      'a class
       -> text_iter_t
           * bool
           * bool
       -> bool
    val beginUserAction : 'a class -> unit
    val copyClipboard :
      'a class
       -> 'b clipboard_class
       -> unit
    val createChildAnchor :
      'a class
       -> text_iter_t
       -> base text_child_anchor_class
    val createMark :
      'a class
       -> string option
           * text_iter_t
           * bool
       -> base text_mark_class
    val cutClipboard :
      'a class
       -> 'b clipboard_class * bool
       -> unit
    val delete :
      'a class
       -> text_iter_t * text_iter_t
       -> unit
    val deleteInteractive :
      'a class
       -> text_iter_t
           * text_iter_t
           * bool
       -> bool
    val deleteMark :
      'a class
       -> 'b text_mark_class
       -> unit
    val deleteMarkByName :
      'a class
       -> string
       -> unit
    val deleteSelection :
      'a class
       -> bool * bool
       -> bool
    val deserialize :
      'a class
       -> 'b class
           * Gdk.AtomRecord.t
           * text_iter_t
           * GUInt8CArrayN.t
       -> unit
    val deserializeGetCanCreateTags :
      'a class
       -> Gdk.AtomRecord.t
       -> bool
    val deserializeSetCanCreateTags :
      'a class
       -> Gdk.AtomRecord.t * bool
       -> unit
    val endUserAction : 'a class -> unit
    val getBounds : 'a class -> text_iter_t * text_iter_t
    val getCharCount : 'a class -> LargeInt.int
    val getCopyTargetList : 'a class -> target_list_t
    val getDeserializeFormats : 'a class -> GdkAtomRecordCArrayN.t
    val getEndIter : 'a class -> text_iter_t
    val getHasSelection : 'a class -> bool
    val getInsert : 'a class -> base text_mark_class
    val getIterAtChildAnchor :
      'a class
       -> 'b text_child_anchor_class
       -> text_iter_t
    val getIterAtLine :
      'a class
       -> LargeInt.int
       -> text_iter_t
    val getIterAtLineIndex :
      'a class
       -> LargeInt.int * LargeInt.int
       -> text_iter_t
    val getIterAtLineOffset :
      'a class
       -> LargeInt.int * LargeInt.int
       -> text_iter_t
    val getIterAtMark :
      'a class
       -> 'b text_mark_class
       -> text_iter_t
    val getIterAtOffset :
      'a class
       -> LargeInt.int
       -> text_iter_t
    val getLineCount : 'a class -> LargeInt.int
    val getMark :
      'a class
       -> string
       -> base text_mark_class option
    val getModified : 'a class -> bool
    val getPasteTargetList : 'a class -> target_list_t
    val getSelectionBound : 'a class -> base text_mark_class
    val getSelectionBounds : 'a class -> (text_iter_t * text_iter_t) option
    val getSerializeFormats : 'a class -> GdkAtomRecordCArrayN.t
    val getSlice :
      'a class
       -> text_iter_t
           * text_iter_t
           * bool
       -> string
    val getStartIter : 'a class -> text_iter_t
    val getTagTable : 'a class -> base text_tag_table_class
    val getText :
      'a class
       -> text_iter_t
           * text_iter_t
           * bool
       -> string
    val insert :
      'a class
       -> text_iter_t
           * string
           * LargeInt.int
       -> unit
    val insertAtCursor :
      'a class
       -> string * LargeInt.int
       -> unit
    val insertChildAnchor :
      'a class
       -> text_iter_t * 'b text_child_anchor_class
       -> unit
    val insertInteractive :
      'a class
       -> text_iter_t
           * string
           * LargeInt.int
           * bool
       -> bool
    val insertInteractiveAtCursor :
      'a class
       -> string
           * LargeInt.int
           * bool
       -> bool
    val insertMarkup :
      'a class
       -> text_iter_t
           * string
           * LargeInt.int
       -> unit
    val insertPixbuf :
      'a class
       -> text_iter_t * 'b GdkPixbuf.PixbufClass.class
       -> unit
    val insertRange :
      'a class
       -> text_iter_t
           * text_iter_t
           * text_iter_t
       -> unit
    val insertRangeInteractive :
      'a class
       -> text_iter_t
           * text_iter_t
           * text_iter_t
           * bool
       -> bool
    val moveMark :
      'a class
       -> 'b text_mark_class * text_iter_t
       -> unit
    val moveMarkByName :
      'a class
       -> string * text_iter_t
       -> unit
    val pasteClipboard :
      'a class
       -> 'b clipboard_class
           * text_iter_t option
           * bool
       -> unit
    val placeCursor :
      'a class
       -> text_iter_t
       -> unit
    val registerDeserializeTagset :
      'a class
       -> string option
       -> Gdk.AtomRecord.t
    val registerSerializeTagset :
      'a class
       -> string option
       -> Gdk.AtomRecord.t
    val removeAllTags :
      'a class
       -> text_iter_t * text_iter_t
       -> unit
    val removeSelectionClipboard :
      'a class
       -> 'b clipboard_class
       -> unit
    val removeTag :
      'a class
       -> 'b text_tag_class
           * text_iter_t
           * text_iter_t
       -> unit
    val removeTagByName :
      'a class
       -> string
           * text_iter_t
           * text_iter_t
       -> unit
    val selectRange :
      'a class
       -> text_iter_t * text_iter_t
       -> unit
    val serialize :
      'a class
       -> 'b class
           * Gdk.AtomRecord.t
           * text_iter_t
           * text_iter_t
       -> GUInt8CArrayN.t
    val setModified :
      'a class
       -> bool
       -> unit
    val setText :
      'a class
       -> string * LargeInt.int
       -> unit
    val unregisterDeserializeFormat :
      'a class
       -> Gdk.AtomRecord.t
       -> unit
    val unregisterSerializeFormat :
      'a class
       -> Gdk.AtomRecord.t
       -> unit
    val applyTagSig :
      (base text_tag_class
        * text_iter_t
        * text_iter_t
        -> unit)
       -> 'a class Signal.t
    val beginUserActionSig : (unit -> unit) -> 'a class Signal.t
    val changedSig : (unit -> unit) -> 'a class Signal.t
    val deleteRangeSig : (text_iter_t * text_iter_t -> unit) -> 'a class Signal.t
    val endUserActionSig : (unit -> unit) -> 'a class Signal.t
    val insertChildAnchorSig : (text_iter_t * base text_child_anchor_class -> unit) -> 'a class Signal.t
    val insertPixbufSig : (text_iter_t * base GdkPixbuf.PixbufClass.class -> unit) -> 'a class Signal.t
    val insertTextSig :
      (text_iter_t
        * string
        * LargeInt.int
        -> unit)
       -> 'a class Signal.t
    val markDeletedSig : (base text_mark_class -> unit) -> 'a class Signal.t
    val markSetSig : (text_iter_t * base text_mark_class -> unit) -> 'a class Signal.t
    val modifiedChangedSig : (unit -> unit) -> 'a class Signal.t
    val pasteDoneSig : (base clipboard_class -> unit) -> 'a class Signal.t
    val removeTagSig :
      (base text_tag_class
        * text_iter_t
        * text_iter_t
        -> unit)
       -> 'a class Signal.t
    val copyTargetListProp : {get : 'a class -> target_list_t option}
    val cursorPositionProp : {get : 'a class -> LargeInt.int}
    val hasSelectionProp : {get : 'a class -> bool}
    val pasteTargetListProp : {get : 'a class -> target_list_t option}
    val tagTableProp :
      {
        get : 'a class -> base text_tag_table_class option,
        new : 'b text_tag_table_class option -> 'a class Property.t
      }
    val textProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end