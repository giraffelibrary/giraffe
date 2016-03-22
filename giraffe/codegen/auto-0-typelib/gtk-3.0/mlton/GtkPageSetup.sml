structure GtkPageSetup :>
  GTK_PAGE_SETUP
    where type 'a class = 'a GtkPageSetupClass.class
    where type page_orientation_t = GtkPageOrientation.t
    where type paper_size_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t =
  struct
    val getType_ = _import "gtk_page_setup_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_page_setup_new" : unit -> GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p;
    val newFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_page_setup_new_from_file" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromKeyFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_page_setup_new_from_key_file" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val copy_ = _import "gtk_page_setup_copy" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p -> GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p;
    val getBottomMargin_ = fn x1 & x2 => (_import "gtk_page_setup_get_bottom_margin" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getLeftMargin_ = fn x1 & x2 => (_import "gtk_page_setup_get_left_margin" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getOrientation_ = _import "gtk_page_setup_get_orientation" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p -> GtkPageOrientation.C.val_;
    val getPageHeight_ = fn x1 & x2 => (_import "gtk_page_setup_get_page_height" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getPageWidth_ = fn x1 & x2 => (_import "gtk_page_setup_get_page_width" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getPaperHeight_ = fn x1 & x2 => (_import "gtk_page_setup_get_paper_height" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getPaperSize_ = _import "gtk_page_setup_get_paper_size" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p -> GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p;
    val getPaperWidth_ = fn x1 & x2 => (_import "gtk_page_setup_get_paper_width" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getRightMargin_ = fn x1 & x2 => (_import "gtk_page_setup_get_right_margin" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getTopMargin_ = fn x1 & x2 => (_import "gtk_page_setup_get_top_margin" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val loadFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_page_setup_load_file" :
              GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val loadKeyFile_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_page_setup_load_key_file" :
              GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p
               * GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setBottomMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_page_setup_set_bottom_margin" :
              GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLeftMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_page_setup_set_left_margin" :
              GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setOrientation_ = fn x1 & x2 => (_import "gtk_page_setup_set_orientation" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p * GtkPageOrientation.C.val_ -> unit;) (x1, x2)
    val setPaperSize_ = fn x1 & x2 => (_import "gtk_page_setup_set_paper_size" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p * GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p -> unit;) (x1, x2)
    val setPaperSizeAndDefaultMargins_ = fn x1 & x2 => (_import "gtk_page_setup_set_paper_size_and_default_margins" : GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p * GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p -> unit;) (x1, x2)
    val setRightMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_page_setup_set_right_margin" :
              GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTopMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_page_setup_set_top_margin" :
              GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val toFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_page_setup_to_file" :
              GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val toKeyFile_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_page_setup_to_key_file" :
              GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p
               * GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GtkPageSetupClass.class
    type page_orientation_t = GtkPageOrientation.t
    type paper_size_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkPageSetupClass.C.fromPtr true) new_ ()
    fun newFromFile fileName = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GtkPageSetupClass.C.fromPtr true) newFromFile_ (fileName & [])
    fun newFromKeyFile keyFile groupName =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GtkPageSetupClass.C.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun copy self = (GtkPageSetupClass.C.withPtr ---> GtkPageSetupClass.C.fromPtr true) copy_ self
    fun getBottomMargin self unit = (GtkPageSetupClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getBottomMargin_ (self & unit)
    fun getLeftMargin self unit = (GtkPageSetupClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getLeftMargin_ (self & unit)
    fun getOrientation self = (GtkPageSetupClass.C.withPtr ---> GtkPageOrientation.C.fromVal) getOrientation_ self
    fun getPageHeight self unit = (GtkPageSetupClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPageHeight_ (self & unit)
    fun getPageWidth self unit = (GtkPageSetupClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPageWidth_ (self & unit)
    fun getPaperHeight self unit = (GtkPageSetupClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPaperHeight_ (self & unit)
    fun getPaperSize self = (GtkPageSetupClass.C.withPtr ---> GtkPaperSizeRecord.C.fromPtr true) getPaperSize_ self
    fun getPaperWidth self unit = (GtkPageSetupClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPaperWidth_ (self & unit)
    fun getRightMargin self unit = (GtkPageSetupClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getRightMargin_ (self & unit)
    fun getTopMargin self unit = (GtkPageSetupClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getTopMargin_ (self & unit)
    fun loadFile self fileName =
      (
        GtkPageSetupClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        loadFile_
        (
          self
           & fileName
           & []
        )
    fun loadKeyFile self keyFile groupName =
      (
        GtkPageSetupClass.C.withPtr
         &&&> GLibKeyFileRecord.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        loadKeyFile_
        (
          self
           & keyFile
           & groupName
           & []
        )
    fun setBottomMargin self margin unit =
      (
        GtkPageSetupClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setBottomMargin_
        (
          self
           & margin
           & unit
        )
    fun setLeftMargin self margin unit =
      (
        GtkPageSetupClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setLeftMargin_
        (
          self
           & margin
           & unit
        )
    fun setOrientation self orientation = (GtkPageSetupClass.C.withPtr &&&> GtkPageOrientation.C.withVal ---> I) setOrientation_ (self & orientation)
    fun setPaperSize self size = (GtkPageSetupClass.C.withPtr &&&> GtkPaperSizeRecord.C.withPtr ---> I) setPaperSize_ (self & size)
    fun setPaperSizeAndDefaultMargins self size = (GtkPageSetupClass.C.withPtr &&&> GtkPaperSizeRecord.C.withPtr ---> I) setPaperSizeAndDefaultMargins_ (self & size)
    fun setRightMargin self margin unit =
      (
        GtkPageSetupClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setRightMargin_
        (
          self
           & margin
           & unit
        )
    fun setTopMargin self margin unit =
      (
        GtkPageSetupClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setTopMargin_
        (
          self
           & margin
           & unit
        )
    fun toFile self fileName =
      (
        GtkPageSetupClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        toFile_
        (
          self
           & fileName
           & []
        )
    fun toKeyFile self keyFile groupName =
      (
        GtkPageSetupClass.C.withPtr
         &&&> GLibKeyFileRecord.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        toKeyFile_
        (
          self
           & keyFile
           & groupName
        )
  end
