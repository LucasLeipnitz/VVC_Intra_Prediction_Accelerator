import AIP_simulator as sim
import vhdl_mode_generator as gen
import os

path_input_modes = "./input/modes/"

option = 6
modes = sim.modes3
current_mode = 2
block_size = 32
assert_equals = 1

def main(modes, current_mode, lenght = 16, height = 1, control = -1):
    
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
        list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(modes, array_states_mods_iidx, array_states_mods_ifact, block_size, lenght, write_file = 1)
    elif(control == 5):
        df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(modes, angles, block_size, lenght)        
        list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(modes, array_states_mods_iidx, array_states_mods_ifact, block_size, lenght)
        sim.calculate_adders(modes,list_position_MCM, list_coefficients_MCM, block_size, write_file = 1)
    elif(control == 6):
        if(assert_equals):
            gen.assert_equals(current_mode)
        else:
            
            df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(modes, angles, block_size, lenght)

            list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(modes, array_states_mods_iidx, array_states_mods_ifact, block_size, lenght)

            list_of_modes_adders = sim.calculate_adders(modes,list_position_MCM, list_coefficients_MCM, block_size)
            for mode, angle, list_of_modes_adders, list_coefficients_MCM  in zip(modes, angles, list_of_modes_adders, list_coefficients_MCM):
                gen.generate_mode(mode, angle, list_of_modes_adders, list_coefficients_MCM, block_size)
    elif(control == 7):
        for file in os.listdir(path_input_modes + str(current_mode)):
            MCM_name = file[:-2]
            with open(path_input_modes + str(current_mode) + "/" + file) as f:
                contents = gen.standardize_MCM_file(f,MCM_name)

            with open(path_input_modes + str(current_mode) + "/" + file, "w") as f:
                f.write(contents)

    else:
        print("Select a value for control between 0 and 7")
    

if __name__ == "__main__":
    main(modes, current_mode, control = option)


