#
#  Copyright (c) 2019            Jeong Han Lee
#  Copyright (c) 2018 - 2019     European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : Jeong Han Lee
# email   : han.lee@esss.se
# Date    : Thursday, March 28 23:06:01 CET 2019
# version : 0.0.4
#

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS

APPSRC:=src

USR_CFLAGS   += -shared -fPIC -Wall -Wextra
USR_CPPFLAGS += -shared -fPIC -Wall -Wextra -std=c++17
USR_LDFLAGS  += -lstdc++ 

USR_INCLUDES += -I$(where_am_I)/include

# Don't include debug symbols in the binary needed for a debugger
# We don't have a debuuger, so shrink the size from 29MB to 9MB under
# /opt/epics/modules
OPT_CXXFLAGS_YES = -O3

# Does bot work for some reason. Patch sources instead
KEEP_HEADER_SUBDIRS += include

HEADERS += include/ruckig/brake.hpp
HEADERS += include/ruckig/block.hpp
HEADERS += include/ruckig/input_parameter.hpp
HEADERS += include/ruckig/output_parameter.hpp
HEADERS += include/ruckig/position.hpp
HEADERS += include/ruckig/profile.hpp
HEADERS += include/ruckig/reflexxes_comparison.hpp
HEADERS += include/ruckig/roots.hpp
HEADERS += include/ruckig/ruckig.hpp
HEADERS += include/ruckig/trajectory.hpp
HEADERS += include/ruckig/utils.hpp
HEADERS += include/ruckig/velocity.hpp

SOURCES += $(APPSRC)/position-step1.cpp
SOURCES += $(APPSRC)/position-step2.cpp
SOURCES += $(APPSRC)/velocity-step1.cpp
SOURCES += $(APPSRC)/velocity-step2.cpp
SOURCES += $(APPSRC)/brake.cpp

db: 
.PHONY: db 
#
.PHONY: vlibs
vlibs:
#
