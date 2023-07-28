import AIP_simulator as sim

path = "./"

def write_mcm_component(f, mode_number, list_MCM_mode):
    component = ""
    for i,j in zip(list_MCM_mode.keys(), list_MCM_mode.values()):
        component = component + "\n"
        str_ref = str(i)
        if(str_ref[0] == "-"):
            str_ref = 'n' + str_ref[1:]

        component = component + "COMPONENT MCM_" + str(mode_number) + "_" + str_ref + "\n\tPORT (\n"
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

def write_comportamental_body(f, mode, list_of_adders, list_MCM_mode):
    input_mapping = {}
    m = 0
    input_n = 0
    block = ""
    for i,j in zip(list_MCM_mode.keys(), list_MCM_mode.values()):
        block += "\n"
        str_ref = str(i)
        if(str_ref[0] == "-"):
            str_ref = 'n' + str_ref[1:]

        block += "\tm" + str(m) + " : " + "MCM_" + str(mode) + "_" + str_ref + "\n"
        port = "\tPORT MAP ( X => ref(" + str(i) + "), "
        input = ""
        if(len(j) == 1):
            input = "Y => input(" + str(input_n) + ") );\n"
            input_tuple = (i,1)
            input_mapping[input_tuple] = "input(" + str(input_n) + ")"
            input_n += 1
        else:
            y_n = 1
            for y in j:
                if(y != 0):
                    input += "Y" + str(y_n) + " => input(" + str(input_n) + "), "
                    input_tuple = (i,y_n)
                    input_mapping[input_tuple] = "input(" + str(input_n) + ")"
                    input_n += 1
                    y_n += 1

            input = input[:-2] + " );\n" #removing the last ','

        block += port + input
        m += 1
    
    signal = "\t\t\ttype t_input is array (0 to " + str(input_n - 1) + ") of std_logic_vector( 15 downto 0);\n\t\t\tsignal 	input : t_input;\n"
    f.write(signal)
    f.write("\nBEGIN\n")
    f.write(block)
    e = 0
    equation = ""
    output_n = 0
    for adder in list_of_adders:
        equation += "\n\te" + str(e) + ": equation_block\n"
        port = "\tPORT MAP ("
        input = ""
        for i in range(0,4):
            input += "input_" + str(i) + " => "
            if(adder[i][1] == 0):
                input += "\"0000000000000000\", "
            else:
                input += input_mapping[adder[i]] + ", "
        
        output = "output => output(" + str(output_n) + "));\n"
        output_n += 1
        e += 1
        equation += port + input + output
    
    f.write(equation)


def generate_mode(mode, list_of_adders, list_MCM_mode):

    mode_name = "mode_" + str(mode)
    input = "ref : in ref_bus (" + str(min(list_MCM_mode.keys())) + " to " + str(max(list_MCM_mode.keys())) + " );\n" 
    output = "output : out output_bus\n"

    f = open(path + mode_name + ".vhd", "w")


    header = "-----------------------------------------------\nLIBRARY ieee;\nUSE ieee.std_logic_1164.all;\nUSE ieee.std_logic_signed.all;\nUSE ieee.numeric_std.all;\nUSE work.mode_in_out.all;\n-----------------------------------------------"
    f.write(header + "\n\n")
    entity = "ENTITY " + mode_name + " IS\n\tPORT (\n\t\t" + input + "\t\t" + output + "\t);\nEND " + mode_name + ";\n"
    f.write(entity + "\n")
    architecture = "ARCHITECTURE comportamental OF " + str(mode_name) + " IS\n"
    f.write(architecture)
    write_mcm_component(f, mode, list_MCM_mode)
    f.write("\n")
    component_equation_block = "COMPONENT equation_block\n\tPORT (\n\t\t\tinput_0, input_1, input_2, input_3 : in std_logic_vector ( 15 downto 0 );"
    component_equation_block = component_equation_block + "\n\t\t\toutput : out std_logic_vector ( 7 downto 0 )\n\t);\nEND COMPONENT;\n"
    f.write(component_equation_block + "\n")
    write_comportamental_body(f, mode, list_of_adders, list_MCM_mode)
    f.write("\nEND comportamental;")

    f.close()

    


