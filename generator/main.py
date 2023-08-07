import AIP_simulator as sim
import vhdl_mode_generator as gen

option = 6
modes = sim.modes3
block_size = 32
assert_equals = 0
assert_equals_mode = 35

def main(modes, lenght = 16, height = 1, control = -1):
    
    angles = sim.map_modes_to_angles(modes)

    if(control == 0):
        sim.calculate_equations(modes, angles, block_size)
    elif(control == 1):
        sim.calculate_samples(modes, angles, block_size)
    elif(control == 2):
        sim.calculate_iidx_ifact(modes, angles, block_size)
    elif(control == 3):#Generate states_ifact_mode_lenght and states_iidx_mode_lenght files of input modes and lenght 
        sim.calculate_states(modes, angles, block_size, lenght, write_file = 1)        
    elif(control == 4):#Generate modes_coefficients_MCM_lenght_height files of input modes, lenght, and height
        df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(modes, angles, block_size, lenght)        
        list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(modes, array_states_mods_iidx, array_states_mods_ifact, lenght, write_file = 1)
    elif(control == 5):
        df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(modes, angles, block_size, lenght)        
        list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(modes, array_states_mods_iidx, array_states_mods_ifact, lenght)
        sim.calculate_adders(modes,list_position_MCM, list_coefficients_MCM, sim.fc_coefficients, write_file=1)
    elif(control == 6):
        if(assert_equals):
            gen.assert_equals(assert_equals_mode)
        else:
            df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(modes, angles, 32, 16)

            list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(modes, array_states_mods_iidx, array_states_mods_ifact, 16)

            list_of_modes_adders = sim.calculate_adders(modes,list_position_MCM, list_coefficients_MCM, sim.fc_coefficients, write_file=1)

            df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(modes, angles, 32, 16)

            list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(modes, array_states_mods_iidx, array_states_mods_ifact, 16)

            list_of_modes_adders = sim.calculate_adders(modes,list_position_MCM, list_coefficients_MCM, sim.fc_coefficients, write_file=1)
            for mode, angle, list_of_modes_adders, list_coefficients_MCM  in zip(modes, angles, list_of_modes_adders, list_coefficients_MCM):
                gen.generate_mode(mode, angle, list_of_modes_adders, list_coefficients_MCM)
    elif(control == 7):
        raise NotImplemented
    else:
        print("Select a value for control between 0 and 4")
    

if __name__ == "__main__":
    main(modes, control = option)


