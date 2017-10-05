signature GTK_PAGE_SETUP =
  sig
    type 'a class
    type page_orientation_t
    type paper_size_t
    type unit_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromFile : string -> base class
    val newFromKeyFile : GLib.KeyFileRecord.t * string option -> base class
    val copy : 'a class -> base class
    val getBottomMargin :
      'a class
       -> unit_t
       -> real
    val getLeftMargin :
      'a class
       -> unit_t
       -> real
    val getOrientation : 'a class -> page_orientation_t
    val getPageHeight :
      'a class
       -> unit_t
       -> real
    val getPageWidth :
      'a class
       -> unit_t
       -> real
    val getPaperHeight :
      'a class
       -> unit_t
       -> real
    val getPaperSize : 'a class -> paper_size_t
    val getPaperWidth :
      'a class
       -> unit_t
       -> real
    val getRightMargin :
      'a class
       -> unit_t
       -> real
    val getTopMargin :
      'a class
       -> unit_t
       -> real
    val loadFile :
      'a class
       -> string
       -> unit
    val loadKeyFile :
      'a class
       -> GLib.KeyFileRecord.t * string option
       -> unit
    val setBottomMargin :
      'a class
       -> real * unit_t
       -> unit
    val setLeftMargin :
      'a class
       -> real * unit_t
       -> unit
    val setOrientation :
      'a class
       -> page_orientation_t
       -> unit
    val setPaperSize :
      'a class
       -> paper_size_t
       -> unit
    val setPaperSizeAndDefaultMargins :
      'a class
       -> paper_size_t
       -> unit
    val setRightMargin :
      'a class
       -> real * unit_t
       -> unit
    val setTopMargin :
      'a class
       -> real * unit_t
       -> unit
    val toFile :
      'a class
       -> string
       -> unit
    val toKeyFile :
      'a class
       -> GLib.KeyFileRecord.t * string
       -> unit
  end
