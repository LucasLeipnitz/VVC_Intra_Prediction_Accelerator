import AIP_simulator as sim
import vhdl_mode_generator as gen
import math as mh

modes_18_50 = [18,50]

'''#States, MCM modes and adders tests
df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(sim.modes1, sim.angles1, 32, 8)        
list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(sim.modes1, array_states_mods_iidx, array_states_mods_ifact, 8)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(sim.modes1, sim.angles1, 32, 16)
list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(sim.modes1, array_states_mods_iidx, array_states_mods_ifact, 16)
sim.calculate_adders(sim.modes1,list_position_MCM, list_coefficients_MCM,fc_coefficients)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(sim.modes1, sim.angles1, 32, 32)
list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(sim.modes1, array_states_mods_iidx, array_states_mods_ifact, 32)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(sim.modes1, sim.angles1, 32, 8)
list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(sim.modes1, array_states_mods_iidx, array_states_mods_ifact, 8, height=4)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(sim.modes1, sim.angles1, 32, 16)
list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(sim.modes1, array_states_mods_iidx, array_states_mods_ifact, 16, height=4)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(sim.modes1, sim.angles1, 32, 32)
list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(sim.modes1, array_states_mods_iidx, array_states_mods_ifact, 32, height=4)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(sim.modes1, sim.angles1, 32, 8)
list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(sim.modes1, array_states_mods_iidx, array_states_mods_ifact, 8, height=8)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(sim.modes1, sim.angles1, 32, 16)
list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(sim.modes1, array_states_mods_iidx, array_states_mods_ifact, 16, height=8)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(sim.modes1, sim.angles1, 32, 32)
list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(sim.modes1, array_states_mods_iidx, array_states_mods_ifact, 32, height=8)
'''

'''test_modes = sim.modes4
test_angles = sim.angles4
df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(test_modes, test_angles, 32, 16)

list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(test_modes, array_states_mods_iidx, array_states_mods_ifact, 16)

list_of_modes_adders = sim.calculate_adders(test_modes,list_position_MCM, list_coefficients_MCM, sim.fc_coefficients, write_file=1)
#gen.generate_mode(test_modes[1], list_of_modes_adders[1], list_coefficients_MCM[1])

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(test_modes, test_angles, 32, 16)

list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(test_modes, array_states_mods_iidx, array_states_mods_ifact, 16)

list_of_modes_adders = sim.calculate_adders(test_modes,list_position_MCM, list_coefficients_MCM, sim.fc_coefficients, write_file=1)
for mode, angle, list_of_modes_adders, list_coefficients_MCM  in zip(test_modes, test_angles, list_of_modes_adders, list_coefficients_MCM):
    gen.generate_mode(mode, angle, list_of_modes_adders, list_coefficients_MCM)'''

#Testbench, outputs and assert_equals tests
#min_ref = min(list_coefficients_MCM[1][0].keys())
#max_ref = max(list_coefficients_MCM[1][0].keys())
#list_input = gen.random_generate_input(test_modes[1], 0, min_ref, max_ref, 5)
#gen.generate_mode_tb(test_modes[1], list_coefficients_MCM[1][0], list_input)
#gen.generate_outputs(test_modes[1], (0,0), -29, 16, list_input)
#gen.assert_equals(35)
#gen.standardize_MCM_file(34,"MCM_34_n1")
#gen.standardize_MCM_file(36,"MCM_36_n1")

block_size = 32
mode = 3
y = 0
angle = 29
size = 1
input = {0 : 140, 1: 171, 2: 54, 3: 1}

#Find if mode uses fC or fG coefficients
nTbS = int(mh.log2(block_size) + mh.log2(block_size)) >> 1
minDistVerHor = min(abs(mode - 50), abs(mode - 18))
if(minDistVerHor > sim.intraHorVerDistThres[nTbS]):
    filterFlag = 1
else:
    filterFlag = 0

gen.generate_output("", (0,y), angle, size, input, filterFlag)

#gen.print_table()

'''#Equation calculation tests
input = {0: 95, 1: 52, 2: 4, 3: 146,  4: 26, 5: 50, 6: 250, 7: 178, 8: 81}
angle = 6
x,y = 5,2
iIdx = ((y+1)*angle)>>5
iFact = ((y+1)*angle)&31
print(gen.calculate_pred_y(input, x, iIdx, iFact)) #226
x,y = 4,1
iIdx = ((y+1)*angle)>>5
iFact = ((y+1)*angle)&31
print(gen.calculate_pred_y(input, x, iIdx, iFact)) #132
x,y = 0,5
iIdx = ((y+1)*angle)>>5
iFact = ((y+1)*angle)&31
print(gen.calculate_pred_y(input, x, iIdx, iFact)) #24
'''


