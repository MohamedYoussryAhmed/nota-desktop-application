cmake_minimum_required(VERSION 3.16)

project(Nota VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appNota
    main.cpp
	# include files
	include/Driver.h
	# src files
	src/Driver.cpp
)

qt_add_qml_module(appNota
    URI Nota
    VERSION 1.0
	RESOURCE_PREFIX /
	RESOURCES
		resources/icons/logo.png
		# SVG
		resources/icons/svg/add-solid.svg
		resources/icons/svg/download.svg
		resources/icons/svg/duplicate.svg
		resources/icons/svg/hashtag.svg
		resources/icons/svg/square-terminal.svg
		resources/icons/svg/trash.svg
		resources/icons/svg/trophy.svg
	QML_FILES
		Main.qml
		resources/qml/SideBar.qml
		resources/qml/VerticalBarButton.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appNota PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appNota
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appNota
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appNota
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
