import numpy as np
import pandas as pd
import math as mh
import re
from collections import defaultdict
from transform_block import TransformBlock

path = "./"
path_output_metrics = "./output/metrics/"
path_output_blocks = "./output/mcm_block/"

modes1 = [34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66]
modes2 = [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34]
modes3 = [2,3,10,18,33,34,35,43,46,49,50,54]
modes4 = [35]
modes_positive = [50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66]
modes_negative = [34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50]
angles1 = [-32,-29,-26,-23,-20,-18,-16,-14,-12,-10,-8,-6,-4,-3,-2,-1,0,1,2,3,4,6,8,10,12,14,16,18,20,23,26,29,32]
angles2 = [32,29,26,23,20,18,16,14,12,10,8,6,4,3,2,1,0,-1,-2,-3,-4,-6,-8,-10,-12,-14,-16,-18,-20,-23,-26,-29,-32]
angles3 = [32,29,26,23,20,18,16,14,12,10,8,6,4,3,2,1,0,-1,-2,-3,-4,-6,-8,-10,-12,-14,-16,-18,-20,-23,-26,-29,-32]
angles4 = [-29]
angles_positive = [0,1,2,3,4,6,8,10,12,14,16,18,20,23,26,29,32]
angles_negative = [-32,-29,-26,-23,-20,-18,-16,-14,-12,-10,-8,-6,-4,-3,-2,-1,0]

fc_coefficients = {
    "0[0]" : 0, 
    "1[0]" : -1,
    "2[0]" : -2,
    "3[0]" : -2,
    "4[0]" : -2,
    "5[0]" : -3,
    "6[0]" : -4,
    "7[0]" : -4,
    "8[0]" : -4,
    "9[0]" : -5,
    "10[0]" : -6,
    "11[0]" : -6,
    "12[0]" : -6,
    "13[0]" : -5,
    "14[0]" : -4,
    "15[0]" : -4,
    "16[0]" : -4,
    "17[0]" : -4,
    "18[0]" : -4,
    "19[0]" : -4,
    "20[0]" : -4,
    "21[0]" : -3,
    "22[0]" : -2,
    "23[0]" : -2,
    "24[0]" : -2,
    "25[0]" : -2,
    "26[0]" : -2,
    "27[0]" : -2,
    "28[0]" : -2,
    "29[0]" : -1,
    "30[0]" : 0,
    "31[0]" : 0,
    "0[1]" : 64, 
    "1[1]" : 63,
    "2[1]" : 62,
    "3[1]" : 60,
    "4[1]" : 58,
    "5[1]" : 57,
    "6[1]" : 56,
    "7[1]" : 55,
    "8[1]" : 54,
    "9[1]" : 53,
    "10[1]" : 52,
    "11[1]" : 49,
    "12[1]" : 46,
    "13[1]" : 44,
    "14[1]" : 42,
    "15[1]" : 39,
    "16[1]" : 36,
    "17[1]" : 33,
    "18[1]" : 30,
    "19[1]" : 29,
    "20[1]" : 28,
    "21[1]" : 24,
    "22[1]" : 20,
    "23[1]" : 18,
    "24[1]" : 16,
    "25[1]" : 15,
    "26[1]" : 14,
    "27[1]" : 12,
    "28[1]" : 10,
    "29[1]" : 7,
    "30[1]" : 4,
    "31[1]" : 2,
    "0[2]" : 0,
    "0[3]" : 0
}

def simmetry_rule(p, index):
    return str(32 - int(p)), str(3 - int(index))


def calculate_iidx_ifact(modes, angles, size):
    values_ifact = []
    values_iidx = []
    columns = []
    for i,j in zip(modes,angles):
        tb = TransformBlock(size, size, i, j, 0, size*2 + 2, size*2 + 2, 0)
        tb.calculate_constants_mode()
        columns.append(i)
        values_iidx.append(tb.array_iidx)
        values_ifact.append(tb.array_ifact)
       
    df = pd.DataFrame(list(zip(*values_iidx)),columns = columns)
    df.to_excel(excel_writer = path + "values_iidx_" + str(size) + ".xlsx")
    df = pd.DataFrame(list(zip(*values_ifact)),columns = columns)
    df.to_excel(excel_writer = path + "values_ifact_" + str(size) + ".xlsx")


def calculate_samples(modes, angles, size, normalize):
    values_ref = []
    values_id = []
    columns = []
    lowest_id_value = mh.inf
    highest_id_value = -mh.inf
    for i,j in zip(modes,angles):
        tb = TransformBlock(size, size, i, j, 0, size*2 + 2, size*2 + 2, 0)
        tb.calculate_pred_values()
        columns.append(i)
        values_ref.append(tb)
        values_id.append(tb.ref_id)
        if(lowest_id_value > tb.ref_id[0]):
            lowest_id_value = tb.ref_id[0]
        if(highest_id_value < tb.ref_id[-1]):
            highest_id_value = tb.ref_id[-1]

    values_ref_array = []
    for i in values_ref:
        if(normalize):
            i.normalize_ref()
            pass
        values_ref_array.append(i.transform_dict_to_array(lowest_id_value, highest_id_value, normalize))
        
    rows = list(range(lowest_id_value,highest_id_value + 1))

    df = pd.DataFrame(list(zip(*values_ref_array)), index= rows, columns = columns)
    if(normalize):
        df.to_excel(excel_writer = path + "ref_" + str(size) + "_normalized" + ".xlsx")
    else:
        df.to_excel(excel_writer = path + "ref_" + str(size) + ".xlsx")


def calculate_equations(modes, angles, size):
    for i,j in zip(modes,angles):
        tb = TransformBlock(size, size, i, j, 0, size*2 + 2, size*2 + 2, 0)
        tb.calculate_equations_mode()


def calculate_states(modes, angles, block_size, state_size, excel = 0):
    values_ifact = []
    values_iidx = []
    columns = []

    for i,j in zip(modes,angles):
        tb = TransformBlock(block_size, block_size, i, j, 0, block_size*2 + 2, block_size*2 + 2, 0)
        tb.calculate_constants_mode()
        columns.append(i)
        values_iidx.append(tb.array_iidx)
        values_ifact.append(tb.array_ifact)


    array_states_mods_iidx = []
    array_states_mods_ifact = []
    for i,j in zip(values_iidx,values_ifact):
        base = 0
        count = -1
        base_counter = 0
        n_state_iidx = 0
        n_state_ifact = 0
        state_iidx = []
        state_ifact = []
        array_states_iidx = ["Null" for x in range(int(block_size/state_size))] #it has at most 32/state_size states, because at 32 it starts to repeat
        array_states_ifact = ["Null" for x in range(int(block_size/state_size))] #it has at most 32/state_size states, because at 32 it starts to repeat
        for iidx,ifact in zip(i,j):
            if(base == iidx):
                state_iidx.append(base_counter)
            else:
                base_counter = base_counter + 1
                state_iidx.append(base_counter)
            base = iidx
            count = count + 1
            state_ifact.append(ifact)
            if((count + 1)%state_size == 0):
                if(state_iidx in array_states_iidx):
                    pass
                else:
                    array_states_iidx[n_state_iidx] = state_iidx
                    n_state_iidx = n_state_iidx + 1
                state_iidx = []
                base_counter = 0
                
            if((count + 1)%state_size == 0):
                if(state_ifact in array_states_ifact):
                    pass
                else:
                    array_states_ifact[n_state_ifact] = state_ifact
                    n_state_ifact = n_state_ifact + 1
                state_ifact = []
                
        array_states_mods_iidx.append(array_states_iidx)
        array_states_mods_ifact.append(array_states_ifact)

    df_iidx = pd.DataFrame(list(zip(*array_states_mods_iidx)), columns = columns)
    df_ifact = pd.DataFrame(list(zip(*array_states_mods_ifact)), columns = columns)

    if(excel):
        df_iidx.to_excel(excel_writer = path + "states_iidx_" + str(block_size) + "_" + str(state_size) + ".xlsx")
        df_ifact.to_excel(excel_writer = path + "states_ifact_" + str(block_size) + "_" + str(state_size) + ".xlsx")
    
    return df_iidx, df_ifact, array_states_mods_iidx, array_states_mods_ifact

   
def calculate_MCM_blocks(mode, state_iidx, state_ifact, base = 0, height = 1, print_values = 0):
    constants_vectors = {}
    variation = 0 #variation of state_iidx[i+1] and state_iidx[i] 
    
    #Number of fases equals to the size of the block 
    
    for n in range(height):
        downward_index = base #downward will begin from the base
        for i,j in zip(state_iidx, range(len(state_iidx))):
            variation = int(i) - variation
            if(variation == 0):
                pass
            else:
                variation = int(i)
                if(mode >= 34):
                    if(mode >= 50):
                        downward_index = base + int(i)
                    else:
                        downward_index = base - int(i)
                else:
                    #TODO modes < 34
                    pass

            if(downward_index not in constants_vectors):
                constants_vectors[downward_index] = []
            
            constants_vectors[downward_index].append(str(state_ifact[j]) + "[0]")
            
            if((downward_index + 1) not in constants_vectors):
                constants_vectors[downward_index + 1] = []

            constants_vectors[downward_index + 1].append(str(state_ifact[j]) + "[1]")
        
            if((downward_index + 2) not in constants_vectors):
                constants_vectors[downward_index + 2] = []
            
            constants_vectors[downward_index + 2].append(str(state_ifact[j]) + "[2]")
        
            if((downward_index + 3) not in constants_vectors):
                constants_vectors[downward_index + 3] = []
            
            constants_vectors[downward_index + 3].append(str(state_ifact[j]) + "[3]") 

        base = base + 1     

    #constants_vectors = dict(sorted(constants_vectors.items()))

    if(print_values):
        print("############################################")
        for i,j in zip(constants_vectors.values(),constants_vectors.keys()):
            print(j, i)
    
    return constants_vectors


def map_to_coefficients(constants_vectors, coefficients, print_values = 0):
    coefficients_vectors = {}

    for i,j in zip(constants_vectors.values(),constants_vectors.keys()):
        coefficients_vectors[j] = []
        for constant in i:
            if(constant not in coefficients):
                p, index = re.findall(r'\d+', constant) #get p[index] from string containing and put it in two separately variables
                p, index = simmetry_rule(p, index) #transform in a value that exists in the coefficients by the simmetry rule
                value = coefficients[p + '[' + index + ']']
            else:
                value = coefficients[constant]
            
            if(value not in coefficients_vectors[j]):
                    coefficients_vectors[j].append(value)

    if(print_values):
        print("############################################")
        for i,j in zip(coefficients_vectors.values(),coefficients_vectors.keys()):
            print(j, i)

    return coefficients_vectors


def calculate_MCM_modes(modes, array_states_mods_iidx, array_states_mods_ifact, state_size = 32, height = 1, write_file = 0):
    list_position_MCM = []
    list_coefficients_MCM = []
    list_of_counters = {}
    list_of_replicas = {}
    max_coef_counter_mode = -mh.inf
    max_coef_counter_ref = -mh.inf
    if(write_file):
        fp = open(path_output_blocks + "modes_position_MCM_" + str(state_size) + "_" + str(height) + ".txt", "w")
        fc = open(path_output_blocks + "modes_coefficients_MCM_" + str(state_size) + "_" + str(height) + ".txt", "w")
        fm = open(path_output_metrics + "metrics_" + str(state_size) + "_" + str(height) + ".txt", "w")

    metric_mean_dict = {"Mean of Number of Blocks" : 0, "Mean of Number of Replicas" : 0, "Mean of Number of References" : 0, "Mean of Number of Coef Counter" : 0, "Mean of coefficients per references" : 0}
    for mode, states_iidx, states_ifact in zip(modes, array_states_mods_iidx, array_states_mods_ifact):
        if(write_file):
            fp.write("##########################################################\n\n" + str(mode))
            fc.write("##########################################################\n\n" + str(mode))
            fm.write("##########################################################\n\n" + str(mode))

        dict_position_MCM = {}
        dict_coefficients_MCM = {}
        block_counter = 0
        reference_counter = 0
        coef_counter = 0
        for i,j in zip(states_iidx, states_ifact):
            if(not i == "Null"):
                if(write_file):
                    fp.write("\nBlock " + str(block_counter))
                    fc.write("\nBlock " + str(block_counter))

                MCM_blocks = calculate_MCM_blocks(mode,i,j,height = height)
                for key, block in zip(MCM_blocks.keys(),MCM_blocks.values()):
                    if(write_file):
                        fp.write("\n" + str(key) + ": ")

                    dict_position_MCM[key] = []
                    for v in block:
                        if(write_file):
                            fp.write(str(v) + ", ")
                            
                        dict_position_MCM[key].append(v)
                
                MCM_blocks = map_to_coefficients(calculate_MCM_blocks(mode,i,j,height = height),fc_coefficients)
                for key, block in zip(MCM_blocks.keys(),MCM_blocks.values()):
                    if(write_file):
                        fc.write("\n" + str(key) + ": ")

                    reference_counter = reference_counter + 1
                    dict_coefficients_MCM[key] = []
                    reference_coef_counter = 0
                    for v in block:
                        if(write_file):
                            fc.write(str(v) + ", ")

                        reference_coef_counter = reference_coef_counter + 1
                        dict_coefficients_MCM[key].append(v)

                    if(max_coef_counter_ref < reference_coef_counter):
                            max_coef_counter_ref = reference_coef_counter

                    coef_counter = coef_counter  + reference_coef_counter 
                    

                first_half = j
                replicas = 1
                exit = 0
                while((len(first_half) > 1) and (not exit)):
                    second_half = first_half[int(len(first_half)/2):]
                    first_half = first_half[:int(len(first_half)/2)]
                    if(first_half == second_half):
                        replicas = replicas*2
                    else:
                        exit = 1
                
                if(write_file):
                    fp.write("\n")
                    fc.write("\n")

                list_position_MCM.append(dict_position_MCM.copy())
                list_coefficients_MCM.append(dict_coefficients_MCM.copy())
                block_counter = block_counter + 1
        
        if(max_coef_counter_mode < coef_counter):
            max_coef_counter_mode = coef_counter
        
        if(write_file):
            fm.write("\nNumber of Blocks: " + str(block_counter))
            fm.write("\nNumber of Replicas: " + str(replicas))
            fm.write("\nNumber of References: " + str(reference_counter))
            fm.write("\nNumber of Coef Counter: " + str(coef_counter))
            fm.write("\nMean of coefficients per references: " + str(round(coef_counter/reference_counter,2)))

        metric_mean_dict["Mean of Number of Blocks"] += block_counter
        metric_mean_dict["Mean of Number of Replicas"] += replicas
        metric_mean_dict["Mean of Number of References"] += reference_counter
        metric_mean_dict["Mean of Number of Coef Counter"] += coef_counter
        metric_mean_dict["Mean of coefficients per references"] += round(coef_counter/reference_counter,2)

        if(block_counter not in list_of_counters.keys()):
            list_of_counters[block_counter] = 1
        else:
            list_of_counters[block_counter] = list_of_counters[block_counter] + 1

        if(replicas not in list_of_replicas.keys()):
            list_of_replicas[replicas] = 1
        else:
            list_of_replicas[replicas] = list_of_replicas[replicas] + 1

        if(write_file):
            fp.write("\n")
            fc.write("\n")
            fm.write("\n")
    
    if(write_file):
        for i,j in zip(list_of_counters.keys(), list_of_counters.values()):
            fm.write("\nNumber of modes with " + str(i) + " block(s): " + str(j))

    metric_mean_dict["Mean of Number of Blocks"] = metric_mean_dict["Mean of Number of Blocks"]/len(modes)
    metric_mean_dict["Mean of Number of Replicas"] =  metric_mean_dict["Mean of Number of Replicas"]/len(modes)
    metric_mean_dict["Mean of Number of References"] =  metric_mean_dict["Mean of Number of References"]/len(modes)
    metric_mean_dict["Mean of Number of Coef Counter"] =  metric_mean_dict["Mean of Number of Coef Counter"]/len(modes)
    metric_mean_dict["Mean of coefficients per references"] =  metric_mean_dict["Mean of coefficients per references"]/len(modes)

    if(write_file):
        fm.write("\nMean of Number of Blocks: " + str(round(metric_mean_dict["Mean of Number of Blocks"],2)))
        fm.write("\nMean of Number of Replicas: " + str(round(metric_mean_dict["Mean of Number of Replicas"],2)))
        fm.write("\nMean of Number of References: " + str(round(metric_mean_dict["Mean of Number of References"],2)))
        fm.write("\nMean of Number of Coef Counter: " + str(round(metric_mean_dict["Mean of Number of Coef Counter"],2)))
        fm.write("\nMean of coefficients per references: " + str(round(metric_mean_dict["Mean of coefficients per references"],2)))
        fm.write("\nMax coefficients in a mode: " + str(max_coef_counter_mode))   
        fm.write("\nMax coefficients in a reference: " + str(max_coef_counter_ref))      
        fp.close()
        fc.close()
        fm.close()

    #order dicts
    '''sorted_dict_list = []
    for i in list_coefficients_MCM:
        sorted_dict_list.append(dict(sorted(i.items())))

    list_coefficients_MCM = sorted_dict_list.copy()

    sorted_dict_list = []
    for i in list_position_MCM:
        sorted_dict_list.append(dict(sorted(i.items())))

    list_position_MCM = sorted_dict_list.copy()'''

    return list_position_MCM, list_coefficients_MCM

def calculate_adders(modes, list_position_MCM, list_coefficients_MCM, coefficients, write_file = 0):
    
    if(write_file):
        fa = open(path_output_blocks + "modes_adders.txt", "w")
        fao = open(path_output_blocks + "modes_adders_outputs.txt", "w")

    list_of_modes_adders = [] #list of list of adders of each mode
    for mode, dict_position_MCMs, dict_coefficients_MCMs in zip(modes, list_position_MCM, list_coefficients_MCM):
        if(write_file):
            fa.write("##########################################################\n\n" + str(mode))
            fao.write("##########################################################\n\n" + str(mode))

        list_of_adders = [] #is a list of tuples (ref,k) where ref(integer) is the reference multipluing, Yk is its output and k is an integer (Y1 for first output, Y2 for second ...)
        
        adder_n = 0
        for i, j in zip(dict_position_MCMs.values(), dict_position_MCMs.keys()):
            for position_value in i:
                p, index = re.findall(r'\d+', position_value) #get p[index] from string containing and put it in two separately variables
                if(index == '0'):
                    if(write_file):
                        fa.write("\nAdder" + str(adder_n) + ": ")
                        fao.write("\nAdder" + str(adder_n) + ": ")

                    current_adder = []
                    adder_n = adder_n + 1
                    value_index = 0
                    #search all 4 values of the filter
                    for k in range(j, j+4):
                        range_position_value = p + '[' + str(value_index) + ']'
                        if(range_position_value not in coefficients):
                            d, index = re.findall(r'\d+', range_position_value) #get p[index] from string containing and put it in two separately variables
                            d, index = simmetry_rule(d, index) #transform in a value that exists in the coefficients by the simmetry rule
                            value = coefficients[d + '[' + index + ']']
                        else:
                            value = coefficients[range_position_value]
                        
                        if(value == 0):
                            if(write_file):
                                fa.write("ref[" + str(k) + "]*0, ")
                                fao.write("0, ")

                            current_tuple = (k,0)
                        else:
                            #search for the value in list_coefficients_MCM of index k
                            coefficient_index = 1
                            for coefficient_value in dict_coefficients_MCMs[k]:
                                if(coefficient_value == value):
                                    if(write_file):
                                        fa.write("ref[" + str(k) + "]*" + str(value) + ", ")
                                        fao.write(str(k) + ":Y" + str(coefficient_index) + ", ")

                                    current_tuple = (k,coefficient_index)
                                else:
                                    if(coefficient_value != 0):
                                        coefficient_index = coefficient_index + 1
                        
                        current_adder.append(current_tuple)
                        value_index = value_index + 1
                    
                    list_of_adders.append(current_adder.copy())

        list_of_modes_adders.append(list_of_adders.copy())

        if(write_file):
            fa.write("\n\n")
            fao.write("\n\n")              

    if(write_file):
        fa.close()
        fao.close()

    return list_of_modes_adders


