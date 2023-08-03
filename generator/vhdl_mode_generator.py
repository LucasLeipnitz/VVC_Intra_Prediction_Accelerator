import numpy as np
import random as rm

path_modes = "./output/modes/"
path_tests = "./output/tests/"

fc_coefficients = [[0 for col in range(4)] for row in range(32)]
fc_coefficients[0][0] = 0
fc_coefficients[0][1] = 64
fc_coefficients[0][2] = 0
fc_coefficients[0][3] = 0
fc_coefficients[1][0] = -1
fc_coefficients[1][1] = 63
fc_coefficients[1][2] = 2
fc_coefficients[1][3] = 0
fc_coefficients[2][0] = -2
fc_coefficients[2][1] = 62
fc_coefficients[2][2] = 4
fc_coefficients[2][3] = 0
fc_coefficients[3][0] = -2
fc_coefficients[3][1] = 60
fc_coefficients[3][2] = 7
fc_coefficients[3][3] = -1
fc_coefficients[4][0] = -2
fc_coefficients[4][1] = 58
fc_coefficients[4][2] = 10
fc_coefficients[4][3] = -2
fc_coefficients[5][0] = -3
fc_coefficients[5][1] = 57
fc_coefficients[5][2] = 12
fc_coefficients[5][3] = -2
fc_coefficients[6][0] = -4
fc_coefficients[6][1] = 56
fc_coefficients[6][2] = 14
fc_coefficients[6][3] = -2
fc_coefficients[7][0] = -4
fc_coefficients[7][1] = 55
fc_coefficients[7][2] = 15
fc_coefficients[7][3] = -2
fc_coefficients[8][0] = -4
fc_coefficients[8][1] = 54
fc_coefficients[8][2] = 16
fc_coefficients[8][3] = -2
fc_coefficients[9][0] = -5
fc_coefficients[9][1] = 53
fc_coefficients[9][2] = 18
fc_coefficients[9][3] = -2
fc_coefficients[10][0] = -6
fc_coefficients[10][1] = 52
fc_coefficients[10][2] = 20
fc_coefficients[10][3] = -2
fc_coefficients[11][0] = -6
fc_coefficients[11][1] = 49
fc_coefficients[11][2] = 24
fc_coefficients[11][3] = -3
fc_coefficients[12][0] = -6
fc_coefficients[12][1] = 46
fc_coefficients[12][2] = 28
fc_coefficients[12][3] = -4
fc_coefficients[13][0] = -5
fc_coefficients[13][1] = 44
fc_coefficients[13][2] = 29
fc_coefficients[13][3] = -4
fc_coefficients[14][0] = -4
fc_coefficients[14][1] = 42
fc_coefficients[14][2] = 30
fc_coefficients[14][3] = -4
fc_coefficients[15][0] = -4
fc_coefficients[15][1] = 39
fc_coefficients[15][2] = 33
fc_coefficients[15][3] = -4
fc_coefficients[16][0] = -4
fc_coefficients[16][1] = 36
fc_coefficients[16][2] = 36
fc_coefficients[16][3] = -4

def simmetry_rule(p, index):
    return fc_coefficients[32 - p][3 - index]

for i in range(17,32):
    for j in range(0,4):
        fc_coefficients[i][j] = simmetry_rule(i, j)

def write_mcm_component(f, mode_number, list_MCM_mode, single_block_mode):
    block_counter = 0
    for mcm_block in list_MCM_mode:
        block_counter += 1
        component = ""
        for i,j in zip(mcm_block.keys(), mcm_block.values()):
            component = component + "\n"
            str_ref = str(i)
            if(str_ref[0] == "-"):
                str_ref = 'n' + str_ref[1:]

            if(single_block_mode):
                component = component + "COMPONENT MCM_" + str(mode_number) + "_" + str_ref + "\n\tPORT (\n"
            else:
                component = component + "COMPONENT MCM_" + str(mode_number) + "_b" + str(block_counter) + "_" + str_ref + "\n\tPORT (\n"
            
            component_input = "\t\t\tX : in std_logic_vector ( 7 downto 0 );\n"
            component_output = "\t\t\t"
            if(len(j) == 1):
                component_output = component_output + "Y : "
            else:
                y_n = 1
                for y in j:
                    if(y != 0):
                        component_output = component_output + "Y" + str(y_n) + ", "
                        y_n += 1

                component_output = component_output[:-2] + " : " #removing the last ','
            
            component_output = component_output + "out std_logic_vector ( 15 downto 0 )\n"
            component = component + component_input + component_output
            component = component + "\t);\nEND COMPONENT;\n"
    
        f.write(component)

def write_comportamental_body(f, mode, list_of_adders, list_MCM_mode, single_block_mode):
    input_mapping = {}
    m = 0
    input_n = 0
    block = ""
    block_counter = 0
    for mcm_block in list_MCM_mode:
        block_counter += 1
        for i,j in zip(mcm_block.keys(), mcm_block.values()):
            block += "\n"
            str_ref = str(i)
            if(str_ref[0] == "-"):
                str_ref = 'n' + str_ref[1:]

            if(single_block_mode):
                block += "m" + str(m) + " : " + "MCM_" + str(mode) + "_" + str_ref + "\n"
            else:
                block += "m" + str(m) + " : " + "MCM_" + str(mode) + "_b" + str(block_counter) + "_" + str_ref + "\n"

            port = "PORT MAP ( X => ref(" + str(i) + "), "
            input = ""
            if(len(j) == 1):
                input = "Y => input(" + str(input_n) + ") );\n"
                input_tuple = (block_counter,i,1)
                input_mapping[input_tuple] = "input(" + str(input_n) + ")"
                input_n += 1
            else:
                y_n = 1
                for y in j:
                    if(y != 0):
                        input += "Y" + str(y_n) + " => input(" + str(input_n) + "), "
                        input_tuple = (block_counter,i,y_n)
                        input_mapping[input_tuple] = "input(" + str(input_n) + ")"
                        input_n += 1
                        y_n += 1

                input = input[:-2] + " );\n" #removing the last ','

            block += port + input
            m += 1
    
    type = "type t_input is array (0 to " + str(input_n - 1) + ") of std_logic_vector( 15 downto 0);\ntype t_eq_input is array (0 to 15) of eq_input;\n"
    signal = "signal 	input : t_input;\nsignal 	eq_input : t_eq_input;\n"
    f.write(type + signal)
    f.write("\n\nBEGIN")
    f.write(block)

    if(single_block_mode):
        adder_counter = 0
        atribution = "\n"
        for adder in list_of_adders[0]:
            input = ""
            for i in range(0,4):
                input += "\neq_input(" + str(adder_counter) + ")(" + str(i) + ") <= "
                if(adder[i][1] == 0):
                    input += "\"0000000000000000\";"
                else:
                    input += input_mapping[(1,adder[i][0],adder[i][1])] + ";"
                
            adder_counter += 1
            atribution += input
        
        f.write(atribution + "\n")
    else:
        f.write("\nPROCESS (state) is\nBEGIN\n")
        block_counter = 0
        atribution = ""
        for block_adder in list_of_adders:
            if(block_counter == 0):
                atribution += "\tIF "
            else:
                atribution += "\n\tELSIF "

            atribution += "(state = '" + str(block_counter) + "') THEN"
            block_counter += 1
            adder_counter = 0
            for adder in block_adder:
                input = ""
                for i in range(0,4):
                    input += "\n\t\teq_input(" + str(adder_counter) + ")(" + str(i) + ") <= "
                    if(adder[i][1] == 0):
                        input += "\"0000000000000000\";"
                    else:
                        input += input_mapping[(block_counter,adder[i][0],adder[i][1])] + ";"
                    
                adder_counter += 1
                atribution += input
        atribution += "\n\tEND IF;\nEND PROCESS;"
        f.write(atribution + "\n")

    equation = ""
    for i in range(len(list_of_adders[0])):
        equation += "\ne" + str(i) + ": equation_block\n"
        port = "PORT MAP ("
        input = ""
        for j in range(0,4):
            input += "input_" + str(j) + " => eq_input(" + str(i) + ")(" + str(j) + "), "

        output = "output => output(" + str(i) + "));\n"
        equation += port + input + output
    
    f.write(equation)


def generate_mode(mode, list_of_adders, list_MCM_mode):

    if(len(list_MCM_mode) > 1):
        single_block_mode = 0
    else:
        single_block_mode = 1

    list_of_min_ref = []
    list_of_max_ref = []
    for i in list_MCM_mode: list_of_min_ref.append(min(i.keys())); list_of_max_ref.append(max(i.keys()))
    mode_name = "mode_" + str(mode)
    input = "ref : in ref_bus (" + str(min(list_of_min_ref)) + " to " + str(max(list_of_max_ref)) + " );\n" 

    if(not single_block_mode):
        input += "\t\tstate: in bit;\n"

    output = "output : out output_bus\n"

    f = open(path_modes + mode_name + ".vhd", "w")

    header = "-----------------------------------------------\nLIBRARY ieee;\nUSE ieee.std_logic_1164.all;\nUSE ieee.std_logic_signed.all;\nUSE ieee.numeric_std.all;\nUSE work.mode_in_out.all;\n-----------------------------------------------"
    f.write(header + "\n")
    entity = "\nENTITY " + mode_name + " IS\n\tPORT (\n\t\t" + input + "\t\t" + output + "\t);\nEND " + mode_name + ";\n"
    f.write(entity)
    architecture = "\nARCHITECTURE comportamental OF " + str(mode_name) + " IS\n"
    f.write(architecture)
    write_mcm_component(f, mode, list_MCM_mode, single_block_mode)
    f.write("\n")
    component_equation_block = "COMPONENT equation_block\n\tPORT (\n\t\t\tinput_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );"
    component_equation_block = component_equation_block + "\n\t\t\toutput : out std_logic_vector ( 7 downto 0 )\n\t);\nEND COMPONENT;\n"
    f.write(component_equation_block + "\n")
    write_comportamental_body(f, mode, list_of_adders, list_MCM_mode, single_block_mode)
    f.write("\nEND comportamental;")
    f.close()

def generate_mode_tb(mode, list_MCM_mode, list_input):

    mode_name = "mode_" + str(mode) + "_tb"

    f = open(path_modes + mode_name + ".vhd", "w")

    header = "-----------------------------------------------\nLIBRARY ieee;\nUSE ieee.std_logic_1164.all;\nUSE work.mode_in_out.all;\nUSE STD.textio.all;\nUSE ieee.std_logic_textio.all;\n-----------------------------------------------"
    f.write(header + "\n")
    entity = "\nENTITY " + mode_name + " IS\nEND " + mode_name + ";\n"
    f.write(entity)
    architecture = "\nARCHITECTURE comportamental OF " + mode_name + " IS\n"
    f.write(architecture)
    signal = "\nSIGNAL ref : ref_bus (" + str(min(list_MCM_mode.keys())) + " to " + str(max(list_MCM_mode.keys())) + ");\nSIGNAL output : output_bus;\nFILE file_RESULTS : text;\nCONSTANT c_WIDTH : natural := 4;\n"
    f.write(signal)
    component = "\nCOMPONENT " + "mode_" + str(mode) + "\n\tPORT ( \n\t\tref : in ref_bus (" + str(min(list_MCM_mode.keys())) + " to " + str(max(list_MCM_mode.keys())) + ");\n\t\toutput : out output_bus\n\t);\nEND COMPONENT;\n"
    f.write(component)
    f.write("\nBEGIN\n\ti1 : mode_" + str(mode) + "\n\tPORT MAP (ref => ref, output => output);\n\tfile_open(file_RESULTS, \"output_results.txt\", write_mode);\n\tinit : PROCESS\n\tVARIABLE v_OLINE  : line;\n\tVARIABLE row  : line;\n")
    f.write("\n\t\tBEGIN")
    n_couter = 1
    for n in list_input:
        ref_atribution = ""
        for i, j in zip(n.keys(),n.values()):
            ref_atribution = ref_atribution + "\n\t\t\tref(" + str(i) + ")" + " <= " + "\"" + str(np.binary_repr(j, width=8)) + "\"; -- " + str(j)

        f.write(ref_atribution)
        f.write("\n\n\t\t\twrite(row," + str(n_couter) + ", right);\n\t\t\twriteline(file_RESULTS,row);\n\n\t\t\twait for 5 ns;\n\n")
        loop = "\t\t\tFOR i IN 0 TO 15 LOOP\n\t\t\t\twrite(v_OLINE, output(i), right, c_WIDTH);\n\t\t\t\twriteline(file_RESULTS, v_OLINE);\n\t\t\tEND LOOP;\n\n\t\t\twait for 5 ns;\n"
        f.write(loop)
        n_couter += 1

    f.write("\n\t\t\tfile_close(file_RESULTS);\n\n\t\t\twait;\n\n\tEND PROCESS init;\n\nEND comportamental;")
    f.close()

def random_generate_input(mode, base, min_input, max_input, number_of_input):
    list_of_input = []
    f = open(path_tests + "test" + "_input_" + str(mode) + ".txt", "w")
    for n in range(1, number_of_input + 1):
        input = {}
        f.write("Test " + str(n) + "\n")
        for i in range(min_input, max_input + 1):
            input[base + i] = rm.randint(0, 255)
            f.write("ref_" + str(base + i) + " : " + str(input[base + i]) + "\n")
        list_of_input.append(input.copy())

    f.close()
    return list_of_input

def generate_outputs(mode, base, angle, size, list_input):
    f = open(path_tests + "test" + "_outputs_" + str(mode) + ".txt", "w")
    x_base, y_base = base[0], base[1]
    input_counter = 1
    for input in list_input:
        f.write("Test " + str(input_counter) + "\n")
        for y in range(y_base, size):
            iIdx = ((y+1)*angle)>>5
            iFact = ((y+1)*angle)&31
            f.write(str(calculate_pred_y(input,x_base,iIdx,iFact)) + "\n")
        
        input_counter += 1
    
    f.close()     

def calculate_pred_y(ref, x, iIdx, iFact):
    fT = [0 for row in range(4)]
    for j in range (0,4):
        fT[j] = fc_coefficients[iFact][j]

    pred = 0
    for i in range (0,4):
        pred += fT[i]*ref[x + iIdx + i]

    pred = clip1((pred + 32)>>6)
    return pred

def clip1(value):
    if(value > 255):
        return 255
    
    if(value < 0):
        return 0
    
    return value

def assert_equals(mode):
    f_eq = open(path_tests + "test" + "_outputs_" + str(mode) + ".txt", "r")
    f_sim = open(path_tests + "output_results.txt", "r")
    test_counter = 0
    output_counter = 0
    equal_counter = 0
    test_passed = 0
    first_line = 1
    for line_eq, line_sim in zip(f_eq, f_sim):
        if("Test" in line_eq):
            test_counter += 1
            if((output_counter == equal_counter) and not first_line):
                test_passed += 1
            
            output_counter = 0
            equal_counter = 0
            first_line = 0
        else:
            output_counter += 1    
            if(int(line_eq) == int(line_sim, 2)):
                equal_counter += 1
    
    if(output_counter == equal_counter):
        test_passed += 1

    print("Tests passed: " + str(test_passed) + "/" + str(test_counter))
    f_eq.close()
    f_sim.close()


    
        

        
