##
# Ruben zigzag
#
# MAKE SURE THAT IM2COL IS SET TO TRUE
OUTPUT_DIR := hls/MobileNet_v1_L3_4x8/ # Don't forget backslash behind folder name
XML := Ruben_results/all_su_best_tm_otf/MobileNet_v1_L3_M1_SU1_min_en.xml
all: zigzag open_xml config_files run_tb
tb: config_files run_tb
zigzag:
	python top_module.py \
		--set Ruben_inputs/settings.yaml \
		--arch Ruben_inputs/architecture.yaml \
		--map Ruben_inputs/mapping.yaml \
		--mempool Ruben_inputs/memory_pool.yaml
	mkdir -p $(OUTPUT_DIR)
	cp $(XML) $(OUTPUT_DIR)
open_xml:
	firefox $(XML) &
config_files:
	mkdir -p $(OUTPUT_DIR)
	python xml_to_hls_extraction.py $(XML) $(OUTPUT_DIR)
	cp hls/top.h hls/run hls/directives.tcl $(OUTPUT_DIR)
	@echo "For more excessive changes, you should take a look in the generated output files and the included source code!"
run_tb:
	cd $(OUTPUT_DIR) && ./run
catapult:
	cd $(OUTPUT_DIR) && catapult -file directives.tcl &
clean:
	rm -rf ./Ruben_results
	rm -rf $(OUTPUT_DIR)

# end
