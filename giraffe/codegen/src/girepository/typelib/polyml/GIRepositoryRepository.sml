structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class = 'a GIRepositoryRepositoryClass.class
    where type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    where type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    where type typelibtype_t = GIRepositoryTypelibType.t =
  struct
    local
      open PolyMLFFI
    in
      val getDefault_ =
        call
          (getSymbol "g_irepository_get_default")
          (cVoid --> GObjectObjectClass.PolyML.cPtr)

      val prependSearchPath_ =
        call
          (getSymbol "g_irepository_prepend_search_path")
          (Utf8.PolyML.cInPtr --> cVoid)

      val loadTypelib_ =
        call
          (getSymbol "g_irepository_load_typelib")
          (GObjectObjectClass.PolyML.cPtr
            &&> GIRepositoryTypelibType.PolyML.cPtr
            &&> GIRepositoryRepositoryLoadFlags.PolyML.cVal
            &&> GLibErrorRecord.PolyML.cOutOptRef
            --> Utf8.PolyML.cOutPtr)

      val require_ =
        call
          (getSymbol "g_irepository_require")
          (GObjectObjectClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            &&> Utf8.PolyML.cInPtr
            &&> GIRepositoryRepositoryLoadFlags.PolyML.cVal
            &&> GLibErrorRecord.PolyML.cOutOptRef
            --> GIRepositoryTypelibType.PolyML.cPtr)

      val getDependencies_ =
        call
          (getSymbol "g_irepository_get_dependencies")
          (GObjectObjectClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> Utf8CPtrArray.PolyML.cOutOptPtr)

      val getNInfos_ =
        call
          (getSymbol "g_irepository_get_n_infos")
          (GObjectObjectClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> GInt32.PolyML.cVal)

      val getInfo_ =
        call
          (getSymbol "g_irepository_get_info")
          (GObjectObjectClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr)

      val getSharedLibrary_ =
        call
          (getSymbol "g_irepository_get_shared_library")
          (GObjectObjectClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> Utf8.PolyML.cOutOptPtr)

      val getVersion_ =
        call
          (getSymbol "g_irepository_get_version")
          (GObjectObjectClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> Utf8.PolyML.cOutOptPtr)

      val getCPrefix_ =
        call
          (getSymbol "g_irepository_get_c_prefix")
          (GObjectObjectClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> Utf8.PolyML.cOutOptPtr)
    end


    type 'a class = 'a GIRepositoryRepositoryClass.class
    type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    type typelibtype_t = GIRepositoryTypelibType.t


    (* The interface specified by G_I_REPOSITORY_REPOSITORY is a variation on
     * GIRepository to allow multiple versions of a namespace to be loaded in
     * the repository.  The GIRepository C library does not support multiple
     * versions so G_I_REPOSITORY_REPOSITORY is implemented by wrapping the
     * C functions 'get*' in a check that the name to version map specified
     * by the `typelibvers_t` argument is the same as the version already
     * loaded in the repository.
     *
     * The bindings to the C functions that are subsequently wrapped have the
     * suffix '1'. *)

    fun getDefault () =
      (I ---> GIRepositoryRepositoryClass.FFI.fromPtr false) getDefault_ ()

    fun loadTypelib repository typelib flags =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> GIRepositoryTypelibType.FFI.withPtr
         &&&> GIRepositoryRepositoryLoadFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 0
      )
        loadTypelib_
        (repository & typelib & flags & [])

    fun prependSearchPath directory =
      (Utf8.FFI.withPtr ---> I) prependSearchPath_ directory

    fun require1 repository (namespace_, version, flags) =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GIRepositoryRepositoryLoadFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GIRepositoryTypelibType.FFI.fromPtr false
      )
        require_
        (repository & namespace_ & version & flags & [])

    fun getDependencies1 repository namespace_ =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> Utf8CPtrArray.FFI.fromOptPtr 2
      )
        getDependencies_
        (repository & namespace_)

    fun getNInfos1 repository namespace_ =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GInt32.FFI.fromVal
      )
        getNInfos_
        (repository & namespace_)

    fun getInfo1 repository namespace_ index =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> GIRepositoryBaseInfoClass.FFI.fromPtr true
      )
        getInfo_
        (repository & namespace_ & index)

    fun getSharedLibrary1 repository namespace =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> Utf8.FFI.fromOptPtr 0
      )
        getSharedLibrary_
        (repository & namespace)

    fun getVersion1 repository namespace =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> Utf8.FFI.fromOptPtr 0
      )
        getVersion_
        (repository & namespace)

    fun getCPrefix1 repository namespace_ =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> Utf8.FFI.fromOptPtr 0
      )
        getCPrefix_
        (repository & namespace_)


    (* `typelibvers_t` is a map from names to versions. *)

    type typelibvers_t = string ListDict.t


    (* Support for extending `typelibvers_t` values. *)

    fun errMsgVerExists name ver =
      String.concat [
        "namespace '", name, "' version '", ver, "' already present"
      ]

    fun errMsgVerConflict name ver1 ver2 =
      String.concat [
        "namespace '", name, "' version '", ver1,
        "' conflicts with version '", ver2, "' that is already present"
      ]

    fun checkVer ((name, ver1), ver2) =
      if ver1 = ver2
      then raise Fail (errMsgVerExists name ver2)
      else raise Fail (errMsgVerConflict name ver1 ver2)

    fun insertTypelibVer ((name, ver), vers) =
      ListDict.inserti checkVer ((name, ver), vers)

    fun extendTypelibVers extraVers vers = foldl insertTypelibVer vers extraVers


    (* Checking `typelibvers_t` values is performed by `getVersion`. *)

    fun errMsgNamespaceNotInVers name  =
      String.concat [
        "typelib versions do not include namespace '",
        name,
        "'"
      ]

    fun errMsgNamesaceNotInRepo name =
      String.concat ["namespace '", name, "' not loaded"]

    fun errMsgVerMismatch name version versionLoaded  =
      String.concat [
        "typelib version for namespace '", name,
        "' is version '", version,
        "' but repository has version '", versionLoaded,
        "' loaded"
      ]

    fun getVersion repository versions name =
      case ListDict.lookup versions name of
        SOME version => (
          case getVersion1 repository name of
            SOME versionLoaded =>
              if version = versionLoaded
              then version
              else raise Fail (errMsgVerMismatch name version versionLoaded)
          | NONE               => raise Fail (errMsgNamesaceNotInRepo name)
        )
      | NONE         => raise Fail (errMsgNamespaceNotInVers name)


    (* Support for decoding a dependency of the form <name>-<version>. *)

    fun errMsgDependencyFormat dep  =
      String.concat [
        "dependecy \"",
        String.toString dep,
        "\" does not have the form <name>-<version>"
      ]

    fun parseDependency dep =
      case String.fields (fn c => c = #"-") dep of
        [name, version] => (name, version)
      | _               => raise Fail (errMsgDependencyFormat dep)


    (* Wrap GIRepository functions to support `typelibvers_t` *)

    fun convertUtf8CPtrArrayToList a =
      List.tabulate (Utf8CPtrArray.length a, Utf8CPtrArray.get a)

    fun require repository (namespace_, version, flags) =
      let
        val typelib = require1 repository (namespace_, version, flags)
        val dependencies =
          case getDependencies1 repository namespace_ of
            NONE      => ListDict.empty
          | SOME deps => extendTypelibVers (map parseDependency (convertUtf8CPtrArrayToList deps)) ListDict.empty

        val versions =
          ListDict.insert
            (fn _ => raise Fail "typelib dependency contains itself")
            ((namespace_, version), dependencies)
      in
        (typelib, versions)
      end

    fun getDependencies repository versions namespace_ = (
      ignore (getVersion repository versions namespace_);
      Option.map convertUtf8CPtrArrayToList (getDependencies1 repository namespace_)
    )

    fun getNInfos repository versions namespace_ = (
      ignore (getVersion repository versions namespace_);
      getNInfos1 repository namespace_
    )

    fun getInfo repository versions namespace_ index = (
      ignore (getVersion repository versions namespace_);
      getInfo1 repository namespace_ index
    )

    fun getSharedLibrary repository versions namespace_ = (
      ignore (getVersion repository versions namespace_);
      getSharedLibrary1 repository namespace_
    )

    fun getCPrefix repository versions namespace_ = (
      ignore (getVersion repository versions namespace_);
      getCPrefix1 repository namespace_
    )

  end
