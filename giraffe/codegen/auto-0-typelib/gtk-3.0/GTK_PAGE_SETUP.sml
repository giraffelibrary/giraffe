signature GTK_PAGE_SETUP =
  sig
    type 'a class_t
    type pageorientation_t
    type papersizerecord_t
    type unit_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newFromFile : string -> base class_t
    val newFromKeyFile :
      GLib.KeyFileRecord.t
       -> string option
       -> base class_t
    val copy : 'a class_t -> base class_t
    val getBottomMargin :
      'a class_t
       -> unit_t
       -> real
    val getLeftMargin :
      'a class_t
       -> unit_t
       -> real
    val getOrientation : 'a class_t -> pageorientation_t
    val getPageHeight :
      'a class_t
       -> unit_t
       -> real
    val getPageWidth :
      'a class_t
       -> unit_t
       -> real
    val getPaperHeight :
      'a class_t
       -> unit_t
       -> real
    val getPaperSize : 'a class_t -> papersizerecord_t
    val getPaperWidth :
      'a class_t
       -> unit_t
       -> real
    val getRightMargin :
      'a class_t
       -> unit_t
       -> real
    val getTopMargin :
      'a class_t
       -> unit_t
       -> real
    val loadFile :
      'a class_t
       -> string
       -> bool
    val loadKeyFile :
      'a class_t
       -> GLib.KeyFileRecord.t
       -> string option
       -> bool
    val setBottomMargin :
      'a class_t
       -> real
       -> unit_t
       -> unit
    val setLeftMargin :
      'a class_t
       -> real
       -> unit_t
       -> unit
    val setOrientation :
      'a class_t
       -> pageorientation_t
       -> unit
    val setPaperSize :
      'a class_t
       -> papersizerecord_t
       -> unit
    val setPaperSizeAndDefaultMargins :
      'a class_t
       -> papersizerecord_t
       -> unit
    val setRightMargin :
      'a class_t
       -> real
       -> unit_t
       -> unit
    val setTopMargin :
      'a class_t
       -> real
       -> unit_t
       -> unit
    val toFile :
      'a class_t
       -> string
       -> bool
    val toKeyFile :
      'a class_t
       -> GLib.KeyFileRecord.t
       -> string
       -> unit
  end
