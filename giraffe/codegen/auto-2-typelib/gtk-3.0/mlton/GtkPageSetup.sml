structure GtkPageSetup :>
  GTK_PAGE_SETUP
    where type 'a class_t = 'a GtkPageSetupClass.t
    where type pageorientation_t = GtkPageOrientation.t
    where type papersizerecord_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t =
  struct
    val getType_ = _import "gtk_page_setup_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_page_setup_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_page_setup_new_from_file" :
              cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val copy_ = _import "gtk_page_setup_copy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getBottomMargin_ = fn x1 & x2 => (_import "gtk_page_setup_get_bottom_margin" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getLeftMargin_ = fn x1 & x2 => (_import "gtk_page_setup_get_left_margin" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getOrientation_ = _import "gtk_page_setup_get_orientation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkPageOrientation.C.val_;
    val getPageHeight_ = fn x1 & x2 => (_import "gtk_page_setup_get_page_height" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getPageWidth_ = fn x1 & x2 => (_import "gtk_page_setup_get_page_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getPaperHeight_ = fn x1 & x2 => (_import "gtk_page_setup_get_paper_height" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getPaperSize_ = _import "gtk_page_setup_get_paper_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p;
    val getPaperWidth_ = fn x1 & x2 => (_import "gtk_page_setup_get_paper_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getRightMargin_ = fn x1 & x2 => (_import "gtk_page_setup_get_right_margin" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getTopMargin_ = fn x1 & x2 => (_import "gtk_page_setup_get_top_margin" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val loadFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_page_setup_load_file" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setOrientation_ = fn x1 & x2 => (_import "gtk_page_setup_set_orientation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPageOrientation.C.val_ -> unit;) (x1, x2)
    val setPaperSize_ = fn x1 & x2 => (_import "gtk_page_setup_set_paper_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p -> unit;) (x1, x2)
    val setPaperSizeAndDefaultMargins_ = fn x1 & x2 => (_import "gtk_page_setup_set_paper_size_and_default_margins" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p -> unit;) (x1, x2)
    val setRightMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_page_setup_set_right_margin" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class_t = 'a GtkPageSetupClass.t
    type pageorientation_t = GtkPageOrientation.t
    type papersizerecord_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkPageSetupClass.C.fromPtr true) new_ ()
    fun newFromFile fileName = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GtkPageSetupClass.C.fromPtr true) newFromFile_ (fileName & [])
    fun newFromKeyFile keyFile groupName =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GtkPageSetupClass.C.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun copy self = (GObjectObjectClass.C.withPtr ---> GtkPageSetupClass.C.fromPtr true) copy_ self
    fun getBottomMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getBottomMargin_ (self & unit)
    fun getLeftMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getLeftMargin_ (self & unit)
    fun getOrientation self = (GObjectObjectClass.C.withPtr ---> GtkPageOrientation.C.fromVal) getOrientation_ self
    fun getPageHeight self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPageHeight_ (self & unit)
    fun getPageWidth self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPageWidth_ (self & unit)
    fun getPaperHeight self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPaperHeight_ (self & unit)
    fun getPaperSize self = (GObjectObjectClass.C.withPtr ---> GtkPaperSizeRecord.C.fromPtr true) getPaperSize_ self
    fun getPaperWidth self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPaperWidth_ (self & unit)
    fun getRightMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getRightMargin_ (self & unit)
    fun getTopMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getTopMargin_ (self & unit)
    fun loadFile self fileName =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun setOrientation self orientation = (GObjectObjectClass.C.withPtr &&&> GtkPageOrientation.C.withVal ---> I) setOrientation_ (self & orientation)
    fun setPaperSize self size = (GObjectObjectClass.C.withPtr &&&> GtkPaperSizeRecord.C.withPtr ---> I) setPaperSize_ (self & size)
    fun setPaperSizeAndDefaultMargins self size = (GObjectObjectClass.C.withPtr &&&> GtkPaperSizeRecord.C.withPtr ---> I) setPaperSizeAndDefaultMargins_ (self & size)
    fun setRightMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        toKeyFile_
        (
          self
           & keyFile
           & groupName
        )
  end
