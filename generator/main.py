import AIP_simulator as sim
import vhdl_mode_generator as gen
import os

path_input_modes = "./input/modes/"

option = 0
modes = sim.modes4
current_mode = 0
block_size = 64
assert_equals = 1
normalize = 1
length = 4
height = 4
heuristic_on = True

def main(modes, current_mode, length = 4, height = 4, control = -1):
    
    angles = sim.map_modes_to_angles(modes)

    sim.transform_coefficients(8, 16, True)

    if(control == 0):
        sim.calculate_equations(modes, angles, block_size, "fc")
    elif(control == 1):
        sim.calculate_samples(modes, angles, block_size, normalize=normalize)
    elif(control == 2):
        sim.calculate_iidx_ifact(modes, angles, block_size)
    elif(control == 3):#Generate states_ifact_mode_length and states_iidx_mode_length files of input modes and length 
        sim.calculate_states(modes, angles, block_size, length, write_file = 1)        
    elif(control == 4):#Generate modes_coefficients_MCM_length_height files of input modes, length, and height
        df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(modes, angles, block_size, length)        
        list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(modes, array_states_mods_iidx, array_states_mods_ifact, block_size, length, height, write_file = 1, heuristic_on = heuristic_on)
    elif(control == 5):
        df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(modes, angles, block_size, length)        
        list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(modes, array_states_mods_iidx, array_states_mods_ifact, block_size, length, heuristic_on)
        sim.calculate_adders(modes,list_position_MCM, list_coefficients_MCM, block_size, write_file = 1)
    elif(control == 6):      
        df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact = sim.calculate_states(modes, angles, block_size, length)

        list_position_MCM, list_coefficients_MCM = sim.calculate_MCM_modes(modes, array_states_mods_iidx, array_states_mods_ifact, block_size, length, heuristic_on)

        list_of_modes_adders = sim.calculate_adders(modes,list_position_MCM, list_coefficients_MCM, block_size, heuristic_on)
        for mode, angle, list_of_modes_adders, list_coefficients_MCM  in zip(modes, angles, list_of_modes_adders, list_coefficients_MCM):
            gen.generate_mode(mode, angle, list_of_modes_adders, list_coefficients_MCM, block_size)
    elif(control == 7):
        for file in os.listdir(path_input_modes + str(current_mode)):
            MCM_name = file[:-2]
            with open(path_input_modes + str(current_mode) + "/" + file) as f:
                contents = gen.standardize_MCM_file(f,MCM_name)

            with open(path_input_modes + str(current_mode) + "/" + file, "w") as f:
                f.write(contents)
    elif(control == 8):
        if(assert_equals):
            input = gen.automated_tests(196, -66, 38)
            gen.assert_equals_planar(input, 32)
            gen.assert_equals_dc(input, 32, 135)
            for i in range (0,16):
                gen.assert_equals_angular(input, modes[i], angles[i], block_size, -66, 38)
        else:
            gen.automated_tests(196, -66, 38)

    else:
        print("Select a value for control between 0 and 8")
    

if __name__ == "__main__":
    main(modes, current_mode, length, height, control = option)


