'''
Number Grid generator
By BrownieO
Generates an image of a grid with numbers.
'''
import argparse
from PIL import Image, ImageDraw, ImageFont

parser = argparse.ArgumentParser(description="Generates an image of a grid with numbers.")
parser.add_argument("-r", '--rows', type=int, help='number of rows')
parser.add_argument("-c", '--columns', type=int, help='number of columns')
args = parser.parse_args()

if not args.rows or not args.columns:
    parser.print_help()
    quit()

x = args.columns
y = args.rows
n = 17  # Width of each cell (in pixels)
m = 17  # Height of each cell (in pixels)

def generate_number_grid(x, y, n, m):
    # Image size
    width = x * n
    height = y * m

    img = Image.new('RGB', (width, height), color='white')
    draw = ImageDraw.Draw(img)

    try:
        font = ImageFont.truetype("arial.ttf", size=min(n, m) // 2)
    except IOError:
        font = ImageFont.load_default()

    number = 1

    for j in range(y): 
        for i in range(x):
            top_left = (i * n, j * m)
            bottom_right = ((i + 1) * n, (j + 1) * m)
            
            draw.rectangle([top_left, bottom_right], outline="black")

            text = str(number)

            text_bbox = draw.textbbox((0, 0), text, font=font)
            text_width = text_bbox[2] - text_bbox[0]
            text_height = text_bbox[3] - text_bbox[1]

            position = ((top_left[0] + bottom_right[0] - text_width) // 2,
                        (top_left[1] + bottom_right[1] - text_height) // 2)
            
            draw.text(position, text, fill="black", font=font)

            number += 1

    img.save("number_grid.png")

generate_number_grid(x, y, n, m)
