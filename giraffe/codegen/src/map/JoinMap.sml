functor JoinMap(
  structure L : MAP
  structure R : MAP 
) :>
  MAP
    where type key = L.key * R.key
    where type 'a t = 'a R.t L.t =
  struct
    type key = L.key * R.key
    type 'a maplet = key * 'a

    type 'a t = 'a R.t L.t

    val empty = L.empty
    val isEmpty = L.isEmpty

    fun mapWithKey g f (kl, x) = g (fn (kr, d) => f ((kl, kr), d)) x
    fun mapMapWithKey h g f (kl, x) =
      h (fn (kr, d) => g ((kl, kr), d)) (fn (kr, d) => f ((kl, kr), d)) x
    fun foldWithKey g f ((kl, x), a) = g (fn ((kr, d), a) => f (((kl, kr), d), a)) (x, a)
    fun foldLWithKey g f (a, (kl, x)) = g (fn (a, (kr, d)) => f (a, ((kl, kr), d))) (a, x)
    fun foldMapWithKey h g f ((kl, x), a) =
      h (fn (kr, d) => g ((kl, kr), d)) (fn ((kr, d), a) => f (((kl, kr), d), a)) (x, a)

    fun singleton ((kl, kr), d) = L.singleton (kl, R.singleton (kr, d))
    fun singletonMap g ((kl, kr), d) =
      L.singleton (kl, R.singletonMap g (kr, d))
    fun singletonMapi g ((kl, kr), d) =
      L.singleton (kl, mapWithKey R.singletonMapi g (kl, (kr, d)))
    fun singletonFoldMap g ((kl, kr), d) =
      let
        val (a, dl) = R.singletonFoldMap g (kr, d)
      in
        (a, L.singleton (kl, dl))
      end
    fun singletonFoldMapi g ((kl, kr), d) =
      let
        val (a, dl) = mapWithKey R.singletonFoldMapi g (kl, (kr, d))
      in
        (a, L.singleton (kl, dl))
      end

    fun insert f (((kl, kr), d), m) =
      L.insertMap R.singleton (R.insert f) ((kl, (kr, d)), m)
    fun insertMap g f (((kl, kr), d), m) =
      L.insertMap (R.singletonMap g) (R.insertMap g f) ((kl, (kr, d)), m)
    fun insertFoldMap g f (((kl, kr), d), m) =
      L.insertFoldMap (R.singletonFoldMap g) (R.insertFoldMap g f)
        ((kl, (kr, d)), m)

    fun inserti f (((kl, kr), d), m) =
      L.insertMapi (R.singleton o #2) (foldWithKey R.inserti f) ((kl, (kr, d)), m)
    fun insertMapi g f (((kl, kr), d), m) =
      L.insertMapi (mapWithKey R.singletonMapi g) (foldMapWithKey R.insertMapi g f)
        ((kl, (kr, d)), m)
    fun insertFoldMapi g f (((kl, kr), d), m) =
      L.insertFoldMapi (mapWithKey R.singletonFoldMapi g) (foldMapWithKey R.insertFoldMapi g f)
        ((kl, (kr, d)), m)

    fun update f ((kl, kr), ml) =
      L.update (fn mr => R.update f (kr, mr)) (kl, ml)

    fun toNonEmpty m = if R.isEmpty m then NONE else SOME m
    fun mapSnd f (a, b) = (a, f b)

    fun delete ((kl, kr), ml) =
      L.removeMap (toNonEmpty o R.delete) ((kl, kr), ml)

    fun remove f ((kl, kr), ml) =
      L.removeMap (toNonEmpty o R.remove f) ((kl, kr), ml)
    fun removeMap f (((kl, kr), x), ml) =
      L.removeMap (toNonEmpty o R.removeMap f) ((kl, (kr, x)), ml)
    fun removeFoldMap g f (((kl, kr), x), ml) =
      L.removeFoldMap (g o #2)
        (mapSnd toNonEmpty o R.removeFoldMap g f)
        ((kl, (kr, x)), ml)

    fun removei f ((kl, kr), ml) =
      L.removeMapi (toNonEmpty o mapWithKey R.removei f) ((kl, kr), ml)
    fun removeMapi f (((kl, kr), x), ml) =
      L.removeMapi (toNonEmpty o mapWithKey R.removeMapi f) ((kl, (kr, x)), ml)
    fun removeFoldMapi g f (((kl, kr), x), ml) =
      L.removeFoldMapi (mapWithKey Fn.id g)
        (mapSnd toNonEmpty o mapMapWithKey R.removeFoldMapi g f)
        ((kl, (kr, x)), ml)

    fun lookup ml (kl, kr) =
      case L.lookup ml kl of
        SOME mr => R.lookup mr kr
      | NONE    => NONE

    fun map f = L.map (R.map f)
    fun mapi f = L.mapi (mapWithKey R.mapi f)

    fun app f = L.app (R.app f)
    fun appi f = L.appi (mapWithKey R.appi f)

    fun mapPartial f = L.mapPartial (toNonEmpty o R.mapPartial f)
    fun mapPartiali f = L.mapPartiali (toNonEmpty o mapWithKey R.mapPartiali f)

    fun filter f = L.mapPartial (toNonEmpty o R.filter f)
    fun filteri f = L.mapPartiali (toNonEmpty o mapWithKey R.filteri f)

    fun fold f = L.fold (R.fold f)
    fun foldi f = L.foldi (foldWithKey R.foldi f)
    fun foldR f = L.foldR (R.foldR f)
    fun foldRi f = L.foldRi (foldWithKey R.foldRi f)
    fun foldL f = L.foldL (R.foldL f)
    fun foldLi f = L.foldLi (foldLWithKey R.foldLi f)

    fun size m = L.fold (fn (mr, a) => a + R.size mr) (m, 0)
  end
