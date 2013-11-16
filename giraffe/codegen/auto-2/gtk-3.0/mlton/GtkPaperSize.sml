structure GtkPaperSize :>
  GTK_PAPER_SIZE
    where type record_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t =
  struct
    val getType_ = _import "gtk_paper_size_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_paper_size_new" : cstring * unit CPointer.t -> GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p;
    val newCustom_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_gtk_paper_size_new_custom" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val newFromKeyFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_paper_size_new_from_key_file" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newFromPpd_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_gtk_paper_size_new_from_ppd" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val copy_ = _import "gtk_paper_size_copy" : GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p -> GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p;
    val getDefaultBottomMargin_ = fn x1 & x2 => (_import "gtk_paper_size_get_default_bottom_margin" : GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getDefaultLeftMargin_ = fn x1 & x2 => (_import "gtk_paper_size_get_default_left_margin" : GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getDefaultRightMargin_ = fn x1 & x2 => (_import "gtk_paper_size_get_default_right_margin" : GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getDefaultTopMargin_ = fn x1 & x2 => (_import "gtk_paper_size_get_default_top_margin" : GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getDisplayName_ = _import "gtk_paper_size_get_display_name" : GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getHeight_ = fn x1 & x2 => (_import "gtk_paper_size_get_height" : GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getName_ = _import "gtk_paper_size_get_name" : GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getPpdName_ = _import "gtk_paper_size_get_ppd_name" : GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getWidth_ = fn x1 & x2 => (_import "gtk_paper_size_get_width" : GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val isCustom_ = _import "gtk_paper_size_is_custom" : GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p -> FFI.Bool.C.val_;
    val isEqual_ = fn x1 & x2 => (_import "gtk_paper_size_is_equal" : GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p * GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val setSize_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_paper_size_set_size" :
              GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> unit;
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
            _import "mlton_gtk_paper_size_to_key_file" :
              GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p
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
    val getDefault_ = _import "gtk_paper_size_get_default" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    type record_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name = (FFI.String.C.withConstOptPtr ---> GtkPaperSizeRecord.C.fromPtr true) new_ name
    fun newCustom name displayName width height unit =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> GtkPaperSizeRecord.C.fromPtr true
      )
        newCustom_
        (
          name
           & displayName
           & width
           & height
           & unit
        )
    fun newFromKeyFile keyFile groupName =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GtkPaperSizeRecord.C.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun newFromPpd ppdName ppdDisplayName width height =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> GtkPaperSizeRecord.C.fromPtr true
      )
        newFromPpd_
        (
          ppdName
           & ppdDisplayName
           & width
           & height
        )
    fun copy self = (GtkPaperSizeRecord.C.withPtr ---> GtkPaperSizeRecord.C.fromPtr true) copy_ self
    fun getDefaultBottomMargin self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getDefaultBottomMargin_ (self & unit)
    fun getDefaultLeftMargin self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getDefaultLeftMargin_ (self & unit)
    fun getDefaultRightMargin self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getDefaultRightMargin_ (self & unit)
    fun getDefaultTopMargin self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getDefaultTopMargin_ (self & unit)
    fun getDisplayName self = (GtkPaperSizeRecord.C.withPtr ---> FFI.String.C.fromPtr false) getDisplayName_ self
    fun getHeight self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getHeight_ (self & unit)
    fun getName self = (GtkPaperSizeRecord.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getPpdName self = (GtkPaperSizeRecord.C.withPtr ---> FFI.String.C.fromPtr false) getPpdName_ self
    fun getWidth self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getWidth_ (self & unit)
    fun isCustom self = (GtkPaperSizeRecord.C.withPtr ---> FFI.Bool.C.fromVal) isCustom_ self
    fun isEqual self size2 = (GtkPaperSizeRecord.C.withPtr &&&> GtkPaperSizeRecord.C.withPtr ---> FFI.Bool.C.fromVal) isEqual_ (self & size2)
    fun setSize self width height unit =
      (
        GtkPaperSizeRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setSize_
        (
          self
           & width
           & height
           & unit
        )
    fun toKeyFile self keyFile groupName =
      (
        GtkPaperSizeRecord.C.withPtr
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
    fun getDefault () = (I ---> FFI.String.C.fromPtr false) getDefault_ ()
  end
