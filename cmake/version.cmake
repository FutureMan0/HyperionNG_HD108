function(SetVersionNumber PREFIX VERSION_STRING)

  STRING(REGEX MATCHALL "[0-9]+|-([A-Za-z0-9_.]+)" VERSION_PARTS ${VERSION_STRING} )
  LIST( LENGTH VERSION_PARTS VERSION_LEN)
  if(${VERSION_LEN} GREATER 0)
    LIST( GET VERSION_PARTS 0 VERSION_MAJOR )
  endif()

  if(${VERSION_LEN} GREATER 1)
    LIST( GET VERSION_PARTS 1 VERSION_MINOR )
  endif()

  if(${VERSION_LEN} GREATER 2)
    LIST( GET VERSION_PARTS 2 VERSION_PATCH )
  endif()

  if(${VERSION_LEN} GREATER 3)
    LIST( GET VERSION_PARTS 3 VERSION_PRE )
  endif()

  set(${PREFIX}_VERSION_MAJOR ${VERSION_MAJOR} PARENT_SCOPE)
  set(${PREFIX}_VERSION_MINOR ${VERSION_MINOR} PARENT_SCOPE)
  set(${PREFIX}_VERSION_PATCH ${VERSION_PATCH} PARENT_SCOPE)
  set(${PREFIX}_VERSION_PRE   ${VERSION_PRE}   PARENT_SCOPE)

  #if(NOT VERSION_PRE MATCHES "stable")
  #  set(${PREFIX}_VERSION_PRE   ${VERSION_PRE}   PARENT_SCOPE)
  #  set( VERSION_PRE_FULL "-${VERSION_PRE}")
  #endif()
endfunction()
