structure GtkTable :>
  GTK_TABLE
    where type 'a class_t = 'a GtkTableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type attach_options_t = GtkAttachOptions.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_table_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgtk "gtk_table_new")
          (
            FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val attach_ =
        call (load_sym libgtk "gtk_table_attach")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> GtkAttachOptions.PolyML.cVal
             &&> GtkAttachOptions.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val attachDefaults_ =
        call (load_sym libgtk "gtk_table_attach_defaults")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getColSpacing_ = call (load_sym libgtk "gtk_table_get_col_spacing") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.UInt32.PolyML.cVal)
      val getDefaultColSpacing_ = call (load_sym libgtk "gtk_table_get_default_col_spacing") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getDefaultRowSpacing_ = call (load_sym libgtk "gtk_table_get_default_row_spacing") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getHomogeneous_ = call (load_sym libgtk "gtk_table_get_homogeneous") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getRowSpacing_ = call (load_sym libgtk "gtk_table_get_row_spacing") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.UInt32.PolyML.cVal)
      val getSize_ =
        call (load_sym libgtk "gtk_table_get_size")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cRef
             &&> FFI.UInt32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val resize_ =
        call (load_sym libgtk "gtk_table_resize")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setColSpacing_ =
        call (load_sym libgtk "gtk_table_set_col_spacing")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setColSpacings_ = call (load_sym libgtk "gtk_table_set_col_spacings") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setHomogeneous_ = call (load_sym libgtk "gtk_table_set_homogeneous") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setRowSpacing_ =
        call (load_sym libgtk "gtk_table_set_row_spacing")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setRowSpacings_ = call (load_sym libgtk "gtk_table_set_row_spacings") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkTableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type attach_options_t = GtkAttachOptions.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new rows columns homogeneous =
      (
        FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> GtkAttachOptions.C.withVal
         &&&> GtkAttachOptions.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
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
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
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
    fun getColSpacing self column = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> FFI.UInt32.C.fromVal) getColSpacing_ (self & column)
    fun getDefaultColSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getDefaultColSpacing_ self
    fun getDefaultRowSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getDefaultRowSpacing_ self
    fun getHomogeneous self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHomogeneous_ self
    fun getRowSpacing self row = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> FFI.UInt32.C.fromVal) getRowSpacing_ (self & row)
    fun getSize self =
      let
        val rows
         & columns
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.UInt32.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && FFI.UInt32.C.fromVal
                   && I
          )
            getSize_
            (
              self
               & FFI.UInt32.null
               & FFI.UInt32.null
            )
      in
        (rows, columns)
      end
    fun resize self rows columns =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
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
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        setColSpacing_
        (
          self
           & column
           & spacing
        )
    fun setColSpacings self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setColSpacings_ (self & spacing)
    fun setHomogeneous self homogeneous = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setRowSpacing self row spacing =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        setRowSpacing_
        (
          self
           & row
           & spacing
        )
    fun setRowSpacings self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setRowSpacings_ (self & spacing)
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
