structure GtkTable :>
  GTK_TABLE
    where type 'a class = 'a GtkTableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type attach_options_t = GtkAttachOptions.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_table_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_table_new" :
              GUInt32.FFI.val_
               * GUInt32.FFI.val_
               * GBool.FFI.val_
               -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val attach_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "gtk_table_attach" :
              GtkTableClass.FFI.notnull GtkTableClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               * GtkAttachOptions.FFI.val_
               * GtkAttachOptions.FFI.val_
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val attachDefaults_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_table_attach_defaults" :
              GtkTableClass.FFI.notnull GtkTableClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getColSpacing_ = fn x1 & x2 => (_import "gtk_table_get_col_spacing" : GtkTableClass.FFI.notnull GtkTableClass.FFI.p * GUInt32.FFI.val_ -> GUInt32.FFI.val_;) (x1, x2)
    val getDefaultColSpacing_ = _import "gtk_table_get_default_col_spacing" : GtkTableClass.FFI.notnull GtkTableClass.FFI.p -> GUInt32.FFI.val_;
    val getDefaultRowSpacing_ = _import "gtk_table_get_default_row_spacing" : GtkTableClass.FFI.notnull GtkTableClass.FFI.p -> GUInt32.FFI.val_;
    val getHomogeneous_ = _import "gtk_table_get_homogeneous" : GtkTableClass.FFI.notnull GtkTableClass.FFI.p -> GBool.FFI.val_;
    val getRowSpacing_ = fn x1 & x2 => (_import "gtk_table_get_row_spacing" : GtkTableClass.FFI.notnull GtkTableClass.FFI.p * GUInt32.FFI.val_ -> GUInt32.FFI.val_;) (x1, x2)
    val getSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_table_get_size" :
              GtkTableClass.FFI.notnull GtkTableClass.FFI.p
               * GUInt32.FFI.ref_
               * GUInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val resize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_table_resize" :
              GtkTableClass.FFI.notnull GtkTableClass.FFI.p
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setColSpacing_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_table_set_col_spacing" :
              GtkTableClass.FFI.notnull GtkTableClass.FFI.p
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setColSpacings_ = fn x1 & x2 => (_import "gtk_table_set_col_spacings" : GtkTableClass.FFI.notnull GtkTableClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setHomogeneous_ = fn x1 & x2 => (_import "gtk_table_set_homogeneous" : GtkTableClass.FFI.notnull GtkTableClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRowSpacing_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_table_set_row_spacing" :
              GtkTableClass.FFI.notnull GtkTableClass.FFI.p
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setRowSpacings_ = fn x1 & x2 => (_import "gtk_table_set_row_spacings" : GtkTableClass.FFI.notnull GtkTableClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkTableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type attach_options_t = GtkAttachOptions.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new rows columns homogeneous =
      (
        GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> GtkTableClass.FFI.fromPtr false
      )
        new_
        (
          rows
           & columns
           & homogeneous
        )
    fun attach self child leftAttach rightAttach topAttach bottomAttach xoptions yoptions xpadding ypadding =
      (
        GtkTableClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GtkAttachOptions.FFI.withVal
         &&&> GtkAttachOptions.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        attach_
        (
          self
           & child
           & leftAttach
           & rightAttach
           & topAttach
           & bottomAttach
           & xoptions
           & yoptions
           & xpadding
           & ypadding
        )
    fun attachDefaults self widget leftAttach rightAttach topAttach bottomAttach =
      (
        GtkTableClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        attachDefaults_
        (
          self
           & widget
           & leftAttach
           & rightAttach
           & topAttach
           & bottomAttach
        )
    fun getColSpacing self column = (GtkTableClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GUInt32.FFI.fromVal) getColSpacing_ (self & column)
    fun getDefaultColSpacing self = (GtkTableClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getDefaultColSpacing_ self
    fun getDefaultRowSpacing self = (GtkTableClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getDefaultRowSpacing_ self
    fun getHomogeneous self = (GtkTableClass.FFI.withPtr ---> GBool.FFI.fromVal) getHomogeneous_ self
    fun getRowSpacing self row = (GtkTableClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GUInt32.FFI.fromVal) getRowSpacing_ (self & row)
    fun getSize self =
      let
        val rows
         & columns
         & () =
          (
            GtkTableClass.FFI.withPtr
             &&&> GUInt32.FFI.withRefVal
             &&&> GUInt32.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GUInt32.FFI.fromVal
                   && I
          )
            getSize_
            (
              self
               & GUInt32.null
               & GUInt32.null
            )
      in
        (rows, columns)
      end
    fun resize self rows columns =
      (
        GtkTableClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        resize_
        (
          self
           & rows
           & columns
        )
    fun setColSpacing self column spacing =
      (
        GtkTableClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        setColSpacing_
        (
          self
           & column
           & spacing
        )
    fun setColSpacings self spacing = (GtkTableClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setColSpacings_ (self & spacing)
    fun setHomogeneous self homogeneous = (GtkTableClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setRowSpacing self row spacing =
      (
        GtkTableClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        setRowSpacing_
        (
          self
           & row
           & spacing
        )
    fun setRowSpacings self spacing = (GtkTableClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setRowSpacings_ (self & spacing)
    local
      open Property
    in
      val columnSpacingProp =
        {
          get = fn x => get "column-spacing" uint x,
          set = fn x => set "column-spacing" uint x
        }
      val homogeneousProp =
        {
          get = fn x => get "homogeneous" boolean x,
          set = fn x => set "homogeneous" boolean x
        }
      val nColumnsProp =
        {
          get = fn x => get "n-columns" uint x,
          set = fn x => set "n-columns" uint x
        }
      val nRowsProp =
        {
          get = fn x => get "n-rows" uint x,
          set = fn x => set "n-rows" uint x
        }
      val rowSpacingProp =
        {
          get = fn x => get "row-spacing" uint x,
          set = fn x => set "row-spacing" uint x
        }
    end
  end
