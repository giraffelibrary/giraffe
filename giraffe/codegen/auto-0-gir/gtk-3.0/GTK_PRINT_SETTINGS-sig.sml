signature GTK_PRINT_SETTINGS =
  sig
    type 'a class
    type print_duplex_t
    type number_up_layout_t
    type page_orientation_t
    type page_range_record_c_array_n_t
    type page_set_t
    type paper_size_t
    type unit_t
    type print_pages_t
    type print_quality_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromFile : string -> base class
    val newFromGvariant : GLib.VariantRecord.t -> base class
    val newFromKeyFile : GLib.KeyFileRecord.t * string option -> base class
    val copy : 'a class -> base class
    val get :
      'a class
       -> string
       -> string
    val getBool :
      'a class
       -> string
       -> bool
    val getCollate : 'a class -> bool
    val getDefaultSource : 'a class -> string
    val getDither : 'a class -> string
    val getDouble :
      'a class
       -> string
       -> real
    val getDoubleWithDefault :
      'a class
       -> string * real
       -> real
    val getDuplex : 'a class -> print_duplex_t
    val getFinishings : 'a class -> string
    val getInt :
      'a class
       -> string
       -> LargeInt.int
    val getIntWithDefault :
      'a class
       -> string * LargeInt.int
       -> LargeInt.int
    val getLength :
      'a class
       -> string * unit_t
       -> real
    val getMediaType : 'a class -> string
    val getNCopies : 'a class -> LargeInt.int
    val getNumberUp : 'a class -> LargeInt.int
    val getNumberUpLayout : 'a class -> number_up_layout_t
    val getOrientation : 'a class -> page_orientation_t
    val getOutputBin : 'a class -> string
    val getPageRanges : 'a class -> page_range_record_c_array_n_t
    val getPageSet : 'a class -> page_set_t
    val getPaperHeight :
      'a class
       -> unit_t
       -> real
    val getPaperSize : 'a class -> paper_size_t
    val getPaperWidth :
      'a class
       -> unit_t
       -> real
    val getPrintPages : 'a class -> print_pages_t
    val getPrinter : 'a class -> string
    val getPrinterLpi : 'a class -> real
    val getQuality : 'a class -> print_quality_t
    val getResolution : 'a class -> LargeInt.int
    val getResolutionX : 'a class -> LargeInt.int
    val getResolutionY : 'a class -> LargeInt.int
    val getReverse : 'a class -> bool
    val getScale : 'a class -> real
    val getUseColor : 'a class -> bool
    val hasKey :
      'a class
       -> string
       -> bool
    val loadFile :
      'a class
       -> string
       -> unit
    val loadKeyFile :
      'a class
       -> GLib.KeyFileRecord.t * string option
       -> unit
    val set :
      'a class
       -> string * string option
       -> unit
    val setBool :
      'a class
       -> string * bool
       -> unit
    val setCollate :
      'a class
       -> bool
       -> unit
    val setDefaultSource :
      'a class
       -> string
       -> unit
    val setDither :
      'a class
       -> string
       -> unit
    val setDouble :
      'a class
       -> string * real
       -> unit
    val setDuplex :
      'a class
       -> print_duplex_t
       -> unit
    val setFinishings :
      'a class
       -> string
       -> unit
    val setInt :
      'a class
       -> string * LargeInt.int
       -> unit
    val setLength :
      'a class
       -> string
           * real
           * unit_t
       -> unit
    val setMediaType :
      'a class
       -> string
       -> unit
    val setNCopies :
      'a class
       -> LargeInt.int
       -> unit
    val setNumberUp :
      'a class
       -> LargeInt.int
       -> unit
    val setNumberUpLayout :
      'a class
       -> number_up_layout_t
       -> unit
    val setOrientation :
      'a class
       -> page_orientation_t
       -> unit
    val setOutputBin :
      'a class
       -> string
       -> unit
    val setPageRanges :
      'a class
       -> page_range_record_c_array_n_t
       -> unit
    val setPageSet :
      'a class
       -> page_set_t
       -> unit
    val setPaperHeight :
      'a class
       -> real * unit_t
       -> unit
    val setPaperSize :
      'a class
       -> paper_size_t
       -> unit
    val setPaperWidth :
      'a class
       -> real * unit_t
       -> unit
    val setPrintPages :
      'a class
       -> print_pages_t
       -> unit
    val setPrinter :
      'a class
       -> string
       -> unit
    val setPrinterLpi :
      'a class
       -> real
       -> unit
    val setQuality :
      'a class
       -> print_quality_t
       -> unit
    val setResolution :
      'a class
       -> LargeInt.int
       -> unit
    val setResolutionXy :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setReverse :
      'a class
       -> bool
       -> unit
    val setScale :
      'a class
       -> real
       -> unit
    val setUseColor :
      'a class
       -> bool
       -> unit
    val toFile :
      'a class
       -> string
       -> unit
    val toGvariant : 'a class -> GLib.VariantRecord.t
    val toKeyFile :
      'a class
       -> GLib.KeyFileRecord.t * string
       -> unit
    val unset :
      'a class
       -> string
       -> unit
  end
