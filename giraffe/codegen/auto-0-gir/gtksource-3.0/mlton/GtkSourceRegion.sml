structure GtkSourceRegion :>
  GTK_SOURCE_REGION
    where type 'a class = 'a GtkSourceRegionClass.class
    where type region_iter_t = GtkSourceRegionIterRecord.t =
  struct
    val getType_ = _import "gtk_source_region_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_region_new" : GtkTextBufferClass.FFI.non_opt GtkTextBufferClass.FFI.p -> GtkSourceRegionClass.FFI.non_opt GtkSourceRegionClass.FFI.p;
    val addRegion_ = fn x1 & x2 => (_import "gtk_source_region_add_region" : GtkSourceRegionClass.FFI.non_opt GtkSourceRegionClass.FFI.p * GtkSourceRegionClass.FFI.opt GtkSourceRegionClass.FFI.p -> unit;) (x1, x2)
    val addSubregion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_region_add_subregion" :
              GtkSourceRegionClass.FFI.non_opt GtkSourceRegionClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getBounds_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_region_get_bounds" :
              GtkSourceRegionClass.FFI.non_opt GtkSourceRegionClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getBuffer_ = _import "gtk_source_region_get_buffer" : GtkSourceRegionClass.FFI.non_opt GtkSourceRegionClass.FFI.p -> GtkTextBufferClass.FFI.opt GtkTextBufferClass.FFI.p;
    val getStartRegionIter_ = fn x1 & x2 => (_import "gtk_source_region_get_start_region_iter" : GtkSourceRegionClass.FFI.non_opt GtkSourceRegionClass.FFI.p * GtkSourceRegionIterRecord.FFI.non_opt GtkSourceRegionIterRecord.FFI.p -> unit;) (x1, x2)
    val intersectRegion_ = fn x1 & x2 => (_import "gtk_source_region_intersect_region" : GtkSourceRegionClass.FFI.non_opt GtkSourceRegionClass.FFI.p * GtkSourceRegionClass.FFI.opt GtkSourceRegionClass.FFI.p -> GtkSourceRegionClass.FFI.opt GtkSourceRegionClass.FFI.p;) (x1, x2)
    val intersectSubregion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_region_intersect_subregion" :
              GtkSourceRegionClass.FFI.non_opt GtkSourceRegionClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               -> GtkSourceRegionClass.FFI.opt GtkSourceRegionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val isEmpty_ = _import "gtk_source_region_is_empty" : GtkSourceRegionClass.FFI.non_opt GtkSourceRegionClass.FFI.p -> GBool.FFI.val_;
    val subtractRegion_ = fn x1 & x2 => (_import "gtk_source_region_subtract_region" : GtkSourceRegionClass.FFI.non_opt GtkSourceRegionClass.FFI.p * GtkSourceRegionClass.FFI.opt GtkSourceRegionClass.FFI.p -> unit;) (x1, x2)
    val subtractSubregion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_region_subtract_subregion" :
              GtkSourceRegionClass.FFI.non_opt GtkSourceRegionClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "gtk_source_region_to_string" : GtkSourceRegionClass.FFI.non_opt GtkSourceRegionClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    type 'a class = 'a GtkSourceRegionClass.class
    type region_iter_t = GtkSourceRegionIterRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new buffer = (GtkTextBufferClass.FFI.withPtr false ---> GtkSourceRegionClass.FFI.fromPtr true) new_ buffer
    fun addRegion self regionToAdd = (GtkSourceRegionClass.FFI.withPtr false &&&> GtkSourceRegionClass.FFI.withOptPtr false ---> I) addRegion_ (self & regionToAdd)
    fun addSubregion self (start, end') =
      (
        GtkSourceRegionClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> I
      )
        addSubregion_
        (
          self
           & start
           & end'
        )
    fun getBounds self =
      let
        val start
         & end'
         & retVal =
          (
            GtkSourceRegionClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            getBounds_
            (
              self
               & ()
               & ()
            )
      in
        if retVal then SOME (start, end') else NONE
      end
    fun getBuffer self = (GtkSourceRegionClass.FFI.withPtr false ---> GtkTextBufferClass.FFI.fromOptPtr false) getBuffer_ self before GtkSourceRegionClass.FFI.touchPtr self
    fun getStartRegionIter self =
      let
        val iter & () = (GtkSourceRegionClass.FFI.withPtr false &&&> GtkSourceRegionIterRecord.FFI.withNewPtr ---> GtkSourceRegionIterRecord.FFI.fromPtr true && I) getStartRegionIter_ (self & ())
      in
        iter
      end
    fun intersectRegion self region2 = (GtkSourceRegionClass.FFI.withPtr false &&&> GtkSourceRegionClass.FFI.withOptPtr false ---> GtkSourceRegionClass.FFI.fromOptPtr true) intersectRegion_ (self & region2)
    fun intersectSubregion self (start, end') =
      (
        GtkSourceRegionClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> GtkSourceRegionClass.FFI.fromOptPtr true
      )
        intersectSubregion_
        (
          self
           & start
           & end'
        )
    fun isEmpty self = (GtkSourceRegionClass.FFI.withPtr false ---> GBool.FFI.fromVal) isEmpty_ self
    fun subtractRegion self regionToSubtract = (GtkSourceRegionClass.FFI.withPtr false &&&> GtkSourceRegionClass.FFI.withOptPtr false ---> I) subtractRegion_ (self & regionToSubtract)
    fun subtractSubregion self (start, end') =
      (
        GtkSourceRegionClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> I
      )
        subtractSubregion_
        (
          self
           & start
           & end'
        )
    fun toString self = (GtkSourceRegionClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) toString_ self
    local
      open ValueAccessor
    in
      val bufferProp =
        {
          name = "buffer",
          gtype = fn () => C.gtype GtkTextBufferClass.tOpt (),
          get = fn x => fn () => C.get GtkTextBufferClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkTextBufferClass.tOpt x
        }
    end
  end
