##
# Ruben zigzag
#
multi-layer:
	hls/multi-layer/run
ruben_inputs:
	python top_module.py\
		--set Ruben_inputs/settings.yaml\
		--arch Ruben_inputs/architecture.yaml\
		--map Ruben_inputs/mapping.yaml\
		--mempool Ruben_inputs/memory_pool.yaml
clean:
	rm -rf ./Ruben_results

# end
