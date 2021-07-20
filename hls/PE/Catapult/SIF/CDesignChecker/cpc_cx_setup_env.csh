#! /bin/csh -f
setenv SYSTEMC_HOME /esat/micas-data/software/Mentor/catapult_10.5c/shared
setenv SYSTEMC_LIB_DIR /esat/micas-data/software/Mentor/catapult_10.5c/shared/lib
setenv CXX_FLAGS "-g -DCALYPTO_SKIP_SYSTEMC_VERSION_CHECK"
setenv LD_FLAGS "-lpthread"
setenv OSSIM ddd
setenv PATH /esat/micas-data/software/Mentor/catapult_10.5c/bin:$PATH
