signature GTK_PRINT_SETTINGS =
  sig
    type 'a class_t
    type printquality_t
    type printpages_t
    type unit_t
    type papersizerecord_t
    type pageset_t
    type pageorientation_t
    type numberuplayout_t
    type printduplex_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newFromFile : string -> base class_t
    val newFromKeyFile :
      GLib.KeyFileRecord.t
       -> string option
       -> base class_t
    val copy : 'a class_t -> base class_t
    val get :
      'a class_t
       -> string
       -> string
    val getBool :
      'a class_t
       -> string
       -> bool
    val getCollate : 'a class_t -> bool
    val getDefaultSource : 'a class_t -> string
    val getDither : 'a class_t -> string
    val getDouble :
      'a class_t
       -> string
       -> real
    val getDoubleWithDefault :
      'a class_t
       -> string
       -> real
       -> real
    val getDuplex : 'a class_t -> printduplex_t
    val getFinishings : 'a class_t -> string
    val getInt :
      'a class_t
       -> string
       -> LargeInt.int
    val getIntWithDefault :
      'a class_t
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val getLength :
      'a class_t
       -> string
       -> unit_t
       -> real
    val getMediaType : 'a class_t -> string
    val getNCopies : 'a class_t -> LargeInt.int
    val getNumberUp : 'a class_t -> LargeInt.int
    val getNumberUpLayout : 'a class_t -> numberuplayout_t
    val getOrientation : 'a class_t -> pageorientation_t
    val getOutputBin : 'a class_t -> string
    val getPageSet : 'a class_t -> pageset_t
    val getPaperHeight :
      'a class_t
       -> unit_t
       -> real
    val getPaperSize : 'a class_t -> papersizerecord_t
    val getPaperWidth :
      'a class_t
       -> unit_t
       -> real
    val getPrintPages : 'a class_t -> printpages_t
    val getPrinter : 'a class_t -> string
    val getPrinterLpi : 'a class_t -> real
    val getQuality : 'a class_t -> printquality_t
    val getResolution : 'a class_t -> LargeInt.int
    val getResolutionX : 'a class_t -> LargeInt.int
    val getResolutionY : 'a class_t -> LargeInt.int
    val getReverse : 'a class_t -> bool
    val getScale : 'a class_t -> real
    val getUseColor : 'a class_t -> bool
    val hasKey :
      'a class_t
       -> string
       -> bool
    val loadFile :
      'a class_t
       -> string
       -> bool
    val loadKeyFile :
      'a class_t
       -> GLib.KeyFileRecord.t
       -> string option
       -> bool
    val set :
      'a class_t
       -> string
       -> string option
       -> unit
    val setBool :
      'a class_t
       -> string
       -> bool
       -> unit
    val setCollate :
      'a class_t
       -> bool
       -> unit
    val setDefaultSource :
      'a class_t
       -> string
       -> unit
    val setDither :
      'a class_t
       -> string
       -> unit
    val setDouble :
      'a class_t
       -> string
       -> real
       -> unit
    val setDuplex :
      'a class_t
       -> printduplex_t
       -> unit
    val setFinishings :
      'a class_t
       -> string
       -> unit
    val setInt :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val setLength :
      'a class_t
       -> string
       -> real
       -> unit_t
       -> unit
    val setMediaType :
      'a class_t
       -> string
       -> unit
    val setNCopies :
      'a class_t
       -> LargeInt.int
       -> unit
    val setNumberUp :
      'a class_t
       -> LargeInt.int
       -> unit
    val setNumberUpLayout :
      'a class_t
       -> numberuplayout_t
       -> unit
    val setOrientation :
      'a class_t
       -> pageorientation_t
       -> unit
    val setOutputBin :
      'a class_t
       -> string
       -> unit
    val setPageSet :
      'a class_t
       -> pageset_t
       -> unit
    val setPaperHeight :
      'a class_t
       -> real
       -> unit_t
       -> unit
    val setPaperSize :
      'a class_t
       -> papersizerecord_t
       -> unit
    val setPaperWidth :
      'a class_t
       -> real
       -> unit_t
       -> unit
    val setPrintPages :
      'a class_t
       -> printpages_t
       -> unit
    val setPrinter :
      'a class_t
       -> string
       -> unit
    val setPrinterLpi :
      'a class_t
       -> real
       -> unit
    val setQuality :
      'a class_t
       -> printquality_t
       -> unit
    val setResolution :
      'a class_t
       -> LargeInt.int
       -> unit
    val setResolutionXy :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setReverse :
      'a class_t
       -> bool
       -> unit
    val setScale :
      'a class_t
       -> real
       -> unit
    val setUseColor :
      'a class_t
       -> bool
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
    val unset :
      'a class_t
       -> string
       -> unit
  end