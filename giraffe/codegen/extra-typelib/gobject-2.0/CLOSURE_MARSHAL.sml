signature CLOSURE_MARSHAL =
  sig
    type ('a, 'b) accessor


    type 'a get
    val &&&> : 'a get * 'b get -> ('a, 'b) pair get

    type 'a set
    type 'a ret
    val && : 'a set * 'b ret -> ('a, 'b) pair ret

    type 'a marshaller
    val ---> : 'a get * 'b ret -> ('a -> 'b) marshaller


    val get : Word32.word -> ('a, 'b) accessor -> 'a get
    val set : Word32.word -> ('a, 'b) accessor -> 'b set
    val ret : ('a, 'b) accessor -> 'b ret

    val void : unit get
    val ret_void : unit ret


    structure C :
      sig
        type callback
        val withCallback :
          (callback -> 'c) -> (('a -> 'b) marshaller * ('a -> 'b)) -> 'c
        (* The callback value passed to the C side should be used as the
         * callback data argument and the dispatch and notify functions
         * set to `giraffe_closure_dispatch` and `giraffe_closure_destroy`
         * respectively, as done by `giraffe_g_closure_new`.  (Note that
         * `withCallback` is unlikely to be used by any function other than
         * `GClosure.new`.)
         *
         * MLton-specific note
         *
         * `withCallback` adds the SML callback function to the closure
         * callback table.  It is removed when `giraffe_closure_destroy` is
         * called.  For a closure object created by `giraffe_g_closure_new`,
         * this occurs when  the closure's reference count becomes zero, just
         * before the closure is destroyed.  Consequently, every closure
         * object has an entry in the closure callback table for its
         * lifetime.
         *)
      end
  end
