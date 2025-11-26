'''
Update Level
By BrownieO
Port Mari0 level arrays to Mari3 format
'''
import argparse
import numpy as np

def parse_args():
    parser = argparse.ArgumentParser(description='Port Mari0 level arrays to Mari3 format.')
    parser.add_argument('--map', type=str, required=True, help='Path to the ID list')
    parser.add_argument('--width', type=int, required=True, help='Width of the map')
    parser.add_argument('--output', type=str, default=None, help='Output file to save the result (optional)')
    
    return parser.parse_args()

def load_map(file_path):
    with open(file_path, 'r') as f:
        return list(map(int, f.read().split()))

def split_list(lst, width):
    """
    Separate list into rows and columns
    """
    return [lst[i:i + width] for i in range(0, len(lst), width)]

def process_map(wmap, wwidth):
    """
    Update the format by replacing characters and transforming the array
    """
    for i, n in enumerate(wmap):
        if n == 1:
            wmap[i] = 0
        
    splitted_list = split_list(wmap, wwidth)
    
    splitted_list = np.rot90(splitted_list, 3)
    splitted_list = np.fliplr(splitted_list)

    replacements = {
        "[ ": "{",
        " ]": "},",
        "[" : "{",
        "]" : "},",
        " " : ",",
    }

    processed_map = []
    for v in splitted_list:
        v = str(v)
        v = " ".join(v.split())
        for old_str, new_str in replacements.items():
            v = v.replace(old_str, new_str)
        processed_map.append(v)
    
    return processed_map

def save_output(processed_map, output_file):
    with open(output_file, 'w') as f:
        for line in processed_map:
            f.write(line + '\n')

args = parse_args()

wmap = load_map(args.map)
wwidth = args.width

processed_map = process_map(wmap, wwidth)

if args.output:
    save_output(processed_map, args.output)
else:
    for line in processed_map:
        print(line)
