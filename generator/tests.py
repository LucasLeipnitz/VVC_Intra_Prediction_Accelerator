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
gen.generate_mode(sim.modes4[0], list_of_modes_adders[0], list_coefficients_MCM[0])
#print(list_of_modes_adders[0][0][0][1])
#print(list_coefficients_MCM[0])