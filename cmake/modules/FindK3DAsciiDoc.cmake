INCLUDE(K3DParseArguments)

FIND_PROGRAM(ASCIIDOC_COMMAND asciidoc)
FIND_PROGRAM(A2X_COMMAND a2x)

FUNCTION(K3D_ADD_ASCIIDOC_MAN_PAGE DOCUMENT_NAME)
	K3D_PARSE_ARGUMENTS(DOCUMENT "SOURCE;DESTINATION" "" ${ARGN})

	SET(ARGUMENTS "")
#	LIST(APPEND ARGUMENTS --attribute docinfo)
#	LIST(APPEND ARGUMENTS --doctype manpage)
#	LIST(APPEND ARGUMENTS --backend docbook)
#	LIST(APPEND ARGUMENTS --out-file ${CMAKE_CURRENT_BINARY_DIR}/${DOCUMENT_NAME}.xml)
	LIST(APPEND ARGUMENTS --format manpage)
	LIST(APPEND ARGUMENTS --destination-dir ${DOCUMENT_DESTINATION})

	ADD_CUSTOM_COMMAND(
		COMMAND ${CMAKE_COMMAND} -E make_directory ${DOCUMENT_DESTINATION}
		OUTPUT ${DOCUMENT_DESTINATION}
		)

	ADD_CUSTOM_COMMAND(
		DEPENDS ${DOCUMENT_SOURCE} ${DOCUMENT_DESTINATION}
		WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
		COMMAND ${A2X_COMMAND} ${ARGUMENTS} ${DOCUMENT_SOURCE}
		OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${DOCUMENT_NAME}
		)

	ADD_CUSTOM_TARGET(${DOCUMENT_NAME} ALL
		DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${DOCUMENT_NAME}
		)
ENDFUNCTION()
