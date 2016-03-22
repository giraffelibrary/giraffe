structure GtkTable :>
  GTK_TABLE
    where type 'a class = 'a GtkTableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type attach_options_t = GtkAttachOptions.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_table_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgtk "gtk_table_new")
          (
            FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val attach_ =
        call (load_sym libgtk "gtk_table_attach")
          (
            GtkTableClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> GtkAttachOptions.PolyML.cVal
             &&> GtkAttachOptions.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val attachDefaults_ =
        call (load_sym libgtk "gtk_table_attach_defaults")
          (
            GtkTableClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getColSpacing_ = call (load_sym libgtk "gtk_table_get_col_spacing") (GtkTableClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.UInt.PolyML.cVal)
      val getDefaultColSpacing_ = call (load_sym libgtk "gtk_table_get_default_col_spacing") (GtkTableClass.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val getDefaultRowSpacing_ = call (load_sym libgtk "gtk_table_get_default_row_spacing") (GtkTableClass.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val getHomogeneous_ = call (load_sym libgtk "gtk_table_get_homogeneous") (GtkTableClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getRowSpacing_ = call (load_sym libgtk "gtk_table_get_row_spacing") (GtkTableClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.UInt.PolyML.cVal)
      val getSize_ =
        call (load_sym libgtk "gtk_table_get_size")
          (
            GtkTableClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cRef
             &&> FFI.UInt.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val resize_ =
        call (load_sym libgtk "gtk_table_resize")
          (
            GtkTableClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setColSpacing_ =
        call (load_sym libgtk "gtk_table_set_col_spacing")
          (
            GtkTableClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setColSpacings_ = call (load_sym libgtk "gtk_table_set_col_spacings") (GtkTableClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val setHomogeneous_ = call (load_sym libgtk "gtk_table_set_homogeneous") (GtkTableClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setRowSpacing_ =
        call (load_sym libgtk "gtk_table_set_row_spacing")
          (
            GtkTableClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setRowSpacings_ = call (load_sym libgtk "gtk_table_set_row_spacings") (GtkTableClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkTableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type attach_options_t = GtkAttachOptions.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new rows columns homogeneous =
      (
        FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.Bool.C.withVal
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
        GtkTableClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> GtkAttachOptions.C.withVal
         &&&> GtkAttachOptions.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
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
        GtkTableClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
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
    fun getColSpacing self column = (GtkTableClass.C.withPtr &&&> FFI.UInt.C.withVal ---> FFI.UInt.C.fromVal) getColSpacing_ (self & column)
    fun getDefaultColSpacing self = (GtkTableClass.C.withPtr ---> FFI.UInt.C.fromVal) getDefaultColSpacing_ self
    fun getDefaultRowSpacing self = (GtkTableClass.C.withPtr ---> FFI.UInt.C.fromVal) getDefaultRowSpacing_ self
    fun getHomogeneous self = (GtkTableClass.C.withPtr ---> FFI.Bool.C.fromVal) getHomogeneous_ self
    fun getRowSpacing self row = (GtkTableClass.C.withPtr &&&> FFI.UInt.C.withVal ---> FFI.UInt.C.fromVal) getRowSpacing_ (self & row)
    fun getSize self =
      let
        val rows
         & columns
         & () =
          (
            GtkTableClass.C.withPtr
             &&&> FFI.UInt.C.withRefVal
             &&&> FFI.UInt.C.withRefVal
             ---> FFI.UInt.C.fromVal
                   && FFI.UInt.C.fromVal
                   && I
          )
            getSize_
            (
              self
               & FFI.UInt.null
               & FFI.UInt.null
            )
      in
        (rows, columns)
      end
    fun resize self rows columns =
      (
        GtkTableClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
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
        GtkTableClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> I
      )
        setColSpacing_
        (
          self
           & column
           & spacing
        )
    fun setColSpacings self spacing = (GtkTableClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setColSpacings_ (self & spacing)
    fun setHomogeneous self homogeneous = (GtkTableClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setRowSpacing self row spacing =
      (
        GtkTableClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> I
      )
        setRowSpacing_
        (
          self
           & row
           & spacing
        )
    fun setRowSpacings self spacing = (GtkTableClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setRowSpacings_ (self & spacing)
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
