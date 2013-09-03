structure GtkTable :>
  GTK_TABLE
    where type 'a class_t = 'a GtkTableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type attachoptions_t = GtkAttachOptions.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_table_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_table_new" :
              FFI.UInt32.val_
               * FFI.UInt32.val_
               * FFI.Bool.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.val_
               * FFI.UInt32.val_
               * FFI.UInt32.val_
               * FFI.UInt32.val_
               * GtkAttachOptions.C.val_
               * GtkAttachOptions.C.val_
               * FFI.UInt32.val_
               * FFI.UInt32.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.val_
               * FFI.UInt32.val_
               * FFI.UInt32.val_
               * FFI.UInt32.val_
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
    val getColSpacing_ = fn x1 & x2 => (_import "gtk_table_get_col_spacing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.val_ -> FFI.UInt32.val_;) (x1, x2)
    val getDefaultColSpacing_ = _import "gtk_table_get_default_col_spacing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt32.val_;
    val getDefaultRowSpacing_ = _import "gtk_table_get_default_row_spacing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt32.val_;
    val getHomogeneous_ = _import "gtk_table_get_homogeneous" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getRowSpacing_ = fn x1 & x2 => (_import "gtk_table_get_row_spacing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.val_ -> FFI.UInt32.val_;) (x1, x2)
    val getSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_table_get_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.ref_
               * FFI.UInt32.ref_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.val_
               * FFI.UInt32.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.val_
               * FFI.UInt32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setColSpacings_ = fn x1 & x2 => (_import "gtk_table_set_col_spacings" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.val_ -> unit;) (x1, x2)
    val setHomogeneous_ = fn x1 & x2 => (_import "gtk_table_set_homogeneous" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setRowSpacing_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_table_set_row_spacing" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.val_
               * FFI.UInt32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setRowSpacings_ = fn x1 & x2 => (_import "gtk_table_set_row_spacings" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkTableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type attachoptions_t = GtkAttachOptions.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new rows columns homogeneous =
      (
        FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
         &&&> FFI.Bool.withVal
         ---> GtkTableClass.C.fromPtr false
      )
        new_
        (
          rows
           & columns
           & homogeneous
        )
    fun attach self child leftAttach rightAttach topAttach bottomAttach xoptions yoptions xpadding ypadding =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
         &&&> GtkAttachOptions.C.withVal
         &&&> GtkAttachOptions.C.withVal
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
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
    fun getColSpacing self column = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.withVal ---> FFI.UInt32.fromVal) getColSpacing_ (self & column)
    fun getDefaultColSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.fromVal) getDefaultColSpacing_ self
    fun getDefaultRowSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.fromVal) getDefaultRowSpacing_ self
    fun getHomogeneous self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getHomogeneous_ self
    fun getRowSpacing self row = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.withVal ---> FFI.UInt32.fromVal) getRowSpacing_ (self & row)
    fun getSize self =
      let
        val rows
         & columns
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.withRefVal
             &&&> FFI.UInt32.withRefVal
             ---> FFI.UInt32.fromVal
                   && FFI.UInt32.fromVal
                   && I
          )
            getSize_
            (
              self
               & 0
               & 0
            )
      in
        (rows, columns)
      end
    fun resize self rows columns =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
         ---> I
      )
        setColSpacing_
        (
          self
           & column
           & spacing
        )
    fun setColSpacings self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.withVal ---> I) setColSpacings_ (self & spacing)
    fun setHomogeneous self homogeneous = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setRowSpacing self row spacing =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
         ---> I
      )
        setRowSpacing_
        (
          self
           & row
           & spacing
        )
    fun setRowSpacings self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.withVal ---> I) setRowSpacings_ (self & spacing)
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
