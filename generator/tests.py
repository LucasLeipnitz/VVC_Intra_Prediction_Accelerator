import AIP_simulator as sim
import vhdl_mode_generator as gen

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

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(sim.modes5, sim.angles5, 32, 16)

list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(sim.modes5, array_states_mods_iidx, array_states_mods_ifact, 16)

list_of_modes_adders = sim.calculate_adders(sim.modes5,list_position_MCM, list_coefficients_MCM, sim.fc_coefficients, write_file=1)
#gen.generate_mode(sim.modes5[1], list_of_modes_adders[1], list_coefficients_MCM[1])

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(sim.modes1, sim.angles1, 32, 16)

list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(sim.modes1, array_states_mods_iidx, array_states_mods_ifact, 16)

list_of_modes_adders = sim.calculate_adders(sim.modes1,list_position_MCM, list_coefficients_MCM, sim.fc_coefficients, write_file=1)
for mode, list_of_modes_adders, list_coefficients_MCM  in zip(sim.modes1, list_of_modes_adders, list_coefficients_MCM):
    gen.generate_mode(mode, list_of_modes_adders, list_coefficients_MCM)

#Testbench, outputs and assert_equals tests
#min_ref = min(list_coefficients_MCM[1][0].keys())
#max_ref = max(list_coefficients_MCM[1][0].keys())
#list_input = gen.random_generate_input(sim.modes5[1], 0, min_ref, max_ref, 5)
#gen.generate_mode_tb(sim.modes5[1], list_coefficients_MCM[1][0], list_input)
#gen.generate_outputs(sim.modes5[1], (0,0), -29, 16, list_input)
#gen.assert_equals(35)

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


