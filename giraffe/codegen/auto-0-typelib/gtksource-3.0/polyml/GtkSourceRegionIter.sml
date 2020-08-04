structure GtkSourceRegionIter :>
  GTK_SOURCE_REGION_ITER
    where type t = GtkSourceRegionIterRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getSubregion_ =
        call (getSymbol "gtk_source_region_iter_get_subregion")
          (
            GtkSourceRegionIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val isEnd_ = call (getSymbol "gtk_source_region_iter_is_end") (GtkSourceRegionIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val next_ = call (getSymbol "gtk_source_region_iter_next") (GtkSourceRegionIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = GtkSourceRegionIterRecord.t
    fun getSubregion self =
      let
        val start
         & end'
         & retVal =
          (
            GtkSourceRegionIterRecord.FFI.withPtr false
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
    fun isEnd self = (GtkSourceRegionIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isEnd_ self
    fun next self = (GtkSourceRegionIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) next_ self
  end
