import numpy as np
import random as rm
import math as mh
import pandas as pd

path_modes = "./output/modes/"
path_tests = "./output/tests/"
path_input_modes = "./input/modes/"

number_of_tests = 5

p = { (0,-1) : 55,
    (-1,32) : 185,
    (-1,0) : 158,
    (-1,1) : 195,
    (-1,2) : 81,
    (-1,3) : 161,
    (-1,4) : 166,
    (-1,5) : 44, 
    (-1,6) : 130,
    (-1,7) : 30,
    (-1,8) : 26,
    (-1,9) : 179,
    (-1,10) : 187,
    (-1,11) : 253,
    (-1,12) : 118,
    (-1,13) : 110,
    (-1,14) : 29,
    (-1,15) : 199,
    (-1,16) : 87,
    (-1,17) : 180,
    (-1,18) : 133,
    (-1,19) : 88,
    (-1,20) : 149,
    (-1,21) : 66,
    (-1,22) : 38,
    (-1,23) : 244,
    (-1,24) : 35,
    (-1,25) : 14,
    (-1,26) : 2,
    (-1,27) : 185,
    (-1,28) : 134,
    (-1,29) : 65,
    (-1,30) : 61,
    (-1,31) : 133,
    (32,-1) : 96,
}

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

fg_coefficients = [[0 for col in range(4)] for row in range(32)]
fg_coefficients[0][0] = 16 
fg_coefficients[1][0] = 16
fg_coefficients[2][0] = 15
fg_coefficients[3][0] = 15
fg_coefficients[4][0] = 14
fg_coefficients[5][0] = 14
fg_coefficients[6][0] = 13
fg_coefficients[7][0] = 13
fg_coefficients[8][0] = 12
fg_coefficients[9][0] = 12
fg_coefficients[10][0] = 11
fg_coefficients[11][0] = 11
fg_coefficients[12][0] = 10
fg_coefficients[13][0] = 10
fg_coefficients[14][0] = 9
fg_coefficients[15][0] = 9
fg_coefficients[16][0] = 8
fg_coefficients[17][0] = 8
fg_coefficients[18][0] = 7
fg_coefficients[19][0] = 7
fg_coefficients[20][0] = 6
fg_coefficients[21][0] = 6
fg_coefficients[22][0] = 5
fg_coefficients[23][0] = 5
fg_coefficients[24][0] = 4
fg_coefficients[25][0] = 4
fg_coefficients[26][0] = 3
fg_coefficients[27][0] = 3
fg_coefficients[28][0] = 2
fg_coefficients[29][0] = 2
fg_coefficients[30][0] = 1
fg_coefficients[31][0] = 1 
fg_coefficients[0][1] = 32
fg_coefficients[1][1] = 32
fg_coefficients[2][1] = 31
fg_coefficients[3][1] = 31
fg_coefficients[4][1] = 30
fg_coefficients[5][1] = 30
fg_coefficients[6][1] = 29
fg_coefficients[7][1] = 29
fg_coefficients[8][1] = 28
fg_coefficients[9][1] = 28
fg_coefficients[10][1] = 27
fg_coefficients[11][1] = 27
fg_coefficients[12][1] = 26
fg_coefficients[13][1] = 26
fg_coefficients[14][1] = 25
fg_coefficients[15][1] = 25
fg_coefficients[16][1] = 24
fg_coefficients[17][1] = 24
fg_coefficients[18][1] = 23
fg_coefficients[19][1] = 23
fg_coefficients[20][1] = 22
fg_coefficients[21][1] = 22
fg_coefficients[22][1] = 21
fg_coefficients[23][1] = 21
fg_coefficients[24][1] = 20
fg_coefficients[25][1] = 20
fg_coefficients[26][1] = 19
fg_coefficients[27][1] = 19
fg_coefficients[28][1] = 18
fg_coefficients[29][1] = 18
fg_coefficients[30][1] = 17
fg_coefficients[31][1] = 17
fg_coefficients[0][2] = 16
fg_coefficients[0][3] = 0
fg_coefficients[1][2] = 16
fg_coefficients[1][3] = 0

ft_coefficients = {"fc": fc_coefficients, "fg": fg_coefficients}

intraHorVerDistThres = {2: 24, 3: 14, 4:2, 5:0, 6:0}

def simmetry_rule(p, index, coef):
    if(coef == "fc"):
        return fc_coefficients[32 - p][3 - index]
    elif(coef == "fg"):
        return fg_coefficients[33 - p][3 - index]
    else:
        raise Exception("Coefficient matrix unknow: " + coef) 

for i in range(17,32):
    for j in range(0,4):
        ft_coefficients["fc"][i][j] = simmetry_rule(i, j, "fc")

for i in range(2,32):
    for j in range(2,4):
        ft_coefficients["fg"][i][j] = simmetry_rule(i, j, "fg")

def print_table():
    print(pd.DataFrame.from_dict(ft_coefficients))
    

def write_mcm_component(f, mode_number, list_MCM_mode, single_block_mode):
    block_counter = 0
    for mcm_block in list_MCM_mode:
        block_counter += 1
        component = ""
        for i,j in zip(mcm_block.keys(), mcm_block.values()):
            y_count = 0
            for y in j:
                if(y != 0):
                    y_count += 1

            if(y_count != 0):
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
                
                if(y_count == 1):
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
            y_count = 0
            for y in j:
                if(y != 0):
                    y_count += 1

            if(y_count != 0):
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
                

                if(y_count == 1):
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
                atribution += "(state = '" + str(block_counter) + "') THEN"
            else:
                atribution += "\n\tELSE "

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


def get_min_max_used_ref_value(ref):
    min_ref = mh.inf
    max_ref = -mh.inf
    for key, values in zip(ref.keys(), ref.values()):
        if(used_ref(values)):
            if(key < min_ref):
                min_ref = key

            if(key > max_ref):
                max_ref = key
        
    return min_ref, max_ref


def used_ref(ref_values):
    y_count = 0
    for y in ref_values:
        if(y != 0):
            y_count += 1

    return bool(y_count)


#Working only for modes with two states or less
def generate_mode(mode, angle, list_of_adders, list_MCM_mode, block_size):

    if(len(list_MCM_mode) > 1):
        single_block_mode = 0
    else:
        single_block_mode = 1

    min_ref_used = mh.inf
    max_ref_used = -mh.inf
    state_counter = 0
    for state in list_MCM_mode:
        state_counter += 1
        min_state_ref_used, max_state_ref_used = get_min_max_used_ref_value(state)

        if(min_state_ref_used < min_ref_used):
            min_ref_used = min_state_ref_used
        
        if(max_state_ref_used > max_ref_used):
            max_ref_used = max_state_ref_used
    
    mode_name = "mode_" + str(mode)
    if(max_ref_used == min_ref_used):
        input = "ref : in ref_bus;\n" 
    else:
        input = "ref : in ref_bus (" + str(min_ref_used) + " to " + str(max_ref_used) + " );\n" 

    if(not single_block_mode):
        input += "\t\tstate: in std_logic;\n"

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

    #Generate list of inputs, result outputs of the interpolation filter and test bench for the mode
    size = 16
    n_test = number_of_tests
    list_test = []
    f = open(path_tests + "test" + "_input_" + str(mode) + ".txt", "w")
    for i in range(n_test):
        y = 0
        list_input = []
        list_base = [0]
        for state in range(len(list_MCM_mode)):
            f.write("Test " + str(i + 1) + "\n")
            f.write("State " + str(state + 1) + "\n")
            input, base = random_generate_input(f, mode, angle, y, size)
            list_input.append(input.copy())
            list_base.append(base)
            y += 16

        list_test.append(list_input.copy())

    f.close()

    f = open(path_tests + "test" + "_outputs_" + str(mode) + ".txt", "w")
    input_counter = 0
    for list_input in list_test:
        y = 0
        state_counter = 0
        input_counter += 1
        for input in list_input:
            state_counter += 1
            f.write("Test " + str(input_counter) + "\n")
            if(not single_block_mode):
                f.write("State " + str(state_counter) + "\n")

            #Find if mode uses fC or fG coefficients
            nTbS = int(mh.log2(block_size) + mh.log2(block_size)) >> 1
            minDistVerHor = min(abs(mode - 50), abs(mode - 18))
            if(minDistVerHor > intraHorVerDistThres[nTbS]):
                filterFlag = 1
            else:
                filterFlag = 0

            generate_output(f, (0,y) ,angle, size, input, filterFlag)
            y += 16
    
    f.close()
 
    generate_mode_tb(mode, min_ref_used, max_ref_used , list_test, list_base, single_block_mode)


def generate_mode_tb(mode, min_ref, max_ref, list_test, list_base, single_block_mode):

    mode_name = "mode_" + str(mode) + "_tb"
    state = ""

    f = open(path_modes + mode_name + ".vhd", "w")

    header = "-----------------------------------------------\nLIBRARY ieee;\nUSE ieee.std_logic_1164.all;\nUSE work.mode_in_out.all;\nUSE STD.textio.all;\nUSE ieee.std_logic_textio.all;\n-----------------------------------------------"
    f.write(header + "\n")
    entity = "\nENTITY " + mode_name + " IS\nEND " + mode_name + ";\n"
    f.write(entity)
    architecture = "\nARCHITECTURE comportamental OF " + mode_name + " IS\n"
    f.write(architecture)

    if(not single_block_mode):
        state = "\nSIGNAL state : std_logic;"

    signal = "\nSIGNAL ref : ref_bus (" + str(min_ref) + " to " + str(max_ref) + ");" + state + "\nSIGNAL output : output_bus;\nFILE file_RESULTS : text;\nCONSTANT c_WIDTH : natural := 4;\n"
    f.write(signal)

    state = ""
    if(not single_block_mode):
        state = "\n\t\tstate : in std_logic;"

    component = "\nCOMPONENT " + "mode_" + str(mode) + "\n\tPORT ( \n\t\tref : in ref_bus (" + str(min_ref) + " to " + str(max_ref) + ");" + state + "\n\t\toutput : out output_bus\n\t);\nEND COMPONENT;\n"
    f.write(component)

    state = ""
    if(not single_block_mode):
        state = " state => state,"

    begin = "\nBEGIN\n\ti1 : mode_" + str(mode) + "\n\tPORT MAP (ref => ref," + state + " output => output);\n\tfile_open(file_RESULTS, \"output_results.txt\", write_mode);\n\tinit : PROCESS\n\tVARIABLE v_OLINE  : line;\n\tVARIABLE row  : line;\n"

    if(not single_block_mode):
        begin += "\tVARIABLE state_row  : line;\n"

    f.write(begin)
    f.write("\n\t\tBEGIN")
    test_counter = 0
    state = ""
    state_write_file = ""
    for list_input in list_test:
        state_counter = 0
        for input in list_input:

            if(not single_block_mode):
                state = "\n\t\t\tstate <= \'" + str(state_counter) + "\';"
                state_write_file = "\n\n\t\t\twrite(state_row," + str(state_counter + 1) + ", right);\n\t\t\twriteline(file_RESULTS,state_row);"
                f.write(state)

            ref_atribution = ""
            for i, j in zip(input.keys(),input.values()):
                index = i - list_base[state_counter]
                if((index >= min_ref) and (index <= max_ref)):
                    ref_atribution = ref_atribution + "\n\t\t\tref(" + str(index) + ")" + " <= " + "\"" + str(np.binary_repr(j, width=8)) + "\"; -- " + str(j)

            f.write(ref_atribution)
            f.write("\n\n\t\t\twrite(row," + str(test_counter) + ", right);\n\t\t\twriteline(file_RESULTS,row);" + state_write_file + "\n\n\t\t\twait for 5 ns;\n\n")
            loop = "\t\t\tFOR i IN 0 TO 15 LOOP\n\t\t\t\twrite(v_OLINE, output(i), right, c_WIDTH);\n\t\t\t\twriteline(file_RESULTS, v_OLINE);\n\t\t\tEND LOOP;\n\n\t\t\twait for 5 ns;\n"
            f.write(loop)
            state_counter += 1

        test_counter += 1

    f.write("\n\t\t\tfile_close(file_RESULTS);\n\n\t\t\twait;\n\n\tEND PROCESS init;\n\nEND comportamental;")
    f.close()

#Automated tests
def datapath_automated_tests():
    input = {}
    fin = open(path_tests  + "datapath_input.vhd", "w")
    fout = open(path_tests  + "datapath_output.vhd", "w")
    #generate inputs
    for n in range(-66,0):
        input[(-1, -(n + 1))] = rm.randint(0, 255)
        fin.write("input(" + str(n) + ") <= \"" + str(np.binary_repr(input[(-1, -(n + 1))],width=8)) + "\"; --" + str(input[(-1, -(n + 1))]) + "\n")

    input[(-1, -1)] = rm.randint(0, 255)
    fin.write("input(" + str(0) + ") <= \"" + str(np.binary_repr(input[(-1, -1)],width=8)) + "\"; --" + str(input[(-1, -1)]) + "\n")

    for n in range(0,38):
        input[(n, -1)] = rm.randint(0, 255)
        fin.write("input(" + str(n + 1) + ") <= \"" + str(np.binary_repr(input[(n, -1)],width=8)) + "\"; --" + str(input[(n, -1)]) + "\n")

    #Planar output
    x = 0
    nTbH = 32
    nTbW = 32
    predSamples = {}
    predV = {}
    predH = {}
    for y in range(nTbH):
        predV[(x,y)] = ((nTbH - 1 - y)*input[(x,-1)] + (y + 1)*input[(-1,nTbH)]) << int(mh.log2(nTbW))
        predH[(x,y)] = ((nTbW - 1 - x)*input[(-1,y)] + (x + 1)*input[(nTbW,-1)]) << int(mh.log2(nTbH))
        predSamples[(x,y)] = (predV[(x,y)] + predH[(x,y)] + nTbH*nTbW) >> int(mh.log2(nTbW) + mh.log2(nTbH) + 1)
        fout.write(str(predSamples[(x,y)]) + "\n")

    fin.close()
    fout.close()

    for key, value in zip(input.keys(), input.values()):
        print(key, value)


def random_generate_input(f, mode, angle, base, size):
    input = {}
    for n in range(base, base + size):
        iIdx = ((n+1)*angle)>>5
        new_base = iIdx
        for i in range(0,4):
            index = 0 + iIdx + i
            if(index not in input):
                input[index] = rm.randint(0, 255)
                f.write("ref_" + str(index) + " : " + str(input[index]) + "\n")

    return input, new_base

def generate_output(f, base, angle, size, input, filterFlag):
    x_base, y_base = base[0], base[1]     
    for y in range(y_base, y_base + size):
        iIdx = ((y+1)*angle)>>5
        iFact = ((y+1)*angle)&31
        f.write(str(calculate_pred_y(input,x_base,iIdx,iFact, filterFlag)) + "\n")
        #print(str(calculate_pred_y(input,x_base,iIdx,iFact, filterFlag)) + "\n")

def calculate_pred_y(ref, x, iIdx, iFact, filterFlag):
    fT = [0 for row in range(4)]

    if(filterFlag):
        coefficients = "fg"
    else:
        coefficients = "fc"

    for j in range (0,4):
        fT[j] = ft_coefficients[coefficients][iFact][j]

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

def assert_equals_angular(mode):
    f_eq = open(path_tests + "test" + "_outputs_" + str(mode) + ".txt", "r")
    f_sim = open(path_tests + "output_results.txt", "r")
    test_counter = 0
    output_counter = 0
    equal_counter = 0
    test_passed = 0
    first_line = 1
    line_counter = 0
    for line_eq, line_sim in zip(f_eq, f_sim):
        line_counter += 1
        if("Test" in line_eq):
            test_counter += 1
            if((output_counter == equal_counter) and not first_line):
                test_passed += 1
            
            output_counter = 0
            equal_counter = 0
            first_line = 0
        else:
            if("State" in line_eq):
                pass
            else:
                output_counter += 1   
                if(int(line_eq) == int(line_sim, 2)):
                    equal_counter += 1
                else:
                    error = str(line_counter) + " : " + str(int(line_eq)) + " /= " + str(int(line_sim, 2))
                    print(error)
    
    if(output_counter == equal_counter):
        test_passed += 1

    print("Tests passed: " + str(test_passed) + "/" + str(test_counter))
    f_eq.close()
    f_sim.close()

def assert_equals_planar(p):

    x = 0
    nTbH = 32
    nTbW = 32
    predSamples = {}
    predV = {}
    predH = {}
    for y in range(nTbH):
        predV[(x,y)] = ((nTbH - 1 - y)*p[(x,-1)] + (y + 1)*p[(-1,nTbH)]) << int(mh.log2(nTbW))
        predH[(x,y)] = ((nTbW - 1 - x)*p[(-1,y)] + (x + 1)*p[(nTbW,-1)]) << int(mh.log2(nTbH))
        predSamples[(x,y)] = (predV[(x,y)] + predH[(x,y)] + nTbH*nTbW) >> int(mh.log2(nTbW) + mh.log2(nTbH) + 1)

    y = 0
    test_counter = 0
    f= open(path_tests + "output_results.txt", "r")
    for line in f:
        if(predSamples[(x,y)] == int(line, 2)):
            test_counter += 1
        else:
            error = str(y) + " : " + str(predSamples[(x,y)]) + " /= " + str(int(line, 2))
            print(error)
        
        y += 1

    print("Tests passed: " + str(test_counter) + "/32")


def standardize_MCM_file(f, MCM_name):
    #with open(path_input_modes + str(mode) + "/" + MCM_name + ".v") as f:
    contents = f.read()
    contents = contents.replace("multiplier_block", MCM_name)
    contents = contents.replace("input  signed  [31:0] X", "input  unsigned  [7:0] X")
    contents = contents.replace("[31:0]", "[15:0]")

    #with open(path_input_modes + str(mode) + "/" + MCM_name + ".v", "w") as f:
    #f.write(contents)
    return contents






    
        

        
