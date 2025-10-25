'''
OCR = Optical C (level) Recognition
By BrownieO
Reads a level image and makes an array of tile IDs.
It also sorts all the IDs by frequency.
'''
import numpy as np
from PIL import Image, ImageChops

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

image_file = "./smb12.png" 
level, unique_tiles = split_image_into_tiles(image_file)

unique_ids, freq = np.unique(level, return_counts=True)
freq_dict = dict(zip(unique_ids, freq))
freq_dict = dict(sorted(freq_dict.items(), key=lambda item: item[1], reverse=True))

image_chain = []
replacements_dict = {}
n = 0

for tile_id in freq_dict:
    replacements_dict[tile_id] = n
    n = n + 1
    image_chain.append(unique_tiles[tile_id])

im = create_image_chain(image_chain)
im.show()

m = 0
for tile_id in level:
    level[m] = replacements_dict[level[m]]
    m = m + 1

level = np.reshape(level, (rows, cols))

im = Image.fromarray((level).astype(np.uint8))
im.show()