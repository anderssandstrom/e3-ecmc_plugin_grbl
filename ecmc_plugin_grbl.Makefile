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

# 
APPSRC := grbl/src
¤APPINC := $(PATCH_DIR)/include
USR_CFLAGS   += -shared -fPIC -Wall -Wextra

# c++17 not allowed because of centos 7
#USR_CPPFLAGS += -shared -fPIC -Wall -Wextra -std=c++17
USR_CPPFLAGS += -shared -fPIC -Wall -Wextra
USR_LDFLAGS  += -lstdc++ 

USR_INCLUDES += -I$(where_am_I)/include

# Don't include debug symbols in the binary needed for a debugger
# We don't have a debuuger, so shrink the size from 29MB to 9MB under
# /opt/epics/modules
OPT_CXXFLAGS_YES = -O3

SOURCES +=main.c
SOURCES +=motion_control.c
SOURCES +=gcode.c
SOURCES +=spindle_control.c
SOURCES +=coolant_control.c
SOURCES +=serial.c 
SOURCES +=protocol.c
SOURCES +=stepper.c
SOURCES +=eeprom.c
SOURCES +=settings.c
SOURCES +=planner.c
SOURCES +=nuts_bolts.c
SOURCES +=limits.c
SOURCES +=jog.c
SOURCES +=print.c
SOURCES +=probe.c
SOURCES +=report.c
SOURCES +=system.c

db: 
.PHONY: db 
#
.PHONY: vlibs
vlibs:
#
