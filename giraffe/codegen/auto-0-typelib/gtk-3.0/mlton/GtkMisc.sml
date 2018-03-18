structure GtkMisc :>
  GTK_MISC
    where type 'a class = 'a GtkMiscClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_misc_get_type" : unit -> GObjectType.FFI.val_;
    val getAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_misc_get_alignment" :
              GtkMiscClass.FFI.notnull GtkMiscClass.FFI.p
               * GFloat.FFI.ref_
               * GFloat.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_misc_get_padding" :
              GtkMiscClass.FFI.notnull GtkMiscClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_misc_set_alignment" :
              GtkMiscClass.FFI.notnull GtkMiscClass.FFI.p
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_misc_set_padding" :
              GtkMiscClass.FFI.notnull GtkMiscClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkMiscClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getAlignment self =
      let
        val xalign
         & yalign
         & () =
          (
            GtkMiscClass.FFI.withPtr
             &&&> GFloat.FFI.withRefVal
             &&&> GFloat.FFI.withRefVal
             ---> GFloat.FFI.fromVal
                   && GFloat.FFI.fromVal
                   && I
          )
            getAlignment_
            (
              self
               & GFloat.null
               & GFloat.null
            )
      in
        (xalign, yalign)
      end
    fun getPadding self =
      let
        val xpad
         & ypad
         & () =
          (
            GtkMiscClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPadding_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (xpad, ypad)
      end
    fun setAlignment self (xalign, yalign) =
      (
        GtkMiscClass.FFI.withPtr
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         ---> I
      )
        setAlignment_
        (
          self
           & xalign
           & yalign
        )
    fun setPadding self (xpad, ypad) =
      (
        GtkMiscClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setPadding_
        (
          self
           & xpad
           & ypad
        )
    local
      open Property
    in
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x,
          new = fn x => new "xalign" float x
        }
      val xpadProp =
        {
          get = fn x => get "xpad" int x,
          set = fn x => set "xpad" int x,
          new = fn x => new "xpad" int x
        }
      val yalignProp =
        {
          get = fn x => get "yalign" float x,
          set = fn x => set "yalign" float x,
          new = fn x => new "yalign" float x
        }
      val ypadProp =
        {
          get = fn x => get "ypad" int x,
          set = fn x => set "ypad" int x,
          new = fn x => new "ypad" int x
        }
    end
  end
