import AIP_simulator as sim
import vhdl_mode_generator as gen

'''df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = calculate_states(modes1, angles1, 32, 8)        
list_position_MCM, list_coefficients_MCM = calculate_MCM_modes(modes1, array_states_mods_iidx, array_states_mods_ifact, 8)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = calculate_states(modes1, angles1, 32, 16)
list_position_MCM, list_coefficients_MCM = calculate_MCM_modes(modes1, array_states_mods_iidx, array_states_mods_ifact, 16)
calculate_adders(modes1,list_position_MCM, list_coefficients_MCM,fc_coefficients)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = calculate_states(modes1, angles1, 32, 32)
list_position_MCM, list_coefficients_MCM = calculate_MCM_modes(modes1, array_states_mods_iidx, array_states_mods_ifact, 32)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = calculate_states(modes1, angles1, 32, 8)
list_position_MCM, list_coefficients_MCM = calculate_MCM_modes(modes1, array_states_mods_iidx, array_states_mods_ifact, 8, height=4)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = calculate_states(modes1, angles1, 32, 16)
list_position_MCM, list_coefficients_MCM = calculate_MCM_modes(modes1, array_states_mods_iidx, array_states_mods_ifact, 16, height=4)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = calculate_states(modes1, angles1, 32, 32)
list_position_MCM, list_coefficients_MCM = calculate_MCM_modes(modes1, array_states_mods_iidx, array_states_mods_ifact, 32, height=4)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = calculate_states(modes1, angles1, 32, 8)
list_position_MCM, list_coefficients_MCM = calculate_MCM_modes(modes1, array_states_mods_iidx, array_states_mods_ifact, 8, height=8)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = calculate_states(modes1, angles1, 32, 16)
list_position_MCM, list_coefficients_MCM = calculate_MCM_modes(modes1, array_states_mods_iidx, array_states_mods_ifact, 16, height=8)

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = calculate_states(modes1, angles1, 32, 32)
list_position_MCM, list_coefficients_MCM = calculate_MCM_modes(modes1, array_states_mods_iidx, array_states_mods_ifact, 32, height=8)'''

df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(sim.modes4, sim.angles4, 32, 16)

list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(sim.modes4, array_states_mods_iidx, array_states_mods_ifact, 16)

list_of_modes_adders = sim.calculate_adders(sim.modes4,list_position_MCM, list_coefficients_MCM, sim.fc_coefficients)
#gen.generate_mode(sim.modes4[0], list_of_modes_adders[0], list_coefficients_MCM[0])

min_ref = min(list_coefficients_MCM[0].keys())
max_ref = max(list_coefficients_MCM[0].keys())
list_input = gen.random_generate_input(sim.modes4[0], 0, min_ref, max_ref, 5)
gen.generate_mode_tb(sim.modes4[0], list_coefficients_MCM[0], list_input)
gen.generate_outputs(sim.modes4[0], (0,0), -29, 16, list_input)
'''input = {0: 95, 1: 52, 2: 4, 3: 146,  4: 26, 5: 50, 6: 250, 7: 178, 8: 81}
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
print(gen.calculate_pred_y(input, x, iIdx, iFact)) #24'''


