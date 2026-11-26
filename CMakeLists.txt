cmake_minimum_required(VERSION 3.22)
project(ult VERSION 1.1.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(JUCE_PATH "" CACHE PATH "Path to the JUCE checkout")
if (JUCE_PATH STREQUAL "")
    foreach(candidate
        "${CMAKE_CURRENT_LIST_DIR}/../JUCE"
        "C:/JUCE"
        "$ENV{USERPROFILE}/JUCE"
        "$ENV{USERPROFILE}/Documents/JUCE"
        "C:/Program Files/JUCE")
        if (EXISTS "${candidate}/CMakeLists.txt")
            set(JUCE_PATH "${candidate}")
            break()
        endif()
    endforeach()
endif()
if (NOT EXISTS "${JUCE_PATH}/CMakeLists.txt")
    message(FATAL_ERROR "JUCE was not found at ${JUCE_PATH}. Set -DJUCE_PATH=D:/JUCE")
endif()
add_subdirectory("${JUCE_PATH}" JUCE)

juce_add_binary_data(ult_fonts
    SOURCES
        Assets/Fonts/InterRegular.otf
        Assets/Fonts/InterSemiBold.otf
        Assets/Fonts/InterBold.otf
        Assets/autotune.jpg
        Assets/compressor.jpg
        Assets/de-esser.jpg
        Assets/eq.jpg
        Assets/gate.jpg
        Assets/shtag772_ui.wav
        Assets/DefaultLayout.xml
        Assets/power_off.png
        "Assets/Presets/Clean vox.ultpreset"
        "Assets/Presets/SoundCloud.ultpreset"
        "Assets/Presets/Phone.ultpreset"
        "Assets/Presets/Rockstar.ultpreset"
        "Assets/Presets/Lo-Fi.ultpreset"
        "Assets/Presets/swagghazard.ultpreset"
        "Assets/Presets/matrasss.ultpreset"
        "Assets/Presets/BLAXXXi.ultpreset"
        "Assets/Presets/Wayde.ultpreset"
        "Assets/Presets/iMan.ultpreset"
)

juce_add_plugin(ult
    COMPANY_NAME "swagghazard"
    BUNDLE_ID "com.swagghazard.ult"
    PLUGIN_MANUFACTURER_CODE Swgh
    PLUGIN_CODE Extn
    FORMATS VST3
    PRODUCT_NAME "ult"
    VST3_CATEGORIES Fx
    IS_SYNTH FALSE
    NEEDS_MIDI_INPUT FALSE
    NEEDS_MIDI_OUTPUT FALSE
    IS_MIDI_EFFECT FALSE
    EDITOR_WANTS_KEYBOARD_FOCUS FALSE
    COPY_PLUGIN_AFTER_BUILD FALSE
)

juce_generate_juce_header(ult)

# Diagnostic: keep JUCE image storage CPU-backed while testing NVIDIA D3D11 hang.
target_compile_definitions(ult PRIVATE JUCE_USE_SOFTWARE_IMAGE_TYPE=1 JUCE_DIRECT2D=0)

target_sources(ult PRIVATE
    Sources/PluginProcessor.cpp
    Sources/PluginProcessor.h
    Sources/PluginEditor.cpp
    Sources/PluginEditor.h
    Sources/UltGuide.h
    Sources/DSP/FaustOtt.cpp
    Sources/DSP/FaustOtt.h
    Sources/DSP/OctaveShifter.cpp
    Sources/DSP/OctaveShifter.h
    Sources/DSP/UltReverb.cpp
    Sources/DSP/UltReverb.h
    Sources/DSP/UltDoubler.cpp
    Sources/DSP/UltDoubler.h

    Sources/ThirdParty/SnapTune/AutoTuneEngine.cpp
    Sources/ThirdParty/SnapTune/AutoTuneEngine.h
    Sources/ThirdParty/SnapTune/PitchDetector.cpp
    Sources/ThirdParty/SnapTune/PitchDetector.h
    Sources/ThirdParty/SnapTune/Scales.h
    Sources/ThirdParty/SnapTune/VibratoTracker.h
    Sources/ThirdParty/SnapTune/KeyFinder.h

    Sources/ThirdParty/Airwindows/DeBessAdapter.cpp
    Sources/ThirdParty/Airwindows/Density3Adapter.cpp
    Sources/ThirdParty/Airwindows/StereoDoublerAdapter.cpp
    Sources/ThirdParty/Airwindows/StereoChorusAdapter.cpp
    Sources/ThirdParty/Airwindows/VerbityAdapter.cpp

    Sources/ThirdParty/Airwindows/Compat/audioeffectx.h
    Sources/ThirdParty/Airwindows/Original/DeBess/DeBess.h
    Sources/ThirdParty/Airwindows/Original/Density3/Density3.h
    Sources/ThirdParty/Airwindows/Original/StereoDoubler/StereoDoubler.h
    Sources/ThirdParty/Airwindows/Original/StereoChorus/StereoChorus.h
    Sources/ThirdParty/Airwindows/Original/Verbity/Verbity.h

    Sources/ThirdParty/Touchstone/refcomp/Engine.h
    Sources/ThirdParty/Touchstone/refcomp/ADAA.h
    Sources/ThirdParty/Touchstone/refcomp/AnalogFlaws.h
    Sources/ThirdParty/Touchstone/refcomp/Ballistics.h
    Sources/ThirdParty/Touchstone/refcomp/Common.h
    Sources/ThirdParty/Touchstone/refcomp/DetectorChain.h
    Sources/ThirdParty/Touchstone/refcomp/GainSolverQP.h
    Sources/ThirdParty/Touchstone/refcomp/Halfband.h
    Sources/ThirdParty/Touchstone/refcomp/MathOps.h
    Sources/ThirdParty/Touchstone/refcomp/Saturators.h
    Sources/ThirdParty/Touchstone/refcomp/StaticCurve.h
    Sources/ThirdParty/Touchstone/refcomp/TopologyClean.h
    Sources/ThirdParty/Touchstone/refcomp/TopologyFET.h
    Sources/ThirdParty/Touchstone/refcomp/TopologyOptimal.h
    Sources/ThirdParty/Touchstone/refcomp/TopologyOpto.h
    Sources/ThirdParty/Touchstone/refcomp/TopologyVCA.h
    Sources/ThirdParty/Touchstone/refcomp/TopologyVariMu.h
    Sources/ThirdParty/Touchstone/refcomp/TopologyVoice.h
)

target_include_directories(ult PRIVATE
    Sources
    Sources/ThirdParty/SnapTune
    Sources/ThirdParty/Touchstone
    Sources/ThirdParty/Airwindows
    Sources/ThirdParty/Airwindows/Compat
)

target_compile_definitions(ult PUBLIC
    JUCE_WEB_BROWSER=0
    JUCE_USE_CURL=0
    JUCE_VST3_CAN_REPLACE_VST2=0
    SNAPTUNE_DIAGNOSTICS=0
)

target_link_libraries(ult PRIVATE
    juce::juce_audio_utils
    juce::juce_dsp
    ult_fonts
    juce::juce_recommended_config_flags
    juce::juce_recommended_warning_flags
)

if (WIN32)
    target_link_libraries(ult PRIVATE winhttp winmm)
endif()

if (MSVC)
    target_compile_options(ult PRIVATE /W4 /permissive- /EHsc /utf-8)
endif()
