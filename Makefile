##
# Ruben zigzag
#
XML := Ruben_results/all_su_best_tm_otf/Test_layer_L3_M1_SU1_min_en.xml
OUTPUT_DIR := hls/new_test/
zigzag:
	python top_module.py \
		--set Ruben_inputs/settings.yaml \
		--arch Ruben_inputs/architecture.yaml \
		--map Ruben_inputs/mapping.yaml \
		--mempool Ruben_inputs/memory_pool.yaml
config_files:
	mkdir -p $(OUTPUT_DIR)
	python xml_to_hls_extraction.py $(XML) $(OUTPUT_DIR)
	cp hls/top.h hls/run $(OUTPUT_DIR)
	@echo "For more excessive changes, you should take a look in the generated output files and the included source code!"
run_tb:
	$(OUTPUT_DIR)/run
clean:
	rm -rf ./Ruben_results

# end
