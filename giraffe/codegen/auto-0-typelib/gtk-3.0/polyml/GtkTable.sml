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
      val getType_ = call (getSymbol "gtk_table_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_table_new")
          (
            GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val attach_ =
        call (getSymbol "gtk_table_attach")
          (
            GtkTableClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GtkAttachOptions.PolyML.cVal
             &&> GtkAttachOptions.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val attachDefaults_ =
        call (getSymbol "gtk_table_attach_defaults")
          (
            GtkTableClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val getColSpacing_ = call (getSymbol "gtk_table_get_col_spacing") (GtkTableClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> GUInt32.PolyML.cVal)
      val getDefaultColSpacing_ = call (getSymbol "gtk_table_get_default_col_spacing") (GtkTableClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getDefaultRowSpacing_ = call (getSymbol "gtk_table_get_default_row_spacing") (GtkTableClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getHomogeneous_ = call (getSymbol "gtk_table_get_homogeneous") (GtkTableClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRowSpacing_ = call (getSymbol "gtk_table_get_row_spacing") (GtkTableClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> GUInt32.PolyML.cVal)
      val getSize_ =
        call (getSymbol "gtk_table_get_size")
          (
            GtkTableClass.PolyML.cPtr
             &&> GUInt32.PolyML.cRef
             &&> GUInt32.PolyML.cRef
             --> cVoid
          )
      val resize_ =
        call (getSymbol "gtk_table_resize")
          (
            GtkTableClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val setColSpacing_ =
        call (getSymbol "gtk_table_set_col_spacing")
          (
            GtkTableClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val setColSpacings_ = call (getSymbol "gtk_table_set_col_spacings") (GtkTableClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setHomogeneous_ = call (getSymbol "gtk_table_set_homogeneous") (GtkTableClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRowSpacing_ =
        call (getSymbol "gtk_table_set_row_spacing")
          (
            GtkTableClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val setRowSpacings_ = call (getSymbol "gtk_table_set_row_spacings") (GtkTableClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkTableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type attach_options_t = GtkAttachOptions.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        rows,
        columns,
        homogeneous
      ) =
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
    fun attach
      self
      (
        child,
        leftAttach,
        rightAttach,
        topAttach,
        bottomAttach,
        xoptions,
        yoptions,
        xpadding,
        ypadding
      ) =
      (
        GtkTableClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
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
    fun attachDefaults
      self
      (
        widget,
        leftAttach,
        rightAttach,
        topAttach,
        bottomAttach
      ) =
      (
        GtkTableClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
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
    fun getColSpacing self column = (GtkTableClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> GUInt32.FFI.fromVal) getColSpacing_ (self & column)
    fun getDefaultColSpacing self = (GtkTableClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getDefaultColSpacing_ self
    fun getDefaultRowSpacing self = (GtkTableClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getDefaultRowSpacing_ self
    fun getHomogeneous self = (GtkTableClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHomogeneous_ self
    fun getRowSpacing self row = (GtkTableClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> GUInt32.FFI.fromVal) getRowSpacing_ (self & row)
    fun getSize self =
      let
        val rows
         & columns
         & () =
          (
            GtkTableClass.FFI.withPtr false
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
    fun resize self (rows, columns) =
      (
        GtkTableClass.FFI.withPtr false
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
    fun setColSpacing self (column, spacing) =
      (
        GtkTableClass.FFI.withPtr false
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
    fun setColSpacings self spacing = (GtkTableClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setColSpacings_ (self & spacing)
    fun setHomogeneous self homogeneous = (GtkTableClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setRowSpacing self (row, spacing) =
      (
        GtkTableClass.FFI.withPtr false
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
    fun setRowSpacings self spacing = (GtkTableClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setRowSpacings_ (self & spacing)
    local
      open ValueAccessor
    in
      val columnSpacingProp =
        {
          name = "column-spacing",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val homogeneousProp =
        {
          name = "homogeneous",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val nColumnsProp =
        {
          name = "n-columns",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val nRowsProp =
        {
          name = "n-rows",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val rowSpacingProp =
        {
          name = "row-spacing",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
    end
  end
