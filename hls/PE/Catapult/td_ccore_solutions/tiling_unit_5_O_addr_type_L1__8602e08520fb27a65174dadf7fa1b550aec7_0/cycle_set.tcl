
# Loop constraints
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp CSTEPS_FROM {{. == 0}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/tile_size:io_read(tile_size:in:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/loops.relevancy:io_read(loops.relevancy:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/loops.bound:io_read(loops.bound:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/io_read(ccs_ccore_start:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:if:io_write(instr.tile:rsc.@)#5 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:if:io_write(instr.bound:rsc.@)#5 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/tile_size:io_write(tile_size:out:rsc.@) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for-1:if:mul CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for-2:if:mul CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#3 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for-3:if:mul CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#6 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for-4:if:mul CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#9 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for-5:if:mul CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#12 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#11 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#8 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#5 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#2 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#13 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#10 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#7 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#4 CSTEPS_FROM {{.. == 1}}
directive set /tiling_unit<5,O_addr_type_L1>/run/run:rlp/main/for:mux#1 CSTEPS_FROM {{.. == 1}}

# Probe constraints
