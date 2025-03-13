
X_TILE=2
Y_TILE=2

rule1:
	sims -vlt_build -ariane -vlt_build_args="-MAKEFLAGS CXX=mpic++ -MAKEFLAGS LINK=mpic++ " -vlt_build_args='-j 2' -config_rtl=DISABLE_ALL_MONITORS -config_rtl=MINIMAL_MONITORING -sys=metro_chipset -x_tiles=${X_TILE} -y_tiles=${Y_TILE}
	
rule2:
	sims -vlt_build -ariane -vlt_build_args="-MAKEFLAGS CXX=mpic++ -MAKEFLAGS LINK=mpic++ " -vlt_build_args='-j 2' -config_rtl=DISABLE_ALL_MONITORS -config_rtl=MINIMAL_MONITORING -sys=metro_tile -x_tiles=${X_TILE} -y_tiles=${X_TILE}

rule3:
	sims -vlt_run -ariane -sys=metro_chipset -x_tiles=${X_TILE} -y_tiles=${Y_TILE} hello_world_token.c -model_dir=`pwd` -cyclesCheckFinish=10000 -cyclesCheckFinishAfter=1000

rule0: rule1 rule2 rule3
