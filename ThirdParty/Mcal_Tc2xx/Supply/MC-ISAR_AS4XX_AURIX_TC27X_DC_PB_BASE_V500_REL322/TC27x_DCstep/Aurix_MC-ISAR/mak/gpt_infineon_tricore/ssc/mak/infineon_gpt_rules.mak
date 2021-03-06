#*******************************************************************************
#                                                                             **
#* Copyright (C) Infineon Technologies (2012)                                 **
#*                                                                            **
#* All rights reserved.                                                       **
#*                                                                            **
#* This document contains proprietary information belonging to Infineon       **
#* Technologies. Passing on and copying of this document, and communication   **
#* of its contents is not permitted without prior written authorization.      **
#*                                                                            **
#*******************************************************************************
#*                                                                            **
#*  FILENAME  : infineon_gpt_rules.mak                                        **
#*                                                                            **
#*  VERSION   : 0.0.3                                                         **
#*                                                                            **
#*  DATE      : 2012.10.25                                                    **
#*                                                                            **
#*                                                                            **
#*                                                                            **
#*  AUTHOR    : DL-AUTOSAR-Engineering                                        **
#*                                                                            **
#*  VENDOR    : Infineon Technologies                                         **
#*                                                                            **
#*  DESCRIPTION  : This make file is used to build the GPT driver             **
#*                                                                            **
#*                                                                            **
#*  MAY BE CHANGED BY USER [yes/no]: no                                       **
#*                                                                            **
#******************************************************************************/

#******************************************************************************
#*                      Author(s) Identity                                   **
#******************************************************************************
#*                                                                           **
#* Initials     Name                                                         **
#* --------------------------------------------------------------------------**
#* AD          Abhishek Dwivedi                                              **
#* RS           Roopa Sirur                                                  **
#*                                                                           **
#*****************************************************************************/


#*******************************************************************************
#*                      Revision Control History                              **
#******************************************************************************/
#*
#*  V0.0.3 : 2012.10.25, AD  : Module specific compile variable introduced
#*  V0.0.2 : 2007.09.24, RS  : Only SSC based files should be compiled in this mak
#*  V0.0.1 : 2007.02.24, RS  : Initial version.
#*
#******************************************************************************/

#***************************** REQUIRE ****************************************/

include $(SSC_ROOT)/mak/autosar.mak
include $(SSC_ROOT)/mak/base_make.mak
include $(COMPILER_MAKE_PATH)/compiler.mak
include $(SSC_ROOT)/mak/gpt_infineon_tricore/ssc/mak/infineon_gpt_defs.mak
include $(SSC_ROOT)/mak/mcu_infineon_tricore/ssc/mak/infineon_gtm_defs.mak
include $(SSC_ROOT)/mak/ecum_infineon_tricore/ssc/mak/infineon_ecum_defs.mak

#***************************** SPECIFIC ****************************************/

headers = $(STANDARD_DEPENDANCY) $(GPT_DEP_HEADERS) 
GPT_INC_PATHS_FILE = gpt_include_paths.ifx

build_gpt_driver : info incpaths $(GPT_SSC_OBJECTS) 


$(GPT_BASE_PATH)/ssc/obj/Gpt.$(OBJ_FILE_SUFFIX) : $(GPT_BASE_PATH)/ssc/src/Gpt.c $(headers) $(DET_FILE_PATH)/Det.h $(MCALLIB_BASE_PATH)/ssc/inc/Mcal.h $(OS_FILE_PATH)/Os.h $(GPT_BASE_PATH)\ssc\inc\Gpt_Local.h
	@$(COMPILE_GPT)  $(OUTPUT) $(GPT_BASE_PATH)\ssc\obj\Gpt.$(OBJ_FILE_SUFFIX) $(STD_OPT_CC) $(FF_READ)$(GPT_INC_PATHS_FILE) $(OBJ_CREATION)  $(GPT_BASE_PATH)\ssc\src\Gpt.c  $(ERROR_REPORT)
	@-rm -f $(GPT_BASE_PATH)/ssc/obj/Gpt.ers

$(GPT_BASE_PATH)/ssc/obj/Gpt_Ver.$(OBJ_FILE_SUFFIX) : $(GPT_BASE_PATH)/ssc/src/Gpt_Ver.c $(headers) $(DET_FILE_PATH)/Det.h $(MCALLIB_BASE_PATH)/ssc/inc/Mcal.h $(OS_FILE_PATH)/Os.h $(GPT_BASE_PATH)\ssc\inc\Gpt_Local.h
	@$(COMPILE_GPT)  $(OUTPUT) $(GPT_BASE_PATH)\ssc\obj\Gpt_Ver.$(OBJ_FILE_SUFFIX) $(STD_OPT_CC) $(FF_READ)$(GPT_INC_PATHS_FILE) $(OBJ_CREATION)  $(GPT_BASE_PATH)\ssc\src\Gpt_Ver.c  $(ERROR_REPORT)
	@-rm -f $(GPT_BASE_PATH)/ssc/obj/Gpt_Ver.ers


.PHONY: clean
clean:
	@-rm -f $(GPT_OBJECTS)

.PHONY: wipe
wipe:
	@-rm -f *.src
	@-rm -f *.err

print:
	@echo $(GPT_OBJECTS)

incpaths:
	@echo $(STANDARD_INCLUDE) > $(GPT_INC_PATHS_FILE)
	@echo $(ECUM_INCLUDE_PATH) >> $(GPT_INC_PATHS_FILE)
	@echo $(GPT_INCLUDE_PATH) >> $(GPT_INC_PATHS_FILE)
	@echo $(GTM_INCLUDE_PATH) >> $(GPT_INC_PATHS_FILE)



info: 
	@echo -------------Compiling GPT Module---------------


