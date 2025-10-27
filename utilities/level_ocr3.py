'''
OCR = Optical C(level) Recognition
By BrownieO
Reads a level image and makes arrays of tile IDs.
It also can sort the IDs by frequency.
'''
import argparse
import numpy as np
from pathlib import Path
from PIL import Image, ImageChops

parser = argparse.ArgumentParser(description="Reads a level image and makes arrays of tile IDs.")
parser.add_argument("-f", "--file", help="set the input file path.")
parser.add_argument("-l", "--level", action="store_true", help="output a full level array.")
parser.add_argument("-p", "--palette", action="store_true", help="output an image with all the unique tiles.")
parser.add_argument("-s", "--sort", action="store_true", help="sort the tile IDs by frequency.")
args = parser.parse_args()

image_file = "./smb12.png" 
create_level = args.level
create_palette = args.palette
sort_tiles = args.sort

if not create_level and not create_palette and not sort_tiles:
    parser.print_help()
    quit()

def split_image_into_tiles(image_path):
    global rows
    global cols
    img = Image.open(image_path)
    img_width, img_height = img.size

    cols = img_width // 16
    rows = img_height // 16
    
    tile_width = 16
    tile_height = 16

    tiles = []
    unique = []

    for r in range(rows):
        for c in range(cols):
            left = c * tile_width
            top = r * tile_height
            right = (c + 1) * tile_width
            bottom = (r + 1) * tile_height

            tile = img.crop((left, top, right, bottom))

            still_unique = True
            
            for item in unique:
                diff = ImageChops.difference(item, tile)
                if not diff.getbbox():
                    tiles.append(unique.index(item))
                    still_unique = False
                    break
            
            if still_unique:
                unique.append(tile)
                tiles.append(len(unique)-1)

    return tiles, unique

def create_image_chain(images):
    widths, heights = zip(*(i.size for i in images))

    total_width = sum(widths)
    max_height = max(heights)

    new_im = Image.new('RGB', (total_width, max_height))

    x_offset = 0
    for im in images:
      new_im.paste(im, (x_offset,0))
      x_offset += im.size[0]

    return new_im

level, unique_tiles = split_image_into_tiles(image_file)

unique_ids, freq = np.unique(level, return_counts=True)

if sort_tiles:
    sorted_indices = np.argsort(freq)[::-1]
    sorted_unique_ids = unique_ids[sorted_indices] 
    sorted_freq = freq[sorted_indices]

    replacements_dict = {tile_id: n for n, tile_id in enumerate(sorted_unique_ids)}
else:
    sorted_unique_ids = unique_ids

if create_palette or sort_tiles:
    image_chain = []
    n = 0
    for tile_id in sorted_unique_ids:
        if create_palette:
            image_chain.append(unique_tiles[tile_id])
        if sort_tiles:
            replacements_dict[tile_id] = n
            n += 1

if sort_tiles:
    m = 0
    for tile_id in level:
        level[m] = replacements_dict[tile_id]
        m += 1

if create_palette:
    im = create_image_chain(image_chain)
    im.save(Path(image_file).stem + "_palette.png")

if create_level:
    level = np.reshape(level, (rows, cols))
    im = Image.fromarray(level.astype(np.uint8))
    im.save(Path(image_file).stem + "_array.png")