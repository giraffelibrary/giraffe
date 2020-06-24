structure GtkSourceRegionIter :>
  GTK_SOURCE_REGION_ITER
    where type t = GtkSourceRegionIterRecord.t =
  struct
    val getSubregion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_region_iter_get_subregion" :
              GtkSourceRegionIterRecord.FFI.non_opt GtkSourceRegionIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val isEnd_ = _import "gtk_source_region_iter_is_end" : GtkSourceRegionIterRecord.FFI.non_opt GtkSourceRegionIterRecord.FFI.p -> GBool.FFI.val_;
    val next_ = _import "gtk_source_region_iter_next" : GtkSourceRegionIterRecord.FFI.non_opt GtkSourceRegionIterRecord.FFI.p -> GBool.FFI.val_;
    type t = GtkSourceRegionIterRecord.t
    fun getSubregion self =
      let
        val start
         & end'
         & retVal =
          (
            GtkSourceRegionIterRecord.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            getSubregion_
            (
              self
               & ()
               & ()
            )
      in
        if retVal then SOME (start, end') else NONE
      end
    fun isEnd self = (GtkSourceRegionIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) isEnd_ self
    fun next self = (GtkSourceRegionIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) next_ self
  end
