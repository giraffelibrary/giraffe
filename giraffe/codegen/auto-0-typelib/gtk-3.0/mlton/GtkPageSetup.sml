structure GtkPageSetup :>
  GTK_PAGE_SETUP
    where type 'a class = 'a GtkPageSetupClass.class
    where type page_orientation_t = GtkPageOrientation.t
    where type paper_size_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t =
  struct
    val getType_ = _import "gtk_page_setup_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_page_setup_new" : unit -> GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p;
    val newFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_page_setup_new_from_file" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromGvariant_ = _import "gtk_page_setup_new_from_gvariant" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p;
    val newFromKeyFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_page_setup_new_from_key_file" :
              GLibKeyFileRecord.FFI.non_opt GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val copy_ = _import "gtk_page_setup_copy" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p -> GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p;
    val getBottomMargin_ = fn x1 & x2 => (_import "gtk_page_setup_get_bottom_margin" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getLeftMargin_ = fn x1 & x2 => (_import "gtk_page_setup_get_left_margin" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getOrientation_ = _import "gtk_page_setup_get_orientation" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p -> GtkPageOrientation.FFI.val_;
    val getPageHeight_ = fn x1 & x2 => (_import "gtk_page_setup_get_page_height" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getPageWidth_ = fn x1 & x2 => (_import "gtk_page_setup_get_page_width" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getPaperHeight_ = fn x1 & x2 => (_import "gtk_page_setup_get_paper_height" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getPaperSize_ = _import "gtk_page_setup_get_paper_size" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p -> GtkPaperSizeRecord.FFI.non_opt GtkPaperSizeRecord.FFI.p;
    val getPaperWidth_ = fn x1 & x2 => (_import "gtk_page_setup_get_paper_width" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getRightMargin_ = fn x1 & x2 => (_import "gtk_page_setup_get_right_margin" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getTopMargin_ = fn x1 & x2 => (_import "gtk_page_setup_get_top_margin" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val loadFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_page_setup_load_file" :
              GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p
               * GLibKeyFileRecord.FFI.non_opt GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
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
              GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setOrientation_ = fn x1 & x2 => (_import "gtk_page_setup_set_orientation" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p * GtkPageOrientation.FFI.val_ -> unit;) (x1, x2)
    val setPaperSize_ = fn x1 & x2 => (_import "gtk_page_setup_set_paper_size" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p * GtkPaperSizeRecord.FFI.non_opt GtkPaperSizeRecord.FFI.p -> unit;) (x1, x2)
    val setPaperSizeAndDefaultMargins_ = fn x1 & x2 => (_import "gtk_page_setup_set_paper_size_and_default_margins" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p * GtkPaperSizeRecord.FFI.non_opt GtkPaperSizeRecord.FFI.p -> unit;) (x1, x2)
    val setRightMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_page_setup_set_right_margin" :
              GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
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
              GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
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
              GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val toGvariant_ = _import "gtk_page_setup_to_gvariant" : GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val toKeyFile_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_page_setup_to_key_file" :
              GtkPageSetupClass.FFI.non_opt GtkPageSetupClass.FFI.p
               * GLibKeyFileRecord.FFI.non_opt GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkPageSetupClass.FFI.fromPtr true) new_ ()
    fun newFromFile fileName = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> GtkPageSetupClass.FFI.fromPtr true) newFromFile_ (fileName & [])
    fun newFromGvariant variant = (GLibVariantRecord.FFI.withPtr false ---> GtkPageSetupClass.FFI.fromPtr true) newFromGvariant_ variant
    fun newFromKeyFile (keyFile, groupName) =
      (
        GLibKeyFileRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GtkPageSetupClass.FFI.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun copy self = (GtkPageSetupClass.FFI.withPtr false ---> GtkPageSetupClass.FFI.fromPtr true) copy_ self
    fun getBottomMargin self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getBottomMargin_ (self & unit)
    fun getLeftMargin self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getLeftMargin_ (self & unit)
    fun getOrientation self = (GtkPageSetupClass.FFI.withPtr false ---> GtkPageOrientation.FFI.fromVal) getOrientation_ self
    fun getPageHeight self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getPageHeight_ (self & unit)
    fun getPageWidth self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getPageWidth_ (self & unit)
    fun getPaperHeight self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getPaperHeight_ (self & unit)
    fun getPaperSize self = (GtkPageSetupClass.FFI.withPtr false ---> GtkPaperSizeRecord.FFI.fromPtr false) getPaperSize_ self
    fun getPaperWidth self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getPaperWidth_ (self & unit)
    fun getRightMargin self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getRightMargin_ (self & unit)
    fun getTopMargin self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getTopMargin_ (self & unit)
    fun loadFile self fileName =
      (
        GtkPageSetupClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadFile_
        (
          self
           & fileName
           & []
        )
    fun loadKeyFile self (keyFile, groupName) =
      (
        GtkPageSetupClass.FFI.withPtr false
         &&&> GLibKeyFileRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadKeyFile_
        (
          self
           & keyFile
           & groupName
           & []
        )
    fun setBottomMargin self (margin, unit) =
      (
        GtkPageSetupClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setBottomMargin_
        (
          self
           & margin
           & unit
        )
    fun setLeftMargin self (margin, unit) =
      (
        GtkPageSetupClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setLeftMargin_
        (
          self
           & margin
           & unit
        )
    fun setOrientation self orientation = (GtkPageSetupClass.FFI.withPtr false &&&> GtkPageOrientation.FFI.withVal ---> I) setOrientation_ (self & orientation)
    fun setPaperSize self size = (GtkPageSetupClass.FFI.withPtr false &&&> GtkPaperSizeRecord.FFI.withPtr false ---> I) setPaperSize_ (self & size)
    fun setPaperSizeAndDefaultMargins self size = (GtkPageSetupClass.FFI.withPtr false &&&> GtkPaperSizeRecord.FFI.withPtr false ---> I) setPaperSizeAndDefaultMargins_ (self & size)
    fun setRightMargin self (margin, unit) =
      (
        GtkPageSetupClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setRightMargin_
        (
          self
           & margin
           & unit
        )
    fun setTopMargin self (margin, unit) =
      (
        GtkPageSetupClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
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
        GtkPageSetupClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        toFile_
        (
          self
           & fileName
           & []
        )
    fun toGvariant self = (GtkPageSetupClass.FFI.withPtr false ---> GLibVariantRecord.FFI.fromPtr false) toGvariant_ self
    fun toKeyFile self (keyFile, groupName) =
      (
        GtkPageSetupClass.FFI.withPtr false
         &&&> GLibKeyFileRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        toKeyFile_
        (
          self
           & keyFile
           & groupName
        )
  end
